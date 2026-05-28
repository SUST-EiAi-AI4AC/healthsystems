package com.nwpu.healthsystem.backend.entity.health;

import lombok.Data;
import java.util.Date;

@Data
public class SpO2 {

    private Integer id;
    private Date date;                        // 日期
    private String userProfilePK;             // 用户标识
    private String email;  // 用户邮箱
    private Date calendarDate;                // 日历日期
    private Date startTimestampGMT;           // GMT开始时间
    private Date endTimestampGMT;             // GMT结束时间
    private Date startTimestampLocal;         // 本地开始时间
    private Date endTimestampLocal;           // 本地结束时间
    private Date sleepStartTimestampGMT;      // 睡眠开始时间(GMT)
    private Date sleepEndTimestampGMT;        // 睡眠结束时间(GMT)
    private Date sleepStartTimestampLocal;    // 睡眠开始时间(本地)
    private Date sleepEndTimestampLocal;      // 睡眠结束时间(本地)
    private Date tomorrowSleepStartTimestampGMT;   // 次日睡眠开始时间(GMT)
    private Date tomorrowSleepEndTimestampGMT;     // 次日睡眠结束时间(GMT)
    private Date tomorrowSleepStartTimestampLocal; // 次日睡眠开始时间(本地)
    private Date tomorrowSleepEndTimestampLocal;   // 次日睡眠结束时间(本地)
    private String averageSpO2;               // 平均血氧值
    private String lowestSpO2;                // 最低血氧值
    private String lastSevenDaysAvgSpO2;      // 近七日平均血氧
    private String latestSpO2;                // 最新血氧值
    private Date latestSpO2TimestampGMT;      // 最新血氧时间(GMT)
    private Date latestSpO2TimestampLocal;    // 最新血氧时间(本地)
    private String avgSleepSpO2;              // 睡眠期间平均血氧
    private String avgTomorrowSleepSpO2;      // 次日睡眠期间平均血氧
    private Integer spO2SingleValues;         // 单次血氧测量值

    // Getter 和 Setter 方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUserProfilePK() {
        return userProfilePK;
    }

    public void setUserProfilePK(String userProfilePK) {
        this.email = userProfilePK;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public Date getCalendarDate() {
        return calendarDate;
    }

    public void setCalendarDate(Date calendarDate) {
        this.calendarDate = calendarDate;
    }

    public Date getStartTimestampGMT() {
        return startTimestampGMT;
    }

    public void setStartTimestampGMT(Date startTimestampGMT) {
        this.startTimestampGMT = startTimestampGMT;
    }

    public Date getEndTimestampGMT() {
        return endTimestampGMT;
    }

    public void setEndTimestampGMT(Date endTimestampGMT) {
        this.endTimestampGMT = endTimestampGMT;
    }

    public Date getStartTimestampLocal() {
        return startTimestampLocal;
    }

    public void setStartTimestampLocal(Date startTimestampLocal) {
        this.startTimestampLocal = startTimestampLocal;
    }

    public Date getEndTimestampLocal() {
        return endTimestampLocal;
    }

    public void setEndTimestampLocal(Date endTimestampLocal) {
        this.endTimestampLocal = endTimestampLocal;
    }

    public Date getSleepStartTimestampGMT() {
        return sleepStartTimestampGMT;
    }

    public void setSleepStartTimestampGMT(Date sleepStartTimestampGMT) {
        this.sleepStartTimestampGMT = sleepStartTimestampGMT;
    }

    public Date getSleepEndTimestampGMT() {
        return sleepEndTimestampGMT;
    }

    public void setSleepEndTimestampGMT(Date sleepEndTimestampGMT) {
        this.sleepEndTimestampGMT = sleepEndTimestampGMT;
    }

    public Date getSleepStartTimestampLocal() {
        return sleepStartTimestampLocal;
    }

    public void setSleepStartTimestampLocal(Date sleepStartTimestampLocal) {
        this.sleepStartTimestampLocal = sleepStartTimestampLocal;
    }

    public Date getSleepEndTimestampLocal() {
        return sleepEndTimestampLocal;
    }

    public void setSleepEndTimestampLocal(Date sleepEndTimestampLocal) {
        this.sleepEndTimestampLocal = sleepEndTimestampLocal;
    }

    public Date getTomorrowSleepStartTimestampGMT() {
        return tomorrowSleepStartTimestampGMT;
    }

    public void setTomorrowSleepStartTimestampGMT(Date tomorrowSleepStartTimestampGMT) {
        this.tomorrowSleepStartTimestampGMT = tomorrowSleepStartTimestampGMT;
    }

    public Date getTomorrowSleepEndTimestampGMT() {
        return tomorrowSleepEndTimestampGMT;
    }

    public void setTomorrowSleepEndTimestampGMT(Date tomorrowSleepEndTimestampGMT) {
        this.tomorrowSleepEndTimestampGMT = tomorrowSleepEndTimestampGMT;
    }

    public Date getTomorrowSleepStartTimestampLocal() {
        return tomorrowSleepStartTimestampLocal;
    }

    public void setTomorrowSleepStartTimestampLocal(Date tomorrowSleepStartTimestampLocal) {
        this.tomorrowSleepStartTimestampLocal = tomorrowSleepStartTimestampLocal;
    }

    public Date getTomorrowSleepEndTimestampLocal() {
        return tomorrowSleepEndTimestampLocal;
    }

    public void setTomorrowSleepEndTimestampLocal(Date tomorrowSleepEndTimestampLocal) {
        this.tomorrowSleepEndTimestampLocal = tomorrowSleepEndTimestampLocal;
    }

    public String getAverageSpO2() {
        return averageSpO2;
    }

    public void setAverageSpO2(String averageSpO2) {
        this.averageSpO2 = averageSpO2;
    }

    public String getLowestSpO2() {
        return lowestSpO2;
    }

    public void setLowestSpO2(String lowestSpO2) {
        this.lowestSpO2 = lowestSpO2;
    }

    public String getLastSevenDaysAvgSpO2() {
        return lastSevenDaysAvgSpO2;
    }

    public void setLastSevenDaysAvgSpO2(String lastSevenDaysAvgSpO2) {
        this.lastSevenDaysAvgSpO2 = lastSevenDaysAvgSpO2;
    }

    public String getLatestSpO2() {
        return latestSpO2;
    }

    public void setLatestSpO2(String latestSpO2) {
        this.latestSpO2 = latestSpO2;
    }

    public Date getLatestSpO2TimestampGMT() {
        return latestSpO2TimestampGMT;
    }

    public void setLatestSpO2TimestampGMT(Date latestSpO2TimestampGMT) {
        this.latestSpO2TimestampGMT = latestSpO2TimestampGMT;
    }

    public Date getLatestSpO2TimestampLocal() {
        return latestSpO2TimestampLocal;
    }

    public void setLatestSpO2TimestampLocal(Date latestSpO2TimestampLocal) {
        this.latestSpO2TimestampLocal = latestSpO2TimestampLocal;
    }

    public String getAvgSleepSpO2() {
        return avgSleepSpO2;
    }

    public void setAvgSleepSpO2(String avgSleepSpO2) {
        this.avgSleepSpO2 = avgSleepSpO2;
    }

    public String getAvgTomorrowSleepSpO2() {
        return avgTomorrowSleepSpO2;
    }

    public void setAvgTomorrowSleepSpO2(String avgTomorrowSleepSpO2) {
        this.avgTomorrowSleepSpO2 = avgTomorrowSleepSpO2;
    }

    public Integer getSpO2SingleValues() {
        return spO2SingleValues;
    }

    public void setSpO2SingleValues(Integer spO2SingleValues) {
        this.spO2SingleValues = spO2SingleValues;
    }
}
