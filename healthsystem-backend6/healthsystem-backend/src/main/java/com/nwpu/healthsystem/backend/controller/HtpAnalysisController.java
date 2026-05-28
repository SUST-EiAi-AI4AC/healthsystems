package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.HtpAnalysisService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * HTP房树人分析控制器
 * 提供HTP绘画记录的查询、统计和分析功能
 */
@Api(value = "HTP房树人分析", tags = "HTP房树人分析模块")
@RestController
@RequestMapping("/htp")
public class HtpAnalysisController {

    @Autowired
    private HtpAnalysisService htpAnalysisService;

    @ApiOperation(value = "分页查询HTP记录列表", notes = "支持按用户名、日期范围、风险等级筛选")
    @GetMapping("/list")
    @RequiresAuthentication
    public Response getHtpList(
            @ApiParam(value = "当前页码", example = "1") @RequestParam(defaultValue = "1") int currentPage,
            @ApiParam(value = "每页数量", example = "15") @RequestParam(defaultValue = "15") int pageSize,
            @ApiParam(value = "用户名（模糊查询）") @RequestParam(required = false) String username,
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate,
            @ApiParam(value = "风险等级：normal-正常, mild-轻度, moderate-中度, severe-重度") @RequestParam(required = false) String riskLevel
    ) {
        return htpAnalysisService.getHtpList(currentPage, pageSize, username, startDate, endDate, riskLevel);
    }

    @ApiOperation(value = "获取HTP记录详情", notes = "包含完整的AI分析报告和图片URL")
    @GetMapping("/detail/{id}")
    @RequiresAuthentication
    public Response getHtpDetail(
            @ApiParam(value = "HTP记录ID", required = true) @PathVariable Long id
    ) {
        return htpAnalysisService.getHtpDetail(id);
    }

    @ApiOperation(value = "获取HTP风险等级统计", notes = "统计各风险等级的人数和占比")
    @GetMapping("/statistics/riskLevel")
    @RequiresAuthentication
    public Response getRiskLevelStatistics(
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate
    ) {
        return htpAnalysisService.getRiskLevelStatistics(startDate, endDate);
    }

    @ApiOperation(value = "获取HTP评分分布统计", notes = "统计不同分数段的记录数量")
    @GetMapping("/statistics/scoreDistribution")
    @RequiresAuthentication
    public Response getScoreDistribution(
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate
    ) {
        return htpAnalysisService.getScoreDistribution(startDate, endDate);
    }

    @ApiOperation(value = "获取用户HTP历史趋势", notes = "查看指定用户的HTP评分变化趋势")
    @GetMapping("/trend/{userId}")
    @RequiresAuthentication
    public Response getUserHtpTrend(
            @ApiParam(value = "用户ID", required = true) @PathVariable Long userId,
            @ApiParam(value = "最近N条记录", example = "10") @RequestParam(defaultValue = "10") int limit
    ) {
        return htpAnalysisService.getUserHtpTrend(userId, limit);
    }

    @ApiOperation(value = "删除HTP记录", notes = "根据ID删除HTP绘画记录")
    @RequestMapping(value = "/delete/{id}", method = {RequestMethod.POST, RequestMethod.DELETE})
    @RequiresAuthentication
    public Response deleteHtp(@ApiParam(value = "记录ID", required = true) @PathVariable Long id) {
        return htpAnalysisService.deleteHtp(id);
    }
}
