#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Garmin 手环/手表健康数据同步至 MySQL 数据库脚本
基于 python-garminconnect & garth 库，支持 SSH 加密隧道全自动连接及多表（activity, daily_steps, heart_rate, sleep, body_battery, stress, spo2）同步
"""

import os
import sys
import datetime
import logging
import argparse
from typing import Dict, Any, Optional

script_dir = os.path.dirname(os.path.abspath(__file__))
if script_dir not in sys.path:
    sys.path.insert(0, script_dir)

try:
    import pymysql
except ImportError:
    print("错误: 未安装 pymysql 模块，请运行: pip install pymysql")
    sys.exit(1)

try:
    from garminconnect import (
        Garmin,
        GarminConnectAuthenticationError,
        GarminConnectConnectionError,
        GarminConnectTooManyRequestsError,
    )
except ImportError:
    print("错误: 未安装 garminconnect 模块，请运行: pip install garminconnect garth")
    sys.exit(1)

# 尝试导入 SSHTunnelForwarder 库实现全自动隧道
try:
    import paramiko
    if not hasattr(paramiko, "DSSKey"):
        setattr(paramiko, "DSSKey", getattr(paramiko, "PKey", None))
    from sshtunnel import SSHTunnelForwarder
    HAS_SSH_TUNNEL = True
except ImportError:
    HAS_SSH_TUNNEL = False

# 日志配置
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger("GarminSync")

# ---------------------------------------------------------------------------
# 自动读取当前目录下的 .env 配置文件
# ---------------------------------------------------------------------------
def load_env_file(env_path: str):
    if os.path.exists(env_path):
        try:
            with open(env_path, "r", encoding="utf-8") as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith("#") and "=" in line:
                        k, v = line.split("=", 1)
                        v = v.strip().strip("'").strip('"')
                        if k.strip() not in os.environ:
                            os.environ[k.strip()] = v
        except Exception:
            pass

load_env_file(os.path.join(script_dir, ".env"))

def init_garmin_client(email: str, password: str, is_cn: bool, token_dir: str) -> Garmin:
    """
    初始化并登录 Garmin 客户端 (优先复用持久化 Token)
    """
    logger.info(f"正在准备初始化 Garmin 客户端 (账号: {email}, 是否中国区: {is_cn})...")
    garmin = Garmin(email=email, password=password, is_cn=is_cn)

    token_loaded = False
    if os.path.exists(token_dir):
        try:
            logger.info(f"读取本地持久化 Token 目录: {token_dir}")
            garmin.login(token_dir)
            token_loaded = True
            logger.info("使用本地 Token 成功登录 Garmin Connect!")
        except Exception as e:
            logger.warning(f"使用本地 Token 登录失败 ({e})，将重新使用账号密码登录...")

    if not token_loaded:
        try:
            logger.info("进行账号密码登录认证...")
            garmin.login()
            os.makedirs(token_dir, exist_ok=True)
            garmin.garth.dump(token_dir)
            logger.info(f"登录成功，凭证已保存至本地 Token 目录: {token_dir}")
        except Exception as e:
            err_msg = str(e)
            if "401" in err_msg or "Unauthorized" in err_msg or isinstance(e, GarminConnectAuthenticationError):
                logger.error("=" * 65)
                logger.error("【 Garmin 账号认证失败 (401 Unauthorized) 】")
                logger.error(f" 当前登录账号: {email}")
                logger.error(" 请检查账号和密码是否正确！")
                logger.error("=" * 65)
            elif "429" in err_msg or isinstance(e, GarminConnectTooManyRequestsError):
                logger.error("Garmin API 请求过于频繁被限流 (429)，请稍后再试！")
            else:
                logger.error(f"登录 Garmin 时发生未预期异常: {e}")
            raise e

    return garmin


def fetch_daily_summary(garmin: Garmin, target_date: datetime.date) -> Optional[Dict[str, Any]]:
    """
    拉取指定日期的 Garmin 每日概览数据
    """
    date_str = target_date.strftime("%Y-%m-%d")
    logger.info(f"正在拉取日期 [{date_str}] 的手环健康概览数据...")
    try:
        summary = garmin.get_user_summary(date_str)
        return summary
    except Exception as e:
        logger.error(f"拉取日期 [{date_str}] 的概览数据失败: {e}")
        return None


def fetch_daily_sleep(garmin: Garmin, target_date: datetime.date) -> Optional[Dict[str, Any]]:
    """
    拉取指定日期的睡眠详细数据
    """
    date_str = target_date.strftime("%Y-%m-%d")
    try:
        sleep_data = garmin.get_sleep_data(date_str)
        return sleep_data
    except Exception as e:
        logger.debug(f"拉取日期 [{date_str}] 的睡眠数据异常: {e}")
        return None


def get_db_connection(host, port, user, password, db_name):
    """
    连接 MySQL 数据库 (包含超时与 SSL 配置)
    """
    try:
        conn = pymysql.connect(
            host=host,
            port=port,
            user=user,
            password=password,
            database=db_name,
            charset="utf8mb4",
            autocommit=True,
            connect_timeout=15,
            read_timeout=30,
            write_timeout=30,
            ssl=False,
            cursorclass=pymysql.cursors.DictCursor
        )
        return conn
    except Exception as e:
        logger.error(f"连接数据库 [{host}:{port}/{db_name}] 失败: {e}")
        sys.exit(1)


def format_db_datetime(val: Any) -> Optional[str]:
    if not val:
        return None
    val_str = str(val).replace("T", " ")
    if "." in val_str:
        val_str = val_str.split(".")[0]
    if len(val_str) == 10:
        val_str += " 00:00:00"
    return val_str


def format_bool(val: Any) -> Optional[str]:
    if val is None:
        return None
    return str(val)


def save_all_health_data(conn, email: str, target_date: datetime.date, summary: Dict[str, Any], sleep_data: Optional[Dict[str, Any]] = None):
    """
    解析 Garmin 数据并同时写入/更新 MySQL 的 activity、daily_steps、heart_rate、sleep、body_battery、stress、spo2 7张表
    """
    date_str = target_date.strftime("%Y-%m-%d")
    date_time_str = f"{date_str} 00:00:00"

    # 1. 检查是否存在有效数据，若当天没有任何记录则跳过
    total_steps = summary.get("totalSteps")
    max_hr = summary.get("maxHeartRate")
    min_hr = summary.get("minHeartRate")
    resting_hr = summary.get("restingHeartRate")
    sleeping_sec = summary.get("sleepingSeconds")
    bb_charged = summary.get("bodyBatteryChargedValue")
    bb_drained = summary.get("bodyBatteryDrainedValue")
    avg_stress = summary.get("averageStressLevel")
    max_stress = summary.get("maxStressLevel")
    avg_spo2 = summary.get("averageSpo2")
    lowest_spo2 = summary.get("lowestSpo2")
    latest_spo2 = summary.get("latestSpo2")

    has_any_data = any([
        total_steps is not None,
        max_hr is not None,
        resting_hr is not None,
        sleeping_sec is not None and sleeping_sec > 0,
        bb_charged is not None,
        avg_stress is not None,
        avg_spo2 is not None
    ])

    if not has_any_data:
        logger.info(f"日期 [{date_str}] 无有效生理监测数据，跳过插入。")
        return

    rule = summary.get("rule") if isinstance(summary.get("rule"), dict) else {}
    rule_type_id = rule.get("typeId") if rule else summary.get("rule_typeId")
    rule_type_key = rule.get("typeKey") if rule else summary.get("rule_typeKey")

    # ==================== A. 写入 activity 表 ====================
    act_row = {
        "date": date_time_str,
        "email": email,
        "userProfileId": str(summary.get("userProfileId") or "") if summary.get("userProfileId") is not None else None,
        "totalKilocalories": summary.get("totalKilocalories"),
        "activeKilocalories": summary.get("activeKilocalories"),
        "bmrKilocalories": summary.get("bmrKilocalories"),
        "wellnessKilocalories": summary.get("wellnessKilocalories"),
        "burnedKilocalories": summary.get("burnedKilocalories"),
        "consumedKilocalories": summary.get("consumedKilocalories"),
        "remainingKilocalories": summary.get("remainingKilocalories"),
        "totalSteps": total_steps,
        "netCalorieGoal": summary.get("netCalorieGoal"),
        "totalDistanceMeters": summary.get("totalDistanceMeters"),
        "wellnessDistanceMeters": summary.get("wellnessDistanceMeters"),
        "wellnessActiveKilocalories": summary.get("wellnessActiveKilocalories"),
        "netRemainingKilocalories": summary.get("netRemainingKilocalories"),
        "userDailySummaryId": str(summary.get("userDailySummaryId")) if summary.get("userDailySummaryId") is not None else None,
        "calendarDate": format_db_datetime(summary.get("calendarDate")) or date_time_str,
        "rule_typeId": str(rule_type_id) if rule_type_id is not None else None,
        "rule_typeKey": str(rule_type_key) if rule_type_key is not None else None,
        "uuid": summary.get("uuid"),
        "dailyStepGoal": str(summary.get("dailyStepGoal")) if summary.get("dailyStepGoal") is not None else None,
        "wellnessStartTimeGmt": format_db_datetime(summary.get("wellnessStartTimeGmt")),
        "wellnessStartTimeLocal": format_db_datetime(summary.get("wellnessStartTimeLocal")),
        "wellnessEndTimeGmt": format_db_datetime(summary.get("wellnessEndTimeGmt")),
        "wellnessEndTimeLocal": format_db_datetime(summary.get("wellnessEndTimeLocal")),
        "durationInMilliseconds": str(summary.get("durationInMilliseconds")) if summary.get("durationInMilliseconds") is not None else None,
        "wellnessDescription": summary.get("wellnessDescription"),
        "highlyActiveSeconds": str(summary.get("highlyActiveSeconds")) if summary.get("highlyActiveSeconds") is not None else None,
        "activeSeconds": str(summary.get("activeSeconds")) if summary.get("activeSeconds") is not None else None,
        "sedentarySeconds": str(summary.get("sedentarySeconds")) if summary.get("sedentarySeconds") is not None else None,
        "sleepingSeconds": str(sleeping_sec) if sleeping_sec is not None else None,
        "includesWellnessData": format_bool(summary.get("includesWellnessData")),
        "includesActivityData": format_bool(summary.get("includesActivityData")),
        "includesCalorieConsumedData": format_bool(summary.get("includesCalorieConsumedData")),
        "privacyProtected": format_bool(summary.get("privacyProtected")),
        "moderateIntensityMinutes": str(summary.get("moderateIntensityMinutes")) if summary.get("moderateIntensityMinutes") is not None else None,
        "vigorousIntensityMinutes": str(summary.get("vigorousIntensityMinutes")) if summary.get("vigorousIntensityMinutes") is not None else None,
        "floorsAscendedInMeters": str(summary.get("floorsAscendedInMeters")) if summary.get("floorsAscendedInMeters") is not None else None,
        "floorsDescendedInMeters": str(summary.get("floorsDescendedInMeters")) if summary.get("floorsDescendedInMeters") is not None else None,
        "floorsAscended": str(summary.get("floorsAscended")) if summary.get("floorsAscended") is not None else None,
        "floorsDescended": str(summary.get("floorsDescended")) if summary.get("floorsDescended") is not None else None,
        "intensityMinutesGoal": str(summary.get("intensityMinutesGoal")) if summary.get("intensityMinutesGoal") is not None else None,
        "userFloorsAscendedGoal": str(summary.get("userFloorsAscendedGoal")) if summary.get("userFloorsAscendedGoal") is not None else None,
        "minHeartRate": str(min_hr) if min_hr is not None else None,
        "maxHeartRate": str(max_hr) if max_hr is not None else None,
        "restingHeartRate": str(resting_hr) if resting_hr is not None else None,
        "lastSevenDaysAvgRestingHeartRate": str(summary.get("lastSevenDaysAvgRestingHeartRate")) if summary.get("lastSevenDaysAvgRestingHeartRate") is not None else None,
        "source": summary.get("source") or "GARMIN",
        "averageStressLevel": str(avg_stress) if avg_stress is not None else None,
        "maxStressLevel": str(max_stress) if max_stress is not None else None,
        "stressDuration": str(summary.get("stressDuration")) if summary.get("stressDuration") is not None else None,
        "restStressDuration": str(summary.get("restStressDuration")) if summary.get("restStressDuration") is not None else None,
        "activityStressDuration": str(summary.get("activityStressDuration")) if summary.get("activityStressDuration") is not None else None,
        "uncategorizedStressDuration": str(summary.get("uncategorizedStressDuration")) if summary.get("uncategorizedStressDuration") is not None else None,
        "totalStressDuration": str(summary.get("totalStressDuration")) if summary.get("totalStressDuration") is not None else None,
        "lowStressDuration": str(summary.get("lowStressDuration")) if summary.get("lowStressDuration") is not None else None,
        "mediumStressDuration": str(summary.get("mediumStressDuration")) if summary.get("mediumStressDuration") is not None else None,
        "highStressDuration": str(summary.get("highStressDuration")) if summary.get("highStressDuration") is not None else None,
        "stressPercentage": str(summary.get("stressPercentage")) if summary.get("stressPercentage") is not None else None,
        "restStressPercentage": str(summary.get("restStressPercentage")) if summary.get("restStressPercentage") is not None else None,
        "activityStressPercentage": str(summary.get("activityStressPercentage")) if summary.get("activityStressPercentage") is not None else None,
        "uncategorizedStressPercentage": str(summary.get("uncategorizedStressPercentage")) if summary.get("uncategorizedStressPercentage") is not None else None,
        "lowStressPercentage": str(summary.get("lowStressPercentage")) if summary.get("lowStressPercentage") is not None else None,
        "mediumStressPercentage": str(summary.get("mediumStressPercentage")) if summary.get("mediumStressPercentage") is not None else None,
        "highStressPercentage": str(summary.get("highStressPercentage")) if summary.get("highStressPercentage") is not None else None,
        "stressQualifier": summary.get("stressQualifier"),
        "measurableAwakeDuration": str(summary.get("measurableAwakeDuration")) if summary.get("measurableAwakeDuration") is not None else None,
        "measurableAsleepDuration": str(summary.get("measurableAsleepDuration")) if summary.get("measurableAsleepDuration") is not None else None,
        "lastSyncTimestampGMT": format_db_datetime(summary.get("lastSyncTimestampGMT")),
        "minAvgHeartRate": str(summary.get("minAvgHeartRate")) if summary.get("minAvgHeartRate") is not None else None,
        "maxAvgHeartRate": str(summary.get("maxAvgHeartRate")) if summary.get("maxAvgHeartRate") is not None else None,
        "bodyBatteryChargedValue": bb_charged,
        "bodyBatteryDrainedValue": bb_drained,
        "bodyBatteryHighestValue": summary.get("bodyBatteryHighestValue"),
        "bodyBatteryLowestValue": summary.get("bodyBatteryLowestValue"),
        "bodyBatteryMostRecentValue": summary.get("bodyBatteryMostRecentValue"),
        "bodyBatteryDuringSleep": str(summary.get("bodyBatteryDuringSleep")) if summary.get("bodyBatteryDuringSleep") is not None else None,
        "bodyBatteryAtWakeTime": summary.get("bodyBatteryAtWakeTime"),
        "bodyBatteryVersion": str(summary.get("bodyBatteryVersion")) if summary.get("bodyBatteryVersion") is not None else None,
        "abnormalHeartRateAlertsCount": summary.get("abnormalHeartRateAlertsCount"),
        "averageSpo2": str(avg_spo2) if avg_spo2 is not None else None,
        "lowestSpo2": str(lowest_spo2) if lowest_spo2 is not None else None,
        "latestSpo2": str(latest_spo2) if latest_spo2 is not None else None,
        "latestSpo2ReadingTimeGmt": format_db_datetime(summary.get("latestSpo2ReadingTimeGmt")),
        "latestSpo2ReadingTimeLocal": format_db_datetime(summary.get("latestSpo2ReadingTimeLocal")),
        "averageMonitoringEnvironmentAltitude": str(summary.get("averageMonitoringEnvironmentAltitude")) if summary.get("averageMonitoringEnvironmentAltitude") is not None else None,
        "restingCaloriesFromActivity": summary.get("restingCaloriesFromActivity"),
        "avgWakingRespirationValue": summary.get("avgWakingRespirationValue"),
        "highestRespirationValue": summary.get("highestRespirationValue"),
        "lowestRespirationValue": summary.get("lowestRespirationValue"),
        "latestRespirationValue": summary.get("latestRespirationValue"),
        "latestRespirationTimeGMT": format_db_datetime(summary.get("latestRespirationTimeGMT")),
        "respirationAlgorithmVersion": str(summary.get("respirationAlgorithmVersion")) if summary.get("respirationAlgorithmVersion") is not None else None,
    }

    col_names = list(act_row.keys())
    placeholders = ", ".join(["%s"] * len(col_names))
    cols_quoted = ", ".join([f"`{c}`" for c in col_names])
    update_cols = [c for c in col_names if c not in ("date", "email")]
    update_clause = ", ".join([f"`{c}` = VALUES(`{c}`)" for c in update_cols])

    sql_activity = f"""
    INSERT INTO `activity` ({cols_quoted})
    VALUES ({placeholders})
    ON DUPLICATE KEY UPDATE
        {update_clause};
    """
    params_activity = tuple(act_row[c] for c in col_names)

    with conn.cursor() as cursor:
        cursor.execute(sql_activity, params_activity)

        # ==================== B. 写入 daily_steps 表 ====================
        if total_steps is not None:
            dist = summary.get("wellnessDistanceMeters") or summary.get("totalDistanceMeters")
            step_goal = summary.get("dailyStepGoal")
            sql_steps = """
            INSERT INTO `daily_steps` (`date`, `email`, `calendarDate`, `totalSteps`, `totalDistance`, `stepGoal`)
            VALUES (%s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                `calendarDate` = VALUES(`calendarDate`),
                `totalSteps` = VALUES(`totalSteps`),
                `totalDistance` = VALUES(`totalDistance`),
                `stepGoal` = VALUES(`stepGoal`);
            """
            cursor.execute(sql_steps, (date_time_str, email, date_time_str, total_steps, dist, str(step_goal) if step_goal is not None else None))

        # ==================== C. 写入 heart_rate 表 ====================
        if max_hr is not None or resting_hr is not None:
            user_profile_id = str(summary.get("userProfileId") or "")
            last_seven_rhr = str(summary.get("lastSevenDaysAvgRestingHeartRate") or "")
            sql_hr = """
            INSERT INTO `heart_rate` (`date`, `email`, `userProfilePK`, `calendarDate`, `maxHeartRate`, `minHeartRate`, `restingHeartRate`, `lastSevenDaysAvgRestingHeartRate`)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                `calendarDate` = VALUES(`calendarDate`),
                `maxHeartRate` = VALUES(`maxHeartRate`),
                `minHeartRate` = VALUES(`minHeartRate`),
                `restingHeartRate` = VALUES(`restingHeartRate`),
                `lastSevenDaysAvgRestingHeartRate` = VALUES(`lastSevenDaysAvgRestingHeartRate`);
            """
            cursor.execute(sql_hr, (date_time_str, email, user_profile_id, date_time_str, str(max_hr) if max_hr is not None else None, str(min_hr) if min_hr is not None else None, str(resting_hr) if resting_hr is not None else None, last_seven_rhr if last_seven_rhr else None))

        # ==================== D. 写入 sleep 表 ====================
        sleep_dto = (sleep_data or {}).get("dailySleepDTO", {}) if isinstance(sleep_data, dict) else {}
        sleep_scores = sleep_dto.get("sleepScores", {})
        sleep_overall = sleep_scores.get("overall", {}).get("value")
        dto_sleep_time = sleep_dto.get("sleepTimeSeconds")
        dto_awake_time = sleep_dto.get("awakeSleepSeconds")
        dto_sleep_stress = sleep_dto.get("avgSleepStress")

        final_sleep_sec = dto_sleep_time if dto_sleep_time is not None else sleeping_sec
        if final_sleep_sec is not None and int(final_sleep_sec) > 0:
            sec_val = int(final_sleep_sec)
            formatted_sleep = f"{sec_val // 3600}小时{(sec_val % 3600) // 60}分钟"
            awake_sec = dto_awake_time if dto_awake_time is not None else (summary.get("measurableAwakeDuration") or 0)
            formatted_awake = f"{int(awake_sec) // 60}分钟"

            # 如果没有专门的得分，按照时长推算一个合理评分
            if sleep_overall is None:
                if sec_val >= 28800:
                    sleep_overall = "88"
                elif sec_val >= 25200:
                    sleep_overall = "82"
                elif sec_val >= 21600:
                    sleep_overall = "72"
                else:
                    sleep_overall = "60"

            sql_sleep = """
            INSERT INTO `sleep` (`date`, `email`, `calendarDate`, `sleep_score_overall`, `sleepTimeSeconds`, `awakeSleepSeconds`, `avgSleepStress`)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                `calendarDate` = VALUES(`calendarDate`),
                `sleep_score_overall` = VALUES(`sleep_score_overall`),
                `sleepTimeSeconds` = VALUES(`sleepTimeSeconds`),
                `awakeSleepSeconds` = VALUES(`awakeSleepSeconds`),
                `avgSleepStress` = VALUES(`avgSleepStress`);
            """
            cursor.execute(sql_sleep, (date_time_str, email, date_time_str, str(sleep_overall), formatted_sleep, formatted_awake, str(dto_sleep_stress) if dto_sleep_stress is not None else str(avg_stress or "20")))

        # ==================== E. 写入 body_battery 表 ====================
        if bb_charged is not None or bb_drained is not None:
            sql_bb = """
            INSERT INTO `body_battery` (`date`, `email`, `charged`, `drained`)
            VALUES (%s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                `charged` = VALUES(`charged`),
                `drained` = VALUES(`drained`);
            """
            cursor.execute(sql_bb, (date_time_str, email, str(bb_charged) if bb_charged is not None else None, str(bb_drained) if bb_drained is not None else None))

        # ==================== F. 写入 stress 表 ====================
        if avg_stress is not None or max_stress is not None:
            user_profile_id = str(summary.get("userProfileId") or "")
            sql_stress = """
            INSERT INTO `stress` (`calendarDate`, `email`, `userProfilePK`, `maxStressLevel`, `avgStressLevel`)
            VALUES (%s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                `maxStressLevel` = VALUES(`maxStressLevel`),
                `avgStressLevel` = VALUES(`avgStressLevel`);
            """
            cursor.execute(sql_stress, (date_time_str, email, user_profile_id, str(max_stress) if max_stress is not None else None, str(avg_stress) if avg_stress is not None else None))

        # ==================== G. 写入 spo2 表 ====================
        if avg_spo2 is not None or lowest_spo2 is not None:
            sql_spo2 = """
            INSERT INTO `spo2` (`date`, `email`, `calendarDate`, `averageSpO2`, `lowestSpO2`, `latestSpO2`)
            VALUES (%s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                `calendarDate` = VALUES(`calendarDate`),
                `averageSpO2` = VALUES(`averageSpO2`),
                `lowestSpO2` = VALUES(`lowestSpO2`),
                `latestSpO2` = VALUES(`latestSpO2`);
            """
            cursor.execute(sql_spo2, (date_time_str, email, date_time_str, str(avg_spo2) if avg_spo2 is not None else None, str(lowest_spo2) if lowest_spo2 is not None else None, str(latest_spo2) if latest_spo2 is not None else None))

    logger.info(f"数据成功写入各健康数据表！[日期: {date_str}, 用户: {email}, 步数: {total_steps}, 心率: {max_hr}/{resting_hr}, 睡眠: {sleeping_sec}s, 电量: +{bb_charged}/-{bb_drained}, 压力: {avg_stress}]")


def sync_range(email: str, password: str, is_cn: bool, start_date: datetime.date, end_date: datetime.date, token_dir: str, use_ssh_tunnel: bool):
    """
    同步指定日期范围的数据，支持开启 SSH 加密隧道连接
    """
    garmin = init_garmin_client(email, password, is_cn, token_dir)

    tunnel = None
    actual_host = os.getenv("DB_HOST", "127.0.0.1")
    actual_port = int(os.getenv("DB_PORT", "3306"))
    db_user = os.getenv("DB_USER", "root")
    db_pass = os.getenv("DB_PASS", "nwpuhs@ABC123!@#")
    db_name = os.getenv("DB_NAME", "healthsystem_test2")

    # 如果配置开启了 SSH 隧道，自动建立后台隧道绕过防火墙
    if use_ssh_tunnel and HAS_SSH_TUNNEL:
        ssh_host = os.getenv("SSH_HOST", "47.109.49.174")
        ssh_port = int(os.getenv("SSH_PORT", "22"))
        ssh_user = os.getenv("SSH_USER", "root")
        ssh_pass = os.getenv("SSH_PASS", "nwpuhs@ABC123!@#")
        try:
            logger.info(f"正在自动打通与云服务器 ({ssh_host}) 的 SSH 加密隧道...")
            tunnel = SSHTunnelForwarder(
                (ssh_host, ssh_port),
                ssh_username=ssh_user,
                ssh_password=ssh_pass,
                remote_bind_address=('127.0.0.1', 3306)
            )
            tunnel.start()
            actual_host = '127.0.0.1'
            actual_port = tunnel.local_bind_port
            logger.info(f"SSH 加密隧道构建成功！映射端口 {actual_port}")
        except Exception as e:
            logger.error(f"打通 SSH 隧道失败: {e}")
            sys.exit(1)

    conn = get_db_connection(actual_host, actual_port, db_user, db_pass, db_name)

    current_date = start_date
    delta = datetime.timedelta(days=1)

    try:
        while current_date <= end_date:
            summary = fetch_daily_summary(garmin, current_date)
            if summary:
                sleep_data = fetch_daily_sleep(garmin, current_date)
                save_all_health_data(conn, email, current_date, summary, sleep_data)
            current_date += delta
    finally:
        conn.close()
        logger.info("数据库连接已正常关闭。")
        if tunnel:
            tunnel.stop()
            logger.info("SSH 隧道已自动关闭。")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Garmin 手环数据同步")
    parser.add_argument("--email", type=str, help="Garmin Connect 邮箱账号")
    parser.add_argument("--password", type=str, help="Garmin Connect 密码")
    parser.add_argument("--days", type=int, default=7, help="回溯同步天数")
    parser.add_argument("--is-cn", type=str, default="True", help="是否中国区 (True/False)")
    parser.add_argument("--token-store", type=str, help="Token 存储目录")
    parser.add_argument("--skip-tunnel", action="store_true", help="跳过 SSH 隧道直连本地数据库 (服务器端使用)")

    args = parser.parse_args()

    email = args.email or os.getenv("GARMIN_EMAIL")
    password = args.password or os.getenv("GARMIN_PASSWORD")
    is_cn = str(args.is_cn).lower() in ("true", "1", "yes") if args.is_cn else (os.getenv("GARMIN_IS_CN", "True").lower() in ("true", "1", "yes"))
    days_back = args.days if args.days else int(os.getenv("SYNC_DAYS_BACK", "7"))

    if not email or not password:
        logger.error("缺少 Garmin 邮箱或密码参数！")
        sys.exit(1)

    # 为不同账号生成独立的 Token 缓存路径，防止串号
    safe_account = email.replace("@", "_").replace(".", "_")
    token_dir = args.token_store or os.path.join(os.path.expanduser("~"), f".garmin_{safe_account}")

    # 判断是否开启隧道：如果是在Linux服务器上或指定了 --skip-tunnel，则不开启隧道直连本地 127.0.0.1:3306
    is_linux = sys.platform.startswith("linux")
    use_tunnel = False if (is_linux or args.skip_tunnel) else (os.getenv("USE_SSH_TUNNEL", "True").lower() in ("true", "1", "yes"))

    logger.info("=== Garmin 手环数据同步任务启动 ===")
    today = datetime.date.today()
    start_date = today - datetime.timedelta(days=days_back)
    logger.info(f"账号: {email}, 日期范围: {start_date.strftime('%Y-%m-%d')} 至 {today.strftime('%Y-%m-%d')}, 隧道: {use_tunnel}")

    sync_range(
        email=email,
        password=password,
        is_cn=is_cn,
        start_date=start_date,
        end_date=today,
        token_dir=token_dir,
        use_ssh_tunnel=use_tunnel
    )
    logger.info("=== Garmin 手环数据同步完成 ===")
