package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.sql.Date;

@Data
@ApiModel(description = "PSQI Scale")
public class Psqi {
    private long id;
    private long userId;
    private Date logDate;
    private int status;
    private byte score;
    private String q1;
    private byte q2;
    private String q3;
    private byte q4;
    private byte q5a;
    private byte q5b;
    private byte q5c;
    private byte q5d;
    private byte q5e;
    private byte q5f;
    private byte q5g;
    private byte q5h;
    private byte q5i;
    private byte q5j;
    private String q5jDesc;
    private byte q6;
    private byte q7;
    private byte q8;
    private byte q9;
}
