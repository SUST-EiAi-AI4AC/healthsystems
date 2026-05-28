package com.nwpu.healthsystem.backend.common.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class DepressedInfoDto {
    List<Long> userIdList;

    String depressed;

    String remark;
}
