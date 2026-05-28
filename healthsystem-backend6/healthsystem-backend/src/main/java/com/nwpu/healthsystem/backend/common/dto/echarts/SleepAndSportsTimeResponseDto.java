package com.nwpu.healthsystem.backend.common.dto.echarts;

import lombok.Data;
import java.sql.Date;
import java.sql.Time;

@Data
public class SleepAndSportsTimeResponseDto extends DateRequestDto {
    private double sleepTime;
    private String sportsTime;
    private Time sleepTimeStart;
    private Time sleepTimeEnd;
    private  String stepInfo;
    private  String studyOrWorkTime;
    private  String freeTime;
    private  String communicateTime;
    private  String phonePlayTime;


    public SleepAndSportsTimeResponseDto(Date date) {
        this.logDate = date;
        this.sleepTime = -1;
        this.sportsTime = "";
        this.sleepTimeStart = null;
        this.sleepTimeEnd = null;
        this.stepInfo = "";
        this.studyOrWorkTime="";
        this.freeTime="";
        this.communicateTime="";
        this.phonePlayTime="";
    }

    // 必须写无参的构造方法
    public SleepAndSportsTimeResponseDto() {}
}
