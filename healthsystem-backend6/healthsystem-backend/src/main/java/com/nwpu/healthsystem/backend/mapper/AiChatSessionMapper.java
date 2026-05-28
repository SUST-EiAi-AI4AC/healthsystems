package com.nwpu.healthsystem.backend.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * AI聊天会话Mapper
 */
@Mapper
public interface AiChatSessionMapper {
    
    /**
     * 获取AI聊天会话列表（带用户信息和消息统计）
     */
    @Select("SELECT s.id, s.user_id, s.title, s.created_at, s.updated_at, " +
            "u.real_name, u.user_name, u.phone, " +
            "(SELECT COUNT(*) FROM ai_chat_message WHERE session_id = s.id) as message_count " +
            "FROM ai_chat_session s " +
            "LEFT JOIN user_info u ON s.user_id = u.user_id " +
            "ORDER BY s.updated_at DESC " +
            "LIMIT #{offset}, #{limit}")
    List<Map<String, Object>> getSessionListWithUserInfo(@Param("offset") int offset, @Param("limit") int limit);
    
    /**
     * 获取总数
     */
    @Select("SELECT COUNT(*) FROM ai_chat_session")
    int getTotalCount();
    
    /**
     * 根据用户名或真实姓名搜索
     */
    @Select("SELECT s.id, s.user_id, s.title, s.created_at, s.updated_at, " +
            "u.real_name, u.user_name, u.phone, " +
            "(SELECT COUNT(*) FROM ai_chat_message WHERE session_id = s.id) as message_count " +
            "FROM ai_chat_session s " +
            "LEFT JOIN user_info u ON s.user_id = u.user_id " +
            "WHERE u.user_name LIKE CONCAT('%', #{keyword}, '%') " +
            "OR u.real_name LIKE CONCAT('%', #{keyword}, '%') " +
            "ORDER BY s.updated_at DESC " +
            "LIMIT #{offset}, #{limit}")
    List<Map<String, Object>> searchSessions(@Param("keyword") String keyword, 
                                              @Param("offset") int offset, 
                                              @Param("limit") int limit);
    
    /**
     * 搜索总数
     */
    @Select("SELECT COUNT(*) FROM ai_chat_session s " +
            "LEFT JOIN user_info u ON s.user_id = u.user_id " +
            "WHERE u.user_name LIKE CONCAT('%', #{keyword}, '%') " +
            "OR u.real_name LIKE CONCAT('%', #{keyword}, '%')")
    int getSearchCount(@Param("keyword") String keyword);

    /**
     * 根据ID删除会话
     */
    @org.apache.ibatis.annotations.Delete("DELETE FROM ai_chat_session WHERE id = #{id}")
    int deleteSession(@Param("id") Long id);
}
