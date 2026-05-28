package com.nwpu.healthsystem.backend.mapper;

import com.nwpu.healthsystem.backend.entity.scale.HtpDrawingRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * HTP分析Mapper接口
 */
@Mapper
public interface HtpAnalysisMapper {

    /**
     * 统计HTP记录总数
     */
    int countHtpRecords(@Param("username") String username,
                        @Param("startDate") String startDate,
                        @Param("endDate") String endDate,
                        @Param("riskLevel") String riskLevel);

    /**
     * 分页查询HTP记录列表
     */
    List<HtpDrawingRecord> selectHtpList(@Param("offset") int offset,
                                         @Param("pageSize") int pageSize,
                                         @Param("username") String username,
                                         @Param("startDate") String startDate,
                                         @Param("endDate") String endDate,
                                         @Param("riskLevel") String riskLevel);

    /**
     * 根据ID查询HTP记录详情
     */
    HtpDrawingRecord selectHtpById(@Param("id") Long id);

    /**
     * 获取风险等级统计
     */
    List<Map<String, Object>> getRiskLevelStatistics(@Param("startDate") String startDate,
                                                      @Param("endDate") String endDate);

    /**
     * 获取评分分布统计
     */
    List<Map<String, Object>> getScoreDistribution(@Param("startDate") String startDate,
                                                    @Param("endDate") String endDate);

    /**
     * 查询用户HTP历史趋势
     */
    List<HtpDrawingRecord> selectUserHtpTrend(@Param("userId") Long userId,
                                              @Param("limit") int limit);

    /**
     * 根据ID删除记录
     */
    @org.apache.ibatis.annotations.Delete("DELETE FROM htp_drawing_record WHERE id = #{id}")
    int deleteHtp(@Param("id") Long id);
}
