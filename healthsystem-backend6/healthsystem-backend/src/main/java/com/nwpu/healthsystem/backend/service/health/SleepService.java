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
        Sleep sleep = sleepMapper.findLatestSleepByUser(email);
        if (sleep != null && ((sleep.getSleep_score_overall() != null && !sleep.getSleep_score_overall().isEmpty() && !sleep.getSleep_score_overall().equalsIgnoreCase("null"))
                || (sleep.getSleepTimeSeconds() != null && !sleep.getSleepTimeSeconds().isEmpty() && !sleep.getSleepTimeSeconds().equalsIgnoreCase("null")))) {
            formatSleepDurations(sleep);
            return sleep;
        }

        try {
            java.util.Map<String, Object> act = sleepMapper.findLatestActivitySleep(email);
            if (act != null) {
                Sleep fallback = new Sleep();
                fallback.setEmail(email);
                if (act.get("sleep_score_overall") != null) {
                    fallback.setSleepScoreOverall(act.get("sleep_score_overall").toString());
                } else {
                    fallback.setSleepScoreOverall("80");
                }
                if (act.get("sleepingSeconds") != null) {
                    fallback.setSleepTimeSeconds(formatDurationSeconds(act.get("sleepingSeconds").toString()));
                }
                if (act.get("measurableAwakeDuration") != null) {
                    fallback.setAwakeSleepSeconds(formatDurationSeconds(act.get("measurableAwakeDuration").toString()));
                }
                if (act.get("avgSleepStress") != null) {
                    fallback.setAvgSleepStress(act.get("avgSleepStress").toString());
                }
                Object cd = act.get("calendarDate");
                if (cd instanceof java.sql.Date) {
                    fallback.setCalendarDate((java.sql.Date) cd);
                } else if (cd instanceof java.util.Date) {
                    fallback.setCalendarDate(new java.sql.Date(((java.util.Date) cd).getTime()));
                }
                return fallback;
            }
        } catch (Exception e) {
            log.error("睡眠降级读取 activity 表异常: {}", e.getMessage());
        }

        if (sleep != null) {
            formatSleepDurations(sleep);
        }
        return sleep;
    }

    private void formatSleepDurations(Sleep sleep) {
        if (sleep == null) return;
        if (sleep.getSleepTimeSeconds() != null) {
            sleep.setSleepTimeSeconds(formatDurationSeconds(sleep.getSleepTimeSeconds()));
        }
        if (sleep.getAwakeSleepSeconds() != null) {
            sleep.setAwakeSleepSeconds(formatDurationSeconds(sleep.getAwakeSleepSeconds()));
        }
    }

    private String formatDurationSeconds(String raw) {
        if (raw == null || raw.trim().isEmpty() || raw.equalsIgnoreCase("null")) return "--";
        if (raw.contains("小时") || raw.contains("分")) return raw;
        try {
            long sec = Long.parseLong(raw.trim());
            long hours = sec / 3600;
            long mins = (sec % 3600) / 60;
            if (hours > 0) {
                return hours + "小时" + (mins > 0 ? mins + "分" : "");
            } else {
                return mins + "分";
            }
        } catch (Exception e) {
            return raw;
        }
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
