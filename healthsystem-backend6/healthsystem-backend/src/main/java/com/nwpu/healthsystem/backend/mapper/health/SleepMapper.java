package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.Sleep;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface SleepMapper {

    @Select("SELECT * FROM sleep WHERE email = #{email} ORDER BY calendarDate DESC LIMIT 1")
    Sleep findLatestSleepByUser(String email);
    @Select("SELECT * FROM sleep WHERE email = #{email} " +
            "ORDER BY calendarDate DESC LIMIT #{period}")
    List<Sleep> findRecentSleepByUser(@Param("email") String email, @Param("period") int period);

    @Select("SELECT * FROM sleep WHERE email = #{email}" +
            "order by calendarDate DESC")
    List<Sleep> getSleepHistorybyEmail(@Param("email") String email);
}

