package com.nwpu.healthsystem.backend.mapper;

import com.nwpu.healthsystem.backend.common.dto.InvitionCodeDto;
import com.nwpu.healthsystem.backend.entity.InvitionCode;
import org.springframework.stereotype.Repository;


@Repository
public interface InvitionCodeMapper {
    // 根据邀请码获得邀请人信息
    long getInviterByInvitionCode(String invitionCode);

    // 根据助理邀请码获取邀请人id
    long getInviterByAssistantCode(String assistantCode);

    // 用户通过验证 ，生成用户邀请码，用户归属小组信息
    int insertInvitionCode(InvitionCode invitionCode);

    // 根据用户id 获得邀请码
    InvitionCodeDto getInvitionCodeById(long userId);

    //根据用户id 查询用户归属于哪个小组
    long getGroupIdByUserId(long userId);

    //根据用户id 查询用户归属于哪个小组（无记录时返回 null，用于管理员等没有邀请码的账号）
    Long getGroupIdByUserIdOrNull(long userId);
}
