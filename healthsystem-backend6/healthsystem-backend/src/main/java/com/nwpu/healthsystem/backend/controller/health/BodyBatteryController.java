package com.nwpu.healthsystem.backend.controller.health;

import com.nwpu.healthsystem.backend.entity.health.BodyBattery;
import com.nwpu.healthsystem.backend.service.health.BodyBatteryService;
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
public class BodyBatteryController {

    private final BodyBatteryService bodyBatteryService;
    private final UserInfoMapper userInfoMapper;

    public BodyBatteryController(BodyBatteryService bodyBatteryService, UserInfoMapper userInfoMapper) {
        this.bodyBatteryService = bodyBatteryService;
        this.userInfoMapper = userInfoMapper;
    }

    @ApiOperation(value = "获取用户当前天的身体电量信息", notes = "查询指定用户今天的身体电量数据")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的身体电量信息")
    })
    @GetMapping("/getCurrentDayBodyBattery")
    @RequiresAuthentication
    public Response getCurrentDayBodyBattery(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) return Response.fail("缺少 token");

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) return Response.fail("未找到用户的 email");

        BodyBattery battery = bodyBatteryService.getCurrentDayBodyBattery(email);
        return battery != null ? Response.success(battery) : Response.success("今日暂无身体电量数据");
    }

    @ApiOperation(value = "获取最近N天身体电量历史数据")
    @GetMapping("/getBodyBatteryHistory")
    @RequiresAuthentication
    public Response getBodyBatteryHistory(HttpServletRequest request, @RequestParam(defaultValue = "7") int period) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) return Response.fail("缺少 token");

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) return Response.fail("未找到用户的 email");

        List<BodyBattery> list = bodyBatteryService.getBodyBatteryHistory(email, period);
        return Response.success(list);
    }

    @ApiOperation(value = "根据用户邮箱获取用户历史身体电量信息", notes = "")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的身体电量信息")
    })
    @GetMapping("/getBodyBatteryHistorybyEmail")
    @RequiresAuthentication
    public Response getBodyBatteryHistorybyEmail(@RequestParam String email) {
        return bodyBatteryService.getBodyBatteryHistorybyEmail(email);
    }
}
