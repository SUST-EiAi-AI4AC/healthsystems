package com.nwpu.healthsystem.backend.entity.answer;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.sql.Time;


@Data
@ApiModel(description = "EMA模型")
public class EMAAnswer {

    @ApiModelProperty(value = "记录id", example = "1")
    private long id;

    @ApiModelProperty(value = "用户id", example = "1")
    private long userId;

    @ApiModelProperty(value = "记录日期", example = "2020-01-01")
    private Date logDate;

    @ApiModelProperty(value = "记录时间", example = "20:20:20")
    private Time logTime;

    @ApiModelProperty(value = "情绪", example = "happy")
    private String mood;

    @ApiModelProperty(value = "情绪等级", example = "a little bit")
    private String moodLevel;

    @ApiModelProperty(value = "压力等级", example = "Feeling good")
    private String stressLevel;

    @ApiModelProperty(value = "录音文件地址", example = "1")
    private String speechUrl;

    @ApiModelProperty(value = "（暂时不同）pam", example = "***")
    private String pam;

    @ApiModelProperty(value = "valence", example = "0")
    private byte valence;

    @ApiModelProperty(value = "arousal", example = "0")
    private byte arousal;

    @ApiModelProperty(value = "pamScore：1-16", example = "1")
    private byte pamScore;

    private String imgSelected;

    private String imgDatas;
}
