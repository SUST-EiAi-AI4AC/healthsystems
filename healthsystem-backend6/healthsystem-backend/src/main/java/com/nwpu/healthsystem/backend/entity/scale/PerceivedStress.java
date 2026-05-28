package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.sql.Date;
import java.time.format.DateTimeFormatter;


@Data
@ApiModel(description = "PerceivedStress Scale")
public class PerceivedStress {
    @ApiModelProperty(value = "记录id", example = "1")
    private long id;

    @ApiModelProperty(value = "用户id", example = "1")
    private long userId;

    @ApiModelProperty(value = "填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。" +
            "同时还可以在数据库层面完成限制：一个用户一天只有一条记录", example = "2020-01-01")
    private Date logDate;
    private Date logDate2;
    private Date logDate3;

    @Max(value = 4, message = "问题1最大值为4")
    @Min(value = 0, message = "问题1最小值为0")
    @ApiModelProperty(value = "(请回想最近一个月来，发生下列各状况的频率。 从不 偶尔 有时 常常 总是 )一些无法预期的事情发生而感到心烦意乱", example = "0")
    private byte pssQ1;

    @Max(value = 4, message = "问题2最大值为4")
    @Min(value = 0, message = "问题2最小值为0")
    @ApiModelProperty(value = "感觉无法控制自己生活中重要的事情", example = "1")
    private byte pssQ2;

    @Max(value = 4, message = "问题3最大值为4")
    @Min(value = 0, message = "问题3最小值为0")
    @ApiModelProperty(value = "感到紧张不安和压力", example = "2")
    private byte pssQ3;

    @Max(value = 4, message = "问题4最大值为4")
    @Min(value = 0, message = "问题4最小值为0")
    @ApiModelProperty(value = "成功地处理恼人的生活麻烦", example = "3")
    private byte pssQ4;

    @Max(value = 4, message = "问题5最大值为4")
    @Min(value = 0, message = "问题5最小值为0")
    @ApiModelProperty(value = "感到自己是有效地处理生活中所发生的重要改变", example = "4")
    private byte pssQ5;

    @Max(value = 4, message = "问题6最大值为4")
    @Min(value = 0, message = "问题6最小值为0")
    @ApiModelProperty(value = "对于有能力处理自己私人的问题感到很有信心 ", example = "0")
    private byte pssQ6;

    @Max(value = 4, message = "问题7最大值为4")
    @Min(value = 0, message = "问题7最小值为0")
    @ApiModelProperty(value = "感到事情顺心如意", example = "1")
    private byte pssQ7;

    @Max(value = 4, message = "问题8最大值为4")
    @Min(value = 0, message = "问题8最小值为0")
    @ApiModelProperty(value = "发现自己无法处理所有自己必须做的事情", example = "2")
    private byte pssQ8;

    @Max(value = 4, message = "问题9最大值为4")
    @Min(value = 0, message = "问题9最小值为0")
    @ApiModelProperty(value = "有办法控制生活中恼人的事情", example = "3")
    private byte pssQ9;

    @Max(value = 4, message = "问题10最大值为4")
    @Min(value = 0, message = "问题10最小值为0")
    @ApiModelProperty(value = "常觉得自己是驾驭事情的主人", example = "4")
    private byte pssQ10;

    @Max(value = 4, message = "问题11最大值为4")
    @Min(value = 0, message = "问题11最小值为0")
    @ApiModelProperty(value = "常生气，因为很多事情的发生是超出自己所能控制的", example = "0")
    private byte pssQ11;

    @Max(value = 4, message = "问题12最大值为4")
    @Min(value = 0, message = "问题12最小值为0")
    @ApiModelProperty(value = "经常想到有些事情是自己必须完成的", example = "1")
    private byte pssQ12;

    @Max(value = 4, message = "问题13最大值为4")
    @Min(value = 0, message = "问题13最小值为0")
    @ApiModelProperty(value = "常能掌握时间安排方式", example = "2")
    private byte pssQ13;

    @Max(value = 4, message = "问题14最大值为4")
    @Min(value = 0, message = "问题14最小值为0")
    @ApiModelProperty(value = "常感到困难的事情堆积如山，而自己无法克服它们", example = "3")
    private byte pssQ14;

    @ApiModelProperty(value = "量表由14个项目组成，bai分别为du6个正向题目和8个反向题目，其中反向计分的题目分别是4、5、6、7、9、10、12、13。量表具有两个维度，" +
            "分别是紧张感和失控感，采用5点计分的方法，最后统计量表的总得分，得分越高说明被试的心理压力越明显。" +
            "计算分值的方法为:“从不”记1分、“偶尔”记2分、“有时”记3分、“时常”记4分、“总是”记5分，最后的总分范围是在14分-70分之间。", example = "50")
    private byte score;
    private byte score2;
    private byte score3;

    private DateTimeFormatter formatter;
    private String username;

    public PerceivedStress() {
    }

    public PerceivedStress(long userId, Date logDate,byte score,String username) {
        this.userId = userId;
        this.logDate = logDate;
        this.score = score;
        this.username = username;
    }
}
