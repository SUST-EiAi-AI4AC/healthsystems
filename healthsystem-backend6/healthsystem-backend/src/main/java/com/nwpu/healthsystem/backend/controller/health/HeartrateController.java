package com.nwpu.healthsystem.backend.controller.health;

import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.entity.health.Heartrate;
import com.nwpu.healthsystem.backend.service.UserService;
import com.nwpu.healthsystem.backend.service.health.HeartrateService;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.utils.JWTUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/healthInfo")
public class HeartrateController {

    private final HeartrateService heartrateService;
    private final UserInfoMapper userInfoMapper;

    public HeartrateController(HeartrateService heartrateService, UserInfoMapper userInfoMapper) {
        this.heartrateService = heartrateService;
        this.userInfoMapper = userInfoMapper;
    }

    @ApiOperation(value = "获取用户当前天的心率信息", notes = "查询指定用户今天的心率数据")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的心率信息")
    })
    @GetMapping("/getCurrentDayHeartrate")
    @RequiresAuthentication
    public Response getCurrentDayHeartrate(HttpServletRequest request) {
        // 1. 获取 token（注意前端要把 token 放在 header 中）
        String token = request.getHeader("Authorization");  // ← 检查前端传的 key 是不是 Authorization

        if (token == null || token.isEmpty()) {
            return Response.fail( "缺少 token");
        }

        // 2. 从 token 中解析出用户名
        String userName = JWTUtil.getUsername(token);
        // 3. 查询 email
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }
        // 4. 查询心率数据
        Heartrate heartrate = heartrateService.getCurrentDayHeartrate(email);
        if (heartrate != null) {
            return Response.success(heartrate);
        } else {
            return Response.success("今日暂无心率数据");
        }
    }

    @ApiOperation(value = "获取用户最近N天的心率历史记录", notes = "查询指定用户最近N天的最大心率、最小心率和静息心率")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功，返回心率历史记录列表"),
            @ApiResponse(code = 400, message = "查询失败，如缺少token、用户不存在等"),
            @ApiResponse(code = 500, message = "服务器内部错误")
    })
    @GetMapping("/getHeartrateHistory")
    @RequiresAuthentication // 需认证（与之前的接口保持一致的权限控制）
    public Response getHeartrateHistory(
            HttpServletRequest request,
            @RequestParam(defaultValue = "7") int period // 默认为7天，可通过请求参数修改
    ) {
        // 1. 获取token
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return Response.fail("缺少token");
        }

        // 2. 从token解析用户名
        String userName = JWTUtil.getUsername(token);

        // 3. 查询用户标识email
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的email");
        }

        // 4. 查询最近period天的心率历史数据
        List<Heartrate> heartrateList = heartrateService.getHeartrateHistory(email, period);

        return Response.success(heartrateList);
    }

    @ApiOperation(value = "根据用户邮箱获取用户历史心率信息", notes = "")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的心率信息")
    })
    @GetMapping("/getHeartrateHistorybyEmail")
    @RequiresAuthentication
    public Response getHeartrateHistorybyEmail(@RequestParam String email) {
        return heartrateService.getHeartrateHistorybyEmail(email);
    }
}