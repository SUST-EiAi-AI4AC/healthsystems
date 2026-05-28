package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.mapper.DiaryMapper;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 日记分析服务
 */
@Service
public class DiaryAnalysisService {
    
    @Autowired
    private DiaryMapper diaryMapper;
    
    /**
     * 获取日记列表（分页）
     */
    public Response getDiaryList(int currentPage, int pageSize, String keyword) {
        try {
            int offset = (currentPage - 1) * pageSize;
            List<Map<String, Object>> list;
            int totalCount;
            
            if (keyword != null && !keyword.trim().isEmpty()) {
                list = diaryMapper.searchDiaries(keyword, offset, pageSize);
                totalCount = diaryMapper.getSearchCount(keyword);
            } else {
                list = diaryMapper.getDiaryListWithUserInfo(offset, pageSize);
                totalCount = diaryMapper.getTotalCount();
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
            return Response.fail("获取日记列表失败：" + e.getMessage());
        }
    }
    
    /**
     * 获取情绪统计（按风险等级）
     */
    public Response getMoodStatistics() {
        try {
            Map<String, Object> statistics = diaryMapper.getMoodStatistics();
            return Response.success(statistics);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("获取情绪统计失败：" + e.getMessage());
        }
    }

    /**
     * 根据ID删除日记
     */
    public Response deleteDiary(Long id) {
        try {
            int rows = diaryMapper.deleteDiary(id);
            if (rows > 0) {
                return Response.success("删除成功");
            } else {
                return Response.fail("日记不存在或删除失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail("删除失败：" + e.getMessage());
        }
    }
}
