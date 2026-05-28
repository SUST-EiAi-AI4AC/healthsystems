package com.nwpu.healthsystem.backend.mapper;

import com.nwpu.healthsystem.backend.entity.UserHealthInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface UserHealthInfoMapper {
    /**
     * 根据用户id 获取用户健康信息
     *@param userId
     *@return
     */
    UserHealthInfo getUserHealthInfoByUserId(long userId);

    /**
     * 插入用户健康信息，    无法插入 用户的标注信息，这一部分信息只提供给 医生记录
     *@param userHealthInfo
     *@return
     */
    int insertUserHealthInfo(UserHealthInfo userHealthInfo);

    /**
     * 修改用户健康信息     无法更新 医生id（注册时初始化）和  用户的标注信息，这一部分信息只提供给 医生记录
     *@param userHealthInfo
     *@return
     */
    int updateUserHealthInfo(UserHealthInfo userHealthInfo);

//    待扩展 医生 更新用户标注信息、
    long getDoctorIdofUser(long userId);

    /**
     * 修改用户健康信息 （专门添加 用户的标注信息）    无法更新 医生id（注册时初始化）
     *@param userHealthInfo
     *@return
     */
    int updateUserHealthInfoByDoctor(UserHealthInfo userHealthInfo);

    /**
     * 修改 抑郁标注
     *@param
     *@return
     */
    int updateDepressedInfoByDoctor(long userId, String depressed, String remark);

    /**
     * 获取健康报告列表（带用户信息）
     */
    @Select("SELECT h.id, h.user_id, h.sex, h.birth_date, h.height, h.weight, " +
            "h.depressed, h.remark, h.add_timestamp_mils, h.mod_timestamp_mils, " +
            "u.real_name, u.user_name, u.phone " +
            "FROM user_health_info h " +
            "LEFT JOIN user_info u ON h.user_id = u.user_id " +
            "ORDER BY h.mod_timestamp_mils DESC " +
            "LIMIT #{offset}, #{limit}")
    List<Map<String, Object>> getHealthReportList(@Param("offset") int offset, @Param("limit") int limit);
    
    /**
     * 获取总数
     */
    @Select("SELECT COUNT(*) FROM user_health_info")
    int getTotalCount();
    
    /**
     * 根据用户名或真实姓名搜索
     */
    @Select("SELECT h.id, h.user_id, h.sex, h.birth_date, h.height, h.weight, " +
            "h.depressed, h.remark, h.add_timestamp_mils, h.mod_timestamp_mils, " +
            "u.real_name, u.user_name, u.phone " +
            "FROM user_health_info h " +
            "LEFT JOIN user_info u ON h.user_id = u.user_id " +
            "WHERE u.user_name LIKE CONCAT('%', #{keyword}, '%') " +
            "OR u.real_name LIKE CONCAT('%', #{keyword}, '%') " +
            "ORDER BY h.mod_timestamp_mils DESC " +
            "LIMIT #{offset}, #{limit}")
    List<Map<String, Object>> searchHealthReports(@Param("keyword") String keyword, 
                                                   @Param("offset") int offset, 
                                                   @Param("limit") int limit);
    
    /**
     * 搜索总数
     */
    @Select("SELECT COUNT(*) FROM user_health_info h " +
            "LEFT JOIN user_info u ON h.user_id = u.user_id " +
            "WHERE u.user_name LIKE CONCAT('%', #{keyword}, '%') " +
            "OR u.real_name LIKE CONCAT('%', #{keyword}, '%')")
    int getSearchCount(@Param("keyword") String keyword);
    
    /**
     * 获取抑郁风险等级统计
     * 根据depressed字段进行分类：正常、轻度、中度、重度、高危
     */
    @Select("SELECT " +
            "COUNT(*) as total_count, " +
            "SUM(CASE WHEN depressed = '正常' OR depressed = '待标注' OR depressed = '' THEN 1 ELSE 0 END) as normal, " +
            "SUM(CASE WHEN depressed = '轻度' THEN 1 ELSE 0 END) as low_risk, " +
            "SUM(CASE WHEN depressed = '中度' THEN 1 ELSE 0 END) as medium_risk, " +
            "SUM(CASE WHEN depressed = '重度' OR depressed = '高危' THEN 1 ELSE 0 END) as high_risk " +
            "FROM user_health_info")
    Map<String, Object> getDepressionStatistics();
    
    /**
     * 获取用户的综合健康报告详情
     */
    @Select("SELECT h.*, u.real_name, u.user_name, u.phone, u.email, " +
            "(SELECT COUNT(*) FROM heal_diary WHERE user_id = #{userId}) as diary_count, " +
            "(SELECT COUNT(*) FROM ai_chat_session WHERE user_id = #{userId}) as chat_count " +
            "FROM user_health_info h " +
            "LEFT JOIN user_info u ON h.user_id = u.user_id " +
            "WHERE h.user_id = #{userId}")
    Map<String, Object> getUserHealthDetail(@Param("userId") Long userId);

    /**
     * 根据ID删除健康报告记录
     */
    @org.apache.ibatis.annotations.Delete("DELETE FROM user_health_info WHERE id = #{id}")
    int deleteHealthReport(@Param("id") Long id);
}
