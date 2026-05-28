package com.nwpu.healthsystem.backend.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 疗愈日记Mapper
 */
@Mapper
public interface DiaryMapper {
    
    /**
     * 获取日记列表（带用户信息）
     */
    @Select("SELECT d.id, d.user_id, d.content, d.mood_score, d.mood_label, " +
            "d.image_urls, d.is_private, d.add_timestamp_mils, " +
            "u.real_name, u.user_name, u.phone " +
            "FROM heal_diary d " +
            "LEFT JOIN user_info u ON d.user_id = u.user_id " +
            "ORDER BY d.add_timestamp_mils DESC " +
            "LIMIT #{offset}, #{limit}")
    List<Map<String, Object>> getDiaryListWithUserInfo(@Param("offset") int offset, @Param("limit") int limit);
    
    /**
     * 获取总数
     */
    @Select("SELECT COUNT(*) FROM heal_diary")
    int getTotalCount();
    
    /**
     * 根据用户名或真实姓名搜索
     */
    @Select("SELECT d.id, d.user_id, d.content, d.mood_score, d.mood_label, " +
            "d.image_urls, d.is_private, d.add_timestamp_mils, " +
            "u.real_name, u.user_name, u.phone " +
            "FROM heal_diary d " +
            "LEFT JOIN user_info u ON d.user_id = u.user_id " +
            "WHERE u.user_name LIKE CONCAT('%', #{keyword}, '%') " +
            "OR u.real_name LIKE CONCAT('%', #{keyword}, '%') " +
            "ORDER BY d.add_timestamp_mils DESC " +
            "LIMIT #{offset}, #{limit}")
    List<Map<String, Object>> searchDiaries(@Param("keyword") String keyword, 
                                             @Param("offset") int offset, 
                                             @Param("limit") int limit);
    
    /**
     * 搜索总数
     */
    @Select("SELECT COUNT(*) FROM heal_diary d " +
            "LEFT JOIN user_info u ON d.user_id = u.user_id " +
            "WHERE u.user_name LIKE CONCAT('%', #{keyword}, '%') " +
            "OR u.real_name LIKE CONCAT('%', #{keyword}, '%')")
    int getSearchCount(@Param("keyword") String keyword);
    
    /**
     * 获取情绪统计（按风险等级）
     * 根据mood_score进行分类：1-3重度，4-5中度，6-7轻度，8-10正常
     */
    @Select("SELECT " +
            "COUNT(*) as total_count, " +
            "SUM(CASE WHEN mood_score >= 1 AND mood_score <= 2 THEN 1 ELSE 0 END) as normal, " +
            "SUM(CASE WHEN mood_score = 3 THEN 1 ELSE 0 END) as low_risk, " +
            "SUM(CASE WHEN mood_score = 4 THEN 1 ELSE 0 END) as medium_risk, " +
            "SUM(CASE WHEN mood_score = 5 THEN 1 ELSE 0 END) as high_risk " +
            "FROM heal_diary")
    Map<String, Object> getMoodStatistics();

    /**
     * 根据ID删除日记
     */
    @org.apache.ibatis.annotations.Delete("DELETE FROM heal_diary WHERE id = #{id}")
    int deleteDiary(@Param("id") Long id);
}
