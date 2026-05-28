package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.sql.Date;
import java.time.format.DateTimeFormatter;


@Data
@ApiModel(description = "SAS Scale")
public class SAS {
    @ApiModelProperty(value = "记录id", example = "1")
    private long id;

    @ApiModelProperty(value = "用户ID",example = "1")
    private long userId;

    @ApiModelProperty(value = "填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。" +
            "同时还可以在数据库层面完成限制：一个用户一天只有一条记录", example = "2020-01-01")
    private Date logDate;
    private Date logDate2;
    private Date logDate3;

    @Max(value = 4, message = "问题1最大值为4")
    @Min(value = 1, message = "问题1最小值为1")
    @ApiModelProperty(value = "我觉得比平时更紧张和焦虑",example = "0")
    private byte sasQ1;

    @Max(value = 4, message = "问题2最大值为4")
    @Min(value = 1, message = "问题2最小值为1")
    @ApiModelProperty(value = "我无缘无故地感到害怕",example = "0")
    private byte sasQ2;

    @Max(value = 4, message = "问题3最大值为4")
    @Min(value = 1, message = "问题3最小值为1")
    @ApiModelProperty(value = "我容易心里烦乱或觉得惊恐",example = "0")
    private byte sasQ3;

    @Max(value = 4, message = "问题4最大值为4")
    @Min(value = 1, message = "问题4最小值为1")
    @ApiModelProperty(value = "我感觉自己快要崩溃了",example = "0")
    private byte sasQ4;

    @Max(value = 4, message = "问题5最大值为4")
    @Min(value = 1, message = "问题5最小值为1")
    @ApiModelProperty(value = "我觉得一切都很好，不会发生什么不好的事情",example = "0")
    private byte sasQ5;

    @Max(value = 4, message = "问题6最大值为4")
    @Min(value = 1, message = "问题6最小值为1")
    @ApiModelProperty(value = "我手脚发抖打颤",example = "0")
    private byte sasQ6;

    @Max(value = 4, message = "问题7最大值为4")
    @Min(value = 1, message = "问题7最小值为1")
    @ApiModelProperty(value = "我因为头疼、头颈痛和背痛而苦恼",example = "0")
    private byte sasQ7;

    @Max(value = 4, message = "问题8最大值为4")
    @Min(value = 1, message = "问题8最小值为1")
    @ApiModelProperty(value = "我感到容易衰弱和疲乏",example = "0")
    private byte sasQ8;

    @Max(value = 4, message = "问题9最大值为4")
    @Min(value = 1, message = "问题9最小值为1")
    @ApiModelProperty(value = "我觉得心平气和，并且容易安静坐着",example = "0")
    private byte sasQ9;

    @Max(value = 4, message = "问题10最大值为4")
    @Min(value = 1, message = "问题10最小值为1")
    @ApiModelProperty(value = "我觉得心跳得很快",example = "0")
    private byte sasQ10;

    @Max(value = 4, message = "问题11最大值为4")
    @Min(value = 1, message = "问题11最小值为1")
    @ApiModelProperty(value = "我因为一阵阵头晕而苦恼",example = "0")
    private byte sasQ11;

    @Max(value = 4, message = "问题12最大值为4")
    @Min(value = 1, message = "问题12最小值为1")
    @ApiModelProperty(value = "我有晕倒发作或觉得要晕倒似的",example = "0")
    private byte sasQ12;

    @Max(value = 4, message = "问题13最大值为4")
    @Min(value = 1, message = "问题13最小值为1")
    @ApiModelProperty(value = "我呼气、吸气都感到很容易",example = "0")
    private byte sasQ13;

    @Max(value = 4, message = "问题14最大值为4")
    @Min(value = 1, message = "问题14最小值为1")
    @ApiModelProperty(value = "我手脚麻木和刺痛",example = "0")
    private byte sasQ14;

    @Max(value = 4, message = "问题15最大值为4")
    @Min(value = 1, message = "问题15最小值为1")
    @ApiModelProperty(value = "我因为胃痛和消化不良而苦恼",example = "0")
    private byte sasQ15;

    @Max(value = 4, message = "问题16最大值为4")
    @Min(value = 1, message = "问题16最小值为1")
    @ApiModelProperty(value = "我常常要小便",example = "0")
    private byte sasQ16;

    @Max(value = 4, message = "问题17最大值为4")
    @Min(value = 1, message = "问题17最小值为1")
    @ApiModelProperty(value = "我的手脚常常是干燥温暖的",example = "0")
    private byte sasQ17;

    @Max(value = 4, message = "问题18最大值为4")
    @Min(value = 1, message = "问题18最小值为1")
    @ApiModelProperty(value = "我脸红发热",example = "0")
    private byte sasQ18;

    @Max(value = 4, message = "问题19最大值为4")
    @Min(value = 1, message = "问题19最小值为1")
    @ApiModelProperty(value = "我容易入睡，并且一夜睡得很好",example = "0")
    private byte sasQ19;

    @Max(value = 4, message = "问题20最大值为4")
    @Min(value = 1, message = "问题10最小值为1")
    @ApiModelProperty(value = "我做噩梦",example = "0")
    private byte sasQ20;


    @ApiModelProperty(value = "对于每个问题，完全不会记1分、几天记2分、一半以上的日子记3分、几乎每天记4分，计算总分",example = "9")
    private byte score;
    private byte score2;
    private byte score3;

    private DateTimeFormatter formatter;
    private String username;


    public SAS() {
    }

    public SAS(long userId, Date logDate,byte score,String username) {
        this.userId = userId;
        this.logDate = logDate;
        this.score = score;
        this.username = username;
    }

}
