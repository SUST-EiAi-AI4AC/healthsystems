package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.sql.Date;

@Data
@ApiModel(description = "MAIA-2 Scale")
public class Maia2 {
    private long id;
    private long userId;
    private Date logDate;
    private int status;
    private short score;
    private byte q1; private byte q2; private byte q3; private byte q4; private byte q5; private byte q6; private byte q7; private byte q8; private byte q9; private byte q10;
    private byte q11; private byte q12; private byte q13; private byte q14; private byte q15; private byte q16; private byte q17; private byte q18; private byte q19; private byte q20;
    private byte q21; private byte q22; private byte q23; private byte q24; private byte q25; private byte q26; private byte q27; private byte q28; private byte q29; private byte q30;
    private byte q31; private byte q32; private byte q33; private byte q34; private byte q35; private byte q36; private byte q37;
}
