package com.nwpu.healthsystem.backend.entity.scale;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.sql.Date;

@Data
@ApiModel(description = "OCEAN Scale")
public class Ocean {
    private long id;
    private long userId;
    private Date logDate;
    private int status;
    private short score;
    private byte q1; private byte q2; private byte q3; private byte q4; private byte q5; private byte q6; private byte q7; private byte q8; private byte q9; private byte q10;
    private byte q11; private byte q12; private byte q13; private byte q14; private byte q15; private byte q16; private byte q17; private byte q18; private byte q19; private byte q20;
    private byte q21; private byte q22; private byte q23; private byte q24; private byte q25; private byte q26; private byte q27; private byte q28; private byte q29; private byte q30;
    private byte q31; private byte q32; private byte q33; private byte q34; private byte q35; private byte q36; private byte q37; private byte q38; private byte q39; private byte q40;
    private byte q41; private byte q42; private byte q43; private byte q44; private byte q45; private byte q46; private byte q47; private byte q48; private byte q49; private byte q50;
    private byte q51; private byte q52; private byte q53; private byte q54; private byte q55; private byte q56; private byte q57; private byte q58; private byte q59; private byte q60;
}
