package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.entity.scale.AiChatMessage;
import com.nwpu.healthsystem.backend.mapper.AiChatMessageMapper;
import com.nwpu.healthsystem.backend.mapper.AiChatSessionMapper;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * AI聊天分析服务
 */
@Service
public class AiChatAnalysisService {
    
    @Autowired
    private AiChatSessionMapper sessionMapper;
    
    @Autowired
    private AiChatMessageMapper messageMapper;
    
    /**
     * 获取AI聊天会话列表（分页）
     */
    public Response getSessionList(int currentPage, int pageSize, String keyword) {
        try {
            int offset = (currentPage - 1) * pageSize;
            List<Map<String, Object>> list;
            int totalCount;
            
            if (keyword != null && !keyword.trim().isEmpty()) {
                list = sessionMapper.searchSessions(keyword, offset, pageSize);
                totalCount = sessionMapper.getSearchCount(keyword);
            } else {
                list = sessionMapper.getSessionListWithUserInfo(offset, pageSize);
                totalCount = sessionMapper.getTotalCount();
            }
            
            PageInfo pageInfo = new PageInfo(currentPage, pageSize);
            pageInfo.setTotalNumber(totalCount);
            pageInfo.count();
            
            Map<String, Object> result = new HashMap<>();
            result.put("data", list);
            result.put("pageInfo", pageInfo);
            
            return Response.success(result);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取AI聊天会话列表失败：" + e.getMessage());
        }
    }
    
    /**
     * 获取会话的消息详情
     */
    public Response getSessionMessages(Long sessionId) {
        try {
            List<AiChatMessage> messages = messageMapper.getMessagesBySessionId(sessionId);
            return Response.success(messages);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取消息详情失败：" + e.getMessage());
        }
    }
    
    /**
     * 获取情感分析统计
     */
    public Response getEmotionStatistics() {
        try {
            Map<String, Object> statistics = messageMapper.getEmotionStatistics();
            return Response.success(statistics);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取情感统计失败：" + e.getMessage());
        }
    }

    /**
     * 删除会话及其关联消息
     */
    @org.springframework.transaction.annotation.Transactional
    public Response deleteSession(Long sessionId) {
        try {
            messageMapper.deleteMessagesBySessionId(sessionId);
            int rows = sessionMapper.deleteSession(sessionId);
            if (rows > 0) {
                return Response.success("删除成功");
            } else {
                return Response.fail("会话不存在或删除失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("删除失败：" + e.getMessage());
        }
    }
}
