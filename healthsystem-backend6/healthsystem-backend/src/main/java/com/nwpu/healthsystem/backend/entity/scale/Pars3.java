package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.sql.Date;

@Data
@ApiModel(description = "PARS-3 Scale")
public class Pars3 {
    private long id;
    private long userId;
    private Date logDate;
    private int status;
    private short score;
    private byte q1;
    private byte q2;
    private byte q3;
    private String q4Types;
    private byte q5;
}
