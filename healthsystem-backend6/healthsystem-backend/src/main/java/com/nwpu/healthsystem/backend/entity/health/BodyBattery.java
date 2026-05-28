package com.nwpu.healthsystem.backend.entity.health;

import lombok.Data;
import java.util.Date;

@Data
public class BodyBattery {

    private Integer id;
    private String userProfilePK;  // 关联用户的标识字段
    private String email;  // 用户邮箱
    private Date date;             // 日期
    private String charged;        // 充电量/恢复值
    private String drained;        // 消耗值
    private Date startTimestampGMT; // GMT开始时间
    private Date endTimestampGMT;   // GMT结束时间
    private Date startTimestampLocal; // 本地开始时间
    private Date endTimestampLocal;   // 本地结束时间

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCharged() {
        return charged;
    }

    public void setCharged(String charged) {
        this.charged = charged;
    }

    public String getDrained() {
        return drained;
    }

    public void setDrained(String drained) {
        this.drained = drained;
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
}