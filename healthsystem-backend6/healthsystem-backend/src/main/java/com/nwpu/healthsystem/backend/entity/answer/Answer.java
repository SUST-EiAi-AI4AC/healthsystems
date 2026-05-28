//package com.nwpu.healthsystem.backend.entity.answer;
//
//import io.swagger.annotations.ApiModel;
//import io.swagger.annotations.ApiModelProperty;
//import lombok.Data;
//
//import java.sql.Date;
//import java.sql.Time;
//import java.sql.Timestamp;
//
//
//@Data
//@ApiModel(description = "每日一次的问卷信息")
//public class Answer  {
//
//    @ApiModelProperty(value = "记录id", example = "1")
//    private long id;
//
//    /**
//     * 用户id，外键
//     */
//    @ApiModelProperty(value = "用户id", example = "1")
//    private long userId;
//
//
//    @ApiModelProperty(value = "填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。" +
//            "同时还可以在数据库层面完成限制：一个用户一天只有一条记录", example = "2020-01-01")
//    private Date logDate;
//
//    @ApiModelProperty(value = "运动信息，如慢跑、走路、游泳等，这里不应限制运动方式数量，可以存储多种，每一种方式以字符‘|’隔开", example = "慢跑|游泳")
//    private String sportsInfo;
//
//    @ApiModelProperty(value = "运动时间，单位分钟，与上面对应用‘|’隔开", example = "30|30")
//    private String sportsTime;
//
//    @ApiModelProperty(value = "如暴饮暴食、胃口更差/更好、进食更多/更少；这里可能也不是用一个词就能描述状态" +
//            "（某些状态也并不是互斥的，比如分为胃口和进食多少，胃口好可能不一定进食多?），即可以用‘|’分隔表示状态", example = "暴饮暴食")
//    private String dietInfo;
//
//    @ApiModelProperty(value = "是否按时服药：未知（0）（有些人可能不用服药），未按时服药（1），按时服药（2）", example = "1")
//    private byte medicine;
//
//    @ApiModelProperty(value = "入睡困难、睡不安、睡得多", example = "入睡困难")
//    private String sleepInfo;
//
//    @ApiModelProperty(value = "睡眠时间，单位小时", example = "8")
//    private double sleepTime;
//
//    @ApiModelProperty(value = "睡眠开始时间", example = "23:30:00")
//    private Time sleepTimeStart;
//
//    @ApiModelProperty(value = "今天早晨醒来后，你是")
//    private String weakupStatus;
//
//    @ApiModelProperty(value = "您今天吃早饭的时间")
//    private String breakfirstTime;
//
//    @ApiModelProperty(value = "您今天如何安排自己的时间")
//    private String timeManagement;
//
//    @ApiModelProperty(value = "与人交往时，您的表现如何")
//    private String socialExpression;
//
//    @ApiModelProperty(value = "您今天学习/工作的时长")
//    private String studyOrWorkTime;
//
//    @ApiModelProperty(value = "今天的学习或工作中，你的状态如何")
//    private String studyOrWorkState;
//
//    @ApiModelProperty(value = "您今天如何度过自己的空闲时间")
//    private String free;
//
//    @ApiModelProperty(value = "今天度过您空闲时间的时长有多少")
//    private String freeTime;
//
//    @ApiModelProperty(value = "在度过您的空闲时间时有哪些症状")
//    private String freeSymptom;
//
//    @ApiModelProperty(value = "昨天晚上休息前，您做了什么")
//    private String yesterdayNight;
//
//    @ApiModelProperty(value = "在昨天结束时，您感受如何")
//    private String yesterdayEndFeel;
//
//    @ApiModelProperty(value = "睡眠结束时间", example = "06:30:00")
//    private Time sleepTimeEnd;
//
//    @ApiModelProperty(value = "个人阐述，自行补充情况，描述今天遇到的事情、心情、个人状况等等，必须录制语音；存储语音文件地址", example = "")
//    private String statementUrl;
//
//    @ApiModelProperty(value = "添加时间戳", example = "")
//    private Timestamp addTimestampMils;
//
//    @ApiModelProperty(value = "手机步数", example = "")
//    private String stepInfo;
//
//    @ApiModelProperty(value = "吃了几顿饭", example = "")
//    private String mealInfo;
//
//    @ApiModelProperty(value = "您今天吃午饭的时间", example = "")
//    private String mealTime;
//
//    @ApiModelProperty(value = "您今天午休的时长", example = "")
//    private String mealSleepTime;
//
//    @ApiModelProperty(value = "您今天与他人交流的时长共计", example = "")
//    private String communicateTime;
//
//    @ApiModelProperty(value = "您今天是否参与了哪项活动", example = "")
//    private String activityInfo;
//
//    @ApiModelProperty(value = "您今天吃晚饭的时间", example = "")
//    private String dinnerTime;
//
//    @ApiModelProperty(value = "今天您玩手机的时长共计", example = "")
//    private String phonePlayTime;
//
//
//}


package com.nwpu.healthsystem.backend.entity.answer;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;


@Data
@ApiModel(description = "每日一次的问卷信息")
public class Answer  {

    @ApiModelProperty(value = "记录id", example = "1")
    private long id;

    /**
     * 用户id，外键
     */
    @ApiModelProperty(value = "用户id", example = "1")
    private long userId;

    @ApiModelProperty(value = "填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。" +
            "同时还可以在数据库层面完成限制：一个用户一天只有一条记录", example = "2020-01-01")
    private Date logDate;

    @ApiModelProperty(value = "如暴饮暴食、胃口更差/更好、进食更多/更少；这里可能也不是用一个词就能描述状态" +
            "（某些状态也并不是互斥的，比如分为胃口和进食多少，胃口好可能不一定进食多?），即可以用‘|’分隔表示状态", example = "暴饮暴食")
    private String dietInfo;

    @ApiModelProperty(value = "是否按时服药：未知（0）（有些人可能不用服药），未按时服药（1），按时服药（2）", example = "1")
    private byte medicine;

    @ApiModelProperty(value = "今天早晨醒来后，你是")
    private String weakupStatus;

    @ApiModelProperty(value = "您今天如何安排自己的时间")
    private String timeManagement;

    @ApiModelProperty(value = "与人交往时，您的表现如何")
    private String socialExpression;

    @ApiModelProperty(value = "您今天学习/工作的时长")
    private String studyOrWorkTime;

    @ApiModelProperty(value = "今天的学习或工作中，你的状态如何")
    private String studyOrWorkState;

    @ApiModelProperty(value = "您今天如何度过自己的空闲时间")
    private String free;

    @ApiModelProperty(value = "在度过您的空闲时间时有哪些症状")
    private String freeSymptom;

    @ApiModelProperty(value = "昨天晚上休息前，您做了什么")
    private String yesterdayNight;

    @ApiModelProperty(value = "在昨天结束时，您感受如何")
    private String yesterdayEndFeel;

    @ApiModelProperty(value = "个人阐述，自行补充情况，描述今天遇到的事情、心情、个人状况等等，必须录制语音；存储语音文件地址", example = "")
    private String statementUrl;

    @ApiModelProperty(value = "添加时间戳", example = "")
    private Timestamp addTimestampMils;

    @ApiModelProperty(value = "您今天与他人交流的时长共计", example = "")
    private String communicateTime;

    @ApiModelProperty(value = "今天您玩手机的时长共计", example = "")
    private String phonePlayTime;


}
