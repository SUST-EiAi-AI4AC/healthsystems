package com.nwpu.healthsystem.backend.mapper;

import com.nwpu.healthsystem.backend.entity.scale.AiChatMessage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * AI聊天消息Mapper
 */
@Mapper
public interface AiChatMessageMapper {
    
    /**
     * 根据会话ID获取消息列表
     */
    @Select("SELECT * FROM ai_chat_message WHERE session_id = #{sessionId} ORDER BY created_at ASC")
    List<AiChatMessage> getMessagesBySessionId(@Param("sessionId") Long sessionId);
    
    /**
     * 获取情感分析统计（按风险等级）
     * 这里简化处理，根据消息内容中的关键词进行分类
     */
    @Select("SELECT " +
            "COUNT(DISTINCT user_id) as total_users, " +
            "SUM(CASE WHEN content LIKE '%抑郁%' OR content LIKE '%难过%' OR content LIKE '%痛苦%' OR content LIKE '%绝望%' THEN 1 ELSE 0 END) as high_risk, " +
            "SUM(CASE WHEN content LIKE '%焦虑%' OR content LIKE '%担心%' OR content LIKE '%紧张%' THEN 1 ELSE 0 END) as medium_risk, " +
            "SUM(CASE WHEN content LIKE '%不开心%' OR content LIKE '%烦躁%' OR content LIKE '%疲惫%' THEN 1 ELSE 0 END) as low_risk " +
            "FROM ai_chat_message WHERE role = 'user'")
    Map<String, Object> getEmotionStatistics();

    /**
     * 根据会话ID删除消息
     */
    @org.apache.ibatis.annotations.Delete("DELETE FROM ai_chat_message WHERE session_id = #{sessionId}")
    int deleteMessagesBySessionId(@Param("sessionId") Long sessionId);
}
