package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.BodyBattery;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BodyBatteryMapper {

    @Select("SELECT * FROM body_battery WHERE email = #{email} ORDER BY date DESC LIMIT 1")
    BodyBattery findLatestBodyBatteryByUser(@Param("email") String email);

    @Select("SELECT * FROM body_battery WHERE email = #{email} " +
            "ORDER BY date DESC LIMIT #{period}")
    List<BodyBattery> findRecentBodyBatteryByUser(@Param("email") String email, @Param("period") int period);

    @Select("SELECT * FROM body_battery WHERE email = #{email}" +
            "order by date DESC")
    List<BodyBattery> getBodyBatteryHistorybyEmail(@Param("email") String email);
}
