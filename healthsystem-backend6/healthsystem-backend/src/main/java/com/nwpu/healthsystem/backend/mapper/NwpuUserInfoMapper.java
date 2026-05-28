package com.nwpu.healthsystem.backend.mapper;

import com.nwpu.healthsystem.backend.entity.NwpuUserInfo;
import org.springframework.stereotype.Repository;


@Repository
public interface NwpuUserInfoMapper {

//    库的设计：记得给外键（userid）加唯一约束 : OK
    /**
     * 查询 nwpu 学生信息 根据用户id
     *@param userId
     *@return
     */
    NwpuUserInfo getNwpuUserInfoByUserId(long userId);

    /**
     * 插入 nwpu 学生信息
     *@param nwpuUserInfo
     *@return
     */
    int insertNwpuUserInfo(NwpuUserInfo nwpuUserInfo);

    /**
     * 更新 nwpu 学生信息
     *@param nwpuUserInfo
     *@return
     */
    int updateNwpuUserInfo(NwpuUserInfo nwpuUserInfo);

    /**
     *
     *@param userId
     *@return
     */
    int deleteNwpuUserInfoById(long userId);
}
