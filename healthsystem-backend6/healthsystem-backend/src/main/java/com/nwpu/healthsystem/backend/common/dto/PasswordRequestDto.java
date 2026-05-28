package com.nwpu.healthsystem.backend.common.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
public class PasswordRequestDto {
    @ApiModelProperty(value = "旧密码", example = "123456", required = true)
    String oldPassword;

    @ApiModelProperty(value = "新密码", example = "123456", required = true)
    String newPassword;
}
