package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.SpO2;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpO2Mapper {

    @Select("SELECT * FROM spo2 WHERE email = #{email} " +
            "AND ((averageSpO2 IS NOT NULL AND averageSpO2 != '' AND averageSpO2 != 'null') " +
            "  OR (lowestSpO2 IS NOT NULL AND lowestSpO2 != '' AND lowestSpO2 != 'null')) " +
            "ORDER BY calendarDate DESC LIMIT 1")
    SpO2 findLatestSpO2ByUser(String email);

    @Select("SELECT averageSpo2, lowestSpo2, averageSpo2HRSleep, calendarDate FROM activity WHERE email = #{email} " +
            "AND ((averageSpo2 IS NOT NULL AND averageSpo2 != '' AND averageSpo2 != 'null') " +
            "  OR (lowestSpo2 IS NOT NULL AND lowestSpo2 != '' AND lowestSpo2 != 'null')) " +
            "ORDER BY calendarDate DESC LIMIT 1")
    java.util.Map<String, Object> findLatestActivitySpO2(String email);

    @Select("SELECT * FROM spo2 WHERE email = #{email} ORDER BY calendarDate DESC LIMIT #{period}")
    List<SpO2> findRecentSpO2ByUser(@Param("email") String email, @Param("period") int period);

    @Select("SELECT * FROM spo2 WHERE email = #{email}" +
            "order by calendarDate DESC")
    List<SpO2> getSpO2HistorybyEmail(@Param("email") String email);
}
