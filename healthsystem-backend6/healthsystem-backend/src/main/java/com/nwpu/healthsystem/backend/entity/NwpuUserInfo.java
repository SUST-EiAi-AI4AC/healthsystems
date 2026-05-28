package com.nwpu.healthsystem.backend.entity;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;


@Data

public class NwpuUserInfo  {


    private long id;

    /**
     * 用户id
     */
    private long userId;

    /**
     * 用户学号/工号
     */
    private String nwpuId;

    /**
     * 所属学院/单位名字
     */
    private String college;

    /**
     * 用户所在年级，入学/校年份
     */
    private Integer grade;

    /**
     * 用户类型，未知（0），本科生（1），硕士（2），博士（3），教职工（4）
     */
    private String type;

    /**
     * 添加时间戳
     */
    private Timestamp addTimestampMils;

    /**
     * 修改时间戳
     */
    private Timestamp modTimestampMils;


}
