"""
pip3 install garth requests readchar

export EMAIL=<your garmin email>
export PASSWORD=<your garmin password>

"""

import datetime
from datetime import timezone
import json
import logging
import os
import sys
from getpass import getpass

import argparse  # 修改部分

import readchar
import requests
from garth.exc import GarthHTTPError

from garminconnect import (
    Garmin,
    GarminConnectAuthenticationError,
    GarminConnectConnectionError,
    GarminConnectTooManyRequestsError,
)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# -------------------------- 新增1：各数据类型的关键字段配置（核心！判断数据是否合格的依据） --------------------------
# 键：数据类型（与save_data的data_type参数对应），值：该类型必须非空的关键字段列表
DATA_TYPE_KEY_FIELDS = {
    "activity_data": [
        "data.totalKilocalories",
        "data.totalSteps",
        "data.totalDistanceMeters",
    ],  # 活动数据关键字段
    "body_battery_data": [
        "data.body_battery.0.charged",
        "data.body_battery.0.drained",
    ],  # 身体电池数据关键字段
    "daily_steps_data": [
        "steps.0.totalSteps",
        "steps.0.totalDistance",
        "steps.0.stepGoal",
    ],  # 每日步数数据关键字段
    "fitness_age_data": ["data.fitnessAge"],  # 体能年龄关键字段
    "heart_rate_data": [
        "data.maxHeartRate",
        "data.minHeartRate",
        "data.restingHeartRate",
    ],  # 心率数据关键字段
    "hrv_data": ["data.hrvSummary.weeklyAvg"],  # 心率变异性关键字段
    "respiration_data": [
        "data.lowestRespirationValue",
        "data.highestRespirationValue",
    ],  # 呼吸数据关键字段
    "resting_heart_rate_data": [
        "data.allMetrics.metricsMap.WELLNESS_RESTING_HEART_RATE.0.value"
    ],  # 静息心率关键字段
    "sleep_data": [
        "data.dailySleepDTO.sleepTimeSeconds",
        "data.dailySleepDTO.deepSleepSeconds",
    ],  # 睡眠数据关键字段
    "stats_body_composition_data": [
        "data.totalKilocalories",
        "data.totalSteps",
    ],  # 身体成分数据关键字段
    "steps_data": ["data.0.steps"],  # 15分钟步数数据关键字段
    "stress_data": ["data.maxStressLevel", "data.avgStressLevel"],  # 压力数据关键字段
}
# --------------------------------------------------------------------------

# -------------------------- 新增2：空值记录管理模块（核心！不区分数据类型） --------------------------
# 空值记录存储路径（与json数据同目录，按用户隔离）
# NULL_RECORD_ROOT = os.path.join(r"E:\\learn\\vue3\\health\\python_scripts\\json_data")
# NULL_RECORD_ROOT = os.path.join(r"/healthsystem-test/python_scripts/json_data")
NULL_RECORD_ROOT = os.path.join(r"/home/xtt/python_scripts/json_data")
# NULL_RECORD_ROOT = os.path.join(r"/healthsystem-test/python_scripts/json_data")  # 服务器路径（按需切换）
NULL_RECORD_FILE = "null_data_records.json"  # 单用户的空值记录文件名


def get_user_null_record_path(safe_email: str) -> str:
    """获取当前用户的空值记录路径（按邮箱隔离）"""
    user_dir = os.path.join(NULL_RECORD_ROOT, safe_email)
    os.makedirs(user_dir, exist_ok=True)  # 确保目录存在
    return os.path.join(user_dir, NULL_RECORD_FILE)


def load_null_records(user_email: str) -> list:
    """加载当前用户的空值记录（无记录返回空列表）"""
    safe_email = user_email.replace("@", "_")
    record_path = get_user_null_record_path(safe_email)
    if not os.path.exists(record_path):
        return []
    try:
        with open(record_path, "r", encoding="utf-8") as f:
            records = json.load(f)
            # 确保记录包含必要字段（兼容异常情况）
            required_fields = [
                "user_email",
                "start_date",
                "end_date",
                "null_dates",
                "status",
            ]
            for record in records:
                for field in required_fields:
                    if field not in record:
                        # 填充默认值
                        if field == "null_dates":
                            record[field] = []
                        elif field == "status":
                            record[field] = "未处理"
                        elif field == "user_email":
                            record[field] = user_email
                        else:
                            record[field] = ""
            return records
    except (json.JSONDecodeError, Exception) as e:
        logger.error(f"加载空值记录失败（{record_path}）：{e}")
        return []


def save_null_records(user_email: str, records: list) -> bool:
    """保存当前用户的空值记录（去重：同一时段仅一条）"""
    safe_email = user_email.replace("@", "_")
    record_path = get_user_null_record_path(safe_email)
    try:
        # 去重：按“时段（start_date+end_date）”唯一，避免重复记录
        unique_records = []
        record_keys = set()
        for record in records:
            if not all([record["start_date"], record["end_date"]]):
                continue  # 跳过时段不完整的记录
            record_key = f"{record['start_date']}_{record['end_date']}"
            if record_key not in record_keys:
                record_keys.add(record_key)
                unique_records.append(record)
        # 保存记录
        with open(record_path, "w", encoding="utf-8") as f:
            json.dump(unique_records, f, ensure_ascii=False, indent=2)
        logger.info(f"空值记录已保存（{len(unique_records)}条）：{record_path}")
        return True
    except Exception as e:
        logger.error(f"保存空值记录失败（{record_path}）：{e}")
        return False


def add_null_record(
    user_email: str, start_date: str, end_date: str, null_dates: list
) -> None:
    """
    新增/更新空值记录：首次获取后，若有不合格日期则记录
    - 不区分数据类型，仅按“日期是否合格”记录
    """
    if not null_dates:
        return  # 无不合格日期，无需记录

    # 读取现有记录
    records = load_null_records(user_email)
    record_updated = False

    # 检查是否已有相同时段的记录，有则更新，无则新增
    for idx, record in enumerate(records):
        if (
            record["user_email"] == user_email
            and record["start_date"] == start_date
            and record["end_date"] == end_date
        ):
            # 合并不合格日期（去重）
            merged_null_dates = list(set(record["null_dates"] + null_dates))
            records[idx]["null_dates"] = merged_null_dates
            records[idx]["status"] = "未处理"  # 重置为未处理
            logger.info(
                f"更新空值记录：{user_email}（{start_date}-{end_date}），合并后不合格日期：{merged_null_dates}"
            )
            record_updated = True
            break

    # 无现有记录则新增
    if not record_updated:
        new_record = {
            "user_email": user_email,
            "start_date": start_date,
            "end_date": end_date,
            "null_dates": null_dates,
            "status": "未处理",  # 初始状态：未处理
        }
        records.append(new_record)
        logger.info(f"新增空值记录：{json.dumps(new_record, ensure_ascii=False)}")

    # 保存更新后的记录
    save_null_records(user_email, records)


def update_null_record_status(user_email: str, start_date: str, end_date: str) -> list:
    """
    更新空值记录状态：重请求后合格，标记为“已处理”并返回原不合格日期
    :return: 原不合格日期列表（用于告知用户）
    """
    records = load_null_records(user_email)
    original_null_dates = []
    record_modified = False

    # 匹配“未处理”的目标时段记录
    for idx, record in enumerate(records):
        if (
            record["user_email"] == user_email
            and record["start_date"] == start_date
            and record["end_date"] == end_date
            and record["status"] == "未处理"
        ):
            original_null_dates = record["null_dates"].copy()  # 保存原不合格日期
            records[idx]["status"] = "已处理"
            record_modified = True
            logger.info(
                f"空值记录标记为已处理：{user_email}（{start_date}-{end_date}），原不合格日期：{original_null_dates}"
            )
            break

    # 保存更新后的记录
    if record_modified:
        save_null_records(user_email, records)

    return original_null_dates


def get_unhandled_null_records(user_email: str) -> list:
    """获取当前用户所有“未处理”的空值记录（用于优先重请求）"""
    records = load_null_records(user_email)
    # 筛选条件：未处理 + 不合格日期非空 + 时段完整
    return [
        r
        for r in records
        if r["user_email"] == user_email
        and r["status"] == "未处理"
        and len(r["null_dates"]) > 0
        and r["start_date"]
        and r["end_date"]
    ]


# --------------------------------------------------------------------------

# -------------------------- 新增：命令行参数解析 --------------------------
parser = argparse.ArgumentParser(description="Garmin Connect API 数据获取工具")
parser.add_argument(
    "--email", help="Garmin账号邮箱（优先于环境变量）", default="ccceee00011@163.com"
)
parser.add_argument(
    "--password", help="Garmin账号密码（优先于环境变量）", default="Forest58312"
)
parser.add_argument(
    "--start-date", help="开始日期（格式：YYYY-MM-DD）", default="2025-12-27"
)
parser.add_argument(
    "--end-date", help="结束日期（格式：YYYY-MM-DD）", default="2026-01-10"
)
parser.add_argument(
    "--option", help='操作选项（如"c"获取睡眠数据，"9"获取心率数据）', default="*"
)
# parser.add_argument('--test', help='测试模式：手动模拟空值数据', default=False)
args = parser.parse_args()
# --------------------------------------------------------------------------

# Load environment variables if defined
email = args.email
password = args.password

if not email:
    email = os.getenv("EMAIL")
if not password:
    password = os.getenv("PASSWORD")

# tokenstore = "/healthsystem-test/python_scripts/.garminconnecttoken"
# tokenstore_base64 = "/healthsystem-test/python_scripts/.garminconnect_base64"

tokenstore = "/home/xtt/python_scripts/.garminconnecttoken"
tokenstore_base64 = "/home/xtt/python_scripts/.garminconnect_base64"
# tokenstore = "E:\\learn\\vue3\\health\\python_scripts\\.garminconnecttoken"
# tokenstore_base64 = "E:\\learn\\vue3\\health\\python_scripts\\.garminconnect_base64"

api = None

# -------------------------- 新增：通过命令行参数设置日期范围 --------------------------
try:
    startdate = datetime.datetime.strptime(args.start_date, "%Y-%m-%d").date()
    enddate = datetime.datetime.strptime(args.end_date, "%Y-%m-%d").date()
except ValueError as e:
    logger.error(f"日期格式错误，请使用YYYY-MM-DD：{e}")
    sys.exit(1)
# --------------------------------------------------------------------------


# -------------------------- 新增：定义批量获取的选项列表 --------------------------
# 定义需要批量获取的所有数据类型对应的选项键
BATCH_OPTIONS = [
    "4",  # 活动数据
    "7",  # 每日状态和身体成分
    "8",  # 每15分钟步数
    "9",  # 心率数据
    "-",  # 每日步数
    "/",  # 身体电池数据
    "a",  # 静息心率
    "c",  # 睡眠数据
    "d",  # 压力数据
    "e",  # 呼吸数据
    "f",  # 血氧数据
    "x",  # 心率变异性(HRV)
    "U",  # 体能年龄数据
]
# --------------------------------------------------------------------------

menu_options = {
    "1": "Get full name",
    "2": "Get unit system",
    "4": f"Get activity data for '{startdate.isoformat()}' to '{enddate.isoformat()}' (compatible with garminconnect-ha)",  # 活动
    "7": f"Get stats and body composition data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 每日状态，包括各项数据
    "8": f"Get steps data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 每15分钟
    "9": f"Get heart rate data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 实时
    "-": f"Get daily step data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 每日步数
    "/": f"Get body battery data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 每4小时
    "a": f"Get resting heart rate data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",
    "c": f"Get sleep data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 实时
    "d": f"Get stress data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 实时
    "e": f"Get respiration data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 实时
    "f": f"Get SpO2 data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 每小时
    "x": f"Get Heart Rate Variability data (HRV) for '{startdate.isoformat()}' to '{enddate.isoformat()}'",  # 每5分钟
    "U": f"Get Fitness Age data for '{startdate.isoformat()}' to '{enddate.isoformat()}",  # 每日
    "*": "一次性获取所有数据类型（活动/心率/睡眠/步数等）",  # 新增批量选项
    "Z": "Remove stored login tokens (logout)",
    "q": "Exit",
}


def display_json(api_call, output):
    """Format API output for better readability."""
    dashed = "-" * 20
    header = f"{dashed} {api_call} {dashed}"
    footer = "-" * len(header)
    print(header)

    if isinstance(output, (int, str, dict, list)):
        print(json.dumps(output, indent=4))
    else:
        print(output)

    print(footer)


def display_text(output):
    """Format API output for better readability."""
    dashed = "-" * 60
    header = f"{dashed}"
    footer = "-" * len(header)
    print(header)
    print(json.dumps(output, indent=4))
    print(footer)


def get_credentials():
    """Get user credentials."""
    email = input("Login e-mail: ")
    password = getpass("Enter password: ")
    return email, password


def init_api(email, password):
    """Initialize Garmin API with your credentials."""
    try:
        # Using Oauth1 and OAuth2 token files from directory
        print(
            f"Trying to login to Garmin Connect using token data from directory '{tokenstore}'...\n"
        )

        garmin = Garmin()
        garmin.login(tokenstore)

    except (FileNotFoundError, GarthHTTPError, GarminConnectAuthenticationError):
        # Session is expired. You'll need to log in again
        print(
            "Login tokens not present, login with your Garmin Connect credentials to generate them.\n"
            f"They will be stored in '{tokenstore}' for future use.\n"
        )
        try:
            # Ask for credentials if not set as environment variables
            if not email or not password:
                email, password = get_credentials()

            # 修改地区，cn是中国区API，com是国际区API
            garmin = Garmin(
                email=email, password=password, is_cn=True, return_on_mfa=True
            )
            result1, result2 = garmin.login()
            if result1 == "needs_mfa":  # MFA is required
                mfa_code = get_mfa()
                garmin.resume_login(result2, mfa_code)

            # Save Oauth1 and Oauth2 token files to directory for next login
            garmin.garth.dump(tokenstore)
            print(
                f"Oauth tokens stored in '{tokenstore}' directory for future use. (first method)\n"
            )

            # Encode Oauth1 and Oauth2 tokens to base64 string and safe to file for next login (alternative way)
            token_base64 = garmin.garth.dumps()
            dir_path = os.path.expanduser(tokenstore_base64)
            with open(dir_path, "w") as token_file:
                token_file.write(token_base64)
            print(
                f"Oauth tokens encoded as base64 string and saved to '{dir_path}' file for future use. (second method)\n"
            )

            # Re-login Garmin API with tokens
            garmin.login(tokenstore)
        except (
            FileNotFoundError,
            GarthHTTPError,
            GarminConnectAuthenticationError,
            requests.exceptions.HTTPError,
        ) as err:
            logger.error(err)
            return None

    return garmin


def get_mfa():
    """Get MFA."""
    return input("MFA one-time code: ")


def print_menu():
    """Print examples menu."""
    for key in menu_options.keys():
        print(f"{key} -- {menu_options[key]}")
    print("Make your selection: ", end="", flush=True)


# -------------------------- 新增3：单天数据校验函数（判断某天数据是否合格） --------------------------
def is_daily_data_valid(daily_data: dict, data_type: str) -> bool:
    """
    判断单天数据是否合格：检查该数据类型的所有关键字段是否存在且非空
    支持嵌套字段（如data.0.steps），并允许数值0（如步数为0）
    :param daily_data: 单天数据（结构：{date: "...", data: [...]} 或特殊结构如body_battery）
    :param data_type: 数据类型（对应DATA_TYPE_KEY_FIELDS的键）
    :return: True=合格，False=不合格
    """
    # 1. 检查数据类型是否在配置中
    if data_type not in DATA_TYPE_KEY_FIELDS:
        logger.warning(f"未知数据类型：{data_type}，默认判定为合格")
        return True

    # 2. 适配特殊数据类型结构（如body_battery_data无data键）
    if data_type == "body_battery_data":
        # 构造适配后续校验的结构（将body_battery和events放入data键）
        adapted_data = {
            "date": daily_data["date"],
            "data": {
                "body_battery": daily_data["body_battery"],
                "body_battery_events": daily_data["body_battery_events"],
            },
        }
        daily_data = adapted_data

    # 3. 获取当前数据类型的关键字段
    key_fields = DATA_TYPE_KEY_FIELDS[data_type]

    # 4. 遍历关键字段，解析嵌套路径（支持列表索引，如data.0.steps）
    for field in key_fields:
        field_parts = field.split(".")  # 拆分路径：["data", "0", "steps"]
        current_data = daily_data  # 从根数据开始逐层遍历
        field_exists = True

        # 逐层解析字段（处理字典键和列表索引）
        for part in field_parts:
            # 处理列表索引（如"0"→转为整数0）
            if part.isdigit():
                part = int(part)
                # 检查当前层级是否为列表，且索引有效（不越界）
                if not isinstance(current_data, list) or part >= len(current_data):
                    field_exists = False
                    break
            # 处理字典键（如"data"、"steps"）
            else:
                if not isinstance(current_data, dict) or part not in current_data:
                    field_exists = False
                    break

            # 进入下一层级数据
            current_data = current_data[part]

        # 字段不存在或索引越界→数据不合格
        if not field_exists:
            logger.warning(
                f"缺失关键字段/索引无效：{field} → 日期{daily_data['date']}数据不合格"
            )
            return False

        # 5. 判断字段值是否有效（允许0，排除null/空字符串/NaN/空数组）
        value = current_data
        # 无效值判定条件：
        # - 是None → 无效
        # - 是空字符串（或纯空格）→ 无效
        # - 是NaN（float类型的Not a Number）→ 无效
        # - 是空列表 → 无效
        # 注意：允许数值0（如steps=0）、布尔值（如true/false）
        if (
            value is None
            or (isinstance(value, str) and value.strip() == "")
            or (isinstance(value, float) and str(value).lower() == "nan")
            or (isinstance(value, list) and len(value) == 0)
        ):
            logger.warning(
                f"关键字段'{field}'值无效（空/NaN/空数组）→ 日期{daily_data['date']}数据不合格"
            )
            return False

    # 所有关键字段均存在且有效→数据合格
    return True


# -------------------------- 新增4：收集某时段内的不合格日期（不区分数据类型） --------------------------
def collect_invalid_dates(
    all_data: list, data_type: str, start_date: str, end_date: str
) -> list:
    """
    收集某时段内的不合格日期：仅通过is_daily_data_valid判定
    :param all_data: 某数据类型的全时段数据（[{date: "...", data: ...}, ...]）
    :param data_type: 数据类型（用于is_daily_data_valid校验）
    :param start_date/end_date: 时段范围（YYYY-MM-DD）
    :return: 不合格日期列表（YYYY-MM-DD）
    """
    invalid_dates = []
    for daily_item in all_data:
        daily_date = daily_item["date"]
        # 仅处理时段内的日期
        if not (start_date <= daily_date <= end_date):
            continue
        # 用is_daily_data_valid判定是否合格
        if not is_daily_data_valid(daily_item, data_type):
            invalid_dates.append(daily_date)
    return invalid_dates


def switch(api, i):
    """Run selected API call."""
    # 全局变量声明（用于重请求时覆盖日期范围）
    global startdate, enddate

    # Exit example program
    if i == "q":
        print("Be active, generate some data to fetch next time ;-) Bye!")
        sys.exit()

    # Skip requests if login failed
    if api:
        try:
            print(f"\n\nExecuting: {menu_options[i]}\n")

            # -------------------------- 新增：优先处理未处理的空值记录（批量获取时生效） --------------------------
            if i == "*":
                # 1. 获取当前用户的未处理空值记录
                unhandled_records = get_unhandled_null_records(email)
                if unhandled_records:
                    logger.warning(
                        f"\n发现{len(unhandled_records)}条未处理空值记录，优先重请求修复"
                    )
                    for record in unhandled_records:
                        # 解析记录中的时段
                        try:
                            rec_start = datetime.datetime.strptime(
                                record["start_date"], "%Y-%m-%d"
                            ).date()
                            rec_end = datetime.datetime.strptime(
                                record["end_date"], "%Y-%m-%d"
                            ).date()
                        except ValueError:
                            logger.error(
                                f"记录时段格式错误（{record['start_date']}-{record['end_date']}），跳过"
                            )
                            continue

                        # 临时保存原命令行的日期范围（修复后恢复）
                        original_start = startdate
                        original_end = enddate
                        # 覆盖日期范围为待修复时段
                        startdate = rec_start
                        enddate = rec_end

                        # 2. 重请求该时段的所有数据类型（复用批量逻辑）
                        logger.info(
                            f"\n重请求修复时段：{email}（{rec_start}至{rec_end}）"
                        )
                        for option in BATCH_OPTIONS:
                            print(f"\n===== 重请求：{menu_options[option]} =====")
                            try:
                                switch(api, option)
                            except Exception as e:
                                logger.error(f"重请求选项 {option} 失败：{str(e)}")
                                continue

                        # 3. 验证重请求后的数据是否全部合格（检查所有数据类型）
                        all_valid = True
                        safe_email = email.replace("@", "_")
                        for option in BATCH_OPTIONS:
                            # 选项→数据类型映射（与save_data的data_type一致）
                            opt_data_type = {
                                "4": "activity_data",
                                "7": "stats_body_composition_data",
                                "8": "steps_data",
                                "9": "heart_rate_data",
                                "/": "body_battery_data",
                                "-": "daily_steps_data",
                                "a": "resting_heart_rate_data",
                                "c": "sleep_data",
                                "d": "stress_data",
                                "e": "respiration_data",
                                "f": "spo2_data",
                                "x": "hrv_data",
                                "U": "fitness_age_data",
                            }[option]
                            # 读取重请求后的JSON文件
                            json_filename = f"garmin_{opt_data_type}_{rec_start.strftime('%Y%m%d')}_{rec_end.strftime('%Y%m%d')}.json"
                            # json_path = os.path.join(r"E:\\learn\\vue3\\health\\python_scripts\\json_data", safe_email, json_filename)
                            json_path = os.path.join(
                                r"/healthsystem-test/python_scripts/json_data",
                                safe_email,
                                json_filename,
                            )
                            if not os.path.exists(json_path):
                                all_valid = False
                                break
                            # 读取数据并检查是否仍有不合格日期
                            with open(json_path, "r", encoding="utf-8") as f:
                                json_data = json.load(f)
                                invalid_dates = collect_invalid_dates(
                                    json_data,
                                    opt_data_type,
                                    rec_start.isoformat(),
                                    rec_end.isoformat(),
                                )
                                if invalid_dates:
                                    all_valid = False
                                    logger.warning(
                                        f"重请求后仍有不合格日期：{opt_data_type} → {invalid_dates}"
                                    )
                                    break

                        # 4. 重请求后全部合格→更新记录状态并返回原不合格日期
                        if all_valid:
                            original_invalid_dates = update_null_record_status(
                                email, record["start_date"], record["end_date"]
                            )
                            print(
                                f"\n重请求成功！原不合格日期已修复：{original_invalid_dates}"
                            )
                        else:
                            print(f"\n重请求后仍存在不合格日期，记录保持未处理状态")

                        # 恢复原命令行的日期范围
                        startdate = original_start
                        enddate = original_end
            # --------------------------------------------------------------------------

            # USER BASICS
            if i == "1":
                # Get full name from profile
                display_json("api.get_full_name()", api.get_full_name())
            elif i == "2":
                # Get unit system from profile
                display_json("api.get_unit_system()", api.get_unit_system())

            # 活动数据（i=="4"）
            elif i == "4":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_user_summary(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_user_summary() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "activity_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "activity_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 每日状态和身体成分数据（i=="7"）
            elif i == "7":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_stats_and_body(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_stats_and_body() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "stats_body_composition_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "stats_body_composition_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 每15分钟步数数据（i=="8"）
            elif i == "8":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_steps_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_steps_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "steps_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data, "steps_data", startdate.isoformat(), enddate.isoformat()
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 心率数据（i=="9"）
            elif i == "9":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_heart_rates(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_heart_rates() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "heart_rate_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "heart_rate_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 身体电池数据（i=="/"）
            elif i == "/":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    battery_data = api.get_body_battery(
                        current_date.isoformat(), current_date.isoformat()
                    )
                    battery_events = api.get_body_battery_events(
                        current_date.isoformat()
                    )
                    all_data.append(
                        {
                            "date": current_date.isoformat(),
                            "body_battery": battery_data,
                            "body_battery_events": battery_events,
                        }
                    )
                    current_date += datetime.timedelta(days=1)
                save_data(all_data, "body_battery_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "body_battery_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 每日步数数据（i=="-"）
            elif i == "-":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_step_data = api.get_daily_steps(
                        current_date.isoformat(), current_date.isoformat()
                    )
                    all_data.append(
                        {"date": current_date.isoformat(), "steps": daily_step_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_daily_steps('{startdate.isoformat()}', '{enddate.isoformat()}')",
                    api.get_daily_steps(startdate.isoformat(), enddate.isoformat()),
                )
                save_data(all_data, "daily_steps_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "daily_steps_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 静息心率数据（i=="a"）
            elif i == "a":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_rhr_day(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_rhr_day() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "resting_heart_rate_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "resting_heart_rate_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 睡眠数据（i=="c"）
            elif i == "c":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_sleep_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_sleep_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "sleep_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data, "sleep_data", startdate.isoformat(), enddate.isoformat()
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 压力数据（i=="d"）
            elif i == "d":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_stress_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_stress_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "stress_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data, "stress_data", startdate.isoformat(), enddate.isoformat()
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 呼吸数据（i=="e"）
            elif i == "e":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_respiration_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_respiration_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "respiration_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "respiration_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 血氧数据（i=="f"）
            elif i == "f":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_spo2_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_spo2_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "spo2_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data, "spo2_data", startdate.isoformat(), enddate.isoformat()
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 心率变异性数据（i=="x"）
            elif i == "x":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_hrv_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_hrv_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "hrv_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data, "hrv_data", startdate.isoformat(), enddate.isoformat()
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 体能年龄数据（i=="U"）
            elif i == "U":
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_fitnessage_data(current_date.isoformat())
                    all_data.append(
                        {"date": current_date.isoformat(), "data": daily_data}
                    )
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_fitnessage_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data,
                )
                save_data(all_data, "fitness_age_data")
                # 收集不合格日期并记录
                invalid_dates = collect_invalid_dates(
                    all_data,
                    "fitness_age_data",
                    startdate.isoformat(),
                    enddate.isoformat(),
                )
                if invalid_dates:
                    add_null_record(
                        email, startdate.isoformat(), enddate.isoformat(), invalid_dates
                    )

            # 批量执行逻辑（i=="*"）
            elif i == "*":
                print(f"\n开始一次性获取所有数据类型（共{len(BATCH_OPTIONS)}项）...\n")
                for option in BATCH_OPTIONS:
                    print(f"\n===== 正在获取：{menu_options[option]} =====")
                    try:
                        switch(api, option)
                    except Exception as e:
                        logger.error(f"获取选项 {option} 时出错：{str(e)}")
                        continue  # 忽略当前错误，继续下一项
                print(f"\n所有数据类型获取完成！")
                return  # 批量执行结束

            # 移除登录令牌（i=="Z"）
            elif i == "Z":
                tokendir = os.path.expanduser(tokenstore)
                print(f"Removing stored login tokens from: {tokendir}")
                try:
                    for root, dirs, files in os.walk(tokendir, topdown=False):
                        for name in files:
                            os.remove(os.path.join(root, name))
                        for name in dirs:
                            os.rmdir(os.path.join(root, name))
                    print(f"Directory {tokendir} removed")
                except FileNotFoundError:
                    print(f"Directory not found: {tokendir}")
                api = None

        except (
            GarminConnectConnectionError,
            GarminConnectAuthenticationError,
            GarminConnectTooManyRequestsError,
            requests.exceptions.HTTPError,
            GarthHTTPError,
        ) as err:
            logger.error(err)
        except KeyError:
            # Invalid menu option chosen
            pass
    else:
        print("Could not login to Garmin Connect, try again later.")


# -------------------------- 核心修改：通用数据保存函数 --------------------------
def save_data(data, data_type):
    try:
        user_email = email if email else "unknown_user"
        safe_email = user_email.replace("@", "_")

        # target_dir = os.path.join(r"E:\\learn\\vue3\\health\\python_scripts\\json_data", safe_email)
        # target_dir = os.path.join(
        #     r"/healthsystem-test/python_scripts/json_data", safe_email
        # )
        target_dir = os.path.join(r"/home/xtt/python_scripts/json_data", safe_email)
        os.makedirs(target_dir, exist_ok=True)

        filename = f"garmin_{data_type}_{startdate.strftime('%Y%m%d')}_{enddate.strftime('%Y%m%d')}.json"
        file_path = os.path.join(target_dir, filename)

        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)

        print(f"数据已保存到: {file_path}")
    except Exception as e:
        print(f"保存数据失败: {str(e)}")


# -------------------------- 修改：主程序逻辑（支持命令行自动执行或交互式模式） --------------------------
if __name__ == "__main__":
    # 验证选项合法性
    if args.option not in menu_options:
        logger.error(
            f"无效的操作选项：{args.option}，可选选项：{list(menu_options.keys())}"
        )
        sys.exit(1)

    # 初始化API连接
    api = init_api(email, password)
    if not api:
        logger.error("API初始化失败，无法继续执行")
        sys.exit(1)

    # 如果指定了--option，直接执行并退出（非交互式模式）
    if args.option:
        switch(api, args.option)
        sys.exit(0)
    # 否则进入原有交互式菜单模式（保持兼容性）
    else:
        while True:
            print("\n*** Garmin Connect API Demo by cyberjunky ***\n")
            if not api:
                api = init_api(email, password)
            if api:
                print_menu()
                option = readchar.readkey()
                switch(api, option)
            else:
                api = init_api(email, password)
