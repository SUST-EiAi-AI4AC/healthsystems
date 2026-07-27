package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.GarminAnalysisService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Garmin 生理数据智能分析控制器
 * 提供基于 activity 表数据的全量指标可视化分析与健康诊断建议
 */
@Api(value = "Garmin生理数据分析", tags = "Garmin生理数据分析模块")
@RestController
@RequestMapping("/garminAnalysis")
public class GarminAnalysisController {

    @Autowired
    private GarminAnalysisService garminAnalysisService;

    @ApiOperation(value = "分页查询 Garmin 生理数据记录列表", notes = "支持按用户名/邮箱、日期范围、风险等级筛选")
    @GetMapping("/list")
    @RequiresAuthentication
    public Response getGarminList(
            @ApiParam(value = "当前页码", example = "1") @RequestParam(defaultValue = "1") int currentPage,
            @ApiParam(value = "每页数量", example = "15") @RequestParam(defaultValue = "15") int pageSize,
            @ApiParam(value = "用户名或邮箱（模糊查询）") @RequestParam(required = false) String username,
            @ApiParam(value = "开始日期 yyyy-MM-dd") @RequestParam(required = false) String startDate,
            @ApiParam(value = "结束日期 yyyy-MM-dd") @RequestParam(required = false) String endDate,
            @ApiParam(value = "风险等级：normal-正常, mild-轻度, moderate-中度, severe-重度") @RequestParam(required = false) String riskLevel
    ) {
        return garminAnalysisService.getGarminList(currentPage, pageSize, username, startDate, endDate, riskLevel);
    }

    @ApiOperation(value = "获取单条 Garmin 生理数据智能分析报告", notes = "包含 94 项指标分析、健康打分与多维度专家建议")
    @GetMapping("/detail/{id}")
    @RequiresAuthentication
    public Response getGarminDetail(
            @ApiParam(value = "记录ID", required = true) @PathVariable Long id
    ) {
        return garminAnalysisService.getGarminDetail(id);
    }

    @ApiOperation(value = "获取 Garmin 生理数据总体宏观统计", notes = "统计平均静息心率、平均睡眠、步数与电量恢复指标")
    @GetMapping("/statistics")
    @RequiresAuthentication
    public Response getStatistics() {
        return garminAnalysisService.getStatistics();
    }

    @ApiOperation(value = "获取用户历史趋势", notes = "查看指定用户的历史 Garmin 指标变化")
    @GetMapping("/trend")
    @RequiresAuthentication
    public Response getUserTrend(
            @ApiParam(value = "用户邮箱", required = true) @RequestParam String email,
            @ApiParam(value = "最近N条", example = "7") @RequestParam(defaultValue = "7") int limit
    ) {
        return garminAnalysisService.getUserTrend(email, limit);
    }

    @ApiOperation(value = "删除 Garmin 生理记录", notes = "根据ID删除 activity 记录")
    @RequestMapping(value = "/delete/{id}", method = {RequestMethod.POST, RequestMethod.DELETE})
    @RequiresAuthentication
    public Response deleteGarmin(@ApiParam(value = "记录ID", required = true) @PathVariable Long id) {
        return garminAnalysisService.deleteGarmin(id);
    }
}
