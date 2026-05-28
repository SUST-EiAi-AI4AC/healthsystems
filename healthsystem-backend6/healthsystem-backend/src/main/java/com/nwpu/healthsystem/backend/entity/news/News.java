package com.nwpu.healthsystem.backend.entity.news;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;

@Data
@ApiModel(description = "News")
public class News {
    @ApiModelProperty(value = "记录id", example = "1")
    private long newsId;

    @ApiModelProperty(value = "用户id", example = "1")
    private long userId;

    @ApiModelProperty(value = "日期", example = "2020-01-01")
    private Date logDate;

    private String username;

    private String title;

    private String source;

    private String photo;

    private String content;

}
