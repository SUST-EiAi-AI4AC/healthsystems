package com.nwpu.healthsystem.backend.common.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class InvitionCodeDto {
    private String invitionCode;

    private String assistantCode;

    public InvitionCodeDto(String invitionCode, String assistantCode) {
        this.invitionCode = invitionCode;
        this.assistantCode = assistantCode;
    }
}
