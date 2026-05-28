package com.nwpu.healthsystem.backend.entity.health;

import lombok.Data;
import java.sql.Date;

@Data
public class Heartrate {

    private Integer id;
    private String userProfilePK;
    private String email;  // 用户邮箱
    private Date calendarDate;
    private String maxHeartRate;
    private String minHeartRate;
    private String restingHeartRate;
    private String lastSevenDaysAvgRestingHeartRate;

    // Getter 和 Setter 方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getMaxHeartRate() {
        return maxHeartRate;
    }

    public void setMaxHeartRate(String maxHeartRate) {
        this.maxHeartRate = maxHeartRate;
    }

    public String getMinHeartRate() {
        return minHeartRate;
    }

    public void setMinHeartRate(String minHeartRate) {
        this.minHeartRate = minHeartRate;
    }

    public String getRestingHeartRate() {
        return restingHeartRate;
    }

    public void setRestingHeartRate(String restingHeartRate) {
        this.restingHeartRate = restingHeartRate;
    }

    public String getLastSevenDaysAvgRestingHeartRate() {
        return lastSevenDaysAvgRestingHeartRate;
    }

    public void setLastSevenDaysAvgRestingHeartRate(String lastSevenDaysAvgRestingHeartRate) {
        this.lastSevenDaysAvgRestingHeartRate = lastSevenDaysAvgRestingHeartRate;
    }
}
