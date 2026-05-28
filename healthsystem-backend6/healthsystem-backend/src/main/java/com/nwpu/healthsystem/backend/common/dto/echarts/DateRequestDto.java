package com.nwpu.healthsystem.backend.common.dto.echarts;

import lombok.Data;

import java.io.Serializable;
import java.sql.Date;

@Data
public class DateRequestDto {
    protected Date logDate;
}
