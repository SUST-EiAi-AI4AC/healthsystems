package com.nwpu.healthsystem.backend.service.health;

import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.entity.health.Stress;
import com.nwpu.healthsystem.backend.mapper.health.StressMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class StressService {
    private final StressMapper stressMapper;

    public StressService(StressMapper stressMapper) {
        this.stressMapper = stressMapper;
    }

    public Stress getCurrentDayStress(String email) {
        Stress st = stressMapper.findLatestStressByUser(email);
        if (st != null && ((st.getMaxStressLevel() != null && !st.getMaxStressLevel().isEmpty() && !st.getMaxStressLevel().equalsIgnoreCase("null"))
                || (st.getAvgStressLevel() != null && !st.getAvgStressLevel().isEmpty() && !st.getAvgStressLevel().equalsIgnoreCase("null")))) {
            return st;
        }

        try {
            java.util.Map<String, Object> act = stressMapper.findLatestActivityStress(email);
            if (act != null) {
                Stress fallback = new Stress();
                fallback.setEmail(email);
                if (act.get("maxStressLevel") != null) fallback.setMaxStressLevel(act.get("maxStressLevel").toString());
                if (act.get("averageStressLevel") != null) fallback.setAvgStressLevel(act.get("averageStressLevel").toString());
                Object cd = act.get("calendarDate");
                if (cd instanceof java.sql.Date) {
                    fallback.setCalendarDate((java.sql.Date) cd);
                } else if (cd instanceof java.util.Date) {
                    fallback.setCalendarDate(new java.sql.Date(((java.util.Date) cd).getTime()));
                }
                return fallback;
            }
        } catch (Exception e) {
            log.error("压力降级读取 activity 表异常: {}", e.getMessage());
        }

        return st;
    }

    public List<Stress> getStressHistory(String email, int period) {
        return stressMapper.findRecentStressByUser(email, period);
    }

    public Response getStressHistorybyEmail(String email) {
        try {
            List<Stress> stressList = stressMapper.getStressHistorybyEmail(email);

            if (stressList != null && !stressList.isEmpty()) {
                return Response.success(stressList);
            }
            return Response.fail("未查询到用户邮箱为 [" + email + "] 的压力信息");
        } catch (IllegalArgumentException e) {
            log.error("查询用户压力信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            String errorMsg = e.getMessage() != null ? e.getMessage() : "未知错误";
            log.error("查询用户压力信息失败，用户邮箱: {}, 原因: {}", email, errorMsg);
            return Response.fail("查询用户压力信息失败，请稍后重试");
        }
    }
}
