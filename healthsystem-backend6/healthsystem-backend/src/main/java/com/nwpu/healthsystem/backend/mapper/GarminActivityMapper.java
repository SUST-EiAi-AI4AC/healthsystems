package com.nwpu.healthsystem.backend.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface GarminActivityMapper {

    /**
     * 分页多条件查询 activity 记录并关联 user_info 获取真实姓名
     */
    @Select("<script>" +
            "SELECT a.*, COALESCE(u.real_name, u.user_name, '未知用户') AS realName, u.user_name AS userName " +
            "FROM activity a " +
            "LEFT JOIN user_info u ON a.email = u.email " +
            "WHERE 1=1 " +
            "<if test='username != null and username != \"\"'>" +
            "  AND (u.user_name LIKE CONSTRUCT('%', #{username}, '%') OR u.real_name LIKE CONSTRUCT('%', #{username}, '%') OR a.email LIKE CONSTRUCT('%', #{username}, '%')) " +
            "</if>" +
            "<if test='startDate != null and startDate != \"\"'>" +
            "  AND DATE(a.calendarDate) &gt;= #{startDate} " +
            "</if>" +
            "<if test='endDate != null and endDate != \"\"'>" +
            "  AND DATE(a.calendarDate) &lt;= #{endDate} " +
            "</if>" +
            "ORDER BY a.calendarDate DESC " +
            "LIMIT #{offset}, #{limit}" +
            "</script>")
    List<Map<String, Object>> selectActivityList(
            @Param("offset") int offset,
            @Param("limit") int limit,
            @Param("username") String username,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate
    );

    /**
     * 查询符合条件的记录总数
     */
    @Select("<script>" +
            "SELECT COUNT(*) " +
            "FROM activity a " +
            "LEFT JOIN user_info u ON a.email = u.email " +
            "WHERE 1=1 " +
            "<if test='username != null and username != \"\"'>" +
            "  AND (u.user_name LIKE CONSTRUCT('%', #{username}, '%') OR u.real_name LIKE CONSTRUCT('%', #{username}, '%') OR a.email LIKE CONSTRUCT('%', #{username}, '%')) " +
            "</if>" +
            "<if test='startDate != null and startDate != \"\"'>" +
            "  AND DATE(a.calendarDate) &gt;= #{startDate} " +
            "</if>" +
            "<if test='endDate != null and endDate != \"\"'>" +
            "  AND DATE(a.calendarDate) &lt;= #{endDate} " +
            "</if>" +
            "</script>")
    int countActivityList(
            @Param("username") String username,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate
    );

    /**
     * 根据 ID 查询单条记录
     */
    @Select("SELECT a.*, COALESCE(u.real_name, u.user_name, '未知用户') AS realName, u.user_name AS userName " +
            "FROM activity a " +
            "LEFT JOIN user_info u ON a.email = u.email " +
            "WHERE a.id = #{id}")
    Map<String, Object> selectActivityById(@Param("id") Long id);

    /**
     * 查询指定 email 近 N 天的历史记录（按日期升序排序）
     */
    @Select("SELECT a.* " +
            "FROM activity a " +
            "WHERE a.email = #{email} " +
            "ORDER BY a.calendarDate DESC " +
            "LIMIT #{limit}")
    List<Map<String, Object>> selectUserRecentActivity(@Param("email") String email, @Param("limit") int limit);

    /**
     * 全局宏观统计指标
     */
    @Select("SELECT " +
            "  COUNT(*) AS totalRecords, " +
            "  COUNT(DISTINCT email) AS totalUsers, " +
            "  AVG(CAST(restingHeartRate AS DECIMAL(10,2))) AS avgRestingHR, " +
            "  AVG(CAST(sleepingSeconds AS DECIMAL(10,2)) / 3600.0) AS avgSleepHours, " +
            "  AVG(totalSteps) AS avgSteps, " +
            "  AVG(CAST(averageStressLevel AS DECIMAL(10,2))) AS avgStress, " +
            "  AVG(bodyBatteryChargedValue) AS avgBodyBatteryCharge " +
            "FROM activity")
    Map<String, Object> selectGlobalStatistics();

    /**
     * 删除记录
     */
    @Delete("DELETE FROM activity WHERE id = #{id}")
    int deleteActivityById(@Param("id") Long id);
}
