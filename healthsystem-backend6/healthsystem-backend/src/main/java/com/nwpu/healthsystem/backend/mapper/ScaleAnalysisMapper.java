package com.nwpu.healthsystem.backend.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 量表分析Mapper接口
 */
@Mapper
public interface ScaleAnalysisMapper {

    /**
     * 统计量表记录总数
     */
    int countScaleRecords(@Param("tableName") String tableName,
                          @Param("scaleType") String scaleType,
                          @Param("username") String username,
                          @Param("startDate") String startDate,
                          @Param("endDate") String endDate,
                          @Param("riskLevel") String riskLevel);

    /**
     * 分页查询量表记录列表
     */
    List<Map<String, Object>> selectScaleList(@Param("tableName") String tableName,
                                               @Param("scaleType") String scaleType,
                                               @Param("offset") int offset,
                                               @Param("pageSize") int pageSize,
                                               @Param("username") String username,
                                               @Param("startDate") String startDate,
                                               @Param("endDate") String endDate,
                                               @Param("riskLevel") String riskLevel);

    /**
     * 根据ID查询量表记录详情
     */
    Map<String, Object> selectScaleById(@Param("tableName") String tableName,
                                        @Param("id") Long id);

    /**
     * 获取量表风险等级统计
     */
    List<Map<String, Object>> getScaleRiskStatistics(@Param("tableName") String tableName,
                                                      @Param("scaleType") String scaleType,
                                                      @Param("startDate") String startDate,
                                                      @Param("endDate") String endDate);

    /**
     * 查询用户最新量表记录
     */
    Map<String, Object> selectUserLatestScale(@Param("tableName") String tableName,
                                               @Param("userId") Long userId);

    /**
     * 查询用户量表历史趋势
     */
    List<Map<String, Object>> selectUserScaleTrend(@Param("tableName") String tableName,
                                                    @Param("userId") Long userId,
                                                    @Param("limit") int limit);

    /**
     * 获取量表评分分布统计
     */
    List<Map<String, Object>> getScaleScoreDistribution(@Param("tableName") String tableName,
                                                         @Param("startDate") String startDate,
                                                         @Param("endDate") String endDate);

    /**
     * 根据ID删除量表记录
     */
    @org.apache.ibatis.annotations.Delete("DELETE FROM ${tableName} WHERE id = #{id}")
    int deleteScale(@Param("tableName") String tableName, @Param("id") Long id);
}
