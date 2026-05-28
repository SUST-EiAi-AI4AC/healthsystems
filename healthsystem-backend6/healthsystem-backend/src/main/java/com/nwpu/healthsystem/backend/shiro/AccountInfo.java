package com.nwpu.healthsystem.backend.shiro;

import lombok.Data;


@Data
public class AccountInfo {
    long userId;

    String userName;

    AccountInfo(long userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }
}
