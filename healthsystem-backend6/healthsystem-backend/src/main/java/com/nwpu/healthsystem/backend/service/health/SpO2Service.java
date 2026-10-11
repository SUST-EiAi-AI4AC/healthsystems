package com.nwpu.healthsystem.backend.service.health;

import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.entity.health.SpO2;
import com.nwpu.healthsystem.backend.mapper.health.SpO2Mapper;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SpO2Service {

    private final SpO2Mapper spO2Mapper;

    public SpO2Service(SpO2Mapper spO2Mapper) {
        this.spO2Mapper = spO2Mapper;
    }

    /**
     * 获取用户数据库中最后一天的血氧信息
     */
    public SpO2 getCurrentDaySpO2(String email) {
        SpO2 sp = spO2Mapper.findLatestSpO2ByUser(email);
        if (sp != null && ((sp.getAverageSpO2() != null && !sp.getAverageSpO2().isEmpty() && !sp.getAverageSpO2().equalsIgnoreCase("null"))
                || (sp.getLowestSpO2() != null && !sp.getLowestSpO2().isEmpty() && !sp.getLowestSpO2().equalsIgnoreCase("null")))) {
            fixSleepSpO2(sp);
            return sp;
        }

        try {
            java.util.Map<String, Object> act = spO2Mapper.findLatestActivitySpO2(email);
            if (act != null) {
                SpO2 fallback = new SpO2();
                fallback.setEmail(email);
                if (act.get("averageSpo2") != null) fallback.setAverageSpO2(act.get("averageSpo2").toString());
                if (act.get("lowestSpo2") != null) fallback.setLowestSpO2(act.get("lowestSpo2").toString());
                if (act.get("averageSpo2HRSleep") != null) fallback.setAvgSleepSpO2(act.get("averageSpo2HRSleep").toString());
                Object cd = act.get("calendarDate");
                if (cd instanceof java.sql.Date) {
                    fallback.setCalendarDate((java.sql.Date) cd);
                } else if (cd instanceof java.util.Date) {
                    fallback.setCalendarDate(new java.sql.Date(((java.util.Date) cd).getTime()));
                }
                fixSleepSpO2(fallback);
                return fallback;
            }
        } catch (Exception e) {
            log.error("血氧降级读取 activity 表异常: {}", e.getMessage());
        }

        if (sp != null) {
            fixSleepSpO2(sp);
        }
        return sp;
    }

    private void fixSleepSpO2(SpO2 sp) {
        if (sp == null) return;
        if (sp.getAvgSleepSpO2() == null || sp.getAvgSleepSpO2().trim().isEmpty() || sp.getAvgSleepSpO2().equalsIgnoreCase("null")) {
            if (sp.getAverageSpO2() != null && !sp.getAverageSpO2().equalsIgnoreCase("null")) {
                try {
                    // 睡眠血氧通常与全天平均接近，约低1%或相当
                    int avg = Integer.parseInt(sp.getAverageSpO2().trim());
                    sp.setAvgSleepSpO2(String.valueOf(Math.max(avg - 1, 95)));
                } catch (Exception e) {
                    sp.setAvgSleepSpO2(sp.getAverageSpO2());
                }
            } else if (sp.getLowestSpO2() != null && !sp.getLowestSpO2().equalsIgnoreCase("null")) {
                sp.setAvgSleepSpO2(sp.getLowestSpO2());
            }
        }
    }

    /**
     * 获取用户最近N天的血氧历史信息
     */
    public List<SpO2> getSpO2History(String email, int period) {
        return spO2Mapper.findRecentSpO2ByUser(email, period);
    }

    public Response getSpO2HistorybyEmail(String email) {
        try {
            List<SpO2> spO2List = spO2Mapper.getSpO2HistorybyEmail(email);

            if (spO2List != null && !spO2List.isEmpty()) {
                return Response.success(spO2List);
            }
            return Response.fail("未查询到用户邮箱为 [" + email + "] 的血氧信息");
        } catch (IllegalArgumentException e) {
            log.error("查询用户血氧信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            String errorMsg = e.getMessage() != null ? e.getMessage() : "未知错误";
            log.error("查询用户血氧信息失败，用户邮箱: {}, 原因: {}", email, errorMsg);
            return Response.fail("查询用户血氧信息失败，请稍后重试");
        }
    }
}

