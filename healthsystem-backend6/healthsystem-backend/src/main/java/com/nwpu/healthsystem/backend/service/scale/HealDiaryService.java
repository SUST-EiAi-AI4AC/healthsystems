package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.lang.Assert;
import com.nwpu.healthsystem.backend.entity.scale.HealDiary;
import com.nwpu.healthsystem.backend.mapper.scale.HealDiaryMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 疗愈日记业务逻辑层
 */
@Slf4j
@Service
public class HealDiaryService {

    @Autowired
    private HealDiaryMapper healDiaryMapper;

    /**
     * 新增一条日记。
     * userId 由 Token 自动获取。
     *
     * @param params 前端传入的 JSON 参数（content 必填，其余选填）
     * @return 成功时 result 为新日记 id
     */
    @Transactional
    public Response saveDiary(Map<String, Object> params) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            Object contentObj = params.get("content");
            Assert.notNull(contentObj, "日记内容不能为空");
            String content = contentObj.toString().trim();
            Assert.notEmpty(content, "日记内容不能为空");

            HealDiary diary = new HealDiary();
            diary.setUserId(userId);
            diary.setContent(content);

            Object moodScoreObj = params.get("moodScore");
            if (moodScoreObj != null) {
                try { diary.setMoodScore(Integer.parseInt(moodScoreObj.toString())); } catch (NumberFormatException ignored) {}
            }

            Object moodLabelObj = params.get("moodLabel");
            diary.setMoodLabel(moodLabelObj != null ? moodLabelObj.toString() : null);

            Object imageUrlsObj = params.get("imageUrls");
            diary.setImageUrls(imageUrlsObj != null ? imageUrlsObj.toString() : "[]");

            // isPrivate 默认为 1（私密）
            Object isPrivateObj = params.get("isPrivate");
            diary.setIsPrivate(isPrivateObj != null ? Integer.parseInt(isPrivateObj.toString()) : 1);

            healDiaryMapper.insertDiary(diary);
            return Response.success("日记保存成功", diary.getId());
        } catch (IllegalArgumentException e) {
            return Response.fail(e.getMessage());
        } catch (Exception e) {
            log.error("[HealDiary] 新增日记失败: {}", e.getMessage(), e);
            return Response.fail("新增日记失败: " + e.getMessage());
        }
    }

    /**
     * 更新指定日记（仅限本人）。
     *
     * @param id     日记ID
     * @param params 前端传入的更新参数
     * @return 操作结果
     */
    @Transactional
    public Response updateDiary(long id, Map<String, Object> params) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            HealDiary existing = healDiaryMapper.getDiaryById(id);
            Assert.notNull(existing, "日记不存在，id=" + id);
            Assert.isTrue(existing.getUserId().longValue() == userId, "无权限修改他人的日记");

            Object contentObj = params.get("content");
            Assert.notNull(contentObj, "日记内容不能为空");
            String content = contentObj.toString().trim();
            Assert.notEmpty(content, "日记内容不能为空");

            HealDiary diary = new HealDiary();
            diary.setId(id);
            diary.setUserId(userId);
            diary.setContent(content);

            Object moodScoreObj = params.get("moodScore");
            if (moodScoreObj != null) {
                try { diary.setMoodScore(Integer.parseInt(moodScoreObj.toString())); } catch (NumberFormatException ignored) {}
            } else {
                diary.setMoodScore(existing.getMoodScore());
            }

            Object moodLabelObj = params.get("moodLabel");
            diary.setMoodLabel(moodLabelObj != null ? moodLabelObj.toString() : existing.getMoodLabel());

            Object imageUrlsObj = params.get("imageUrls");
            diary.setImageUrls(imageUrlsObj != null ? imageUrlsObj.toString() : existing.getImageUrls());

            int rows = healDiaryMapper.updateDiary(diary);
            if (rows == 0) {
                return Response.fail("更新失败，日记不存在或无权限");
            }
            return Response.success("日记更新成功", null);
        } catch (IllegalArgumentException e) {
            return Response.fail(e.getMessage());
        } catch (Exception e) {
            log.error("[HealDiary] 更新日记失败，id={}: {}", id, e.getMessage(), e);
            return Response.fail("更新日记失败: " + e.getMessage());
        }
    }

    /**
     * 删除指定日记（仅限本人）。
     *
     * @param id 日记ID
     * @return 操作结果
     */
    @Transactional
    public Response deleteDiary(long id) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            HealDiary existing = healDiaryMapper.getDiaryById(id);
            Assert.notNull(existing, "日记不存在，id=" + id);
            Assert.isTrue(existing.getUserId().longValue() == userId, "无权限删除他人的日记");

            int rows = healDiaryMapper.deleteDiary(id, userId);
            if (rows == 0) {
                return Response.fail("删除失败，日记不存在或无权限");
            }
            return Response.success("日记删除成功", null);
        } catch (IllegalArgumentException e) {
            return Response.fail(e.getMessage());
        } catch (Exception e) {
            log.error("[HealDiary] 删除日记失败，id={}: {}", id, e.getMessage(), e);
            return Response.fail("删除日记失败: " + e.getMessage());
        }
    }

    /**
     * 获取当前用户的全部日记列表，按日期降序。
     *
     * @return 日记列表
     */
    public Response listDiaries() {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            List<HealDiary> list = healDiaryMapper.listDiariesByUser(userId);
            return Response.success(list);
        } catch (Exception e) {
            log.error("[HealDiary] 获取日记列表失败: {}", e.getMessage(), e);
            return Response.fail("获取日记列表失败: " + e.getMessage());
        }
    }
}
