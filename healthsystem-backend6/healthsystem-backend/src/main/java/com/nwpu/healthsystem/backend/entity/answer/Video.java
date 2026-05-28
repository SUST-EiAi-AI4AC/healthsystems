package com.nwpu.healthsystem.backend.entity.answer;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
@ApiModel(description = "Video模型")
public class Video {
    private long id;

    private long userId;

    @ApiModelProperty(value = "记录日期", example = "2020-01-01")
    private Date logDate;

    @ApiModelProperty(value = "记录时间", example = "20:20:20")
    private Time logTime;

    @ApiModelProperty(value = "上传的视频文件地链接地址", example = "")
    private String videoUrl;

    private String inference;

    private int inferCost;

    public Video(String videoUrl, String inference, int inferCost) {
        this.id = 0L;
        this.userId = 0L;
        this.logDate = null;
        this.logTime = null;
        this.videoUrl = videoUrl;
        this.inference = inference;
        this.inferCost = inferCost;
    }

    /*
    * 必须添加此无参的构造方法
    * */
    public Video() {

    }
}
