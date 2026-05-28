package com.nwpu.healthsystem.backend.service.health;

import com.nwpu.healthsystem.backend.entity.health.BodyBattery;
import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.mapper.health.BodyBatteryMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BodyBatteryService {

    private final BodyBatteryMapper bodyBatteryMapper;

    public BodyBatteryService(BodyBatteryMapper bodyBatteryMapper) {
        this.bodyBatteryMapper = bodyBatteryMapper;
    }

    /**
     * 获取当前最新的身体电量数据
     */
    public BodyBattery getCurrentDayBodyBattery(String email) {
        return bodyBatteryMapper.findLatestBodyBatteryByUser(email);
    }

    /**
     * 获取最近N天身体电量历史数据
     */
    public List<BodyBattery> getBodyBatteryHistory(String email, int period) {
        return bodyBatteryMapper.findRecentBodyBatteryByUser(email, period);
    }

    public Response getBodyBatteryHistorybyEmail(String email) {
        try {
            List<BodyBattery> bodyBatteryList = bodyBatteryMapper.getBodyBatteryHistorybyEmail(email);

            if (bodyBatteryList != null && !bodyBatteryList.isEmpty()) {
                return Response.success(bodyBatteryList);
            }
            return Response.fail("未查询到用户邮箱为 [" + email + "] 的身体电量信息");
        } catch (IllegalArgumentException e) {
            log.error("查询用户身体电量信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            String errorMsg = e.getMessage() != null ? e.getMessage() : "未知错误";
            log.error("查询用户身体电量信息失败，用户邮箱: {}, 原因: {}", email, errorMsg);
            return Response.fail("查询用户身体电量信息失败，请稍后重试");
        }
    }
}
