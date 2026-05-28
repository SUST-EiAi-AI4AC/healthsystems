package com.nwpu.healthsystem.backend.common.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;


@Data
public class RegisterDoctorDto {
    @ApiModelProperty(value = "是否医生助理", example = "false")
    private Boolean isAssistant;

    @ApiModelProperty(value = "邀请码", example = "710129")
    private String invitionCode;

    @ApiModelProperty(value = "手机号码、唯一", example = "17700001234")
    private String phone;

    @ApiModelProperty(value = "用户名、唯一", example = "小明1号")
    private String userName;

    @ApiModelProperty(value = "密码， 注意：此字段应该只有注册时是有值的，其他时候都应该为空字符串/空")
    private String password;

    private final String role = "doctor";

    private final String permission = "vip";

    @ApiModelProperty(value = "用户真实姓名", example = "小明")
    private String realName;

    @ApiModelProperty(value = "用户身份证号，唯一。这个字符串不一样，请设置为null，或者真实值，请不要设置空字符串", example = "12345620001234xxxx")
    private String identityNumber;

    @ApiModelProperty(value = "用户所在城市", example = "")
    private final String city = "";

    @ApiModelProperty(value = "用户所在省份", example = "")
    private final String province = "";

    private final String country = "中国";

    private final String avatar = "";

    private final byte nwpu = 0;

    // from user_health_info
    @ApiModelProperty(value = "性别", example = "男")
    private String sex;

    @ApiModelProperty(value = "出生时间", example = "2000-10-19")
    private Date birthDate;

    private final Integer height = 0;

    private final Double weight = 0.0;

//    医生注册的时候就不是医生id了，会挂到id=1下，也就是管理员下
    private final long doctorId = 1;

    private final String depressed = "";

    private final String remark = "";
}
