package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Timestamp;


@Data
public class AiChatMessage {

    @ApiModelProperty(value = "消息ID，新增时无需传入", example = "0")
    private long id;

    @ApiModelProperty(value = "所属会话ID", example = "1")
    private long sessionId;

    @ApiModelProperty(value = "用户ID，由后端从Token中自动获取，无需前端传入", example = "1")
    private long userId;

    @ApiModelProperty(value = "消息角色：user / ai", example = "user")
    private String role;

    @ApiModelProperty(value = "消息内容文本", example = "今天感觉有点焦虑")
    private String content;

    @ApiModelProperty(value = "消息类型：text / image，默认 text", example = "text")
    private String msgType;

    @ApiModelProperty(value = "消息创建时间，由数据库自动填充")
    private Timestamp createdAt;
}
