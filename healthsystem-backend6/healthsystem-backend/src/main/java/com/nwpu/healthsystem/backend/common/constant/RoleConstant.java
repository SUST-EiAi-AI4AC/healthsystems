package com.nwpu.healthsystem.backend.common.constant;

/**
 * 账号角色统一枚举与判定入口
 * 数据库字段：user_info.role（varchar(16)，默认 'user'）
 * 枚举约定：
 * user   —— 普通用户，只能使用 App/H5，不能登录后台管理端
 * doctor —— 医生，可使用医生端接口，同时允许登录后台管理端
 * admin  —— 管理员，可登录后台管理端；在 Shiro 中同时具备 doctor 角色（admin 是 doctor 的超集），
 *          因为后台管理页面大量调用 /doctor/** 下的医生端接口
 * 字段为空或出现未知取值时，统一按“普通用户”回退
 */
public final class RoleConstant {

    /** 普通用户 */
    public static final String USER = "user";

    /** 医生 */
    public static final String DOCTOR = "doctor";

    /** 管理员 */
    public static final String ADMIN = "admin";

    /** 普通用户的默认权限（与 role_permission 表保持一致） */
    public static final String PERMISSION_NORMAL = "normal";

    private RoleConstant() {
    }

    /**
     * 规范化角色取值：去空格、转小写；空值或未知取值一律回退为普通用户
     */
    public static String normalize(String role) {
        if (role == null) {
            return USER;
        }
        String value = role.trim().toLowerCase();
        if (DOCTOR.equals(value) || ADMIN.equals(value)) {
            return value;
        }
        // user 以及任何未知取值，都按普通用户处理
        return USER;
    }

    /**
     * 是否为管理员
     */
    public static boolean isAdmin(String role) {
        return ADMIN.equals(normalize(role));
    }

    /**
     * 是否允许登录后台管理端：仅管理员与医生，普通用户一律拒绝
     */
    public static boolean canAccessAdminConsole(String role) {
        String value = normalize(role);
        return ADMIN.equals(value) || DOCTOR.equals(value);
    }
}
