package com.nwpu.healthsystem.backend.common.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@ApiModel
public class LoginRequestDto implements Serializable {


    @NotNull
    //不能为空
    @ApiModelProperty(value = "用户名或者手机号", example = "czw", required = true)
    private String userNameOrPhone;

//    长度限制
    @ApiModelProperty(value = "用户密码", example = "123456", required = true)
    private String password;
}
