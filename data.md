# Garmin 手环同步生理健康数据说明文档 (data.md)

本文档详细说明手环数据同步功能抓取并保存的所有生理健康指标数据，以及数据在数据库中的存储位置与查询方法。

---

## 一、数据存储位置

- **数据库类型**：MySQL 8.0
- **数据库名称**：`healthsystem_test2`
- **目标数据表**：`activity`（活动与每日健康汇总表）
- **数据来源标识**：表中 `source` 字段标记为 `'GARMIN'`
- **主键/索引约束**：包含唯一索引 `UNIQUE KEY unique_entry (email, date)`，保证同一用户在同一天的数据不重复，自动增量更新。

---

## 二、同步的具体生理数据分类说明

同步脚本 `sync_garmin.py` 每日从佳明 Connect 抓取并入库 **20 余项核心生理与健康数据**，划分为 7 大模块：

### 1. 心率生理数据 (Heart Rate)
| 数据库字段名 | 数据类型 | 计量单位 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `restingHeartRate` | varchar/int | bpm (次/分) | **静息心率**：清醒静止状态下的最低平均心率，反映心肺健康度 |
| `minHeartRate` | varchar/int | bpm (次/分) | **24小时最低心率** |
| `maxHeartRate` | varchar/int | bpm (次/分) | **24小时最高心率** |

---

### 2. 睡眠生理数据 (Sleep)
| 数据库字段名 | 数据类型 | 计量单位 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `sleepingSeconds` | varchar/int | 秒 (s) | **总睡眠时长**（除以 3600 可转换为小时，如 28800 秒 = 8 小时） |

---

### 3. 压力与精神状态数据 (Stress & Relaxation)
| 数据库字段名 | 数据类型 | 范围 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `averageStressLevel` | varchar/int | 0 ~ 100 | **全天平均压力指数**（0-25 休息，26-50 低压，51-75 中压，76-100 高压） |
| `maxStressLevel` | varchar/int | 0 ~ 100 | **全天峰值最高压力指数** |
| `stressQualifier` | varchar | 文本 | **压力等级评价**（如 `STRESSFUL` 偏高、`BALANCED` 平衡） |

---

### 4. 身体电量数据 (Body Battery)
身体电量是佳明通过心率变异性(HRV)、压力、睡眠和活动综合计算的身体能量储备评估指标：
| 数据库字段名 | 数据类型 | 范围 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `bodyBatteryChargedValue` | int | 0 ~ 100 | **电量充电增加值**（睡眠与休息充入的电量） |
| `bodyBatteryDrainedValue` | int | 0 ~ 100 | **电量消耗消耗值**（日常活动与运动消耗的电量） |
| `bodyBatteryHighestValue` | int | 0 ~ 100 | **当天最高身体电量分数** |
| `bodyBatteryLowestValue` | int | 0 ~ 100 | **当天最低身体电量分数** |
| `bodyBatteryMostRecentValue` | int | 0 ~ 100 | **当天最近一次测量电量** |

---

### 5. 血氧与呼吸生理数据 (SpO2 & Respiration)
| 数据库字段名 | 数据类型 | 计量单位 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `averageSpo2` | varchar/float | % | **平均脉搏血氧饱和度**（正常范围通常在 95%~100%） |
| `lowestSpo2` | varchar/float | % | **当天最低血氧饱和度** |
| `latestSpo2` | varchar/float | % | **最新单次测量血氧** |
| `avgWakingRespirationValue` | int | 次/分钟 | **清醒状态平均呼吸频率**（正常成人通常为 12~20 次/分） |

---

### 6. 活动与运动数据 (Activity & Movement)
| 数据库字段名 | 数据类型 | 计量单位 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `totalSteps` | int | 步 | **每日行走/跑步总步数** |
| `totalDistanceMeters` | float | 米 (m) | **每日移动总距离** |
| `activeSeconds` | varchar/int | 秒 (s) | **中高强度活动累计时长** |
| `sedentarySeconds` | varchar/int | 秒 (s) | **久坐/静止时长** |

---

### 7. 能量与卡路里消耗数据 (Calories & Energy)
| 数据库字段名 | 数据类型 | 计量单位 | 含义说明 |
| :--- | :--- | :--- | :--- |
| `totalKilocalories` | float | kcal (千卡) | **每日总卡路里消耗**（等于 基础代谢 + 动态运动） |
| `activeKilocalories` | float | kcal (千卡) | **动态/运动卡路里消耗** |
| `bmrKilocalories` | float | kcal (千卡) | **基础代谢卡路里 (BMR)** |

---

### 8. 用户与时间审计元数据 (Audit Metadata)
| 数据库字段名 | 数据类型 | 说明 |
| :--- | :--- | :--- |
| `date` | datetime | 数据归属日期（如 `2026-07-22 00:00:00`） |
| `email` | varchar(100) | 绑定的用户邮箱/账号 |
| `userProfileId` | varchar(100) | 佳明官方用户 Profile ID 编号 |
| `source` | varchar(100) | 数据来源标识，固定为 `'GARMIN'` |

---

## 三、常用 SQL 数据查询示例

您可以使用 Navicat、DBeaver 或命令行连接数据库 `healthsystem_test2` 后，执行以下 SQL 语句查看手环生理数据：

### 1. 查询某个用户最近 10 天的完整生理健康记录

```sql
SELECT 
    date AS '日期',
    email AS '账号',
    totalSteps AS '总步数',
    totalKilocalories AS '总卡路里(kcal)',
    activeKilocalories AS '运动卡路里',
    bmrKilocalories AS '基础代谢',
    restingHeartRate AS '静息心率(bpm)',
    minHeartRate AS '最低心率',
    maxHeartRate AS '最高心率',
    ROUND(sleepingSeconds / 3600, 2) AS '睡眠时长(小时)',
    averageStressLevel AS '平均压力',
    bodyBatteryHighestValue AS '电量最高',
    bodyBatteryLowestValue AS '电量最低',
    averageSpo2 AS '平均血氧(%)',
    avgWakingRespirationValue AS '呼吸率(次/分)'
FROM activity
WHERE source = 'GARMIN'
ORDER BY date DESC
LIMIT 10;
```

---

### 2. 统计月度生理健康均值（如月均步数、月均静息心率、月均睡眠）

```sql
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS '月份',
    SUM(totalSteps) AS '当月总步数',
    ROUND(AVG(totalSteps), 0) AS '日均步数',
    ROUND(AVG(CAST(restingHeartRate AS UNSIGNED)), 1) AS '月均静息心率(bpm)',
    ROUND(AVG(CAST(sleepingSeconds AS UNSIGNED)) / 3600, 2) AS '月均睡眠时长(小时)',
    ROUND(AVG(CAST(averageStressLevel AS UNSIGNED)), 1) AS '月均压力等级',
    ROUND(AVG(CAST(averageSpo2 AS DECIMAL(5,2))), 1) AS '月均血氧(%)'
FROM activity
WHERE source = 'GARMIN'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY 月份 DESC;
```

---

### 3. 查看最近一周的压力与身体电量恢复情况

```sql
SELECT 
    DATE(date) AS '日期',
    averageStressLevel AS '平均压力',
    maxStressLevel AS '最高压力',
    stressQualifier AS '压力评价',
    bodyBatteryChargedValue AS '充电增加量',
    bodyBatteryDrainedValue AS '消耗电量',
    bodyBatteryHighestValue AS '最高电量',
    bodyBatteryLowestValue AS '最低电量'
FROM activity
WHERE source = 'GARMIN'
ORDER BY date DESC
LIMIT 7;
```
