package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.DiaryAnalysisService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 日记分析控制器
 */
@Api(value = "日记分析管理")
@RestController
@RequestMapping("/diaryAnalysis")
public class DiaryAnalysisController {
    
    @Autowired
    private DiaryAnalysisService diaryAnalysisService;
    
    @ApiOperation(value = "获取日记列表（分页）")
    @GetMapping("/getDiaryList")
    @RequiresAuthentication
    public Response getDiaryList(@RequestParam(defaultValue = "1") int currentPage,
                                 @RequestParam(defaultValue = "15") int pageSize,
                                 @RequestParam(required = false) String keyword) {
        return diaryAnalysisService.getDiaryList(currentPage, pageSize, keyword);
    }
    
    @ApiOperation(value = "获取情绪统计（按风险等级）")
    @GetMapping("/getMoodStatistics")
    @RequiresAuthentication
    public Response getMoodStatistics() {
        return diaryAnalysisService.getMoodStatistics();
    }

    @ApiOperation(value = "删除日记记录")
    @RequestMapping(value = "/delete/{id}", method = {RequestMethod.POST, RequestMethod.DELETE})
    @RequiresAuthentication
    public Response deleteDiary(@PathVariable Long id) {
        return diaryAnalysisService.deleteDiary(id);
    }
}
