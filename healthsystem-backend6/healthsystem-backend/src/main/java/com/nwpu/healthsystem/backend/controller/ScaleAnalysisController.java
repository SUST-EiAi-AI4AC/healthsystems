package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.ScaleAnalysisService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 量表分析控制器
 * 提供7个量表（PARS-3、IPAQ、MAIA-2、CD-RISC、OCEAN、PSQI、SCL-90）的查询、统计和分析功能
 */
@Api(value = "量表分析", tags = "量表分析模块")
@RestController
@RequestMapping("/scale")
public class ScaleAnalysisController {

    @Autowired
    private ScaleAnalysisService scaleAnalysisService;

    @ApiOperation(value = "分页查询量表记录列表", notes = "支持按量表类型、用户名、日期范围筛选")
    @GetMapping("/list")
    @RequiresAuthentication
    public Response getScaleList(
            @ApiParam(value = "当前页码", example = "1") @RequestParam(defaultValue = "1") int currentPage,
            @ApiParam(value = "每页数量", example = "15") @RequestParam(defaultValue = "15") int pageSize,
            @ApiParam(value = "量表类型：PARS3, IPAQ, MAIA2, CDRISC, OCEAN, PSQI, SCL90", required = true) @RequestParam String scaleType,
            @ApiParam(value = "用户名（模糊查询）") @RequestParam(required = false) String username,
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate,
            @ApiParam(value = "风险等级：normal-正常, mild-轻度, moderate-中度, severe-重度") @RequestParam(required = false) String riskLevel
    ) {
        return scaleAnalysisService.getScaleList(currentPage, pageSize, scaleType, username, startDate, endDate, riskLevel);
    }

    @ApiOperation(value = "获取量表记录详情", notes = "获取指定量表的详细评估结果")
    @GetMapping("/detail/{scaleType}/{id}")
    @RequiresAuthentication
    public Response getScaleDetail(
            @ApiParam(value = "量表类型", required = true) @PathVariable String scaleType,
            @ApiParam(value = "记录ID", required = true) @PathVariable Long id
    ) {
        return scaleAnalysisService.getScaleDetail(scaleType, id);
    }

    @ApiOperation(value = "获取量表风险等级统计", notes = "统计指定量表各风险等级的人数和占比")
    @GetMapping("/statistics/riskLevel")
    @RequiresAuthentication
    public Response getScaleRiskStatistics(
            @ApiParam(value = "量表类型", required = true) @RequestParam String scaleType,
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate
    ) {
        return scaleAnalysisService.getScaleRiskStatistics(scaleType, startDate, endDate);
    }

    @ApiOperation(value = "获取用户最新量表汇总", notes = "获取指定用户在所有量表上的最新评估结果")
    @GetMapping("/user/latest/{userId}")
    @RequiresAuthentication
    public Response getUserLatestScales(
            @ApiParam(value = "用户ID", required = true) @PathVariable Long userId
    ) {
        return scaleAnalysisService.getUserLatestScales(userId);
    }

    @ApiOperation(value = "获取用户量表趋势", notes = "查看指定用户在某个量表上的评分变化趋势")
    @GetMapping("/trend/{scaleType}/{userId}")
    @RequiresAuthentication
    public Response getUserScaleTrend(
            @ApiParam(value = "量表类型", required = true) @PathVariable String scaleType,
            @ApiParam(value = "用户ID", required = true) @PathVariable Long userId,
            @ApiParam(value = "最近N条记录", example = "10") @RequestParam(defaultValue = "10") int limit
    ) {
        return scaleAnalysisService.getUserScaleTrend(scaleType, userId, limit);
    }

    @ApiOperation(value = "获取量表综合分析报告", notes = "基于用户所有量表结果生成智能分析报告")
    @GetMapping("/analysis/comprehensive/{userId}")
    @RequiresAuthentication
    public Response getComprehensiveAnalysis(
            @ApiParam(value = "用户ID", required = true) @PathVariable Long userId
    ) {
        return scaleAnalysisService.getComprehensiveAnalysis(userId);
    }

    @ApiOperation(value = "获取所有量表类型列表", notes = "返回系统支持的所有量表类型及其说明")
    @GetMapping("/types")
    @RequiresAuthentication
    public Response getScaleTypes() {
        return scaleAnalysisService.getScaleTypes();
    }

    @ApiOperation(value = "获取量表评分分布", notes = "统计指定量表不同分数段的记录数量")
    @GetMapping("/statistics/scoreDistribution")
    @RequiresAuthentication
    public Response getScaleScoreDistribution(
            @ApiParam(value = "量表类型", required = true) @RequestParam String scaleType,
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate
    ) {
        return scaleAnalysisService.getScaleScoreDistribution(scaleType, startDate, endDate);
    }

    @ApiOperation(value = "删除量表记录", notes = "根据量表类型和ID删除记录")
    @RequestMapping(value = "/delete/{scaleType}/{id}", method = {RequestMethod.POST, RequestMethod.DELETE})
    @RequiresAuthentication
    public Response deleteScale(
            @ApiParam(value = "量表类型", required = true) @PathVariable String scaleType,
            @ApiParam(value = "记录ID", required = true) @PathVariable Long id
    ) {
        return scaleAnalysisService.deleteScale(scaleType, id);
    }
}
