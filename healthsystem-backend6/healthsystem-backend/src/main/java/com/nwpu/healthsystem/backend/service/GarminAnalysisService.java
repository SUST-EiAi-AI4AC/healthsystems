package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.mapper.GarminActivityMapper;
import com.nwpu.healthsystem.backend.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class GarminAnalysisService {

    @Autowired(required = false)
    private GarminActivityMapper garminActivityMapper;

    private static final DecimalFormat df1 = new DecimalFormat("0.0");
    private static final DecimalFormat df0 = new DecimalFormat("0");

    /**
     * 分页查询 Garmin activity 记录列表
     */
    public Response getGarminList(int currentPage, int pageSize, String username, String startDate, String endDate, String riskLevel) {
        try {
            int offset = (currentPage - 1) * pageSize;
            List<Map<String, Object>> rawList = garminActivityMapper.selectActivityList(offset, pageSize, username, startDate, endDate);
            int total = garminActivityMapper.countActivityList(username, startDate, endDate);

            List<Map<String, Object>> processedList = new ArrayList<>();
            for (Map<String, Object> row : rawList) {
                Map<String, Object> item = new HashMap<>(row);
                // 规范化字段名
                Object rowId = getCaseVal(row, "id");
                item.put("id", rowId);
                item.put("realName", getCaseVal(row, "realName"));
                item.put("userName", getCaseVal(row, "userName"));
                item.put("email", getCaseVal(row, "email"));
                item.put("calendarDate", getCaseVal(row, "calendarDate"));

                // 计算健康得分与风险等级
                Map<String, Object> eval = evaluatePhysiologicalData(row);
                item.put("healthScore", eval.get("healthScore"));
                item.put("riskLevel", eval.get("riskLevel"));
                item.put("riskLabel", eval.get("riskLabel"));
                item.put("riskBadgeClass", eval.get("riskBadgeClass"));
                
                // 格式化输出
                item.put("sleepHoursStr", formatSleepHours(getCaseVal(row, "sleepingSeconds")));
                item.put("totalStepsStr", formatValue(getCaseVal(row, "totalSteps"), "步"));
                item.put("restingHRStr", formatValue(getCaseVal(row, "restingHeartRate"), "bpm"));
                item.put("avgStressStr", formatValue(getCaseVal(row, "averageStressLevel"), ""));
                item.put("avgSpo2Str", formatValue(getCaseVal(row, "averageSpo2"), "%"));

                processedList.add(item);
            }

            // 按风险等级筛选（若有）
            if (riskLevel != null && !riskLevel.trim().isEmpty()) {
                processedList = processedList.stream()
                        .filter(m -> riskLevel.equalsIgnoreCase(String.valueOf(m.get("riskLevel"))))
                        .collect(Collectors.toList());
            }

            Map<String, Object> resultData = new HashMap<>();
            Map<String, Object> pageInfo = new HashMap<>();
            pageInfo.put("totalNumber", total);
            pageInfo.put("currentPage", currentPage);
            pageInfo.put("pageSize", pageSize);

            resultData.put("pageInfo", pageInfo);
            resultData.put("data", processedList);

            return Response.success(resultData);

        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("查询 Garmin 数据失败: " + e.getMessage());
        }
    }

    /**
     * 获取单条 activity 数据的智能分析报告
     */
    public Response getGarminDetail(Long id) {
        try {
            if (id == null) {
                return Response.fail("请求参数 id 不能为空");
            }
            Map<String, Object> row = garminActivityMapper.selectActivityById(id);
            if (row == null) {
                return Response.fail("未找到指定记录 ID: " + id);
            }

            Map<String, Object> eval = evaluatePhysiologicalData(row);
            Map<String, Object> detailResult = new HashMap<>(row);
            detailResult.put("id", getCaseVal(row, "id"));
            detailResult.put("realName", getCaseVal(row, "realName"));
            detailResult.put("userName", getCaseVal(row, "userName"));
            detailResult.put("email", getCaseVal(row, "email"));
            detailResult.put("calendarDate", getCaseVal(row, "calendarDate"));
            detailResult.put("lastSevenDaysAvgRestingHeartRate", getCaseVal(row, "lastSevenDaysAvgRestingHeartRate"));
            detailResult.put("activeKilocalories", getCaseVal(row, "activeKilocalories"));
            detailResult.put("bmrKilocalories", getCaseVal(row, "bmrKilocalories"));
            detailResult.put("analysis", eval);

            // 附带获取该用户近7天的历史趋势数据
            Object emailObj = getCaseVal(row, "email");
            String email = emailObj != null ? emailObj.toString() : null;
            if (email != null && !email.trim().isEmpty()) {
                List<Map<String, Object>> recentRaw = garminActivityMapper.selectUserRecentActivity(email, 7);
                List<Map<String, Object>> recentRows = new ArrayList<>(recentRaw != null ? recentRaw : Collections.emptyList());
                Collections.reverse(recentRows);
                detailResult.put("recentTrends", formatRecentTrends(recentRows));
            } else {
                detailResult.put("recentTrends", formatRecentTrends(Collections.emptyList()));
            }

            return Response.success(detailResult);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取分析报告失败: " + e.getMessage());
        }
    }

    /**
     * 全局宏观统计数据
     */
    public Response getStatistics() {
        try {
            Map<String, Object> stats = garminActivityMapper.selectGlobalStatistics();
            if (stats == null) {
                stats = new HashMap<>();
            }
            // 格式化处理
            double avgHR = parseDouble(getCaseVal(stats, "avgRestingHR"), 68.5);
            double avgSleep = parseDouble(getCaseVal(stats, "avgSleepHours"), 7.2);
            double avgSteps = parseDouble(getCaseVal(stats, "avgSteps"), 8450);
            double avgStress = parseDouble(getCaseVal(stats, "avgStress"), 32.0);
            double avgBattery = parseDouble(getCaseVal(stats, "avgBodyBatteryCharge"), 65.0);

            Map<String, Object> formattedStats = new HashMap<>();
            formattedStats.put("totalRecords", stats.getOrDefault("totalRecords", 0));
            formattedStats.put("totalUsers", stats.getOrDefault("totalUsers", 0));
            formattedStats.put("avgRestingHR", formatDecimal(avgHR, "0.0"));
            formattedStats.put("avgSleepHours", formatDecimal(avgSleep, "0.0"));
            formattedStats.put("avgSteps", formatDecimal(avgSteps, "0"));
            formattedStats.put("avgStress", formatDecimal(avgStress, "0.0"));
            formattedStats.put("avgBodyBatteryCharge", formatDecimal(avgBattery, "0"));

            return Response.success(formattedStats);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取统计指标失败: " + e.getMessage());
        }
    }

    /**
     * 获取用户历史趋势
     */
    public Response getUserTrend(String email, int limit) {
        try {
            List<Map<String, Object>> recentRows = garminActivityMapper.selectUserRecentActivity(email, limit);
            Collections.reverse(recentRows);
            return Response.success(formatRecentTrends(recentRows));
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取用户历史趋势失败: " + e.getMessage());
        }
    }

    /**
     * 删除记录
     */
    public Response deleteGarmin(Long id) {
        try {
            int rows = garminActivityMapper.deleteActivityById(id);
            if (rows > 0) {
                return Response.success("删除成功");
            } else {
                return Response.fail("删除失败或记录不存在");
            }
        } catch (Exception e) {
            return Response.fail("删除异常: " + e.getMessage());
        }
    }

    // ======================== 私有辅助与智能分析引擎算法 ========================

    /**
     * 佳明生理数据智能评价引擎算法
     */
    private Map<String, Object> evaluatePhysiologicalData(Map<String, Object> row) {
        Map<String, Object> eval = new HashMap<>();

        // 提取主要指标
        double restingHR = parseDouble(getCaseVal(row, "restingHeartRate"), 65.0);
        double maxHR = parseDouble(getCaseVal(row, "maxHeartRate"), 120.0);
        double sleepSec = parseDouble(getCaseVal(row, "sleepingSeconds"), 25200.0); // 默认7小时
        double sleepHours = sleepSec / 3600.0;
        double steps = parseDouble(getCaseVal(row, "totalSteps"), 8000.0);
        double stress = parseDouble(getCaseVal(row, "averageStressLevel"), 30.0);
        double spo2 = parseDouble(getCaseVal(row, "averageSpo2"), 97.0);
        double batteryCharged = parseDouble(getCaseVal(row, "bodyBatteryChargedValue"), 60.0);
        double batteryDrained = parseDouble(getCaseVal(row, "bodyBatteryDrainedValue"), 55.0);
        double respiration = parseDouble(getCaseVal(row, "avgWakingRespirationValue"), 15.0);

        // 1. 心率维度得分 (0-100)
        double hrScore = 100.0;
        if (restingHR < 50) hrScore = 95;
        else if (restingHR <= 72) hrScore = 100;
        else if (restingHR <= 85) hrScore = 82;
        else if (restingHR <= 95) hrScore = 65;
        else hrScore = 45;

        // 2. 睡眠维度得分 (0-100)
        double sleepScore = 100.0;
        if (sleepHours >= 7.0 && sleepHours <= 9.0) sleepScore = 98;
        else if (sleepHours >= 6.0 && sleepHours < 7.0) sleepScore = 80;
        else if (sleepHours >= 9.0 && sleepHours <= 10.5) sleepScore = 85;
        else if (sleepHours < 6.0) sleepScore = 55;
        else sleepScore = 50;

        // 3. 步数与运动得分 (0-100)
        double stepScore = Math.min(100.0, (steps / 10000.0) * 100.0);
        if (steps < 4000) stepScore = 50;

        // 4. 压力管理得分 (0-100)
        double stressScore = 100.0;
        if (stress <= 25) stressScore = 98;
        else if (stress <= 40) stressScore = 85;
        else if (stress <= 60) stressScore = 65;
        else stressScore = 40;

        // 5. 身体电量恢复得分 (0-100)
        double batteryScore = Math.min(100.0, Math.max(0.0, batteryCharged));

        // 6. 血氧评分 (0-100)
        double spo2Score = 100.0;
        if (spo2 >= 96) spo2Score = 100;
        else if (spo2 >= 94) spo2Score = 85;
        else if (spo2 >= 90) spo2Score = 60;
        else spo2Score = 40;

        // 综合健康加权得分
        double totalScore = (hrScore * 0.20) + (sleepScore * 0.25) + (stepScore * 0.15) 
                          + (stressScore * 0.15) + (batteryScore * 0.15) + (spo2Score * 0.10);
        int finalScore = (int) Math.round(totalScore);

        // 判定风险等级与提示标签
        String riskLevel;
        String riskLabel;
        String riskBadgeClass;

        if (finalScore >= 85) {
            riskLevel = "normal";
            riskLabel = "优秀 (最佳状态)";
            riskBadgeClass = "risk-normal";
        } else if (finalScore >= 70) {
            riskLevel = "mild";
            riskLabel = "良好 (轻度注意)";
            riskBadgeClass = "risk-mild";
        } else if (finalScore >= 55) {
            riskLevel = "moderate";
            riskLabel = "中度警示 (生理疲劳)";
            riskBadgeClass = "risk-moderate";
        } else {
            riskLevel = "severe";
            riskLabel = "重度预警 (需休养)";
            riskBadgeClass = "risk-severe";
        }

        // 生成五维雷达图数据
        Map<String, Object> radarMetrics = new HashMap<>();
        radarMetrics.put("heartRateScore", (int) Math.round(hrScore));
        radarMetrics.put("sleepScore", (int) Math.round(sleepScore));
        radarMetrics.put("activityScore", (int) Math.round(stepScore));
        radarMetrics.put("stressScore", (int) Math.round(stressScore));
        radarMetrics.put("batteryScore", (int) Math.round(batteryScore));
        radarMetrics.put("spo2Score", (int) Math.round(spo2Score));

        // 针对性建议模块生成
        List<Map<String, String>> recommendations = new ArrayList<>();

        // 睡眠建议
        if (sleepHours < 6.5) {
            recommendations.add(createAdvise("😴 睡眠调理", "昨日睡眠时长不足" + formatDecimal(sleepHours, "0.0") + "小时。建议今晚提早30分钟入睡，避免睡前使用高亮电子屏幕，促进深睡眠恢复。"));
        } else {
            recommendations.add(createAdvise("😴 睡眠调理", "睡眠时长达到" + formatDecimal(sleepHours, "0.0") + "小时，节律良好！请继续保持规律作息。"));
        }

        // 压力与电量建议
        if (stress > 45 || batteryCharged < 40) {
            recommendations.add(createAdvise("⚡ 能量与压力调节", "检测到平均压力指数达" + formatDecimal(stress, "0") + "，电量仅恢复" + formatDecimal(batteryCharged, "0") + "分。建议下午进行15分钟冥想腹式呼吸，减缓交感神经兴奋。"));
        } else {
            recommendations.add(createAdvise("🧘 压力控制", "全天压力控制良好（平均" + formatDecimal(stress, "0") + "），身心处于健康平衡状态。"));
        }

        // 运动建议
        if (steps < 6000) {
            recommendations.add(createAdvise("🏃 运动与代谢", "昨日步数" + formatDecimal(steps, "0") + "步，尚未达到基础健康活动量。建议饭后散步20-30分钟，改善心肺血液循环。"));
        } else {
            recommendations.add(createAdvise("🏃 运动与代谢", "昨日总步数" + formatDecimal(steps, "0") + "步，活动量达标！建议保持有氧运动与肌肉力量训练相结合。"));
        }

        // 心率与血氧建议
        if (restingHR > 80 || spo2 < 95) {
            recommendations.add(createAdvise("💖 心血管与血氧监护", "静息心率偏高(" + formatDecimal(restingHR, "0") + " bpm)或血氧均值(" + formatDecimal(spo2, "0.0") + "%)稍低。注意补水与室内通风，必要时排查疲劳或感染。"));
        } else {
            recommendations.add(createAdvise("💖 心血管与血氧监护", "静息心率(" + formatDecimal(restingHR, "0") + " bpm)与血氧(" + formatDecimal(spo2, "0.0") + "%)指标非常健康，心脏泵血效率优异。"));
        }

        eval.put("healthScore", finalScore);
        eval.put("riskLevel", riskLevel);
        eval.put("riskLabel", riskLabel);
        eval.put("riskBadgeClass", riskBadgeClass);
        eval.put("radarMetrics", radarMetrics);
        eval.put("recommendations", recommendations);
        eval.put("restingHR", formatDecimal(restingHR, "0"));
        eval.put("maxHR", formatDecimal(maxHR, "0"));
        eval.put("sleepHours", formatDecimal(sleepHours, "0.0"));
        eval.put("totalSteps", formatDecimal(steps, "0"));
        eval.put("avgStress", formatDecimal(stress, "0"));
        eval.put("avgSpo2", formatDecimal(spo2, "0.0"));
        eval.put("batteryCharged", formatDecimal(batteryCharged, "0"));
        eval.put("batteryDrained", formatDecimal(batteryDrained, "0"));
        eval.put("wakingRespiration", formatDecimal(respiration, "0"));

        return eval;
    }

    private Map<String, String> createAdvise(String title, String content) {
        Map<String, String> item = new HashMap<>();
        item.put("title", title);
        item.put("content", content);
        return item;
    }

    private Map<String, Object> formatRecentTrends(List<Map<String, Object>> rows) {
        List<String> dates = new ArrayList<>();
        List<Integer> heartRates = new ArrayList<>();
        List<Double> sleepHours = new ArrayList<>();
        List<Integer> steps = new ArrayList<>();
        List<Integer> stressLevels = new ArrayList<>();
        List<Integer> bodyBatteries = new ArrayList<>();

        for (Map<String, Object> r : rows) {
            Object d = getCaseVal(r, "calendarDate");
            String dateStr = d != null ? d.toString().split(" ")[0] : "";
            dates.add(dateStr);

            heartRates.add((int) parseDouble(getCaseVal(r, "restingHeartRate"), 65));
            double sh = parseDouble(getCaseVal(r, "sleepingSeconds"), 25200) / 3600.0;
            sleepHours.add(Double.parseDouble(formatDecimal(sh, "0.0")));
            steps.add((int) parseDouble(getCaseVal(r, "totalSteps"), 0));
            stressLevels.add((int) parseDouble(getCaseVal(r, "averageStressLevel"), 30));
            bodyBatteries.add((int) parseDouble(r.get("bodyBatteryChargedValue"), 60));
        }

        Map<String, Object> trendData = new HashMap<>();
        trendData.put("dates", dates);
        trendData.put("heartRates", heartRates);
        trendData.put("sleepHours", sleepHours);
        trendData.put("steps", steps);
        trendData.put("stressLevels", stressLevels);
        trendData.put("bodyBatteries", bodyBatteries);
        return trendData;
    }

    private String formatSleepHours(Object secObj) {
        double sec = parseDouble(secObj, 0);
        if (sec <= 0) return "暂无数据";
        double hours = sec / 3600.0;
        return formatDecimal(hours, "0.0") + " 小时";
    }

    private String formatValue(Object valObj, String unit) {
        if (valObj == null) return "暂无数据";
        String s = valObj.toString().trim();
        if (s.isEmpty() || "null".equalsIgnoreCase(s)) return "暂无数据";
        return s + (unit.isEmpty() ? "" : " " + unit);
    }

    private double parseDouble(Object obj, double defaultVal) {
        if (obj == null) return defaultVal;
        try {
            return Double.parseDouble(obj.toString().trim());
        } catch (Exception e) {
            return defaultVal;
        }
    }

    private String formatDecimal(double val, String pattern) {
        try {
            return new DecimalFormat(pattern).format(val);
        } catch (Exception e) {
            return String.valueOf(val);
        }
    }

    private Object getCaseVal(Map<String, Object> map, String key) {
        if (map == null || key == null) return null;
        if (map.containsKey(key)) return map.get(key);
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (key.equalsIgnoreCase(entry.getKey())) {
                return entry.getValue();
            }
        }
        return null;
    }
}
