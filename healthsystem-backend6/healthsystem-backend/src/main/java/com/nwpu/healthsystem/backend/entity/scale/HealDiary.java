package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 疗愈日记实体类，对应数据库 heal_diary 表
 */
@Data
public class HealDiary {

    @ApiModelProperty(value = "日记主键ID，新增时无需传入", example = "0")
    private Long id;

    @ApiModelProperty(value = "用户ID，由后端从Token中自动获取，无需前端传入", example = "1")
    private Long userId;

    @ApiModelProperty(value = "日记正文内容", example = "今天去爬山，心情很好")
    private String content;

    @ApiModelProperty(value = "情绪评分 1-10，1最差 10最好，可为空", example = "8")
    private Integer moodScore;

    @ApiModelProperty(value = "情绪标签，如：平静、开心、焦虑、悲伤等", example = "开心")
    private String moodLabel;

    @ApiModelProperty(value = "附图URL列表，JSON数组格式，如 [\"url1\",\"url2\"]", example = "[]")
    private String imageUrls;

    @ApiModelProperty(value = "是否私密：1私密（默认），0公开", example = "1")
    private Integer isPrivate;

    @ApiModelProperty(value = "创建时间戳，由数据库自动填充")
    private Timestamp addTimestampMils;
}
