package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.lang.Assert;
import com.nwpu.healthsystem.backend.entity.scale.HtpDrawingRecord;
import com.nwpu.healthsystem.backend.mapper.scale.HtpDrawingMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;


@Slf4j
@Service
public class HtpDrawingService {

    @Autowired
    private HtpDrawingMapper htpDrawingMapper;

    /**
     * 保存一条新的 HTP 绘画记录。
     * userId 从当前登录 Token 中自动获取；logDate 自动设置为当天。
     *
     * @param record 前端传入的绘画记录（score、houseScore、treeScore、personScore、reportContent 必填；图片路径可为空，后续通过 updateImageUrls 补填）
     * @return 成功时返回新记录的 id；失败时返回错误信息
     */
    public Response saveRecord(HtpDrawingRecord record) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            record.setUserId(userId);
            // 自动设置绘画日期为当天
            record.setLogDate(new Date(System.currentTimeMillis()));

            int rows = htpDrawingMapper.insertRecord(record);
            if (rows <= 0) {
                return Response.fail("保存绘画记录失败，数据库未写入");
            }
            // useGeneratedKeys=true，record.id 已被回填
            return Response.success("绘画记录保存成功", record.getId());
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[HTP] 保存绘画记录失败，原因: {}", e.getMessage(), e);
            return Response.fail("保存绘画记录失败: " + e.getMessage());
        }
    }

    /**
     * 更新已有绘画记录（支持修改全部字段，包括报告、评分、图片路径）。
     * 安全校验：只允许操作本人记录（userId 与 Token 一致）。
     *
     * @param record 含 id 的更新实体
     * @return 更新结果
     */
    public Response updateRecord(HtpDrawingRecord record) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            record.setUserId(userId);

            int rows = htpDrawingMapper.updateRecord(record);
            if (rows <= 0) {
                return Response.fail("更新失败，记录不存在或无权限");
            }
            return Response.success("绘画记录更新成功", null);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[HTP] 更新绘画记录失败，id={}, 原因: {}", record.getId(), e.getMessage(), e);
            return Response.fail("更新绘画记录失败: " + e.getMessage());
        }
    }

    /**
     * 仅回填图片路径（图片上传成功后调用）。
     * 安全校验：先查询记录归属，确认属于当前登录用户。
     *
     * @param id            记录ID
     * @param drawingImgUrl 绘画图片服务器路径
     * @return 更新结果
     */
    public Response updateImageUrl(long id, String drawingImgUrl) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            // 安全校验：该记录必须属于当前用户
            HtpDrawingRecord existing = htpDrawingMapper.getById(id);
            Assert.notNull(existing, "记录不存在，id=" + id);
            Assert.isTrue(existing.getUserId() == userId, "无权限修改他人的绘画记录");

            int rows = htpDrawingMapper.updateImageUrl(id, drawingImgUrl);
            if (rows <= 0) {
                return Response.fail("图片路径更新失败");
            }
            return Response.success("图片路径更新成功", null);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[HTP] 更新图片路径失败，id={}, 原因: {}", id, e.getMessage(), e);
            return Response.fail("更新图片路径失败: " + e.getMessage());
        }
    }

    /**
     * 分页 + 多条件查询当前用户的历史绘画记录。
     *
     * @param currentPage 当前页（从 1 开始）
     * @param pageSize    每页条数
     * @param startDate   起始日期（可为 null）
     * @param endDate     结束日期（可为 null）
     * @param minScore    最低综合评分（可为 null）
     * @param maxScore    最高综合评分（可为 null）
     * @return 分页结果（含 pageInfo 和 data 列表）
     */
    public Response getList(int currentPage, int pageSize,
                            Date startDate, Date endDate,
                            Integer minScore, Integer maxScore) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            // 统计总数（用于分页计算）
            int total = htpDrawingMapper.countByCondition(userId, startDate, endDate, minScore, maxScore);

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);
            pageInfo.setTotalNumber(total);
            pageInfo.count();

            List<HtpDrawingRecord> records = htpDrawingMapper.getListByPage(
                    userId, pageInfo, startDate, endDate, minScore, maxScore);

            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", records)
                    .map());
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[HTP] 查询历史记录失败，原因: {}", e.getMessage(), e);
            return Response.fail("查询历史记录失败: " + e.getMessage());
        }
    }

    /**
     * 根据记录ID查询单条绘画记录（含用户名）。
     * 安全校验：只允许查看本人记录（医生/管理员角色可跳过此限制，在 Controller 层控制）。
     *
     * @param id 记录ID
     * @return 单条绘画记录
     */
    public Response getById(long id) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            HtpDrawingRecord record = htpDrawingMapper.getById(id);
            if (record == null) {
                return Response.fail("记录不存在，id=" + id);
            }

            // 普通用户：只能查看自己的记录；医生/管理员可查看所有
            boolean isDoctor = AccountCheckUtil.checkHasRole("1") || AccountCheckUtil.checkHasRole("2");
            if (!isDoctor && record.getUserId() != userId) {
                return Response.fail(403, "无权限查看他人的绘画记录", null);
            }

            return Response.success(record);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[HTP] 查询单条记录失败，id={}, 原因: {}", id, e.getMessage(), e);
            return Response.fail("查询记录失败: " + e.getMessage());
        }
    }

    /**
     * 查询全量绘画记录（医生/管理员端使用），含用户名，按时间倒序。
     *
     * @return 全量记录列表
     */
    public Response getAllData() {
        try {
            List<HtpDrawingRecord> allData = htpDrawingMapper.getAllData();
            return Response.success(allData);
        } catch (Exception e) {
            log.error("[HTP] 查询全量数据失败，原因: {}", e.getMessage(), e);
            return Response.fail("查询全量数据失败: " + e.getMessage());
        }
    }
}
