#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Garmin 手环/手表健康数据同步至 MySQL 数据库脚本
基于 python-garminconnect & garth 库，支持 SSH 加密隧道全自动连接
"""

import os
import sys
import datetime
import logging
from typing import Dict, Any, Optional

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

script_dir = os.path.dirname(os.path.abspath(__file__))
load_env_file(os.path.join(script_dir, ".env"))

# ---------------------------------------------------------------------------
# 配置信息 (优先读取 .env 或系统环境变量，也可在下方填写默认值)
# ---------------------------------------------------------------------------
GARMIN_EMAIL = os.getenv("GARMIN_EMAIL", "your_garmin_email@example.com")
GARMIN_PASSWORD = os.getenv("GARMIN_PASSWORD", "your_garmin_password")
IS_CN = os.getenv("GARMIN_IS_CN", "True").lower() in ("true", "1", "yes")

TOKEN_STORE = os.getenv("GARMIN_TOKEN_STORE", os.path.expanduser("~/.garminconnect"))

# SSH 隧道配置
USE_SSH_TUNNEL = os.getenv("USE_SSH_TUNNEL", "False").lower() in ("true", "1", "yes")
SSH_HOST = os.getenv("SSH_HOST", "47.109.49.174")
SSH_PORT = int(os.getenv("SSH_PORT", "22"))
SSH_USER = os.getenv("SSH_USER", "root")
SSH_PASS = os.getenv("SSH_PASS", "")

# 数据库连接配置
DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_PORT = int(os.getenv("DB_PORT", "3306"))
DB_USER = os.getenv("DB_USER", "root")
DB_PASS = os.getenv("DB_PASS", "123456")
DB_NAME = os.getenv("DB_NAME", "healthsystem_test2")


def init_garmin_client() -> Garmin:
    """
    初始化并登录 Garmin 客户端 (优先复用持久化 Token)
    """
    logger.info(f"正在准备初始化 Garmin 客户端 (账号: {GARMIN_EMAIL}, 是否中国区: {IS_CN})...")
    garmin = Garmin(email=GARMIN_EMAIL, password=GARMIN_PASSWORD, is_cn=IS_CN)

    token_loaded = False
    if os.path.exists(TOKEN_STORE):
        try:
            logger.info(f"读取本地持久化 Token 目录: {TOKEN_STORE}")
            garmin.login(TOKEN_STORE)
            token_loaded = True
            logger.info("使用本地 Token 成功登录 Garmin Connect!")
        except Exception as e:
            logger.warning(f"使用本地 Token 登录失败 ({e})，将重新使用账号密码登录...")

    if not token_loaded:
        try:
            logger.info("进行账号密码登录认证...")
            garmin.login()
            garmin.garth.dump(TOKEN_STORE)
            logger.info(f"登录成功，凭证已保存至本地 Token 目录: {TOKEN_STORE}")
        except Exception as e:
            err_msg = str(e)
            if "401" in err_msg or "Unauthorized" in err_msg or isinstance(e, GarminConnectAuthenticationError):
                logger.error("=" * 65)
                logger.error("【 Garmin 账号认证失败 (401 Unauthorized) 】")
                logger.error(f" 当前登录账号: {GARMIN_EMAIL}")
                logger.error(" 请检查 .env 配置文件中的 GARMIN_EMAIL 和 GARMIN_PASSWORD 是否正确！")
                logger.error("=" * 65)
            elif "429" in err_msg or isinstance(e, GarminConnectTooManyRequestsError):
                logger.error("Garmin API 请求过于频繁被限流 (429)，请稍后再试！")
            else:
                logger.error(f"登录 Garmin 时发生未预期异常: {e}")
            sys.exit(1)

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
        logger.error(f"拉取日期 [{date_str}] 的数据失败: {e}")
        return None


def get_db_connection(host=None, port=None):
    """
    连接 MySQL 数据库 (包含超时与 SSL 配置)
    """
    target_host = host if host else DB_HOST
    target_port = port if port else DB_PORT

    try:
        conn = pymysql.connect(
            host=target_host,
            port=target_port,
            user=DB_USER,
            password=DB_PASS,
            database=DB_NAME,
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
        logger.error(f"连接数据库 [{target_host}:{target_port}/{DB_NAME}] 失败: {e}")
        sys.exit(1)


def save_summary_to_db(conn, email: str, target_date: datetime.date, summary: Dict[str, Any]):
    """
    解析 Garmin 数据并写入/更新 MySQL 的 activity 表
    """
    date_str = target_date.strftime("%Y-%m-%d")
    date_time_str = f"{date_str} 00:00:00"

    user_profile_id = str(summary.get("userProfileId") or "")
    total_kilocalories = summary.get("totalKilocalories")
    active_kilocalories = summary.get("activeKilocalories")
    bmr_kilocalories = summary.get("bmrKilocalories")
    total_steps = summary.get("totalSteps")
    total_distance_meters = summary.get("totalDistanceMeters")
    
    wellness_start_gmt = summary.get("wellnessStartTimeGmt")
    wellness_start_local = summary.get("wellnessStartTimeLocal")
    wellness_end_gmt = summary.get("wellnessEndTimeGmt")
    wellness_end_local = summary.get("wellnessEndTimeLocal")

    sleeping_seconds = summary.get("sleepingSeconds")
    active_seconds = summary.get("activeSeconds")
    sedentary_seconds = summary.get("sedentarySeconds")

    resting_heart_rate = summary.get("restingHeartRate")
    min_heart_rate = summary.get("minHeartRate")
    max_heart_rate = summary.get("maxHeartRate")

    avg_stress_level = summary.get("averageStressLevel")
    max_stress_level = summary.get("maxStressLevel")
    stress_qualifier = summary.get("stressQualifier")

    body_battery_charged = summary.get("bodyBatteryChargedValue")
    body_battery_drained = summary.get("bodyBatteryDrainedValue")
    body_battery_highest = summary.get("bodyBatteryHighestValue")
    body_battery_lowest = summary.get("bodyBatteryLowestValue")
    body_battery_most_recent = summary.get("bodyBatteryMostRecentValue")

    avg_spo2 = summary.get("averageSpo2")
    lowest_spo2 = summary.get("lowestSpo2")
    latest_spo2 = summary.get("latestSpo2")

    avg_waking_respiration = summary.get("avgWakingRespirationValue")

    sql = """
    INSERT INTO `activity` (
        `date`, `email`, `userProfileId`, `totalKilocalories`, `activeKilocalories`, `bmrKilocalories`,
        `totalSteps`, `totalDistanceMeters`, `wellnessStartTimeGmt`, `wellnessStartTimeLocal`,
        `wellnessEndTimeGmt`, `wellnessEndTimeLocal`, `sleepingSeconds`, `activeSeconds`, `sedentarySeconds`,
        `restingHeartRate`, `minHeartRate`, `maxHeartRate`, `averageStressLevel`, `maxStressLevel`,
        `stressQualifier`, `bodyBatteryChargedValue`, `bodyBatteryDrainedValue`, `bodyBatteryHighestValue`,
        `bodyBatteryLowestValue`, `bodyBatteryMostRecentValue`, `averageSpo2`, `lowestSpo2`, `latestSpo2`,
        `avgWakingRespirationValue`, `source`
    ) VALUES (
        %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s,
        %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s,
        %s, %s, %s, %s,
        %s, %s, %s, %s, %s,
        %s, 'GARMIN'
    )
    ON DUPLICATE KEY UPDATE
        `userProfileId` = VALUES(`userProfileId`),
        `totalKilocalories` = VALUES(`totalKilocalories`),
        `activeKilocalories` = VALUES(`activeKilocalories`),
        `bmrKilocalories` = VALUES(`bmrKilocalories`),
        `totalSteps` = VALUES(`totalSteps`),
        `totalDistanceMeters` = VALUES(`totalDistanceMeters`),
        `wellnessStartTimeGmt` = VALUES(`wellnessStartTimeGmt`),
        `wellnessStartTimeLocal` = VALUES(`wellnessStartTimeLocal`),
        `wellnessEndTimeGmt` = VALUES(`wellnessEndTimeGmt`),
        `wellnessEndTimeLocal` = VALUES(`wellnessEndTimeLocal`),
        `sleepingSeconds` = VALUES(`sleepingSeconds`),
        `activeSeconds` = VALUES(`activeSeconds`),
        `sedentarySeconds` = VALUES(`sedentarySeconds`),
        `restingHeartRate` = VALUES(`restingHeartRate`),
        `minHeartRate` = VALUES(`minHeartRate`),
        `maxHeartRate` = VALUES(`maxHeartRate`),
        `averageStressLevel` = VALUES(`averageStressLevel`),
        `maxStressLevel` = VALUES(`maxStressLevel`),
        `stressQualifier` = VALUES(`stressQualifier`),
        `bodyBatteryChargedValue` = VALUES(`bodyBatteryChargedValue`),
        `bodyBatteryDrainedValue` = VALUES(`bodyBatteryDrainedValue`),
        `bodyBatteryHighestValue` = VALUES(`bodyBatteryHighestValue`),
        `bodyBatteryLowestValue` = VALUES(`bodyBatteryLowestValue`),
        `bodyBatteryMostRecentValue` = VALUES(`bodyBatteryMostRecentValue`),
        `averageSpo2` = VALUES(`averageSpo2`),
        `lowestSpo2` = VALUES(`lowestSpo2`),
        `latestSpo2` = VALUES(`latestSpo2`),
        `avgWakingRespirationValue` = VALUES(`avgWakingRespirationValue`),
        `source` = 'GARMIN';
    """

    params = (
        date_time_str, email, user_profile_id, total_kilocalories, active_kilocalories, bmr_kilocalories,
        total_steps, total_distance_meters, wellness_start_gmt, wellness_start_local,
        wellness_end_gmt, wellness_end_local, sleeping_seconds, active_seconds, sedentary_seconds,
        resting_heart_rate, min_heart_rate, max_heart_rate, avg_stress_level, max_stress_level,
        stress_qualifier, body_battery_charged, body_battery_drained, body_battery_highest,
        body_battery_lowest, body_battery_most_recent, avg_spo2, lowest_spo2, latest_spo2,
        avg_waking_respiration
    )

    with conn.cursor() as cursor:
        cursor.execute(sql, params)
        logger.info(f"数据插入/更新成功！[日期: {date_str}, 用户: {email}, 步数: {total_steps}, 卡路里: {total_kilocalories}]")


def sync_range(start_date: datetime.date, end_date: datetime.date):
    """
    同步指定日期范围的数据，支持开启 SSH 加密隧道连接
    """
    garmin = init_garmin_client()
    
    tunnel = None
    actual_host = DB_HOST
    actual_port = DB_PORT

    # 如果配置开启了 SSH 隧道，自动建立后台隧道绕过防火墙
    if USE_SSH_TUNNEL and HAS_SSH_TUNNEL:
        try:
            logger.info(f"正在自动打通与阿里云服务器 ({SSH_HOST}) 的 SSH 加密隧道...")
            tunnel = SSHTunnelForwarder(
                (SSH_HOST, SSH_PORT),
                ssh_username=SSH_USER,
                ssh_password=SSH_PASS,
                remote_bind_address=('127.0.0.1', 3306)
            )
            tunnel.start()
            actual_host = '127.0.0.1'
            actual_port = tunnel.local_bind_port
            logger.info(f"SSH 加密隧道构建成功！云端 127.0.0.1:3306 已自动映射至本地端口 {actual_port}")
        except Exception as e:
            logger.error(f"打通 SSH 隧道失败: {e}")
            sys.exit(1)

    conn = get_db_connection(host=actual_host, port=actual_port)

    current_date = start_date
    delta = datetime.timedelta(days=1)

    try:
        while current_date <= end_date:
            summary = fetch_daily_summary(garmin, current_date)
            if summary:
                save_summary_to_db(conn, GARMIN_EMAIL, current_date, summary)
            current_date += delta
    finally:
        conn.close()
        logger.info("数据库连接已正常关闭。")
        if tunnel:
            tunnel.stop()
            logger.info("SSH 隧道已自动关闭。")


if __name__ == "__main__":
    logger.info("=== Garmin 手环数据同步任务启动 ===")
    
    days_back = int(os.getenv("SYNC_DAYS_BACK", "7"))
    today = datetime.date.today()
    start_date = today - datetime.timedelta(days=days_back)

    logger.info(f"同步日期范围: {start_date.strftime('%Y-%m-%d')} 至 {today.strftime('%Y-%m-%d')}")
    sync_range(start_date, today)
    logger.info("=== Garmin 手环数据同步完成 ===")
