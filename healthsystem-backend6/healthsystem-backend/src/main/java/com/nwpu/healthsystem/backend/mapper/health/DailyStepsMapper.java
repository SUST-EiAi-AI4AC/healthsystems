package com.nwpu.healthsystem.backend.mapper.health;

import com.nwpu.healthsystem.backend.entity.health.DailySteps;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface DailyStepsMapper {

    @Select("SELECT * FROM daily_steps WHERE email = #{email} ORDER BY calendarDate DESC LIMIT 1")
    DailySteps findLatestStepsByUser(String email);

    // 获取用户最后一天的日期（用于构造连续日期）
    @Select("SELECT calendarDate FROM daily_steps WHERE email = #{email} ORDER BY calendarDate DESC LIMIT 1")
    Date findLatestDate(@Param("email") String email);

    // 查询指定日期范围内的数据
    @Select("SELECT * FROM daily_steps WHERE email = #{email} AND calendarDate BETWEEN #{startDate} AND #{endDate}")
    List<DailySteps> findStepsByDateRange(@Param("email") String email,
                                          @Param("startDate") Date startDate,
                                          @Param("endDate") Date endDate);

    @Select("SELECT * FROM daily_steps WHERE email = #{email}" +
            "order by calendarDate DESC")
    List<DailySteps> getStepsHistorybyEmail(@Param("email") String email);
}

