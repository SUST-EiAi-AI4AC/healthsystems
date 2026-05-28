package com.nwpu.healthsystem.backend.shiro;

import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.JWTUtil;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * @Description 自定义 Realm
 */
@Component
public class CustomRealm extends AuthorizingRealm {
    private final UserInfoMapper userInfoMapper;

    @Autowired
    public CustomRealm(UserInfoMapper userInfoMapper) {
        this.userInfoMapper = userInfoMapper;
    }

    /**
     * 必须重写此方法，不然会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JWTToken;
    }

    /**
     * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     * 这里有个小问题，这里面抛出的异常 AuthenticationException 全局无法捕获
     * 所以，filter 里面有一个错误处理，跳转到未授权地址，转而返回信息
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
//        System.out.println("————身份认证方法————");
        String token = (String) authenticationToken.getCredentials();
        // 解密获得username，用于和数据库进行对比
        String username = null;
        // 这里可能会抛异常，万一有人手动篡改jwt（第一段）等等，然后解析就会出错
        try{
            username = JWTUtil.getUsername(token);
        } catch (Exception e) {
//            System.out.println("token基本信息被篡改！");
            throw new AuthenticationException("token基本信息被篡改！");
        }

        if (username == null || !JWTUtil.verify(token, username)) {
//            System.out.println("token认证失败！");
            throw new AuthenticationException("token认证失败！");
        }

//        稍微优化一下：
//        UserInfo userInfo = userInfoMapper.getUserInfoByName(username);
        String userId = userInfoMapper.getUserIdByName(username);
        // 找不到用户就会是 null
        if (userId == null) {
//            System.out.println("该用户不存在！");
            throw new AuthenticationException("该用户不存在！");
        }
        Long userId_l = Long.valueOf(userId);
        // 公开信息（username、userId）， 较为私密信息（jwt），Realm名称
        return new SimpleAuthenticationInfo(new AccountInfo(userId_l, username), token, "MyRealm");
    }

    /**
     * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//        System.out.println("————权限认证————");
        // 2020.11.8 修复小bug：由于principals封装为AccountInfo，所以方法改变
//        String username = JWTUtil.getUsername(principals.toString());

//        principals 不是 AccountInfo 类，里面成员才是
        String username = ((AccountInfo) principals.getPrimaryPrincipal()).getUserName();



        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //获得该用户角色
        UserInfo userInfo = userInfoMapper.getUserInfoByName(username);

        String role = userInfo.getRole();
        //每个角色拥有默认的权限
        String rolePermission = userInfoMapper.getRolePermission(userInfo.getUserId());
        //每个用户可以设置新的权限
        String permission = userInfo.getPermission();

        Set<String> roleSet = new HashSet<>();
        Set<String> permissionSet = new HashSet<>();
        //需要将 role, permission 封装到 Set 作为 info.setRoles(), info.setStringPermissions() 的参数
        roleSet.add(role);
        permissionSet.add(rolePermission);
        permissionSet.add(permission);
        //设置该用户拥有的角色和权限
        info.setRoles(roleSet);
        info.setStringPermissions(permissionSet);
        return info;
    }
}