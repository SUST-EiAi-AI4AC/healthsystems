package com.nwpu.healthsystem.backend.service.health;

import cn.hutool.core.lang.Assert;
import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.mapper.health.HeartrateMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

import java.sql.Date;
import java.util.*;
import java.time.LocalDate;
import java.util.stream.Collectors;


@Slf4j
@Service
public class HeartrateService {
    private final HeartrateMapper heartrateMapper;

    public HeartrateService(HeartrateMapper heartrateMapper) {
        this.heartrateMapper = heartrateMapper;
    }

    /**
     * 获取用户当前天的心率信息
     */
//    public Heartrate getCurrentDayHeartrate(String email) {
//        LocalDate currentDate = LocalDate.now();
//        Date sqlDate = Date.valueOf(currentDate);
//        return heartrateMapper.findByUserAndDate(email, sqlDate);
//    }

    /**
     * 获取用户数据库中最后一天的心率信息
     */
    public Heartrate getCurrentDayHeartrate(String email) {
        // 修改为获取最后一天的数据
        return heartrateMapper.findLatestHeartrateByUser(email);
    }
    /**
     * 获取用户最近指定天数的心率历史记录
     * @param email 用户标识
     * @param period 天数（如7天）
     * @return 心率历史记录列表
     */
    public List<Heartrate> getHeartrateHistory(String email, int period) {
        // 第一步：查询数据库中该用户最后一条记录的日期
        Date latestDate = heartrateMapper.findLatestDate(email);
        if (latestDate == null) {
            return Collections.emptyList();
        }

        // 第二步：构造连续日期范围（含缺失）
        LocalDate endDate = latestDate.toLocalDate();
        LocalDate startDate = endDate.minusDays(period - 1);

        // 第三步：查询这段日期范围内的数据
        List<Heartrate> dataInRange = heartrateMapper.findByUserAndDateRange(
                email,
                Date.valueOf(startDate),
                Date.valueOf(endDate)
        );

        // 第四步：构建 Map<LocalDate, Heartrate>
        Map<LocalDate, Heartrate> dataMap = dataInRange.stream()
                .collect(Collectors.toMap(hr -> hr.getCalendarDate().toLocalDate(), hr -> hr));

        // 第五步：补全缺失的日期
        List<Heartrate> result = new ArrayList<>();
        for (int i = 0; i < period; i++) {
            LocalDate date = startDate.plusDays(i);
            Heartrate hr = dataMap.getOrDefault(date, createEmptyHeartrate(email, date));
            result.add(hr);
        }

        return result;
    }

    /**
     * 构造一个“无数据”的 HeartRate 实例（只含日期）
     */
    private Heartrate createEmptyHeartrate(String email, LocalDate date) {
        Heartrate empty = new Heartrate();
        empty.setEmail(email);
        empty.setCalendarDate(Date.valueOf(date));
        empty.setMaxHeartRate(null);     // 或设置为 0
        empty.setMinHeartRate(null);     // 或设置为 0
        empty.setRestingHeartRate(null); // 或设置为 0
        return empty;
    }

    public Response getHeartrateHistorybyEmail(String email) {
        try {
            List<Heartrate> heartrateList = heartrateMapper.getHeartrateHistorybyEmail(email);

            if (heartrateList != null && !heartrateList.isEmpty()) {
                return Response.success(heartrateList);
            }
            return Response.fail("未查询到用户邮箱为 [" + email + "] 的心率信息");
        } catch (IllegalArgumentException e) {
            log.error("查询用户心率信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            // 优先使用异常本身的消息，若为null则使用"未知错误"
            String errorMsg = e.getMessage() != null ? e.getMessage() : "未知错误";
            log.error("查询用户心率信息失败，用户邮箱: {}, 原因: {}", email, errorMsg);
            return Response.fail("查询用户心率信息失败，请稍后重试");
        }
    }
}
