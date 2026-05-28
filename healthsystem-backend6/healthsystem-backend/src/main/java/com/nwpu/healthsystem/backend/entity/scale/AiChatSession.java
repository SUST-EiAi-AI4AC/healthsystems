package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Timestamp;


@Data
public class AiChatSession {

    @ApiModelProperty(value = "会话ID，新增时无需传入", example = "0")
    private long id;

    @ApiModelProperty(value = "用户ID，由后端从Token中自动获取，无需前端传入", example = "1")
    private long userId;

    @ApiModelProperty(value = "对话标题，取第一条用户消息前20字，新建时默认为'新对话'", example = "今天感觉有点焦虑...")
    private String title;

    @ApiModelProperty(value = "会话创建时间，由数据库自动填充")
    private Timestamp createdAt;

    @ApiModelProperty(value = "最后更新时间，由数据库自动维护")
    private Timestamp updatedAt;
}
