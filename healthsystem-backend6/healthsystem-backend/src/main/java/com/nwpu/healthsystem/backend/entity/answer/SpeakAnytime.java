package com.nwpu.healthsystem.backend.entity.answer;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.sql.Date;
import java.sql.Time;



@Data
@ApiModel(description = "SpeakAnytime模型")
public class SpeakAnytime  {
    private long id;

    private long userId;

    @ApiModelProperty(value = "记录日期", example = "2020-01-01")
    private Date logDate;

    @ApiModelProperty(value = "记录时间", example = "20:20:20")
    private Time logTime;

    @ApiModelProperty(value = "上传地语音文件地链接地址", example = "/audio/3_audio_20210312_534c6909-3547-40e8-b990-38c8d672af2d.mp3")
    private String speechUrl;

    private String inference;

    private int inferCost;

    public SpeakAnytime(String speechUrl, String inference, int inferCost) {
        this.id = 0L;
        this.userId = 0L;
        this.logDate = null;
        this.logTime = null;
        this.speechUrl = speechUrl;
        this.inference = inference;
        this.inferCost = inferCost;
    }

    /*
    * 必须添加此方法， 加入Data注解之后又写了自己的构造方法，那么默认的构造方法就没有了，导致数据库查数据赋值进来的时候报错
    *  Error attempting to get column 'log_date' from result set.
    *  Cause: java.sql.SQLDataException: Unsupported conversion from DATE to java.lang.Integer
    * */
    public SpeakAnytime() {

    }

}
