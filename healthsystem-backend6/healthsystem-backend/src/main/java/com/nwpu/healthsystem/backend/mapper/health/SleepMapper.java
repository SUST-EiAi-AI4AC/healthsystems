package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.Sleep;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface SleepMapper {

    @Select("SELECT * FROM sleep WHERE email = #{email} " +
            "AND ((sleep_score_overall IS NOT NULL AND sleep_score_overall != '' AND sleep_score_overall != 'null') " +
            "  OR (sleepTimeSeconds IS NOT NULL AND sleepTimeSeconds != '' AND sleepTimeSeconds != 'null')) " +
            "ORDER BY calendarDate DESC LIMIT 1")
    Sleep findLatestSleepByUser(String email);

    @Select("SELECT sleepingSeconds, measurableAwakeDuration, avgSleepStress, sleep_score_overall, calendarDate FROM activity WHERE email = #{email} " +
            "AND (sleepingSeconds IS NOT NULL AND sleepingSeconds != '' AND sleepingSeconds != 'null') " +
            "ORDER BY calendarDate DESC LIMIT 1")
    java.util.Map<String, Object> findLatestActivitySleep(String email);

    @Select("SELECT * FROM sleep WHERE email = #{email} " +
            "AND ((sleep_score_overall IS NOT NULL AND sleep_score_overall != '' AND sleep_score_overall != 'null') " +
            "  OR (sleepTimeSeconds IS NOT NULL AND sleepTimeSeconds != '' AND sleepTimeSeconds != 'null')) " +
            "ORDER BY calendarDate DESC LIMIT #{period}")
    List<Sleep> findRecentSleepByUser(@Param("email") String email, @Param("period") int period);

    @Select("SELECT * FROM sleep WHERE email = #{email} " +
            "AND ((sleep_score_overall IS NOT NULL AND sleep_score_overall != '' AND sleep_score_overall != 'null') " +
            "  OR (sleepTimeSeconds IS NOT NULL AND sleepTimeSeconds != '' AND sleepTimeSeconds != 'null')) " +
            "order by calendarDate DESC")
    List<Sleep> getSleepHistorybyEmail(@Param("email") String email);
}

