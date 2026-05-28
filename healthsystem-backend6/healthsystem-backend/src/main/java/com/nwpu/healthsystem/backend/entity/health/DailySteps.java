package com.nwpu.healthsystem.backend.entity.health;

import lombok.Data;
import java.sql.Date;

@Data
public class DailySteps {

    private Integer id;
    private String userProfilePK;  // 关联用户的标识字段
    private String email;  // 用户邮箱
    private Date calendarDate;     // 日期
    private Integer totalSteps;    // 总步数
    private Double totalDistance;  // 总距离（公里）
    private String stepGoal;       // 步数目标

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

    public Date getCalendarDate() {
        return calendarDate;
    }

    public void setCalendarDate(Date calendarDate) {
        this.calendarDate = calendarDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public Integer getTotalSteps() {
        return totalSteps;
    }

    public void setTotalSteps(Integer totalSteps) {
        this.totalSteps = totalSteps;
    }

    public Double getTotalDistance() {
        return totalDistance;
    }

    public void setTotalDistance(Double totalDistance) {
        this.totalDistance = totalDistance;
    }

    public String getStepGoal() {
        return stepGoal;
    }

    public void setStepGoal(String stepGoal) {
        this.stepGoal = stepGoal;
    }
}
