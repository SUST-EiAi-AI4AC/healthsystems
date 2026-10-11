import os
import sys

sys.path.insert(0, r"e:\Code\AI\Start\Web\Mindapp\healthsystems\python-garminconnect-master")
from garminconnect import Garmin

email = "ccceee00022@163.com"
password = "Abc123Abc123@"
token_store = os.path.expanduser("~/.garminconnect")

client = Garmin(email=email, password=password, is_cn=True)
client.login(token_store)

summary = client.get_user_summary("2026-07-23")
print("\n--- Summary for 2026-07-23 ---")
keys = ["totalSteps", "totalDistanceMeters", "dailyStepGoal", "maxHeartRate", "minHeartRate", "restingHeartRate", 
        "sleepingSeconds", "measurableAwakeDuration", "bodyBatteryChargedValue", "bodyBatteryDrainedValue", "averageStressLevel", "maxStressLevel", "averageSpo2", "lowestSpo2", "latestSpo2"]
for k in keys:
    print(f"{k}: {summary.get(k)}")

sleep = client.get_sleep_data("2026-07-23")
dto = sleep.get("dailySleepDTO", {})
scores = dto.get("sleepScores", {})
overall_score = scores.get("overall", {}).get("value")
print(f"\nSleep overall score: {overall_score}")
print(f"Sleep time seconds: {dto.get('sleepTimeSeconds')}")
print(f"Awake sleep seconds: {dto.get('awakeSleepSeconds')}")
print(f"Avg sleep stress: {dto.get('avgSleepStress')}")
