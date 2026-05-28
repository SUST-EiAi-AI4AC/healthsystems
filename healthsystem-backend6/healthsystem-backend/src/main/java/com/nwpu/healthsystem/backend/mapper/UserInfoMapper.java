package com.nwpu.healthsystem.backend.mapper;


import com.nwpu.healthsystem.backend.common.dto.UserAllInfoDto;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.util.List;

@Repository
@Mapper
public interface UserInfoMapper
{
    // 新增（email加到user_info中）根据用户邮箱获取用户信息
    @Select("SELECT email FROM user_info WHERE user_name = #{userName}")
    String getEmailByUserName(String userName);

    @Select("SELECT * FROM user_info WHERE user_name = #{userName}")
    UserInfo findByUserName(String userName);

    /***
     * 根据用户名获取用户信息
     * @param userName
     * @return
     */
    UserInfo getUserInfoByName(String userName);

    /***
     * 根据用户手机号获取用户信息
     * @param phone
     * @return
     */
    UserInfo getUserInfoByPhone(String phone);

    /* *
     * 根据用户id获取用户信息
     *
     * */
    UserInfo getUserInfoById(long userId);

    /***
     * 根据用户名获取用户id
     * 因为有可能查不到用户， 所以可能返回空， 不能用long来保存
     * @param userName
     * @return
     */
    String getUserIdByName(String userName);

    /**
     * 获得用户角色默认的权限
     */
    String getRolePermission(long userId);

    /***
     * 注册
     * @param userinfo
     * @return
     */
    int insertUser(UserInfo userinfo);

    /***
     * 修改用户信息，不包括手机号、用户名，密码、角色、权限、
     * @param userInfo
     * @return
     */
    int updateUser(UserInfo userInfo);

    /**
     * 删除用户信息，用于回滚操作
     *@param userId
     *@return
     */
    int deleteUserById(long userId);

    String getPassword(long userId);

    int updatePassword(String password, long userId);

    int updateAvatar(String avatar, long userId);

    ////////////////////////// 以下是后台管理接口

    /**
     * 医生端接口：返回某个医生所有用户数据
     *@param doctorId
     *@return
     */
    List<UserAllInfoDto> getUsersInfoOfDoctorByPage(@Param("doctorId")long doctorId, PageInfo pageInfo,
                                                    String userName, String realName, String sex, String phone);

    // 更新医生的角色和权限
    int updateRoleAndPermission4Doctor(long userId);

    List<UserInfo> getUsersByRole(String role);

    int setPushConnected(long userIdFromToken);

    String selectRealNameByUserId(long userId);
}
