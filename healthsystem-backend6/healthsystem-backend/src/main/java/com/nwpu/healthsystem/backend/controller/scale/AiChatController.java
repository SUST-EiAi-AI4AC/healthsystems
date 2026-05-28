package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.entity.scale.AiChatMessage;
import com.nwpu.healthsystem.backend.service.scale.AiChatService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * AI 心晴聊天历史记录接口
 *
 * <p>
 * 典型前端调用流程：
 * </p>
 * <ol>
 * <li>用户点击"保存当前对话"时，先调用 {@code POST /ai-chat/session/create} 获得 sessionId</li>
 * <li>调用 {@code POST /ai-chat/message/save} 将 chatMessages 批量写入</li>
 * <li>点击"历史对话"按钮时调用 {@code GET /ai-chat/session/list} 获取会话列表</li>
 * <li>点击某条会话时调用 {@code GET /ai-chat/message/list?sessionId=} 还原消息</li>
 * <li>删除某条会话调用 {@code DELETE /ai-chat/session/{id}}</li>
 * </ol>
 */
@Api(value = "AI心晴聊天历史记录")
@RestController
@RequestMapping("/ai-chat")
public class AiChatController {

    @Autowired
    private AiChatService aiChatService;

    // ================================================================
    // Session 接口
    // ================================================================

    @ApiOperation(value = "新建聊天会话", notes = "创建一条新的聊天会话，返回 sessionId。userId 由 Token 自动获取，无需前端传入。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "创建成功，result 为新会话 id"),
            @ApiResponse(code = 400, message = "创建失败")
    })
    @PostMapping("/session/create")
    @RequiresAuthentication
    public Response createSession() {
        return aiChatService.createSession();
    }

    @ApiOperation(value = "获取当前用户的全部会话列表", notes = "按最后更新时间降序返回当前登录用户的所有聊天会话。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功"),
            @ApiResponse(code = 400, message = "查询失败")
    })
    @GetMapping("/session/list")
    @RequiresAuthentication
    public Response listSessions() {
        return aiChatService.listSessions();
    }

    @ApiOperation(value = "删除指定聊天会话", notes = "删除指定 id 的会话及其所有消息（外键 CASCADE）。只能删除本人会话。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "删除成功"),
            @ApiResponse(code = 400, message = "删除失败，会话不存在或无权限")
    })
    @DeleteMapping("/session/{id}")
    @RequiresAuthentication
    public Response deleteSession(
            @ApiParam(value = "会话ID", required = true) @PathVariable long id) {
        return aiChatService.deleteSession(id);
    }

    // ================================================================
    // Message 接口
    // ================================================================

    @ApiOperation(value = "批量保存消息到指定会话",
            notes = "将前端的 chatMessages 列表批量写入指定会话。\n" +
                    "请求体示例：{\"sessionId\": 1, \"messages\": [{\"role\":\"user\",\"content\":\"你好\",\"msgType\":\"text\"}, ...]}\n" +
                    "若会话标题仍为\"新对话\"，自动取第一条用户消息前 20 字更新标题。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "保存成功"),
            @ApiResponse(code = 400, message = "保存失败")
    })
    @PostMapping("/message/save")
    @RequiresAuthentication
    public Response saveMessages(@RequestBody Map<String, Object> body) {
        // 从 body 中解析 sessionId 和 messages
        Object sessionIdObj = body.get("sessionId");
        Object messagesObj  = body.get("messages");

        if (sessionIdObj == null || messagesObj == null) {
            return Response.fail("参数缺失：sessionId 和 messages 均为必填");
        }

        long sessionId;
        try {
            sessionId = Long.parseLong(sessionIdObj.toString());
        } catch (NumberFormatException e) {
            return Response.fail("sessionId 格式错误，必须为整数");
        }

        if (!(messagesObj instanceof List)) {
            return Response.fail("messages 必须为数组格式");
        }

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> rawList = (List<Map<String, Object>>) messagesObj;
        if (rawList.isEmpty()) {
            return Response.fail("messages 不能为空");
        }

        java.util.List<AiChatMessage> messages = new java.util.ArrayList<>();
        for (Map<String, Object> item : rawList) {
            AiChatMessage msg = new AiChatMessage();
            Object role    = item.get("role");
            Object content = item.get("content");
            Object msgType = item.get("msgType");

            if (role == null || content == null) {
                return Response.fail("每条消息必须包含 role 和 content 字段");
            }
            msg.setRole(role.toString());
            msg.setContent(content.toString());
            msg.setMsgType(msgType != null ? msgType.toString() : "text");
            messages.add(msg);
        }

        return aiChatService.saveMessages(sessionId, messages);
    }

    @ApiOperation(value = "获取指定会话的全部消息", notes = "按时间升序返回指定会话的全部消息记录。只能查看本人会话。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功"),
            @ApiResponse(code = 400, message = "查询失败，会话不存在或无权限")
    })
    @GetMapping("/message/list")
    @RequiresAuthentication
    public Response listMessages(
            @ApiParam(value = "会话ID", required = true) @RequestParam long sessionId) {
        return aiChatService.listMessages(sessionId);
    }
}
