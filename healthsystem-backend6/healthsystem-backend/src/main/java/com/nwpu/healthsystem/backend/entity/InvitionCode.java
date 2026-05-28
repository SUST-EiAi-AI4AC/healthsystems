package com.nwpu.healthsystem.backend.entity;

import lombok.Data;


@Data
public class InvitionCode {
    private long id;

    private long userId;

    private String invitionCode;

    private long inviter;

    private String assistantCode;

    private long groupId;

    public InvitionCode(long userId, String invitionCode, long inviter, String assistantCode, long groupId){
        this.userId = userId;
        this.invitionCode = invitionCode;
        this.inviter = inviter;
        this.assistantCode = assistantCode;
        this.groupId = groupId;
    }
}
