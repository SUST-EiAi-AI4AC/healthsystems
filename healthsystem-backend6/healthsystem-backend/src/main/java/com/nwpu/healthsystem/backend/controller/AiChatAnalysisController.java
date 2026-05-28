package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.AiChatAnalysisService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * AI聊天分析控制器
 */
@Api(value = "AI聊天分析管理")
@RestController
@RequestMapping("/aiChatAnalysis")
public class AiChatAnalysisController {
    
    @Autowired
    private AiChatAnalysisService aiChatAnalysisService;
    
    @ApiOperation(value = "获取AI聊天会话列表（分页）")
    @GetMapping("/getSessionList")
    @RequiresAuthentication
    public Response getSessionList(@RequestParam(defaultValue = "1") int currentPage,
                                    @RequestParam(defaultValue = "15") int pageSize,
                                    @RequestParam(required = false) String keyword) {
        return aiChatAnalysisService.getSessionList(currentPage, pageSize, keyword);
    }
    
    @ApiOperation(value = "获取会话的消息详情")
    @GetMapping("/getSessionMessages")
    @RequiresAuthentication
    public Response getSessionMessages(@RequestParam Long sessionId) {
        return aiChatAnalysisService.getSessionMessages(sessionId);
    }
    
    @ApiOperation(value = "获取情感分析统计")
    @GetMapping("/getEmotionStatistics")
    @RequiresAuthentication
    public Response getEmotionStatistics() {
        return aiChatAnalysisService.getEmotionStatistics();
    }

    @ApiOperation(value = "删除会话")
    @RequestMapping(value = "/delete/{id}", method = {RequestMethod.POST, RequestMethod.DELETE})
    @RequiresAuthentication
    public Response deleteSession(@PathVariable Long id) {
        return aiChatAnalysisService.deleteSession(id);
    }
}
