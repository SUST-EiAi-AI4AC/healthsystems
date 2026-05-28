package com.nwpu.healthsystem.backend.service.health;

import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.entity.health.Sleep;
import com.nwpu.healthsystem.backend.mapper.health.SleepMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Slf4j
@Service
public class SleepService {
    private final SleepMapper sleepMapper;

    public SleepService(SleepMapper sleepMapper) {
        this.sleepMapper = sleepMapper;
    }

    /**
     * 获取用户数据库中最后一天的睡眠信息
     */
    public Sleep getCurrentDaySleep(String email) {
        return sleepMapper.findLatestSleepByUser(email);
    }
    /**
     * 获取用户数据库中最近七天的睡眠信息
     */
    public List<Sleep> getSleepHistory(String email, int period) {
        return sleepMapper.findRecentSleepByUser(email, period);
    }

    public Response getSleepHistorybyEmail(String email) {
        try {
            List<Sleep> sleepList = sleepMapper.getSleepHistorybyEmail(email);

            if (sleepList != null && !sleepList.isEmpty()) {
                return Response.success(sleepList);
            }
            return Response.fail("未查询到用户邮箱为 [" + email + "] 的睡眠信息");
        } catch (IllegalArgumentException e) {
            log.error("查询用户睡眠信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            String errorMsg = e.getMessage() != null ? e.getMessage() : "未知错误";
            log.error("查询用户睡眠信息失败，用户邮箱: {}, 原因: {}", email, errorMsg);
            return Response.fail("查询用户睡眠信息失败，请稍后重试");
        }
    }
}
