package com.nwpu.healthsystem.backend.common.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Data
@ApiModel(description = "用户管理模块的数据传输模型，记录所有用户信息，但不包含密码、医生标注信息。" +
        "要求：前端传数据变量名一定要一样，注意数据类型。" +
        "数据格式说明：1、字符串类型数据请不要传null，请传空字符串或者真实值（只有身份证号例外）" +
        "2、时间戳不知道怎么传，可以设置为0，然后从服务器获得数据之后就有值了。（这一项数据库来维护数据）" +
        "3、数值类型数据没有太多要求")
public class UserAllInfoDto implements Serializable {

    @ApiModelProperty(value = "用户id", example = "1")
    private long userId;

    @ApiModelProperty(value = "手机号码、唯一", example = "17700001234")
    private String phone;

    @ApiModelProperty(value = "用户名、唯一", example = "小明1号")
    private String userName;

    @ApiModelProperty(value = "密码， 注意：此字段应该只有注册时是有值的，其他时候都应该为空字符串/空")
    private String password;

    @ApiModelProperty(value = "邮箱", example = "ccceee00001@163.com")
    private String email;

    @ApiModelProperty(value = "garmin密码")
    private String garminPassword;

    @ApiModelProperty(value = "用户角色：用户（user）、医生（doctor）、管理员（admin）", example = "user")
    private String role;

    @ApiModelProperty(value = "用户权限", example = "normal")
    private String permission;

    @ApiModelProperty(value = "用户真实姓名", example = "小明")
    private String realName;

    @ApiModelProperty(value = "用户身份证号，唯一。这个字符串不一样，请设置为null，或者真实值，请不要设置空字符串", example = "12345620001234xxxx")
    private String identityNumber;

    @ApiModelProperty(value = "用户所在城市", example = "西安")
    private String city;

    @ApiModelProperty(value = "用户所在省份", example = "陕西")
    private String province;

    @ApiModelProperty(value = "用户所在国家", example = "中国")
    private String country;

    @ApiModelProperty(value = "用户头像地址", example = "")
    private String avatar;

    @ApiModelProperty(value = "用于标注是否npwu用户，默认0（false），1（true）", example = "1")
    private byte nwpu;

    @ApiModelProperty(value = "添加时间戳", example = "0")
    private Timestamp addTimestampMils;

    @ApiModelProperty(value = "修改时间戳", example = "0")
    private Timestamp modTimestampMils;


    // from nwpu_user_info
    @ApiModelProperty(value = "用户学号/工号", example = "2000991234")
    private String nwpuId;

    @ApiModelProperty(value = "所属学院/单位名字", example = "计算机学院")
    private String college;

    @ApiModelProperty(value = "用户所在年级，入学/校年份", example = "2000")
    private Integer grade;

    @ApiModelProperty(value = "用户类型，未知，本科生，硕士，博士，教职工。数据库是enum类型。只能是以上几种", example = "本科生")
    private String type;


    // from user_health_info
    @ApiModelProperty(value = "性别", example = "男")
    private String sex;

    @ApiModelProperty(value = "出生时间", example = "2000-10-19")
    private Date birthDate;

    @ApiModelProperty(value = "身高，单位：厘米（整数）", example = "170")
    private Integer height;

    @ApiModelProperty(value = "体重，单位：千克，保留小数点后一位", example = "60.0")
    private Double weight;

    @ApiModelProperty(value = "属于哪位医生", example = "1")
    private long doctorId;

    @ApiModelProperty(value = "（真实标签）抑郁程度标注、诊断结果（格式应为指定的几种级别，如高危、重度、中度和轻度）", example = "")
    private String depressed;

    @ApiModelProperty(value = "（真实标签）备注信息（医生对病人的备注信息，格式无要求）", example = "")
    private String remark;

    @ApiModelProperty(value = "注册时填写的邀请码，默认可使用2026", example = "2026")
    private String inviteCode;
}
