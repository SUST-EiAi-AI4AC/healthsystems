package com.nwpu.healthsystem.backend.entity;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;


@Data
public class UserHealthInfo  {

    private long id;

    /**
     * 用户id，外键
     */
    private long userId;

    /**
     * 性别
     */
    private String sex;

    /**
     * 出生时间
     */
    private Date birthDate;

    /**
     * 身高，单位：厘米（整数）
     */
    private Integer height;

    /**
     * 体重，单位：千克，保留小数点后一位
     */
    private Double weight;

    /**
     * 属于哪位医生
     */
    private long doctorId;

    /**
     * （真实标签）抑郁程度标注、诊断结果（格式应为指定的几种级别，如高危、重度、中度和轻度）
     */
    private String depressed;

    /**
     * （真实标签）备注信息（医生对病人的备注信息，格式无要求）
     */
    private String remark;

    /**
     * 添加时间戳
     */
    private Timestamp addTimestampMils;

    /**
     * 修改时间戳
     */
    private Timestamp modTimestampMils;


}
