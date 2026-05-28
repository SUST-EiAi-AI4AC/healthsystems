package com.nwpu.healthsystem.backend.controller.health;

import com.nwpu.healthsystem.backend.entity.health.DailySteps;
import com.nwpu.healthsystem.backend.service.health.DailyStepsService;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.utils.JWTUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/healthInfo")
public class DailyStepsController {

    private final DailyStepsService dailyStepsService;
    private final UserInfoMapper userInfoMapper;

    public DailyStepsController(DailyStepsService dailyStepsService, UserInfoMapper userInfoMapper) {
        this.dailyStepsService = dailyStepsService;
        this.userInfoMapper = userInfoMapper;
    }

    @ApiOperation(value = "获取用户当前天的运动步数信息", notes = "查询指定用户今天的步数数据")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的步数信息")
    })
    @GetMapping("/getCurrentDaySteps")
    @RequiresAuthentication
    public Response getCurrentDaySteps(HttpServletRequest request) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        DailySteps dailySteps = dailyStepsService.getCurrentDaySteps(email);
        if (dailySteps != null) {
            return Response.success(dailySteps);
        } else {
            return Response.success("今日暂无步数数据");
        }
    }

    @ApiOperation(value = "获取最近N天步数历史数据")
    @GetMapping("/getStepsHistory")
    @RequiresAuthentication
    public Response getStepsHistory(HttpServletRequest request, @RequestParam(defaultValue = "7") int period) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        List<DailySteps> stepsList = dailyStepsService.getStepsHistory(email, period);
        return Response.success(stepsList);
    }

    @ApiOperation(value = "根据用户邮箱获取用户历史步数信息", notes = "")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的步数信息")
    })
    @GetMapping("/getStepsHistorybyEmail")
    @RequiresAuthentication
    public Response getStepsHistorybyEmail(@RequestParam String email) {
        return dailyStepsService.getStepsHistorybyEmail(email);
    }
}
