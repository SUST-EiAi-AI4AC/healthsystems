package com.nwpu.healthsystem.backend.entity.depression;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;


@Data
public class Media {
    private long id;

    private long userId;

    private String fileType;

    private Date logDate;

    private Time logTime;

    private String filePath;

    private int infer;

    private int inferCost;
    public Media() {}

    public Media(String filePath, int infer, int inferCost){
        this.filePath = filePath;
        this.infer = infer;
        this.inferCost = inferCost;
    }

}
