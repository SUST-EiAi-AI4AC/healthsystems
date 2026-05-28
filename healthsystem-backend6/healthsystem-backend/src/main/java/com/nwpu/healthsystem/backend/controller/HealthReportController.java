package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.HealthReportService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 健康报告控制器
 */
@Api(value = "健康报告管理")
@RestController
@RequestMapping("/healthReport")
public class HealthReportController {
    
    @Autowired
    private HealthReportService healthReportService;
    
    @ApiOperation(value = "获取健康报告列表（分页）")
    @GetMapping("/getHealthReportList")
    @RequiresAuthentication
    public Response getHealthReportList(@RequestParam(defaultValue = "1") int currentPage,
                                        @RequestParam(defaultValue = "15") int pageSize,
                                        @RequestParam(required = false) String keyword) {
        return healthReportService.getHealthReportList(currentPage, pageSize, keyword);
    }
    
    @ApiOperation(value = "获取抑郁风险等级统计")
    @GetMapping("/getDepressionStatistics")
    @RequiresAuthentication
    public Response getDepressionStatistics() {
        return healthReportService.getDepressionStatistics();
    }
    
    @ApiOperation(value = "获取用户的综合健康报告详情")
    @GetMapping("/getUserHealthDetail")
    @RequiresAuthentication
    public Response getUserHealthDetail(@RequestParam Long userId) {
        return healthReportService.getUserHealthDetail(userId);
    }

    @ApiOperation(value = "删除健康报告记录")
    @RequestMapping(value = "/delete/{id}", method = {RequestMethod.POST, RequestMethod.DELETE})
    @RequiresAuthentication
    public Response deleteHealthReport(@PathVariable Long id) {
        return healthReportService.deleteHealthReport(id);
    }
}
