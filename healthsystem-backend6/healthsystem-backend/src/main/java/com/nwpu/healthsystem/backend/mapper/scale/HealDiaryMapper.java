package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.HealDiary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 疗愈日记 Mapper 接口
 */
@Repository
public interface HealDiaryMapper {

    /**
     * 新增一条日记
     *
     * @param diary 日记实体（userId、content 等由 Service 层设置）
     * @return 影响行数，自增 id 会被回填至 diary.id
     */
    int insertDiary(HealDiary diary);

    /**
     * 更新日记（仅更新 content、moodScore、moodLabel、healActivity、gratitude、goalToday、goalAchieved、imageUrls、title）
     *
     * @param diary 日记实体（必须包含 id 和 userId 用于安全校验）
     * @return 影响行数
     */
    int updateDiary(HealDiary diary);

    /**
     * 逻辑/物理删除指定日记（只能删除本人日记）
     *
     * @param id     日记ID
     * @param userId 当前用户ID（安全校验）
     * @return 影响行数，0 表示不存在或无权限
     */
    int deleteDiary(@Param("id") long id, @Param("userId") long userId);

    /**
     * 查询当前用户的全部日记，按 log_date 降序、id 降序
     *
     * @param userId 用户ID
     * @return 日记列表
     */
    List<HealDiary> listDiariesByUser(@Param("userId") long userId);

    /**
     * 根据ID查询单条日记
     *
     * @param id 日记ID
     * @return 日记实体，不存在返回 null
     */
    HealDiary getDiaryById(@Param("id") long id);
}
