package com.nwpu.healthsystem.backend.service;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import com.nwpu.healthsystem.backend.common.dto.LoginRequestDto;
import com.nwpu.healthsystem.backend.common.dto.RegisterDoctorDto;
import com.nwpu.healthsystem.backend.common.dto.UserAllInfoDto;
import com.nwpu.healthsystem.backend.entity.InvitionCode;
import com.nwpu.healthsystem.backend.entity.NwpuUserInfo;
import com.nwpu.healthsystem.backend.entity.UserHealthInfo;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.mapper.InvitionCodeMapper;
import com.nwpu.healthsystem.backend.mapper.NwpuUserInfoMapper;
import com.nwpu.healthsystem.backend.mapper.UserHealthInfoMapper;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.JWTUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Random;
import java.util.ResourceBundle;

@Slf4j
@Service
public class UserService {
    private final UserInfoMapper userInfoMapper;
    private final NwpuUserInfoMapper nwpuUserInfoMapper;
    private final UserHealthInfoMapper userHealthInfoMapper;
    private final InvitionCodeMapper invitionCodeMapper;

    /** 默认邀请码，无需查证数据库，直接放行 */
    private static final String DEFAULT_INVITE_CODE = "2026";
    /** 默认医生id，使用默认邀请码注册时归属该医生 */
    private static final long DEFAULT_DOCTOR_ID = 1L;

    @Autowired
    public UserService(UserInfoMapper userInfoMapper,
                       NwpuUserInfoMapper nwpuUserInfoMapper,
                       UserHealthInfoMapper userHealthInfoMapper,
                       InvitionCodeMapper invitionCodeMapper) {
        this.userInfoMapper = userInfoMapper;
        this.nwpuUserInfoMapper = nwpuUserInfoMapper;
        this.userHealthInfoMapper = userHealthInfoMapper;
        this.invitionCodeMapper = invitionCodeMapper;
    }

    /**
     * 1、用户登录，包括医生和普通用户
     *
     * @param loginRequestDto
     * @return
     */
    public Response login(LoginRequestDto loginRequestDto, HttpServletResponse response) {

        try {
//          先去检查是否存在用户
            String userNameOrPhone = loginRequestDto.getUserNameOrPhone();

            // 修复空指针 Exception
            if(null == userNameOrPhone || null == loginRequestDto.getPassword()) {
                return Response.fail("用户名/手机号不能为空，登录失败");
            }

//            验证是否为手机号，这个正则表达式限制还不是很严格
            boolean isPhone = userNameOrPhone.matches("[0-9]+");

            UserInfo userInfo;
            if(isPhone) {
                // 根据手机号 获取用户信息
//                System.out.println("根据手机号");
                userInfo = userInfoMapper.getUserInfoByPhone(userNameOrPhone);
            } else {
                // 根据 用户名 获得用户信息
//                System.out.println("根据用户名");
                userInfo = userInfoMapper.getUserInfoByName(userNameOrPhone);
            }
            //            用户不存在
            if (userInfo == null) {
//                System.out.println("用户不存在");
                return Response.fail("用户名/手机号或密码错误，登录失败");
            }

            //            验证密码
            String passwordRequst = SecureUtil.md5(loginRequestDto.getPassword());
//            String passwordRequst = loginRequestDto.getPassword();
            String passwordFromDB = userInfo.getPassword();
            //            密码错误
            if(!passwordFromDB.equals(passwordRequst)) {
//                System.out.println("密码错误");
                return Response.fail("用户名/手机号或密码错误，登录失败");
            }

//密码验证准确, 用户验证成功

//      1、生成Jwt
            String jwt = JWTUtil.createToken(userInfo.getUserName());
            // 生成之后就可以返回，但是怎么返回：可以直接返回，也可以放到 header里面（一般，因为jwt延期的话，就可以看header）
            response.setHeader("Authorization", jwt);
            response.setHeader("Access-Control-Expose-Headers", "Authorization");

//      2、封装用户信息
            NwpuUserInfo nwpuUserInfo = nwpuUserInfoMapper.getNwpuUserInfoByUserId(userInfo.getUserId());
            UserHealthInfo userHealthInfo = userHealthInfoMapper.getUserHealthInfoByUserId(userInfo.getUserId());

            //copy数据，封装成UserAllInfoDto返回前端
            UserAllInfoDto userAllInfoDto = new UserAllInfoDto();
            BeanUtil.copyProperties(nwpuUserInfo, userAllInfoDto);
            BeanUtil.copyProperties(userHealthInfo, userAllInfoDto);
            // 这个放最后，因为三个表都有时间戳，名字都一样会覆盖，所以就用这张表的时间戳
            BeanUtil.copyProperties(userInfo, userAllInfoDto);
            // 清空密码, 标注信息
            userAllInfoDto.setPassword("");
            userAllInfoDto.setDepressed("");
            userAllInfoDto.setRemark("");
//      3、返回数据
            return Response.success(userAllInfoDto);

        } catch (Exception e) {
            log.error("用户名/手机号或密码错误，登录失败" + e.getMessage());
            return Response.fail("用户名/手机号或密码错误，登录失败");
        }
    }

    /**
     * 2、普通用户注册、医生注册也会间接调用这个
     * 注意：注册前会先验证邀请码
     *
     * @param userAllInfoDto
     * @return
     */
    public Response checkInviteCode(String inviteCode) {
        if (inviteCode == null || inviteCode.trim().isEmpty()) {
            return Response.fail("邀请码不能为空");
        }
        if (DEFAULT_INVITE_CODE.equals(inviteCode.trim())) {
            return Response.success("邀请码有效");
        }
        try {
            long inviter = invitionCodeMapper.getInviterByInvitionCode(inviteCode.trim());
            if (inviter > 0) {
                return Response.success("邀请码有效");
            } else {
                return Response.fail("邀请码无效，请检查后重试");
            }
        } catch (Exception e) {
            return Response.fail("邀请码无效，请检查后重试");
        }
    }

    public Response register(UserAllInfoDto userAllInfoDto, HttpServletResponse response) {
        // 先验证邀请码
        String inviteCode = userAllInfoDto.getInviteCode();
        if (inviteCode == null || inviteCode.trim().isEmpty()) {
            return Response.fail("邀请码不能为空，默认邀请码为 2026");
        }
        inviteCode = inviteCode.trim();
        if (DEFAULT_INVITE_CODE.equals(inviteCode)) {
            // 使用默认邀请码，归属默认医生
            userAllInfoDto.setDoctorId(DEFAULT_DOCTOR_ID);
        } else {
            // 查询数据库中的邀请码
            try {
                long inviter = invitionCodeMapper.getInviterByInvitionCode(inviteCode);
                if (inviter <= 0) {
                    return Response.fail("邀请码无效，请检查后重试");
                }
                userAllInfoDto.setDoctorId(inviter);
            } catch (Exception e) {
                return Response.fail("邀请码无效，请检查后重试");
            }
        }

        try {
            // 先对明文密码进行加密
            userAllInfoDto.setPassword(SecureUtil.md5(userAllInfoDto.getPassword()));
//            1、插入表:user_info
            // 将 userAllInfoDto 分解
            UserInfo userInfo = new UserInfo();
            BeanUtil.copyProperties(userAllInfoDto, userInfo);
            // 插入新用户
            int i2 = userInfoMapper.insertUser(userInfo);

            // 插入之后就会自动生成 id，由于将其他信息插入表中
            String userIdByName = userInfoMapper.getUserIdByName(userAllInfoDto.getUserName());
            Long userId = Long.valueOf(userIdByName);
            userAllInfoDto.setUserId(userId);
            try {
                // 将 userAllInfoDto 分解
                UserHealthInfo userHealthInfo = new UserHealthInfo();
                BeanUtil.copyProperties(userAllInfoDto, userHealthInfo);
                // 插入 用户健康信息
                int i1 = userHealthInfoMapper.insertUserHealthInfo(userHealthInfo);
            } catch (Exception e) {
                // 由于插入表user_health_info失败，进行回滚，删除之前插入的 用户信息
                int i = userInfoMapper.deleteUserById(userAllInfoDto.getUserId());
                // 由外部返回错误信息
                throw e;
            }

            // 返回用户信息， 这里面带有jwt, userId等新信息
            String jwt = JWTUtil.createToken(userInfo.getUserName());
            // 生成之后就可以返回，但是怎么返回：可以直接返回，也可以放到 header里面（一般，因为jwt延期的话，就可以看header）
            response.setHeader("Authorization", jwt);
            response.setHeader("Access-Control-Expose-Headers", "Authorization");

            UserInfo userInfo_new = userInfoMapper.getUserInfoById(userAllInfoDto.getUserId());
            BeanUtil.copyProperties(userInfo_new, userAllInfoDto);
            // 清空密码
            userAllInfoDto.setPassword("");
            return Response.success(userAllInfoDto);
        } catch (Exception e) {
            // getCause() 可能为 null，需安全取得错误信息
            String message = e.getCause() != null ? e.getCause().getMessage() : e.getMessage();
            if (message == null) message = e.toString();
//            1、单独处理user——info操作失败： 只要返回错误信息即可
            if(message.contains("u_phone")) {
                return Response.fail("注册失败：手机号已被使用");
            } else if(message.contains("u_user_name")) {
                return Response.fail("注册失败：用户名已被使用");
            } else if(message.contains("u_identity_number")) {
                return Response.fail("注册失败：身份证号已被使用");
            }
            if(message.contains("fk_doctor_id")) {
                return Response.fail("注册失败，医生id不存在，请检查邀请码");
            }

            // 其他所有情况：提示信息为数据库返回的错误信息
            log.error("注册失败，原因:" + e.getMessage());
            return Response.fail("注册失败，原因:" + message);
        }
    }

    /**
     * 3、修改个人信息
     *
     * @param userAllInfoDto
     * @return
     */
    // Java 竟然不支持 参数设置默认值。。。
    public Response update(UserAllInfoDto userAllInfoDto) {
        try {
            long userId = userAllInfoDto.getUserId();
            AccountCheckUtil.check(userAllInfoDto.getUserName(), userId);

            // 验证通过，解析前端传输的信息到 实体
            UserInfo new_userInfo = new UserInfo();
            NwpuUserInfo new_nwpuUserInfo = new NwpuUserInfo();
            UserHealthInfo new_userHealthInfo = new UserHealthInfo();

            BeanUtil.copyProperties(userAllInfoDto, new_userInfo);
            BeanUtil.copyProperties(userAllInfoDto, new_nwpuUserInfo);
            BeanUtil.copyProperties(userAllInfoDto, new_userHealthInfo);

            // old info ，用于回滚
            UserInfo old_userInfo = userInfoMapper.getUserInfoById(userId);
            UserHealthInfo old_userHealthInfo = userHealthInfoMapper.getUserHealthInfoByUserId(userId);

            // 执行更新信息
            // 1、UserInfo
            try{
                int userResult = userInfoMapper.updateUser(new_userInfo);
            } catch (Exception e) {     // 第一张表无需回滚
                throw e;
            }

            // 2、UserHealthInfo
            try {
                int i = userHealthInfoMapper.updateUserHealthInfo(new_userHealthInfo);
            } catch (Exception e) {
                int userResult = userInfoMapper.updateUser(old_userInfo);
                throw e;
            }

            // 3、NwpuUserInfo
            // 有四种情况：
            try {
                if(1 == new_userInfo.getNwpu()) {
                    if(1 == old_userInfo.getNwpu()) {   // 1 一直都是nwpu用户，只是更新信息
                        int i = nwpuUserInfoMapper.updateNwpuUserInfo(new_nwpuUserInfo);
                    } else {                            // 2 之前不是，现在是，需要插入
                        int i = nwpuUserInfoMapper.insertNwpuUserInfo(new_nwpuUserInfo);
                    }
                } else {
                    if(1 == old_userInfo.getNwpu()) {   // 3 之前是，现在不是
                        int i = nwpuUserInfoMapper.deleteNwpuUserInfoById(userId);
                    } else {                            // 4 前后都不是
                        // do nothing
                    }
                }
            } catch (Exception e) {
                // (由于nwpu_id唯一)对NwpuUserInfo维护失败，回滚，还原对前两张表的更改
                int userResult = userInfoMapper.updateUser(old_userInfo);
                int i = userHealthInfoMapper.updateUserHealthInfo(old_userHealthInfo);
                throw e;
            }

            // 更新时间戳、nwpu用户信息，因为有时要清空，可优化，更精细查询
            if(0 == new_userInfo.getNwpu() && 1 == old_userInfo.getNwpu()) {
                userAllInfoDto.setNwpuId("");
                userAllInfoDto.setCollege("");
                userAllInfoDto.setGrade(0);
                userAllInfoDto.setType("");
            }
            userAllInfoDto.setModTimestampMils(new Timestamp(System.currentTimeMillis()));
            userAllInfoDto.setPassword("");
            userAllInfoDto.setDepressed("");
            userAllInfoDto.setRemark("");
            return Response.success(userAllInfoDto);
        } catch (IllegalArgumentException e){
            throw e;            // 全局处理
        } catch (Exception e) {
            // 统一 控制返回信息
            String message = e.getCause().getMessage();

            if(message.contains("u_identity_number")) {
                return Response.fail("修改失败：身份证号码已被使用");
            } else if(message.contains("u_nwpu_id")) {
                return Response.fail("修改失败：nwpu_ID已被使用");
            } else if(message.contains("column 'type'")) {
                return Response.fail("修改失败：还请选择一种nwpu用户类型");
            }else if(message.contains("u_avatar")) {
                return Response.fail("修改失败：还请选择一种nwpu用户类型");
            }
            log.error("修改失败，原因:" + e.getMessage());
            return Response.fail("修改失败，原因:" + message);
        }
    }

    /**
     * 4、用户更新密码
     *@param oldPassword
     *@return
     */
    public Response updatePassword(String oldPassword, String newPassword) {
        try{
            long userId = AccountCheckUtil.getUserIdFromToken();
            // 根据用户ID获取旧密码，验证旧的密码
            String oldPasswordInSQL = userInfoMapper.getPassword(userId);
            oldPassword = SecureUtil.md5(oldPassword);

            if(oldPassword.equals(oldPasswordInSQL)) {
                // 验证成功，更新密码
                newPassword = SecureUtil.md5(newPassword);
                userInfoMapper.updatePassword(newPassword, userId);

                return Response.success(null);
            } else {
                return Response.fail("原始密码错误");
            }
        } catch (Exception e) {
            log.error("更新失败，原因:" + e.getMessage());
            return Response.fail("更新失败，原因:" + e.getMessage());
        }
    }

    public Boolean pushConnected(long userIdFromToken) {
        userInfoMapper.setPushConnected(userIdFromToken);
        return true;
    }

    public Response updateAvatar(String avatar) {
        try{
            long userId = AccountCheckUtil.getUserIdFromToken();
            userInfoMapper.updateAvatar(avatar, userId);
            return Response.success(null);
        } catch (Exception e) {
            log.error("更新失败，原因:" + e.getMessage());
            return Response.fail("更新失败，原因:" + e.getMessage());
        }
    }

    @Transactional
    public Response deleteUserById(long userId) {
        try {
            int result = userInfoMapper.deleteUserById(userId);

            if (result > 0) {
                return Response.success(null);
            } else {
                return Response.fail("用户不存在");
            }
        } catch (Exception e) {
            log.error("删除用户失败，原因: " + e.getMessage());
            return Response.fail("删除用户失败，原因: " + e.getMessage());
        }
    }

    public Response selectRealNameByUserId(long userId) {
        try {
            String result = userInfoMapper.selectRealNameByUserId(userId);
            if (result != null) {
                return Response.success(result);
            } else {
                return Response.fail("用户不存在");
            }
        } catch (Exception e) {
            log.error("删除用户失败，原因: " + e.getMessage());
            return Response.fail("删除用户失败，原因: " + e.getMessage());
        }
    }

}
