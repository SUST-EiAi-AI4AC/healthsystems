package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

import java.sql.Date;

@Repository
public interface HeartrateMapper {
    // 这两行是实时的反应手环更新时间和数据
    @Select("SELECT * FROM heart_rate WHERE email = #{email} AND calendarDate = #{sqlDate} order by calendarDate desc")
    Heartrate findByUserAndDate(String email, Date sqlDate);
    // 查询数据库表最后一天的心率数据（过滤空行）
    @Select("SELECT * FROM heart_rate WHERE email = #{email} " +
            "AND ((maxHeartRate IS NOT NULL AND maxHeartRate != '' AND maxHeartRate != 'null') " +
            "  OR (restingHeartRate IS NOT NULL AND restingHeartRate != '' AND restingHeartRate != 'null')) " +
            "ORDER BY calendarDate DESC LIMIT 1")
    Heartrate findLatestHeartrateByUser(String email);

    @Select("SELECT maxHeartRate, minHeartRate, restingHeartRate, calendarDate FROM activity WHERE email = #{email} " +
            "AND ((maxHeartRate IS NOT NULL AND maxHeartRate != '' AND maxHeartRate != 'null') " +
            "  OR (restingHeartRate IS NOT NULL AND restingHeartRate != '' AND restingHeartRate != 'null')) " +
            "ORDER BY calendarDate DESC LIMIT 1")
    java.util.Map<String, Object> findLatestActivityHeartrate(String email);

    // 查询某个用户的最后一条心率数据的日期
    @Select("SELECT MAX(calendarDate) FROM heart_rate WHERE email = #{email}")
    Date findLatestDate(@Param("email") String email);

    // 根据用户标识和日期范围查询心率数据
    @Select("SELECT * FROM heart_rate WHERE email = #{email} " +
            "AND DATE(calendarDate) BETWEEN #{startTimestampLocal} AND #{endTimestampLocal} " +
            "ORDER BY calendarDate ASC")
    List<Heartrate> findByUserAndDateRange(String email, Date startTimestampLocal, Date endTimestampLocal );

    @Select("SELECT * FROM heart_rate WHERE email = #{email}" +
            "order by calendarDate DESC")
    List<Heartrate> getHeartrateHistorybyEmail(@Param("email") String email);

}

