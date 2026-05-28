package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.Stress;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StressMapper {

    @Select("SELECT * FROM stress WHERE email = #{email} ORDER BY calendarDate DESC LIMIT 1")
    Stress findLatestStressByUser(String email);

    @Select("SELECT * FROM stress WHERE email = #{email} ORDER BY calendarDate DESC LIMIT #{period}")
    List<Stress> findRecentStressByUser(@Param("email") String email, @Param("period") int period);

    @Select("SELECT * FROM stress WHERE email = #{email}" +
            "ORDER BY calendarDate DESC")
    List<Stress> getStressHistorybyEmail(@Param("email") String email);
}
