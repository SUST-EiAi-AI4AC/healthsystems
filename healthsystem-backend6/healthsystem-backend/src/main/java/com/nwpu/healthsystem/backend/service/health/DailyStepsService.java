package com.nwpu.healthsystem.backend.service.health;

import com.nwpu.healthsystem.backend.entity.health.DailySteps;
import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.mapper.health.DailyStepsMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;


@Slf4j
@Service
public class DailyStepsService {

    private final DailyStepsMapper dailyStepsMapper;

    public DailyStepsService(DailyStepsMapper dailyStepsMapper) {
        this.dailyStepsMapper = dailyStepsMapper;
    }

    public DailySteps getCurrentDaySteps(String email) {
        return dailyStepsMapper.findLatestStepsByUser(email);
    }

    /**
     * 获取以最后一天为基准的连续 N 天步数数据（缺失的日期将补 null 字段）
     */
    public List<DailySteps> getStepsHistory(String email, int period) {
        // 第一步：查询最后一天的日期
        Date latestDate = dailyStepsMapper.findLatestDate(email);
        if (latestDate == null) {
            return Collections.emptyList();
        }

        // 第二步：构建日期范围
        LocalDate endDate = latestDate.toLocalDate();
        LocalDate startDate = endDate.minusDays(period - 1);

        // 第三步：查询这段日期范围内的数据
        List<DailySteps> dataInRange = dailyStepsMapper.findStepsByDateRange(
                email,
                Date.valueOf(startDate),
                Date.valueOf(endDate)
        );

        // 第四步：构建 Map<LocalDate, DailySteps>
        Map<LocalDate, DailySteps> dataMap = dataInRange.stream()
                .collect(Collectors.toMap(ds -> ds.getCalendarDate().toLocalDate(), ds -> ds));

        // 第五步：补全缺失的日期
        List<DailySteps> result = new ArrayList<>();
        for (int i = 0; i < period; i++) {
            LocalDate date = startDate.plusDays(i);
            DailySteps step = dataMap.getOrDefault(date, createEmptyStep(email, date));
            result.add(step);
        }

        return result;
    }

    /**
     * 构造一个“无数据”的 DailySteps 实例（只含日期）
     */
    private DailySteps createEmptyStep(String email, LocalDate date) {
        DailySteps empty = new DailySteps();
        empty.setEmail(email);
        empty.setCalendarDate(Date.valueOf(date));
        empty.setTotalSteps(null);      // 或设为 0
        empty.setTotalDistance(null);   // 或设为 0
        empty.setStepGoal(null);        // 或设为 0
        return empty;
    }

    public Response getStepsHistorybyEmail(String email) {
        try {
            List<DailySteps> dailyStepsList = dailyStepsMapper.getStepsHistorybyEmail(email);

            if (dailyStepsList != null && !dailyStepsList.isEmpty()) {
                return Response.success(dailyStepsList);
            }
            return Response.fail("未查询到用户邮箱为 [" + email + "] 的步数信息");
        } catch (IllegalArgumentException e) {
            log.error("查询用户步数信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            String errorMsg = e.getMessage() != null ? e.getMessage() : "未知错误";
            log.error("查询用户步数信息失败，用户邮箱: {}, 原因: {}", email, errorMsg);
            return Response.fail("查询用户步数信息失败，请稍后重试");
        }
    }
}
