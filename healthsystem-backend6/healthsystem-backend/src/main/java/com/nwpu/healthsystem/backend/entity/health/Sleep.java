package com.nwpu.healthsystem.backend.entity.health;

import lombok.Data;
import java.sql.Date;
import java.sql.Timestamp;

@Data
public class Sleep {

    private Integer id;
    private String sleep_id;
    private String userProfilePK;
    private String email;  // 用户邮箱
    private Date calendarDate;
    private String sleepTimeSeconds;
    private String napTimeSeconds;
    private String sleepWindowConfirmed;
    private String sleepWindowConfirmationType;
    private Timestamp sleepStartTimestampGMT;
    private Timestamp sleepEndTimestampGMT;
    private Timestamp sleepStartTimestampLocal;
    private Timestamp sleepEndTimestampLocal;
    private Timestamp autoSleepStartTimestampGMT;
    private Timestamp autoSleepEndTimestampGMT;
    private String sleepQualityTypePK;
    private String sleepResultTypePK;
    private String unmeasurableSleepSeconds;
    private String deepSleepSeconds;
    private String lightSleepSeconds;
    private String remSleepSeconds;
    private String awakeSleepSeconds;
    private String deviceRemCapable;
    private String retro;
    private String sleepFromDevice;
    private Integer averageSpO2Value;
    private Integer lowestSpO2Value;
    private Integer highestSpO2Value;
    private String averageSpO2HRSleep;
    private Integer averageRespirationValue;
    private Integer lowestRespirationValue;
    private Integer highestRespirationValue;
    private Integer awakeCount;
    private String avgSleepStress;
    private String ageGroup;
    private String sleepScoreFeedback;
    private String sleepScoreInsight;
    private String sleepScorePersonalizedInsight;
    private String sleepVersion;
    private Integer restlessMomentsCount;
    private String respirationVersion;
    private String avgOvernightHrv;
    private String hrvStatus;
    private String bodyBatteryChange;
    private String restingHeartRate;
    private String remSleepDataExists;
    private String sleep_score_overall;

    // Getter 和 Setter 方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSleep_id() {
        return sleep_id;
    }

    public void setSleep_id(String sleep_id) {
        this.sleep_id = sleep_id;
    }

    public String getUserProfilePK() {
        return userProfilePK;
    }

    public void setUserProfilePK(String userProfilePK) {
        this.userProfilePK = userProfilePK;
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

    public String getSleepTimeSeconds() {
        return sleepTimeSeconds;
    }

    public void setSleepTimeSeconds(String sleepTimeSeconds) {
        this.sleepTimeSeconds = sleepTimeSeconds;
    }

    public String getNapTimeSeconds() {
        return napTimeSeconds;
    }

    public void setNapTimeSeconds(String napTimeSeconds) {
        this.napTimeSeconds = napTimeSeconds;
    }

    public String getSleepWindowConfirmed() {
        return sleepWindowConfirmed;
    }

    public void setSleepWindowConfirmed(String sleepWindowConfirmed) {
        this.sleepWindowConfirmed = sleepWindowConfirmed;
    }

    public String getSleepWindowConfirmationType() {
        return sleepWindowConfirmationType;
    }

    public void setSleepWindowConfirmationType(String sleepWindowConfirmationType) {
        this.sleepWindowConfirmationType = sleepWindowConfirmationType;
    }

    public Timestamp getSleepStartTimestampGMT() {
        return sleepStartTimestampGMT;
    }

    public void setSleepStartTimestampGMT(Timestamp sleepStartTimestampGMT) {
        this.sleepStartTimestampGMT = sleepStartTimestampGMT;
    }

    public Timestamp getSleepEndTimestampGMT() {
        return sleepEndTimestampGMT;
    }

    public void setSleepEndTimestampGMT(Timestamp sleepEndTimestampGMT) {
        this.sleepEndTimestampGMT = sleepEndTimestampGMT;
    }

    public Timestamp getSleepStartTimestampLocal() {
        return sleepStartTimestampLocal;
    }

    public void setSleepStartTimestampLocal(Timestamp sleepStartTimestampLocal) {
        this.sleepStartTimestampLocal = sleepStartTimestampLocal;
    }

    public Timestamp getSleepEndTimestampLocal() {
        return sleepEndTimestampLocal;
    }

    public void setSleepEndTimestampLocal(Timestamp sleepEndTimestampLocal) {
        this.sleepEndTimestampLocal = sleepEndTimestampLocal;
    }

    public Timestamp getAutoSleepStartTimestampGMT() {
        return autoSleepStartTimestampGMT;
    }

    public void setAutoSleepStartTimestampGMT(Timestamp autoSleepStartTimestampGMT) {
        this.autoSleepStartTimestampGMT = autoSleepStartTimestampGMT;
    }

    public Timestamp getAutoSleepEndTimestampGMT() {
        return autoSleepEndTimestampGMT;
    }

    public void setAutoSleepEndTimestampGMT(Timestamp autoSleepEndTimestampGMT) {
        this.autoSleepEndTimestampGMT = autoSleepEndTimestampGMT;
    }

    public String getSleepQualityTypePK() {
        return sleepQualityTypePK;
    }

    public void setSleepQualityTypePK(String sleepQualityTypePK) {
        this.sleepQualityTypePK = sleepQualityTypePK;
    }

    public String getSleepResultTypePK() {
        return sleepResultTypePK;
    }

    public void setSleepResultTypePK(String sleepResultTypePK) {
        this.sleepResultTypePK = sleepResultTypePK;
    }

    public String getUnmeasurableSleepSeconds() {
        return unmeasurableSleepSeconds;
    }

    public void setUnmeasurableSleepSeconds(String unmeasurableSleepSeconds) {
        this.unmeasurableSleepSeconds = unmeasurableSleepSeconds;
    }

    public String getDeepSleepSeconds() {
        return deepSleepSeconds;
    }

    public void setDeepSleepSeconds(String deepSleepSeconds) {
        this.deepSleepSeconds = deepSleepSeconds;
    }

    public String getLightSleepSeconds() {
        return lightSleepSeconds;
    }

    public void setLightSleepSeconds(String lightSleepSeconds) {
        this.lightSleepSeconds = lightSleepSeconds;
    }

    public String getRemSleepSeconds() {
        return remSleepSeconds;
    }

    public void setRemSleepSeconds(String remSleepSeconds) {
        this.remSleepSeconds = remSleepSeconds;
    }

    public String getAwakeSleepSeconds() {
        return awakeSleepSeconds;
    }

    public void setAwakeSleepSeconds(String awakeSleepSeconds) {
        this.awakeSleepSeconds = awakeSleepSeconds;
    }

    public String getDeviceRemCapable() {
        return deviceRemCapable;
    }

    public void setDeviceRemCapable(String deviceRemCapable) {
        this.deviceRemCapable = deviceRemCapable;
    }

    public String getRetro() {
        return retro;
    }

    public void setRetro(String retro) {
        this.retro = retro;
    }

    public String getSleepFromDevice() {
        return sleepFromDevice;
    }

    public void setSleepFromDevice(String sleepFromDevice) {
        this.sleepFromDevice = sleepFromDevice;
    }

    public Integer getAverageSpO2Value() {
        return averageSpO2Value;
    }

    public void setAverageSpO2Value(Integer averageSpO2Value) {
        this.averageSpO2Value = averageSpO2Value;
    }

    public Integer getLowestSpO2Value() {
        return lowestSpO2Value;
    }

    public void setLowestSpO2Value(Integer lowestSpO2Value) {
        this.lowestSpO2Value = lowestSpO2Value;
    }

    public Integer getHighestSpO2Value() {
        return highestSpO2Value;
    }

    public void setHighestSpO2Value(Integer highestSpO2Value) {
        this.highestSpO2Value = highestSpO2Value;
    }

    public String getAverageSpO2HRSleep() {
        return averageSpO2HRSleep;
    }

    public void setAverageSpO2HRSleep(String averageSpO2HRSleep) {
        this.averageSpO2HRSleep = averageSpO2HRSleep;
    }

    public Integer getAverageRespirationValue() {
        return averageRespirationValue;
    }

    public void setAverageRespirationValue(Integer averageRespirationValue) {
        this.averageRespirationValue = averageRespirationValue;
    }

    public Integer getLowestRespirationValue() {
        return lowestRespirationValue;
    }

    public void setLowestRespirationValue(Integer lowestRespirationValue) {
        this.lowestRespirationValue = lowestRespirationValue;
    }

    public Integer getHighestRespirationValue() {
        return highestRespirationValue;
    }

    public void setHighestRespirationValue(Integer highestRespirationValue) {
        this.highestRespirationValue = highestRespirationValue;
    }

    public Integer getAwakeCount() {
        return awakeCount;
    }

    public void setAwakeCount(Integer awakeCount) {
        this.awakeCount = awakeCount;
    }

    public String getAvgSleepStress() {
        return avgSleepStress;
    }

    public void setAvgSleepStress(String avgSleepStress) {
        this.avgSleepStress = avgSleepStress;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    public String getSleepScoreFeedback() {
        return sleepScoreFeedback;
    }

    public void setSleepScoreFeedback(String sleepScoreFeedback) {
        this.sleepScoreFeedback = sleepScoreFeedback;
    }

    public String getSleepScoreInsight() {
        return sleepScoreInsight;
    }

    public void setSleepScoreInsight(String sleepScoreInsight) {
        this.sleepScoreInsight = sleepScoreInsight;
    }

    public String getSleepScorePersonalizedInsight() {
        return sleepScorePersonalizedInsight;
    }

    public void setSleepScorePersonalizedInsight(String sleepScorePersonalizedInsight) {
        this.sleepScorePersonalizedInsight = sleepScorePersonalizedInsight;
    }

    public String getSleepVersion() {
        return sleepVersion;
    }

    public void setSleepVersion(String sleepVersion) {
        this.sleepVersion = sleepVersion;
    }

    public Integer getRestlessMomentsCount() {
        return restlessMomentsCount;
    }

    public void setRestlessMomentsCount(Integer restlessMomentsCount) {
        this.restlessMomentsCount = restlessMomentsCount;
    }

    public String getRespirationVersion() {
        return respirationVersion;
    }

    public void setRespirationVersion(String respirationVersion) {
        this.respirationVersion = respirationVersion;
    }

    public String getAvgOvernightHrv() {
        return avgOvernightHrv;
    }

    public void setAvgOvernightHrv(String avgOvernightHrv) {
        this.avgOvernightHrv = avgOvernightHrv;
    }

    public String getHrvStatus() {
        return hrvStatus;
    }

    public void setHrvStatus(String hrvStatus) {
        this.hrvStatus = hrvStatus;
    }

    public String getBodyBatteryChange() {
        return bodyBatteryChange;
    }

    public void setBodyBatteryChange(String bodyBatteryChange) {
        this.bodyBatteryChange = bodyBatteryChange;
    }

    public String getRestingHeartRate() {
        return restingHeartRate;
    }

    public void setRestingHeartRate(String restingHeartRate) {
        this.restingHeartRate = restingHeartRate;
    }

    public String getRemSleepDataExists() {
        return remSleepDataExists;
    }

    public void setRemSleepDataExists(String remSleepDataExists) {
        this.remSleepDataExists = remSleepDataExists;
    }

    public String getSleepScoreOverall() {
        return sleep_score_overall;
    }

    public void setSleepScoreOverall(String sleep_score_overall) {
        this.sleep_score_overall = sleep_score_overall;
    }
}


