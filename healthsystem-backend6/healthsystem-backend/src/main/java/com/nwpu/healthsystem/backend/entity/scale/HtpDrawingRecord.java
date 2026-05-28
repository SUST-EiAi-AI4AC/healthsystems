package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;


@Data
public class HtpDrawingRecord {

    @ApiModelProperty(value = "记录ID，新增时无需传入", example = "0")
    private long id;

    @ApiModelProperty(value = "用户ID，由后端从Token中自动获取，无需前端传入", example = "1")
    private long userId;

    @ApiModelProperty(value = "绘画日期，格式 yyyy-MM-dd，新增时由后端自动设置为当天", example = "2026-03-30")
    private Date logDate;

    @ApiModelProperty(value = "记录创建时间戳，由数据库自动填充")
    private Timestamp addTimestamp;

    @ApiModelProperty(value = "HTP综合评分 0-100，由AI分析结果计算得出", example = "72")
    private byte score;

    @ApiModelProperty(value = "AI生成的心理分析报告全文")
    private String reportContent;

    @ApiModelProperty(value = "绘画图片在服务器上的相对路径，由 /uploadDrawing 接口返回后传入", example = "/htp/1_drawing_20260330_uuid.png")
    private String drawingImgUrl;

    /**
     * 联表查询时返回，医生端用于显示用户名
     */
    private String username;

    /**
     * 风险等级（根据score计算得出，不存储在数据库）
     * normal-正常, mild-轻度, moderate-中度, severe-重度
     */
    private String riskLevel;
}
