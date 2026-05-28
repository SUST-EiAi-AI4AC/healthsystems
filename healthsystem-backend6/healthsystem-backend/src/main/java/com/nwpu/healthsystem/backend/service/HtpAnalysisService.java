package com.nwpu.healthsystem.backend.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nwpu.healthsystem.backend.entity.scale.HtpDrawingRecord;
import com.nwpu.healthsystem.backend.mapper.HtpAnalysisMapper;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * HTP房树人分析服务
 */
@Slf4j
@Service
public class HtpAnalysisService {

    @Autowired
    private HtpAnalysisMapper htpAnalysisMapper;

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 分页查询HTP记录列表
     */
    public Response getHtpList(int currentPage, int pageSize, String username, String startDate, String endDate, String riskLevel) {
        try {
            int offset = (currentPage - 1) * pageSize;
            
            // 查询总数
            int totalCount = htpAnalysisMapper.countHtpRecords(username, startDate, endDate, riskLevel);
            
            // 查询列表数据
            List<HtpDrawingRecord> records = htpAnalysisMapper.selectHtpList(offset, pageSize, username, startDate, endDate, riskLevel);
            
            // 为每条记录添加风险等级
            for (HtpDrawingRecord record : records) {
                record.setRiskLevel(calculateRiskLevel(record.getScore()));
            }
            
            PageInfo pageInfo = new PageInfo();
            pageInfo.setTotalNumber(totalCount);
            pageInfo.setCurrentPage(currentPage);
            pageInfo.setPageSize(pageSize);
            pageInfo.count();
            
            Map<String, Object> result = new HashMap<>();
            result.put("pageInfo", pageInfo);
            result.put("data", records);
            
            return Response.success(result);
        } catch (Exception e) {
            log.error("查询HTP记录列表失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 获取HTP记录详情
     */
    public Response getHtpDetail(Long id) {
        try {
            HtpDrawingRecord record = htpAnalysisMapper.selectHtpById(id);
            if (record == null) {
                return Response.fail("记录不存在");
            }
            
            // 添加风险等级
            record.setRiskLevel(calculateRiskLevel(record.getScore()));
            
            // 解析报告内容为JSON对象
            Map<String, Object> result = new HashMap<>();
            result.put("record", record);
            
            if (record.getReportContent() != null && !record.getReportContent().isEmpty()) {
                try {
                    JsonNode reportJson = objectMapper.readTree(record.getReportContent());
                    result.put("reportJson", reportJson);
                } catch (Exception e) {
                    log.warn("解析报告JSON失败", e);
                }
            }
            
            return Response.success(result);
        } catch (Exception e) {
            log.error("查询HTP记录详情失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 获取风险等级统计
     */
    public Response getRiskLevelStatistics(String startDate, String endDate) {
        try {
            List<Map<String, Object>> statistics = htpAnalysisMapper.getRiskLevelStatistics(startDate, endDate);
            
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
            log.error("获取风险等级统计失败", e);
            return Response.fail("统计失败：" + e.getMessage());
        }
    }

    /**
     * 获取评分分布统计
     */
    public Response getScoreDistribution(String startDate, String endDate) {
        try {
            List<Map<String, Object>> distribution = htpAnalysisMapper.getScoreDistribution(startDate, endDate);
            return Response.success(distribution);
        } catch (Exception e) {
            log.error("获取评分分布统计失败", e);
            return Response.fail("统计失败：" + e.getMessage());
        }
    }

    /**
     * 获取用户HTP历史趋势
     */
    public Response getUserHtpTrend(Long userId, int limit) {
        try {
            List<HtpDrawingRecord> records = htpAnalysisMapper.selectUserHtpTrend(userId, limit);
            
            // 为每条记录添加风险等级
            for (HtpDrawingRecord record : records) {
                record.setRiskLevel(calculateRiskLevel(record.getScore()));
            }
            
            return Response.success(records);
        } catch (Exception e) {
            log.error("获取用户HTP趋势失败", e);
            return Response.fail("查询失败：" + e.getMessage());
        }
    }

    /**
     * 根据评分计算风险等级
     * 0-40: severe (重度风险)
     * 41-55: moderate (中度风险)
     * 56-70: mild (轻度风险)
     * 71-100: normal (正常)
     */
    private String calculateRiskLevel(int score) {
        if (score <= 56) {
            return "normal";
        } else if (score <= 70) {
            return "mild";
        } else if (score <= 80) {
            return "moderate";
        } else {
            return "severe";
        }
    }

    /**
     * 删除HTP记录
     */
    public Response deleteHtp(Long id) {
        try {
            int rows = htpAnalysisMapper.deleteHtp(id);
            if (rows > 0) {
                return Response.success("删除成功");
            } else {
                return Response.fail("记录不存在或删除失败");
            }
        } catch (Exception e) {
            log.error("删除HTP记录失败", e);
            return Response.fail("删除失败：" + e.getMessage());
        }
    }
}
