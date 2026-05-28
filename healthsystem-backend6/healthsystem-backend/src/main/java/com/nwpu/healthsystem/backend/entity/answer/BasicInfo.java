package com.nwpu.healthsystem.backend.entity.answer;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
@ApiModel(description = "需要填写的基本信息")
public class BasicInfo {
    @ApiModelProperty(value = "记录id", example = "1")
    private long id;

    @ApiModelProperty(value = "用户id", example = "1")
    private long userId;

    @ApiModelProperty(value = "填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。", example = "2020-01-01")
    private Date logDate;

    private String sex;

    private String phone;

    @JsonFormat(pattern="yyyy-MM")
    private Date birthDate;

    private String culture;

    private String isSingleParent;

    private String isAbandon;

    private String residential;

    private String marital;

    private String trauma;

    private String traumaTime;

    private String relativeSuicide;

    private String mentalIllness;

    private String familyMentalHistory;

    private String closeRel;

    private String resident;

    private String neighborRel;

    private String colleagueRel;

    private String favour;

    private String comfort;

    private String share;

    private String seekHelp;

    private String groupActivity;

    private String datingEngaged;

    private String datingLose;

    private String parentsConflict;

    private String familyFinanceDif;

    private String debt;

    private String familySerInj;

    private String familyDie;

    private String serInj;

    private String unemployed;

    private String workPressure;

    private String poorMark;

    private String roommatesDis;

    private String lifeLawChange;

    private String friendSerInj;

    private String friendDie;

    private String misunderstood;

    private String stolen;

    private String accidentalShock;
}
