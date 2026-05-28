package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.lang.Assert;
import com.nwpu.healthsystem.backend.entity.scale.AiChatMessage;
import com.nwpu.healthsystem.backend.entity.scale.AiChatSession;
import com.nwpu.healthsystem.backend.mapper.scale.AiChatMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Slf4j
@Service
public class AiChatService {

    @Autowired
    private AiChatMapper aiChatMapper;

    // ================================================================
    // Session 相关
    // ================================================================

    /**
     * 新建一条聊天会话。
     * userId 由 Token 自动获取；title 默认"新对话"，后续随第一条消息保存后更新。
     *
     * @return 成功时 result 为新会话 id
     */
    public Response createSession() {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            AiChatSession session = new AiChatSession();
            session.setUserId(userId);
            session.setTitle("新对话");
            aiChatMapper.insertSession(session);
            return Response.success("会话创建成功", session.getId());
        } catch (Exception e) {
            log.error("[AiChat] 创建会话失败: {}", e.getMessage(), e);
            return Response.fail("创建会话失败: " + e.getMessage());
        }
    }

    /**
     * 获取当前用户的全部会话列表，按最后更新时间降序。
     *
     * @return 会话列表
     */
    public Response listSessions() {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            List<AiChatSession> list = aiChatMapper.listSessionsByUser(userId);
            return Response.success(list);
        } catch (Exception e) {
            log.error("[AiChat] 获取会话列表失败: {}", e.getMessage(), e);
            return Response.fail("获取会话列表失败: " + e.getMessage());
        }
    }

    /**
     * 删除指定会话（仅限本人）。
     * 数据库外键 CASCADE，消息会随之自动删除。
     *
     * @param sessionId 会话ID
     * @return 删除结果
     */
    public Response deleteSession(long sessionId) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            AiChatSession session = aiChatMapper.getSessionById(sessionId);
            Assert.notNull(session, "会话不存在，id=" + sessionId);
            Assert.isTrue(session.getUserId() == userId, "无权限删除他人的会话");

            aiChatMapper.deleteSession(sessionId);
            return Response.success("会话删除成功", null);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[AiChat] 删除会话失败，sessionId={}: {}", sessionId, e.getMessage(), e);
            return Response.fail("删除会话失败: " + e.getMessage());
        }
    }

    // ================================================================
    // Message 相关
    // ================================================================

    /**
     * 批量保存消息到指定会话，并自动更新会话标题（若为首条用户消息）和 updated_at。
     * <p>
     * 前端传入结构：{sessionId, messages:[{role, content, msgType},...]}
     * </p>
     *
     * @param sessionId 会话ID
     * @param messages  消息列表（role/content/msgType 由前端提供；sessionId/userId 由 Service 注入）
     * @return 操作结果
     */
    @Transactional
    public Response saveMessages(long sessionId, List<AiChatMessage> messages) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();

            // 安全校验：会话必须属于当前用户
            AiChatSession session = aiChatMapper.getSessionById(sessionId);
            Assert.notNull(session, "会话不存在，id=" + sessionId);
            Assert.isTrue(session.getUserId() == userId, "无权限向他人会话写入消息");

            if (messages == null || messages.isEmpty()) {
                return Response.fail("消息列表不能为空");
            }

            // 注入 sessionId 和 userId；确保 msgType 有默认值
            for (AiChatMessage msg : messages) {
                msg.setSessionId(sessionId);
                msg.setUserId(userId);
                if (msg.getMsgType() == null || msg.getMsgType().isEmpty()) {
                    msg.setMsgType("text");
                }
            }

            aiChatMapper.batchInsertMessages(messages);

            // 若会话标题仍为默认，取第一条用户消息前 20 字作为新标题
            if ("新对话".equals(session.getTitle())) {
                messages.stream()
                        .filter(m -> "user".equals(m.getRole()) && m.getContent() != null && !m.getContent().isEmpty())
                        .findFirst()
                        .ifPresent(firstUser -> {
                            String newTitle = firstUser.getContent().length() > 20
                                    ? firstUser.getContent().substring(0, 20) + "..."
                                    : firstUser.getContent();
                            aiChatMapper.updateSessionTitle(sessionId, newTitle);
                        });
            }

            // 刷新 updated_at
            aiChatMapper.touchSession(sessionId);

            return Response.success("消息保存成功", null);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[AiChat] 保存消息失败，sessionId={}: {}", sessionId, e.getMessage(), e);
            return Response.fail("保存消息失败: " + e.getMessage());
        }
    }

    /**
     * 获取某会话的全部消息（仅限本人）。
     *
     * @param sessionId 会话ID
     * @return 消息列表（按时间升序）
     */
    public Response listMessages(long sessionId) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            AiChatSession session = aiChatMapper.getSessionById(sessionId);
            Assert.notNull(session, "会话不存在，id=" + sessionId);
            Assert.isTrue(session.getUserId() == userId, "无权限查看他人的会话消息");

            List<AiChatMessage> messages = aiChatMapper.listMessagesBySession(sessionId);
            return Response.success(messages);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("[AiChat] 获取消息列表失败，sessionId={}: {}", sessionId, e.getMessage(), e);
            return Response.fail("获取消息列表失败: " + e.getMessage());
        }
    }
}
