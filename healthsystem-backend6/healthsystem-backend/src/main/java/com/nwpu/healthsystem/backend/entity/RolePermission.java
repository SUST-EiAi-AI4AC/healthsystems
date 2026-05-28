package com.nwpu.healthsystem.backend.entity;


import lombok.Data;


@Data
public class RolePermission  {


    private byte id;

    /**
     * 用户角色，‘user’，‘doctor’，‘admin’
     */
    private String role;

    /**
     * 用户权限（暂时用不到），‘normal’，‘vip’
     */
    private String permission;


}
