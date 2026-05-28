package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.time.format.DateTimeFormatter;


@Data
public class Sds {

    private long id;

    @ApiModelProperty(value = "用户ID",example = "1")
    private long userId;

    @ApiModelProperty(value = "填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。" +
            "同时还可以在数据库层面完成限制：一个用户一天只有一条记录", example = "2020-01-01")
    private Date logDate;
    private Date logDate2;
    private Date logDate3;

    private byte q1;
    private byte q2;
    private byte q3;
    private byte q4;
    private byte q5;
    private byte q6;
    private byte q7;
    private byte q8;
    private byte q9;
    private byte q10;
    private byte q11;
    private byte q12;
    private byte q13;
    private byte q14;
    private byte q15;
    private byte q16;
    private byte q17;
    private byte q18;
    private byte q19;
    private byte q20;

    @ApiModelProperty(value = "对于每个人问题，完全不会记0分、几天记1分、一半以上的日子记2分、几乎每天记3分，计算总分",example = "9")
    private byte score;
    private byte score2;
    private byte score3;

    private DateTimeFormatter formatter;
    private String username;

    public Sds() {
    }

    public Sds(long userId, Date logDate,byte score,String username) {
        this.userId = userId;
        this.logDate = logDate;
        this.score = score;
        this.username = username;
    }
}
