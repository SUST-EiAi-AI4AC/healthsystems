package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.mapper.UserHealthInfoMapper;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 健康报告服务
 */
@Service
public class HealthReportService {
    
    @Autowired
    private UserHealthInfoMapper userHealthInfoMapper;
    
    /**
     * 获取健康报告列表（分页）
     */
    public Response getHealthReportList(int currentPage, int pageSize, String keyword) {
        try {
            int offset = (currentPage - 1) * pageSize;
            List<Map<String, Object>> list;
            int totalCount;
            
            if (keyword != null && !keyword.trim().isEmpty()) {
                list = userHealthInfoMapper.searchHealthReports(keyword, offset, pageSize);
                totalCount = userHealthInfoMapper.getSearchCount(keyword);
            } else {
                list = userHealthInfoMapper.getHealthReportList(offset, pageSize);
                totalCount = userHealthInfoMapper.getTotalCount();
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
            return Response.fail("获取健康报告列表失败：" + e.getMessage());
        }
    }
    
    /**
     * 获取抑郁风险等级统计
     */
    public Response getDepressionStatistics() {
        try {
            Map<String, Object> statistics = userHealthInfoMapper.getDepressionStatistics();
            return Response.success(statistics);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取抑郁统计失败：" + e.getMessage());
        }
    }
    
    /**
     * 获取用户的综合健康报告详情
     */
    public Response getUserHealthDetail(Long userId) {
        try {
            Map<String, Object> detail = userHealthInfoMapper.getUserHealthDetail(userId);
            return Response.success(detail);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取健康报告详情失败：" + e.getMessage());
        }
    }

    /**
     * 根据ID删除健康报告记录
     */
    public Response deleteHealthReport(Long id) {
        try {
            int rows = userHealthInfoMapper.deleteHealthReport(id);
            if (rows > 0) {
                return Response.success("删除成功");
            } else {
                return Response.fail("报告记录不存在或删除失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("删除失败：" + e.getMessage());
        }
    }
}
