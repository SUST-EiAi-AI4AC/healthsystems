package com.nwpu.healthsystem.backend.common.dto.echarts;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;


@Data
public class PamScoreResponseDto extends DateRequestDto{
    // logDate 属性从 DateRequestDto 继承而来
    // 为什么要继承呢？ 方便按时间区间查询时中间补0，用同一个方法，节省代码量。
    // 虽然代码量减少了（一些重复的），但是编码时间大大增加，哭了

//    private Date logDate;

    private Time logTime;

    private byte pamScore;

    private byte valence;

    private byte arousal;

    public PamScoreResponseDto(Date date){
        this.logDate = date;
        this.logTime = new Time(0);
        this.pamScore = 0;
    }
    // 必须写无参的构造方法
    public PamScoreResponseDto() {}
}
