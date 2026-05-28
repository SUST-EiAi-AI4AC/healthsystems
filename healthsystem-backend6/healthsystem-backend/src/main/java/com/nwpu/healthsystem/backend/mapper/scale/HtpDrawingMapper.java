package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.HtpDrawingRecord;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;


@Repository
public interface HtpDrawingMapper {

    /**
     * 新增一条 HTP 绘画记录
     *
     * @param record 绘画记录实体（userId、logDate 由 Service 层注入）
     * @return 影响行数
     */
    int insertRecord(HtpDrawingRecord record);

    /**
     * 更新已有记录（支持补充/修改图片路径、报告、评分等全部字段）
     *
     * @param record 包含 id 的绘画记录实体
     * @return 影响行数
     */
    int updateRecord(HtpDrawingRecord record);

    /**
     * 仅更新图片路径（图片上传完成后回填）
     *
     * @param id            记录ID
     * @param drawingImgUrl 绘画图片路径
     * @return 影响行数
     */
    int updateImageUrl(@Param("id") long id, @Param("drawingImgUrl") String drawingImgUrl);

    /**
     * 分页 + 多条件查询当前用户的历史记录
     *
     * @param userId    用户ID
     * @param pageInfo  分页参数（startIndex、totalSelect 由 pageInfo.count() 计算）
     * @param startDate 起始日期（可为 null，表示不限）
     * @param endDate   结束日期（可为 null，表示不限）
     * @param minScore  最低综合评分（可为 null，表示不限）
     * @param maxScore  最高综合评分（可为 null，表示不限）
     * @return 记录列表
     */
    List<HtpDrawingRecord> getListByPage(@Param("userId") long userId,
                                         @Param("pageInfo") PageInfo pageInfo,
                                         @Param("startDate") Date startDate,
                                         @Param("endDate") Date endDate,
                                         @Param("minScore") Integer minScore,
                                         @Param("maxScore") Integer maxScore);

    /**
     * 统计满足条件的总记录数（配合分页使用）
     *
     * @param userId    用户ID
     * @param startDate 起始日期（可为 null）
     * @param endDate   结束日期（可为 null）
     * @param minScore  最低评分（可为 null）
     * @param maxScore  最高评分（可为 null）
     * @return 总记录数
     */
    int countByCondition(@Param("userId") long userId,
                         @Param("startDate") Date startDate,
                         @Param("endDate") Date endDate,
                         @Param("minScore") Integer minScore,
                         @Param("maxScore") Integer maxScore);

    /**
     * 根据记录ID查询单条记录（含关联用户名）
     *
     * @param id 记录ID
     * @return 绘画记录，若不存在返回 null
     */
    HtpDrawingRecord getById(@Param("id") long id);

    /**
     * 查询所有用户的绘画记录（医生/管理员端使用），联表获取用户名
     *
     * @return 全量记录列表，按创建时间倒序
     */
    List<HtpDrawingRecord> getAllData();
}
