import json
import datetime
from typing import Dict, Any, Optional

def format_db_datetime(val: Any) -> Optional[str]:
    if not val:
        return None
    val_str = str(val).replace("T", " ")
    if "." in val_str:
        val_str = val_str.split(".")[0]
    if len(val_str) == 10:  # e.g., "2026-07-14"
        val_str += " 00:00:00"
    return val_str

def format_bool(val: Any) -> Optional[str]:
    if val is None:
        return None
    return str(val)

def extract_activity_row(email: str, target_date: datetime.date, summary: Dict[str, Any]) -> Dict[str, Any]:
    date_str = target_date.strftime("%Y-%m-%d")
    date_time_str = f"{date_str} 00:00:00"

    rule = summary.get("rule") if isinstance(summary.get("rule"), dict) else {}
    rule_type_id = rule.get("typeId") if rule else summary.get("rule_typeId")
    rule_type_key = rule.get("typeKey") if rule else summary.get("rule_typeKey")

    row = {
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
        "totalSteps": summary.get("totalSteps"),
        "netCalorieGoal": summary.get("netCalorieGoal"),
        "totalDistanceMeters": summary.get("totalDistanceMeters"),
        "wellnessDistanceMeters": summary.get("wellnessDistanceMeters"),
        "wellnessActiveKilocalories": summary.get("wellnessActiveKilocalories"),
        "netRemainingKilocalories": summary.get("netRemainingKilocalories"),
        "userDailySummaryId": str(summary.get("userDailySummaryId")) if summary.get("userDailySummaryId") is not None else None,
        "calendarDate": format_db_datetime(summary.get("calendarDate")),
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
        "sleepingSeconds": str(summary.get("sleepingSeconds")) if summary.get("sleepingSeconds") is not None else None,
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
        "minHeartRate": str(summary.get("minHeartRate")) if summary.get("minHeartRate") is not None else None,
        "maxHeartRate": str(summary.get("maxHeartRate")) if summary.get("maxHeartRate") is not None else None,
        "restingHeartRate": str(summary.get("restingHeartRate")) if summary.get("restingHeartRate") is not None else None,
        "lastSevenDaysAvgRestingHeartRate": str(summary.get("lastSevenDaysAvgRestingHeartRate")) if summary.get("lastSevenDaysAvgRestingHeartRate") is not None else None,
        "source": summary.get("source") or "GARMIN",
        "averageStressLevel": str(summary.get("averageStressLevel")) if summary.get("averageStressLevel") is not None else None,
        "maxStressLevel": str(summary.get("maxStressLevel")) if summary.get("maxStressLevel") is not None else None,
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
        "bodyBatteryChargedValue": summary.get("bodyBatteryChargedValue"),
        "bodyBatteryDrainedValue": summary.get("bodyBatteryDrainedValue"),
        "bodyBatteryHighestValue": summary.get("bodyBatteryHighestValue"),
        "bodyBatteryLowestValue": summary.get("bodyBatteryLowestValue"),
        "bodyBatteryMostRecentValue": summary.get("bodyBatteryMostRecentValue"),
        "bodyBatteryDuringSleep": str(summary.get("bodyBatteryDuringSleep")) if summary.get("bodyBatteryDuringSleep") is not None else None,
        "bodyBatteryAtWakeTime": summary.get("bodyBatteryAtWakeTime"),
        "bodyBatteryVersion": str(summary.get("bodyBatteryVersion")) if summary.get("bodyBatteryVersion") is not None else None,
        "abnormalHeartRateAlertsCount": summary.get("abnormalHeartRateAlertsCount"),
        "averageSpo2": str(summary.get("averageSpo2")) if summary.get("averageSpo2") is not None else None,
        "lowestSpo2": str(summary.get("lowestSpo2")) if summary.get("lowestSpo2") is not None else None,
        "latestSpo2": str(summary.get("latestSpo2")) if summary.get("latestSpo2") is not None else None,
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
    return row

json_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystems\database\xtt\python_scripts\json_data\ccceee00022_163.com\garmin_activity_data_20260714_20260722.json"
with open(json_path, "r", encoding="utf-8") as f:
    data = json.load(f)

first_item = data[0]["data"]
target_dt = datetime.date(2026, 7, 14)
row = extract_activity_row("ccceee00022@163.com", target_dt, first_item)

print(f"Extracted {len(row)} columns.")
print("Sample extracted values:")
for k, v in list(row.items())[:15]:
    print(f"  {k}: {v}")
