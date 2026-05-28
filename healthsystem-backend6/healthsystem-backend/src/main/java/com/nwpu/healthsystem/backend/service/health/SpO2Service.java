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
        return spO2Mapper.findLatestSpO2ByUser(email);
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

