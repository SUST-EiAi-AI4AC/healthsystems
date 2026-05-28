package com.nwpu.healthsystem.backend.utils;

import cn.hutool.core.lang.Assert;
import com.nwpu.healthsystem.backend.shiro.AccountInfo;
import org.apache.shiro.SecurityUtils;


public class AccountCheckUtil {
    // 校验用户名和id是否和token一致
    public static void check(String userName, long userId) {
        // 获得当前登录用户的 用户名...  getPrincipal 得到的就是我们自己封装的 AccountInfo类
        AccountInfo principal = (AccountInfo) SecurityUtils.getSubject().getPrincipal();
        // 验证token和userAllInfoDto是否同一人
        Assert.isTrue(userName.equals(principal.getUserName()), "token与用户信息不一致，没有更新权限");

        // 本来经过上面验证就说明有权限了，但为了安全，加一步验证 user——id 因为很多表都是依靠userId关联的
        // 又要查库。。。还是算了
        // 另一种方案：Realm 封装一种数据类型，保存基本信息
        Assert.isTrue(userId == (principal.getUserId()), "token与用户信息不一致，没有更新权限");
    }

    // 校验userid 是否和token里面的一致
    public static void checkByUserId(long userId) {
        // 获得当前登录用户的 用户id...
        AccountInfo principal = (AccountInfo) SecurityUtils.getSubject().getPrincipal();

        Assert.isTrue(userId == (principal.getUserId()), "token与用户信息不一致，没有更新权限");
    }


    // 从token里面获取用户id
    public static long getUserIdFromToken() {
        // 获得当前登录用户的 用户id...
        AccountInfo principal = (AccountInfo) SecurityUtils.getSubject().getPrincipal();

        return principal.getUserId();
    }

    // 检查是否为 相应role
    public static boolean checkHasRole(String role) {
        // shiro 框架提供的方法
        return SecurityUtils.getSubject().hasRole(role);
    }


}
