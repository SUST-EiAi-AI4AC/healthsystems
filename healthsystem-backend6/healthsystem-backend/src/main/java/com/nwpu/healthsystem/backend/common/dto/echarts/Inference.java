package com.nwpu.healthsystem.backend.common.dto.echarts;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;


@Data
public class Inference {
    private Date logDate;
    private Time logTime;
    private String inference;
    private int inferCost;

    public Inference(Date logDate, Time logTime, String inference){
        this.logDate = logDate;
        this.logTime = logTime;
        this.inference = inference;
        this.inferCost = 710072;
    }

}
