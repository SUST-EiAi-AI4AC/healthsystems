package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.mapper.*;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 量表分析服务
 */
@Slf4j
@Service
public class ScaleAnalysisService {

    @Autowired
    private ScaleAnalysisMapper scaleAnalysisMapper;

    /**
     * 量表类型配置
     */
    private static final Map<String, Map<String, Object>> SCALE_CONFIG = new HashMap<>();
    
    static {
        // PARS-3 体力活动感知量表
        Map<String, Object> pars3 = new HashMap<>();
        pars3.put("name", "PARS-3");
        pars3.put("fullName", "体力活动感知量表");
        pars3.put("description", "评估个体对体力活动的感知和态度");
        pars3.put("tableName", "pars3");
        SCALE_CONFIG.put("PARS3", pars3);
        
        // IPAQ 国际体力活动量表
        Map<String, Object> ipaq = new HashMap<>();
        ipaq.put("name", "IPAQ");
        ipaq.put("fullName", "国际体力活动量表");
        ipaq.put("description", "评估个体的体力活动水平");
        ipaq.put("tableName", "ipaq");
        SCALE_CONFIG.put("IPAQ", ipaq);
        
        // MAIA-2 多维度身体内感受觉察量表
        Map<String, Object> maia2 = new HashMap<>();
        maia2.put("name", "MAIA-2");
        maia2.put("fullName", "多维度身体内感受觉察量表");
        maia2.put("description", "评估个体对身体内部感觉的觉察能力");
        maia2.put("tableName", "maia2");
        SCALE_CONFIG.put("MAIA2", maia2);
        
        // CD-RISC 心理韧性量表
        Map<String, Object> cdrisc = new HashMap<>();
        cdrisc.put("name", "CD-RISC");
        cdrisc.put("fullName", "心理韧性量表");
        cdrisc.put("description", "评估个体的心理韧性和应对压力的能力");
        cdrisc.put("tableName", "cdrisc");
        SCALE_CONFIG.put("CDRISC", cdrisc);
        
        // OCEAN 大五人格量表
        Map<String, Object> ocean = new HashMap<>();
        ocean.put("name", "OCEAN");
        ocean.put("fullName", "大五人格量表");
        ocean.put("description", "评估个体的五大人格特质");
        ocean.put("tableName", "ocean");
        SCALE_CONFIG.put("OCEAN", ocean);
        
        // PSQI 匹兹堡睡眠质量指数
        Map<String, Object> psqi = new HashMap<>();
        psqi.put("name", "PSQI");
        psqi.put("fullName", "匹兹堡睡眠质量指数");
        psqi.put("description", "评估个体的睡眠质量");
        psqi.put("tableName", "psqi");
        SCALE_CONFIG.put("PSQI", psqi);
        
        // SCL-90 症状自评量表
        Map<String, Object> scl90 = new HashMap<>();
        scl90.put("name", "SCL-90");
        scl90.put("fullName", "症状自评量表");
        scl90.put("description", "评估个体的心理症状和精神健康状况");
        scl90.put("tableName", "scl90");
        SCALE_CONFIG.put("SCL90", scl90);
    }

    /**
     * 分页查询量表记录列表
     */
    public Response getScaleList(int currentPage, int pageSize, String scaleType, 
                                  String username, String startDate, String endDate, String riskLevel) {
        try {
            // 验证量表类型
            if (!SCALE_CONFIG.containsKey(scaleType.toUpperCase())) {
                return Response.fail("不支持的量表类型：" + scaleType);
            }
            
            String tableName = (String) SCALE_CONFIG.get(scaleType.toUpperCase()).get("tableName");
            int offset = (currentPage - 1) * pageSize;
            
            // 查询总数
            int totalCount = scaleAnalysisMapper.countScaleRecords(tableName, scaleType, username, startDate, endDate, riskLevel);
            
            // 查询列表数据
            List<Map<String, Object>> records = scaleAnalysisMapper.selectScaleList(
                tableName, scaleType, offset, pageSize, username, startDate, endDate, riskLevel);
            
            // 为每条记录添加风险等级
            for (Map<String, Object> record : records) {
                if (record.get("score") != null) {
                    int score = ((Number) record.get("score")).intValue();
                    record.put("riskLevel", calculateScaleRiskLevel(scaleType, score));
                }
            }
            
            PageInfo pageInfo = new PageInfo();
            pageInfo.setTotalNumber(totalCount);
            pageInfo.setCurrentPage(currentPage);
            pageInfo.setPageSize(pageSize);
            pageInfo.count();
            
            Map<String, Object> result = new HashMap<>();
            result.put("pageInfo", pageInfo);
            result.put("data", records);
            result.put("scaleInfo", SCALE_CONFIG.get(scaleType.toUpperCase()));
            
            return Response.success(result);
        } catch (Exception e) {
            log.error("查询量表记录列表失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 获取量表记录详情
     */
    public Response getScaleDetail(String scaleType, Long id) {
        try {
            if (!SCALE_CONFIG.containsKey(scaleType.toUpperCase())) {
                return Response.fail("不支持的量表类型：" + scaleType);
            }
            
            String tableName = (String) SCALE_CONFIG.get(scaleType.toUpperCase()).get("tableName");
            Map<String, Object> record = scaleAnalysisMapper.selectScaleById(tableName, id);
            
            if (record == null) {
                return Response.fail("记录不存在");
            }
            
            // 添加风险等级
            if (record.get("score") != null) {
                int score = ((Number) record.get("score")).intValue();
                record.put("riskLevel", calculateScaleRiskLevel(scaleType, score));
            }
            
            Map<String, Object> result = new HashMap<>();
            result.put("record", record);
            result.put("scaleInfo", SCALE_CONFIG.get(scaleType.toUpperCase()));
            
            return Response.success(result);
        } catch (Exception e) {
            log.error("查询量表记录详情失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 获取量表风险等级统计
     */
    public Response getScaleRiskStatistics(String scaleType, String startDate, String endDate) {
        try {
            if (!SCALE_CONFIG.containsKey(scaleType.toUpperCase())) {
                return Response.fail("不支持的量表类型：" + scaleType);
            }
            
            String tableName = (String) SCALE_CONFIG.get(scaleType.toUpperCase()).get("tableName");
            List<Map<String, Object>> statistics = scaleAnalysisMapper.getScaleRiskStatistics(
                tableName, scaleType, startDate, endDate);
            
            // 计算总数和百分比
            int total = statistics.stream().mapToInt(m -> ((Number) m.get("count")).intValue()).sum();
            
            for (Map<String, Object> stat : statistics) {
                int count = ((Number) stat.get("count")).intValue();
                double percentage = total > 0 ? (count * 100.0 / total) : 0;
                stat.put("percentage", String.format("%.2f", percentage));
                stat.put("total", total);
            }
            
            return Response.success(statistics);
        } catch (Exception e) {
            log.error("获取量表风险等级统计失败", e);
            return Response.fail("统计失败：" + e.getMessage());
        }
    }

    /**
     * 获取用户最新量表汇总
     */
    public Response getUserLatestScales(Long userId) {
        try {
            Map<String, Object> result = new HashMap<>();
            
            for (String scaleType : SCALE_CONFIG.keySet()) {
                String tableName = (String) SCALE_CONFIG.get(scaleType).get("tableName");
                Map<String, Object> latestRecord = scaleAnalysisMapper.selectUserLatestScale(tableName, userId);
                
                if (latestRecord != null && latestRecord.get("score") != null) {
                    int score = ((Number) latestRecord.get("score")).intValue();
                    latestRecord.put("riskLevel", calculateScaleRiskLevel(scaleType, score));
                }
                
                result.put(scaleType, latestRecord);
            }
            
            result.put("scaleTypes", SCALE_CONFIG);
            
            return Response.success(result);
        } catch (Exception e) {
            log.error("获取用户最新量表汇总失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 获取用户量表趋势
     */
    public Response getUserScaleTrend(String scaleType, Long userId, int limit) {
        try {
            if (!SCALE_CONFIG.containsKey(scaleType.toUpperCase())) {
                return Response.fail("不支持的量表类型：" + scaleType);
            }
            
            String tableName = (String) SCALE_CONFIG.get(scaleType.toUpperCase()).get("tableName");
            List<Map<String, Object>> records = scaleAnalysisMapper.selectUserScaleTrend(tableName, userId, limit);
            
            // 为每条记录添加风险等级
            for (Map<String, Object> record : records) {
                if (record.get("score") != null) {
                    int score = ((Number) record.get("score")).intValue();
                    record.put("riskLevel", calculateScaleRiskLevel(scaleType, score));
                }
            }
            
            return Response.success(records);
        } catch (Exception e) {
            log.error("获取用户量表趋势失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 获取量表综合分析报告
     */
    public Response getComprehensiveAnalysis(Long userId) {
        try {
            Map<String, Object> analysis = new HashMap<>();
            List<String> concerns = new ArrayList<>();
            List<String> suggestions = new ArrayList<>();
            
            // 获取所有量表的最新数据
            for (String scaleType : SCALE_CONFIG.keySet()) {
                String tableName = (String) SCALE_CONFIG.get(scaleType).get("tableName");
                Map<String, Object> latestRecord = scaleAnalysisMapper.selectUserLatestScale(tableName, userId);
                
                if (latestRecord != null && latestRecord.get("score") != null) {
                    int score = ((Number) latestRecord.get("score")).intValue();
                    String riskLevel = calculateScaleRiskLevel(scaleType, score);
                    
                    // 根据风险等级生成建议
                    if ("severe".equals(riskLevel) || "moderate".equals(riskLevel)) {
                        String scaleName = (String) SCALE_CONFIG.get(scaleType).get("fullName");
                        concerns.add(scaleName + "评分偏低，需要重点关注");
                        suggestions.add("建议针对" + scaleName + "相关问题进行专业咨询");
                    }
                }
            }
            
            analysis.put("userId", userId);
            analysis.put("analysisDate", new Date());
            analysis.put("concerns", concerns);
            analysis.put("suggestions", suggestions);
            analysis.put("overallStatus", concerns.isEmpty() ? "良好" : "需要关注");
            
            return Response.success(analysis);
        } catch (Exception e) {
            log.error("获取综合分析报告失败", e);
            return Response.fail("分析失败：" + e.getMessage());
        }
    }

    /**
     * 获取所有量表类型
     */
    public Response getScaleTypes() {
        return Response.success(SCALE_CONFIG);
    }

    /**
     * 获取量表评分分布
     */
    public Response getScaleScoreDistribution(String scaleType, String startDate, String endDate) {
        try {
            if (!SCALE_CONFIG.containsKey(scaleType.toUpperCase())) {
                return Response.fail("不支持的量表类型：" + scaleType);
            }
            
            String tableName = (String) SCALE_CONFIG.get(scaleType.toUpperCase()).get("tableName");
            List<Map<String, Object>> distribution = scaleAnalysisMapper.getScaleScoreDistribution(
                tableName, startDate, endDate);
            
            return Response.success(distribution);
        } catch (Exception e) {
            log.error("获取量表评分分布失败", e);
            return Response.fail("统计失败：" + e.getMessage());
        }
    }

    /**
     * 根据量表类型和评分计算风险等级
     */
    private String calculateScaleRiskLevel(String scaleType, int score) {
        String type = scaleType.toUpperCase().replace("-", "");
        
        // CD-RISC 心理韧性量表 (得分越高越好)
        if (type.contains("CDRISC")) {
            if (score >= 75) return "normal";
            if (score >= 60) return "mild";
            if (score >= 45) return "moderate";
            return "severe";
        }
        
        // SCL-90 和 PSQI (得分越高风险越高)
        if (type.contains("SCL90") || type.contains("PSQI")) {
            if (score <= 40) return "normal";
            if (score <= 55) return "mild";
            if (score <= 70) return "moderate";
            return "severe";
        }
        
        // PARS-3 体力活动量表 (23分及以上是正常的)
        if (type.contains("PARS3")) {
            if (score >= 23) return "normal";
            if (score >= 18) return "mild";
            if (score >= 12) return "moderate";
            return "severe";
        }
        
        // 其他量表使用默认标准
        if (score >= 70) return "normal";
        if (score >= 55) return "mild";
        if (score >= 40) return "moderate";
        return "severe";
    }

    /**
     * 删除量表记录
     */
    public Response deleteScale(String scaleType, Long id) {
        try {
            if (!SCALE_CONFIG.containsKey(scaleType.toUpperCase())) {
                return Response.fail("未知的量表类型：" + scaleType);
            }
            String tableName = (String) SCALE_CONFIG.get(scaleType.toUpperCase()).get("tableName");
            int rows = scaleAnalysisMapper.deleteScale(tableName, id);
            if (rows > 0) {
                return Response.success("删除成功");
            } else {
                return Response.fail("记录不存在或删除失败");
            }
        } catch (Exception e) {
            log.error("删除量表记录失败", e);
            return Response.fail("删除失败：" + e.getMessage());
        }
    }
}
