package com.nwpu.healthsystem.backend.controller.health;

import com.nwpu.healthsystem.backend.entity.health.Sleep;
import com.nwpu.healthsystem.backend.service.health.SleepService;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.utils.JWTUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/healthInfo")
public class SleepController {

    private final SleepService sleepService;
    private final UserInfoMapper userInfoMapper;

    public SleepController(SleepService sleepService, UserInfoMapper userInfoMapper) {
        this.sleepService = sleepService;
        this.userInfoMapper = userInfoMapper;
    }

    @ApiOperation(value = "获取用户当前天的睡眠信息", notes = "查询指定用户今天的睡眠数据")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的睡眠信息")
    })
    @GetMapping("/getCurrentDaySleep")
    @RequiresAuthentication
    public Response getCurrentDaySleep(HttpServletRequest request) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        Sleep sleep = sleepService.getCurrentDaySleep(email);
        if (sleep != null) {
            return Response.success(sleep);
        } else {
            return Response.success("今日暂无睡眠数据");
        }
    }

    @ApiOperation(value = "获取最近N天睡眠历史数据")
    @GetMapping("/getSleepHistory")
    @RequiresAuthentication
    public Response getSleepHistory(HttpServletRequest request, @RequestParam(defaultValue = "7") int period) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        List<Sleep> sleepList = sleepService.getSleepHistory(email, period);
        return Response.success(sleepList);
    }

    @ApiOperation(value = "根据用户邮箱获取用户历史睡眠信息", notes = "")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的睡眠信息")
    })
    @GetMapping("/getSleepHistorybyEmail")
    @RequiresAuthentication
    public Response getSleepHistorybyEmail(@RequestParam String email) {
        return sleepService.getSleepHistorybyEmail(email);
    }
}

