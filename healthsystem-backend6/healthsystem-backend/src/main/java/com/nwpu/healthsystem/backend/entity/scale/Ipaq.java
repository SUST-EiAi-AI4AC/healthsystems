package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.sql.Date;

@Data
@ApiModel(description = "IPAQ Scale")
public class Ipaq {
    private long id;
    private long userId;
    private Date logDate;
    private int status;
    private int score;
    private byte q1Days;
    private short q1Hours;
    private short q1Minutes;
    private byte q2Days;
    private short q2Hours;
    private short q2Minutes;
    private byte q3Days;
    private short q3Hours;
    private short q3Minutes;
    private short q4Hours;
    private short q4Minutes;
    private short q5Hours;
    private short q5Minutes;
    private byte q6;
    private String q7;
}
