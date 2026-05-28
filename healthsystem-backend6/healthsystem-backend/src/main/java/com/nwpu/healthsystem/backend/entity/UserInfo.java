package com.nwpu.healthsystem.backend.entity;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class UserInfo {
    /**
     * 用户id
     */
    private long userId;

    /**
     * 手机号码、唯一
     */
    private String phone;

    /**
     * 用户名、唯一
     */
    private String userName;

    private String email;

    /**
     * 数据库不存储原始密码，存MD5散列值，校验的时候判断的是密码散列值是否相同
     */
    private String password;

    private String garminPassword;

    /**
     * 用户角色：用户（0）、医生（1）、管理员（2）
     */
    private String role;

    /**
     * 用户权限
     */
    private String permission;

    /**
     *真实姓名
     */
    private String realName;

    /**
     * 用户学号，10位
     */
    private String nwpuId;

    /**
     * 年级，硕士/研究生
     */

    private String type;
    /**
     * 用户身份证号，唯一
     */
    private String identityNumber;

    /**
     * 用户所在城市
     */
    private String city;

    /**
     * 用户所在省份
     */
    private String province;

    /**
     * 用户所在国家
     */
    private String country;

    /**
     * 用户头像地址
     */
    private String avatar;

    /**
     * 用于标注是否npwu用户，默认0（false），1（true）
     */
    private byte nwpu;

    /**
     * 添加时间戳
     */
    private Timestamp addTimestampMils;

    /**
     * 修改时间戳
     */
    private Timestamp modTimestampMils;

    /**
     * 上一次成功连接推送服务的时间
     */
    private Timestamp pushConnected;

}
