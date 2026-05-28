package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.AiChatMessage;
import com.nwpu.healthsystem.backend.entity.scale.AiChatSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AiChatMapper {

    // ==================== Session ====================

    /**
     * 新建一条聊天会话
     *
     * @param session 会话实体（userId、title 由 Service 层设置）
     * @return 影响行数，id 会被回填至 session.id
     */
    int insertSession(AiChatSession session);

    /**
     * 更新会话标题和 updated_at
     *
     * @param id    会话ID
     * @param title 新标题
     * @return 影响行数
     */
    int updateSessionTitle(@Param("id") long id, @Param("title") String title);

    /**
     * 更新会话的 updated_at 为当前时间
     *
     * @param id 会话ID
     * @return 影响行数
     */
    int touchSession(@Param("id") long id);

    /**
     * 查询指定用户的所有会话，按 updated_at 降序
     *
     * @param userId 用户ID
     * @return 会话列表
     */
    List<AiChatSession> listSessionsByUser(@Param("userId") long userId);

    /**
     * 根据ID查询单条会话
     *
     * @param id 会话ID
     * @return 会话实体，不存在返回 null
     */
    AiChatSession getSessionById(@Param("id") long id);

    /**
     * 删除指定会话（级联删除消息由数据库外键 CASCADE 完成）
     *
     * @param id 会话ID
     * @return 影响行数
     */
    int deleteSession(@Param("id") long id);

    // ==================== Message ====================

    /**
     * 批量插入消息
     *
     * @param messages 消息列表（sessionId、userId 由 Service 层设置）
     * @return 影响行数
     */
    int batchInsertMessages(@Param("list") List<AiChatMessage> messages);

    /**
     * 查询某会话的全部消息，按 created_at 升序
     *
     * @param sessionId 会话ID
     * @return 消息列表
     */
    List<AiChatMessage> listMessagesBySession(@Param("sessionId") long sessionId);

    /**
     * 删除某会话的全部消息
     *
     * @param sessionId 会话ID
     * @return 影响行数
     */
    int deleteMessagesBySession(@Param("sessionId") long sessionId);
}
