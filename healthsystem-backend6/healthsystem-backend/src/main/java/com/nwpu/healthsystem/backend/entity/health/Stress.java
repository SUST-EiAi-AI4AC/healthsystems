package com.nwpu.healthsystem.backend.entity.health;

import lombok.Data;
import java.util.Date;

@Data
public class Stress {

    private Integer id;
    private String userProfilePK;  // 关联用户的标识字段
    private String email;  // 用户邮箱
    private Date calendarDate;     // 日期
    private Date startTimestampGMT; // GMT标准开始时间
    private Date endTimestampGMT;   // GMT标准结束时间
    private String maxStressLevel; // 最大压力水平
    private String avgStressLevel; // 平均压力水平
    private Integer stressChartValueOffset; // 压力图表值偏移量
    private String stressChartYAxisOrigin; // 压力图表Y轴原点

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

    public String getMaxStressLevel() {
        return maxStressLevel;
    }

    public void setMaxStressLevel(String maxStressLevel) {
        this.maxStressLevel = maxStressLevel;
    }

    public String getAvgStressLevel() {
        return avgStressLevel;
    }

    public void setAvgStressLevel(String avgStressLevel) {
        this.avgStressLevel = avgStressLevel;
    }

    public Integer getStressChartValueOffset() {
        return stressChartValueOffset;
    }

    public void setStressChartValueOffset(Integer stressChartValueOffset) {
        this.stressChartValueOffset = stressChartValueOffset;
    }

    public String getStressChartYAxisOrigin() {
        return stressChartYAxisOrigin;
    }

    public void setStressChartYAxisOrigin(String stressChartYAxisOrigin) {
        this.stressChartYAxisOrigin = stressChartYAxisOrigin;
    }
}