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

import argparse #修改部分

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

# -------------------------- 新增：命令行参数解析 --------------------------
parser = argparse.ArgumentParser(description='Garmin Connect API 数据获取工具')
parser.add_argument('--email', help='Garmin账号邮箱（优先于环境变量）', default='2298681550@qq.com')
parser.add_argument('--password', help='Garmin账号密码（优先于环境变量）', default='Zhao020203.')
parser.add_argument('--start-date', help='开始日期（格式：YYYY-MM-DD）', default='2025-03-06')
parser.add_argument('--end-date', help='结束日期（格式：YYYY-MM-DD）', default='2025-03-07')
parser.add_argument('--option', help='操作选项（如"c"获取睡眠数据，"9"获取心率数据）', default='c')
args = parser.parse_args()
# --------------------------------------------------------------------------


# Load environment variables if defined
email = args.email
password = args.password

if not email:
    email = os.getenv("EMAIL")
if not password:
    password = os.getenv("PASSWORD")

# tokenstore = os.getenv("GARMINTOKENS") or "python_scripts/.garminconnecttoken"
# tokenstore_base64 = os.getenv("GARMINTOKENS_BASE64") or "python_scripts/.garminconnect_base64"

tokenstore = "/healthsystem-test/python_scripts/.garminconnecttoken"
tokenstore_base64 = "/healthsystem-test/python_scripts/.garminconnect_base64"
# tokenstore = "E:\\learn\\vue3\\health\\python_scripts\\.garminconnecttoken"
# tokenstore_base64 = "E:\\learn\\vue3\\health\\python_scripts\\.garminconnect_base64"

api = None

# -------------------------- 新增：通过命令行参数设置日期范围 --------------------------
try:
    startdate = datetime.datetime.strptime(args.start_date, '%Y-%m-%d').date()
    enddate = datetime.datetime.strptime(args.end_date, '%Y-%m-%d').date()
except ValueError as e:
    logger.error(f"日期格式错误，请使用YYYY-MM-DD：{e}")
    sys.exit(1)
# --------------------------------------------------------------------------


# Let's say we want to scrape all activities using switch menu_option "p". We change the values of the below variables, IE startdate days, limit,...
# enddate = datetime.date(2025, 4, 2)
# startdate = datetime.date(2025, 3, 7)  # Select past week
start = 0
limit = 100
start_badge = 1  # Badge related calls calls start counting at 1
activitytype = ""  # Possible values are: cycling, running, swimming, multi_sport, fitness_equipment, hiking, walking, other
activityfile = "MY_ACTIVITY.fit"
weight = 89.6
weightunit = "kg"

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
    "U"   # 体能年龄数据
]
# --------------------------------------------------------------------------

menu_options = {
    "1": "Get full name",
    "2": "Get unit system",
    "4": f"Get activity data for '{startdate.isoformat()}' to '{enddate.isoformat()}' (compatible with garminconnect-ha)",#活动
    "7": f"Get stats and body composition data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#每日状态，包括各项数据
    "8": f"Get steps data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#每15分钟
    "9": f"Get heart rate data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#实时
    "-": f"Get daily step data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#每日步数
    "/": f"Get body battery data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#每4小时
    "a": f"Get resting heart rate data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",
    "c": f"Get sleep data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#实时
    "d": f"Get stress data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#实时
    "e": f"Get respiration data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#实时
    "f": f"Get SpO2 data for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#每小时
    "x": f"Get Heart Rate Variability data (HRV) for '{startdate.isoformat()}' to '{enddate.isoformat()}'",#每5分钟
    "U": f"Get Fitness Age data for '{startdate.isoformat()}' to '{enddate.isoformat()}",#每日
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


def switch(api, i):
    """Run selected API call."""

    # Exit example program
    if i == "q":
        print("Be active, generate some data to fetch next time ;-) Bye!")
        sys.exit()

    # Skip requests if login failed
    if api:
        try:
            print(f"\n\nExecuting: {menu_options[i]}\n")
            
            # USER BASICS
            if i == "1":
                # Get full name from profile
                display_json("api.get_full_name()", api.get_full_name())
            elif i == "2":
                # Get unit system from profile
                display_json("api.get_unit_system()", api.get_unit_system())
            elif i == "4":
                # Get activity data for date range (compatible with garminconnect-ha)
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_user_summary(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_user_summary() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "activity_data")
            elif i == "7":
                # Get stats and body composition data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_stats_and_body(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_stats_and_body() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "stats_body_composition_data")
            # USER STATISTICS LOGGED
            elif i == "8":
                # Get steps data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_steps_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_steps_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "steps_data")
            elif i == "9":
                # Get heart rate data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_heart_rates(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_heart_rates() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "heart_rate_data")
            elif i == "/":
                # Get daily body battery data for 'YYYY-MM-DD' to 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    # 获取当天的身体电池数据和事件数据
                    battery_data = api.get_body_battery(current_date.isoformat(), current_date.isoformat())
                    battery_events = api.get_body_battery_events(current_date.isoformat())
                    
                    # 统一数据结构，包含日期、电池数据和事件数据
                    all_data.append({
                        "date": current_date.isoformat(),
                        "body_battery": battery_data,
                        "body_battery_events": battery_events
                    })
                    current_date += datetime.timedelta(days=1)  # 日期递增
                save_data(all_data, "body_battery_data")
            elif i == "-":
                # Get daily step data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []  # 单独定义步数数据列表
                while current_date <= enddate:
                    daily_step_data = api.get_daily_steps(current_date.isoformat(), current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "steps": daily_step_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_daily_steps('{startdate.isoformat()}', '{enddate.isoformat()}')",
                    api.get_daily_steps(startdate.isoformat(), enddate.isoformat()),
                )
                save_data(all_data, "daily_steps_data")
            elif i == "a":
                # Get resting heart rate data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_rhr_day(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_rhr_day() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "resting_heart_rate_data")
            elif i == "c":
                # Get sleep data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_sleep_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_sleep_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "sleep_data")           
            elif i == "d":
                # Get stress data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_stress_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_stress_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "stress_data")
            elif i == "e":
                # Get respiration data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_respiration_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_respiration_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "respiration_data")
            elif i == "f":
                # Get SpO2 data for 'YYYY-MM-DD'
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_spo2_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_spo2_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "spo2_data")
            elif i == "x":
                # Get Heart Rate Variability (hrv) data
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_hrv_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_hrv_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "hrv_data")
            elif i == "U":
                # Get fitness age data
                current_date = startdate
                all_data = []
                while current_date <= enddate:
                    daily_data = api.get_fitnessage_data(current_date.isoformat())
                    all_data.append({
                        "date": current_date.isoformat(),
                        "data": daily_data
                    })
                    current_date += datetime.timedelta(days=1)
                display_json(
                    f"api.get_fitnessage_data() from '{startdate.isoformat()}' to '{enddate.isoformat()}'",
                    all_data
                )
                save_data(all_data, "fitness_age_data")
            # -------------------------- 新增：批量执行逻辑 --------------------------
            elif i == "*":
                print(f"\n开始一次性获取所有数据类型（共{len(BATCH_OPTIONS)}项）...\n")
                for option in BATCH_OPTIONS:
                    print(f"\n===== 正在获取：{menu_options[option]} =====")
                    try:
                        # 递归调用switch函数执行每个选项
                        switch(api, option)
                    except Exception as e:
                        logger.error(f"获取选项 {option} 时出错：{str(e)}")
                        continue  # 忽略当前错误，继续下一项
                print(f"\n所有数据类型获取完成！")
                return  # 批量执行结束
            # --------------------------------------------------------------------------
            elif i == "Z":
                # Remove stored login tokens for Garmin Connect portal
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
        safe_email = user_email.replace('@', '_')

        # target_dir = os.path.join(r"E:\\learn\\vue3\\health\\python_scripts\\json_data", safe_email)
        target_dir = os.path.join(r"/healthsystem-test/python_scripts/json_data", safe_email)
        os.makedirs(target_dir, exist_ok=True)
        
        filename = f"garmin_{data_type}_{startdate.strftime('%Y%m%d')}_{enddate.strftime('%Y%m%d')}.json"
        file_path = os.path.join(target_dir, filename)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        
        print(f"数据已保存到: {file_path}")
    except Exception as e:
        print(f"保存数据失败: {str(e)}")

# -------------------------- 修改：主程序逻辑（支持命令行自动执行或交互式模式） --------------------------
if __name__ == "__main__":
    # 验证选项合法性
    if args.option not in menu_options:
        logger.error(f"无效的操作选项：{args.option}，可选选项：{list(menu_options.keys())}")
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