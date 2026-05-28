package com.nwpu.healthsystem.backend.service;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import com.nwpu.healthsystem.backend.common.dto.InvitionCodeDto;
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
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

@Slf4j
@Service
public class DoctorService {
    private final UserInfoMapper userInfoMapper;
    private final NwpuUserInfoMapper nwpuUserInfoMapper;
    private final UserHealthInfoMapper userHealthInfoMapper;
    private final InvitionCodeMapper invitionCodeMapper;

    @Autowired
    public DoctorService(UserInfoMapper userInfoMapper,
                       NwpuUserInfoMapper nwpuUserInfoMapper,
                       UserHealthInfoMapper userHealthInfoMapper,
                       InvitionCodeMapper invitionCodeMapper) {
        this.userInfoMapper = userInfoMapper;
        this.nwpuUserInfoMapper = nwpuUserInfoMapper;
        this.userHealthInfoMapper = userHealthInfoMapper;
        this.invitionCodeMapper = invitionCodeMapper;
    }

    /**
     * 1、医生注册 间接调用 这个方法
     *  ！！！注意：这一段代码 另一个文件里面也有 UserService
     * @param userAllInfoDto
     * @return
     */
    public Response register(UserAllInfoDto userAllInfoDto, HttpServletResponse response) {
        try {
            // 先对明文密码进行加密
            userAllInfoDto.setPassword(SecureUtil.md5(userAllInfoDto.getPassword()));
//  插入用户信息：
//  注意：由于要把数据分别插入三张表，为了保证操作原子性（中间部分操作有可能失败），注意回滚（没在数据库层面通过 事务/存储过程 的方式实现）
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

//            2、插入表nwpu_user_info
            // 暂时不考虑注册的时候 初始化 nwpu用户信息
//            BeanUtil.copyProperties(userAllInfoDto, nwpuUserInfo);
//            int i = nwpuUserInfoMapper.insertNwpuUserInfo(nwpuUserInfo);

//            3、插入表user_health_info，这里捕获异常进行回滚，然后抛出到上一层集体处理返回错误信息
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
            String message = e.getCause().getMessage();
//            1、单独处理user——info操作失败： 只要返回错误信息即可
            if(message.contains("u_phone")) {
                return Response.fail("注册失败：手机号已被使用");
            } else if(message.contains("u_user_name")) {
                return Response.fail("注册失败：用户名已被使用");
            } else if(message.contains("u_identity_number")) {
                return Response.fail("注册失败：身份证号已被使用");
            }
//            3、单独处理user——health——info操作失败：需要回滚 之前插入的userinfo, 在前面处理了
            if(message.contains("fk_doctor_id")) {
                return Response.fail("注册失败，必须通过扫描二维码注册");
            }

            // 其他所有情况：提示信息为数据库返回的错误信息
            log.error("注册失败，原因:" + e.getMessage());
            return Response.fail("注册失败，原因:" + message);
        }
    }

    /***************************************
     * *************************************
     * *************************************
     * 以下是医生端数据接口
     * *************************************
     * *************************************
     * *************************************
     */

    /**
     * 2、医生获得所属患者列表
     *@param
     *@return
     */

    public Response getUsersInfoOfDoctor(int currentPage, int pageSize,
                                         String userName, String realName, String sex, String phone) {
        try{
            // 步骤1：首先确定医生身份
            long doctorId = AccountCheckUtil.getUserIdFromToken();
            long groupId = this.invitionCodeMapper.getGroupIdByUserId(doctorId);
            doctorId = groupId;

            // 步骤2：业务逻辑
            PageInfo pageInfo = new PageInfo(currentPage, pageSize);
            List<UserAllInfoDto> usersInfoOfDoctorByPage = userInfoMapper.getUsersInfoOfDoctorByPage(doctorId, pageInfo,
                    userName, realName, sex, phone);

            // 必须返回0，返回200 前端LayUi解析错误
            return Response.success(0, "操作成功",
                    MapUtil.builder()
                            .put("pageInfo", pageInfo)
                            .put("data", usersInfoOfDoctorByPage)
                            .map());
        } catch (Exception e) {
            log.error("查询失败，原因:" + e.getMessage());
            return Response.fail("查询失败，原因:" + e.getMessage());
        }
    }


    /**
     * 3、医生修改用户个人信息
     *
     * @param userAllInfoDto
     * @return
     */
    public Response updateUserAllInfoByDoctor(UserAllInfoDto userAllInfoDto) {
        try {
            long userId = userAllInfoDto.getUserId();

            // 医生修改用户信息：
            // 检查用户，是否医生的患者
            UserHealthInfo old_userHealthInfo = userHealthInfoMapper.getUserHealthInfoByUserId(userId);
            // 确定医生身份
            long doctorId = AccountCheckUtil.getUserIdFromToken();
            long groupId = this.invitionCodeMapper.getGroupIdByUserId(doctorId);
            doctorId = groupId;

            // 判断医生权限，数据库中的医生信息和token中的信息是否相同
            Assert.isTrue(old_userHealthInfo.getDoctorId()==doctorId, "该用户不属于您的患者，不能修改信息");

            // 验证通过，解析前端传输的信息到 实体
            UserInfo new_userInfo = new UserInfo();
            NwpuUserInfo new_nwpuUserInfo = new NwpuUserInfo();
            UserHealthInfo new_userHealthInfo = new UserHealthInfo();

            BeanUtil.copyProperties(userAllInfoDto, new_userInfo);
            BeanUtil.copyProperties(userAllInfoDto, new_nwpuUserInfo);
            BeanUtil.copyProperties(userAllInfoDto, new_userHealthInfo);

            // old info ，用于回滚
            UserInfo old_userInfo = userInfoMapper.getUserInfoById(userId);
//            UserHealthInfo old_userHealthInfo = userHealthInfoMapper.getUserHealthInfoByUserId(userId);

            // 执行更新信息
            // 1、UserInfo
            try{
                int userResult = userInfoMapper.updateUser(new_userInfo);
            } catch (Exception e) {     // 第一张表无需回滚
                throw e;
            }

            // 2、UserHealthInfo
            try {
                // 这里用另一个接口
                int i = userHealthInfoMapper.updateUserHealthInfoByDoctor(new_userHealthInfo);
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
                int i = userHealthInfoMapper.updateUserHealthInfoByDoctor(old_userHealthInfo);
                throw e;
            }

            // 更新时间戳、nwpu用户信息，因为有时要清空，可优化，更精细查询
            if(0 == new_userInfo.getNwpu() && 1 == old_userInfo.getNwpu()) {
                userAllInfoDto.setNwpuId("");
                userAllInfoDto.setCollege("");
                userAllInfoDto.setGrade(0);
                userAllInfoDto.setType("");
            }
            //优化：不查库了，反正更新成功了
//            BeanUtil.copyProperties(userInfoMapper.getUserInfoById(userId), userAllInfoDto);
            userAllInfoDto.setModTimestampMils(new Timestamp(System.currentTimeMillis()));
            userAllInfoDto.setPassword("");
            return Response.success(userAllInfoDto);
        } catch (IllegalArgumentException e){
            // Assert 异常
            throw e;            // 全局处理
        } catch (Exception e) {
            // 统一 控制返回信息
            String message = e.getCause().getMessage();

            if(message.contains("u_identity_number")) {
                // 身份证号码已被占用
                return Response.fail("修改失败：身份证号码已被使用");
            } else if(message.contains("u_nwpu_id")) {
                return Response.fail("修改失败：nwpu_ID已被使用");
            } else if(message.contains("column 'type'")) {
                return Response.fail("修改失败：还请选择一种nwpu用户类型");
            }

            log.error("修改失败，原因:" + e.getMessage());
            return Response.fail("修改失败，原因:" + message);
        }
    }


    /**
     * 4、医生：添加一个用户
     *
     * @param userAllInfoDto
     * @return
     */
    public Response registerUserByDoctor(UserAllInfoDto userAllInfoDto) {
        try {
//            处理原始信息：
            // 先对明文密码进行加密
            userAllInfoDto.setPassword(SecureUtil.md5(userAllInfoDto.getPassword()));
            // 确认DoctorId
            long doctorId = AccountCheckUtil.getUserIdFromToken();
            long groupId = this.invitionCodeMapper.getGroupIdByUserId(doctorId);
            doctorId = groupId;

            userAllInfoDto.setDoctorId(doctorId);

//  插入用户信息：
//  注意：由于要把数据分别插入三张表，为了保证操作原子性（中间部分操作有可能失败），注意回滚（没在数据库层面通过 事务/存储过程 的方式实现）
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

//            2、插入表nwpu_user_info
            // 暂时不考虑注册的时候 初始化 nwpu用户信息
//            BeanUtil.copyProperties(userAllInfoDto, nwpuUserInfo);
//            int i = nwpuUserInfoMapper.insertNwpuUserInfo(nwpuUserInfo);

//            3、插入表user_health_info，这里捕获异常进行回滚，然后抛出到上一层集体处理返回错误信息
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

            return Response.success("");
        } catch (Exception e) {
            String message = e.getCause().getMessage();
//            1、单独处理user——info操作失败： 只要返回错误信息即可
            if(message.contains("u_phone")) {
                return Response.fail("注册失败：手机号已被使用");
            } else if(message.contains("u_user_name")) {
                return Response.fail("注册失败：用户名已被使用");
            } else if(message.contains("u_identity_number")) {
                // 身份证号码已被占用
                return Response.fail("修改失败：身份证号码已被使用");
            }
//            2、单独处理nwpu——user——info操作失败：需要撤销 之前插入的userinfo
//            if(message.contains("u_nwpu_id")) {
//                return Response.fail("注册失败：学号已被使用");
//            }
//            3、单独处理user——health——info操作失败：需要回滚 之前插入的userinfo, 在前面处理了
            if(message.contains("fk_doctor_id")) {
                return Response.fail("注册失败，必须通过扫描二维码注册");
            }

            log.error("注册失败，原因:" + e.getMessage());
            return Response.fail("注册失败，原因:" + e.getMessage());
        }
    }


    /**
     * 5、修改标注信息
     *@param
     *@return
     */
    public Response updateDepressedInfo(List<Long> userIdList, String depressed, String remark){
        try {
            long doctorId = AccountCheckUtil.getUserIdFromToken();
            long groupId = this.invitionCodeMapper.getGroupIdByUserId(doctorId);
            doctorId = groupId;

            for(long userId: userIdList){
                // 判断该用户是否医生患者
                long doctorIdofUser = userHealthInfoMapper.getDoctorIdofUser(userId);
                Assert.isTrue(doctorIdofUser==doctorId, "该用户不属于您的患者，不能修改信息");
                // 验证通过
                userHealthInfoMapper.updateDepressedInfoByDoctor(userId, depressed, remark);
            }
            return Response.success(null);
        } catch (IllegalArgumentException e){
            throw e;            // Assert 异常全局处理
        } catch (Exception e) {
            log.error("修改失败，原因:" + e.getMessage());
            return Response.fail("修改失败，原因:" + e.getMessage());
        }
    }

    /**
     * 6、医生注册(邀请码管理注册)
     * -- 1）开放注册：挂到1即可
     * -- 2）邀请码注册：首先校验邀请码，通过则注册新用户，然后生成新医生的邀请码
     *@param
     *@return
     */

    // 是否开放医生注册 写在配置文件中
    @Value("${register.open}")
    private Boolean openRegister;

    public Response registerForDoctor(RegisterDoctorDto registerDoctorDto, HttpServletResponse response) {
        try {
            // 对于医生：小组id=医生id； 对于小组id = 邀请人的id
            long groupId;
            // 邀请人id
            long inviter;
            // 前端传输是否助理
            Boolean isAssistant = registerDoctorDto.getIsAssistant();

            if(isAssistant) {
                /****
                 * 医生助理注册
                 */

                // 步骤1: 查询助理邀请码是否正确，否则抛出异常
                groupId = invitionCodeMapper.getInviterByAssistantCode(registerDoctorDto.getInvitionCode());

                // 步骤2： 正式注册用户， 注册医生时，仍然有一部分代码和普通用户相同
                UserAllInfoDto userAllInfoDto = new UserAllInfoDto();
                BeanUtil.copyProperties(registerDoctorDto, userAllInfoDto);

                Response register = register(userAllInfoDto, response);
                // 注册失败，返回 json 数据
                if(register.getCode() != 200) {
                    return register;
                }

                // 由于 注册用的代码是普通用户注册的代码，所以需要修改以下角色和权限
                UserAllInfoDto result = (UserAllInfoDto) register.getResult();
                long userId = result.getUserId();
                this.userInfoMapper.updateRoleAndPermission4Doctor(userId);

                // 步骤3： 生成邀请码  医生注册时 inviter = groupId
                inviter = groupId;
                if(generateInvitionCode(isAssistant, userId, inviter, groupId)){
                    return register;
                } else {
                    // 不允许到这一步，也不会到这里
                    return Response.fail("生成邀请码失败");
                }
            } else {
                /****
                 * 医生注册
                 */

                // 步骤1： 验证邀请码
                if(!openRegister) {
                    // 1.1）封闭注册，验证邀请码是否正常，否则抛出异常
                    inviter = this.invitionCodeMapper.getInviterByInvitionCode(registerDoctorDto.getInvitionCode());
                } else {
                    // 1.2）开放注册：邀请人挂到1即可
                    inviter = 1;
                }

                // 步骤2： 正式注册用户， 注册医生时，仍然有一部分代码和普通用户相同
                UserAllInfoDto userAllInfoDto = new UserAllInfoDto();
                BeanUtil.copyProperties(registerDoctorDto, userAllInfoDto);

                Response register = register(userAllInfoDto, response);
                // 注册失败，返回 json 数据
                if(register.getCode() != 200) {
                    return register;
                }

                // 由于 注册用的代码是普通用户注册的代码，所以需要修改以下角色和权限
                UserAllInfoDto result = (UserAllInfoDto) register.getResult();
                long userId = result.getUserId();
                this.userInfoMapper.updateRoleAndPermission4Doctor(userId);

                // 步骤3： 生成邀请码  医生注册时 groupId = userId
                groupId = userId;
                if(generateInvitionCode(isAssistant, userId ,inviter, groupId)) {
                    return register;
                } else {
                    // 不允许到这一步，也不会到这里
                    return Response.fail("生成邀请码失败");
                }
            }
        } catch (IllegalArgumentException e){
            throw e;            // Assert 异常全局处理
        } catch (Exception e) {
            log.error("修改失败，原因:" + e.getMessage());

            String message = e.getMessage();
            if(message.indexOf("return null") != -1){
                return Response.fail("邀请码错误");
            }

            return Response.fail("修改失败，原因:" + e.getMessage());
        }
    }


    /**
     * 注册成功后，生成邀请码
     *@param
     *@return
     */
    private Boolean generateInvitionCode(Boolean isAssistant, long userId, long inviter, long groupId) {
        String code1 = getRandomString(4);
        String code2 = getRandomString(4);

        String s_userId = Long.valueOf(userId).toString();
        // 用户id+随机字符串 保证唯一和一定的安全
        code1 = s_userId + code1;
        code2 = s_userId + code2;

        InvitionCode invitionCode;

        if(isAssistant) {
            // 助手不需要 邀请码和助理邀请码
            invitionCode = new InvitionCode(userId, null, inviter, null, groupId);
        } else {
            invitionCode = new InvitionCode(userId, code1, inviter, code2, groupId);
        }

        this.invitionCodeMapper.insertInvitionCode(invitionCode);
        return true;
    }

    //length用户要求产生字符串的长度
    public static String getRandomString(int length){
//        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        String str="abcdefghijklmnopqrstuvwxyz0123456789";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(36);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }


    /**
     * 7、医生获得自己的邀请码
     *@param
     *@return
     */
    public Response getInvitionCode4Doctor() {
        // 从token中获得登录用户的id
        long doctorId = AccountCheckUtil.getUserIdFromToken();

        long groupId = invitionCodeMapper.getGroupIdByUserId(doctorId);
        if(groupId == doctorId) {
            InvitionCodeDto invitionCodeById = this.invitionCodeMapper.getInvitionCodeById(doctorId);
            return Response.success(invitionCodeById);
        } else {
            return Response.success(new InvitionCodeDto("您无法邀请他人", "您无法邀请他人"));
        }
    }

}
