package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.SpO2;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpO2Mapper {

    @Select("SELECT * FROM spo2 WHERE email = #{email} ORDER BY calendarDate DESC LIMIT 1")
    SpO2 findLatestSpO2ByUser(String email);

    @Select("SELECT * FROM spo2 WHERE email = #{email} ORDER BY calendarDate DESC LIMIT #{period}")
    List<SpO2> findRecentSpO2ByUser(@Param("email") String email, @Param("period") int period);

    @Select("SELECT * FROM spo2 WHERE email = #{email}" +
            "order by calendarDate DESC")
    List<SpO2> getSpO2HistorybyEmail(@Param("email") String email);
}
