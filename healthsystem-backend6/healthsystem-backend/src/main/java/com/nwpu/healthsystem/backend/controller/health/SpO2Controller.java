package com.nwpu.healthsystem.backend.controller.health;

import com.nwpu.healthsystem.backend.entity.health.SpO2;
import com.nwpu.healthsystem.backend.service.health.SpO2Service;
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
public class SpO2Controller {

    private final SpO2Service spO2Service;
    private final UserInfoMapper userInfoMapper;

    public SpO2Controller(SpO2Service spO2Service, UserInfoMapper userInfoMapper) {
        this.spO2Service = spO2Service;
        this.userInfoMapper = userInfoMapper;
    }

    @ApiOperation(value = "获取用户当前天的血氧信息", notes = "查询指定用户今天的血氧数据")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的血氧信息")
    })
    @GetMapping("/getCurrentDaySpO2")
    @RequiresAuthentication
    public Response getCurrentDaySpO2(HttpServletRequest request) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        SpO2 spo2 = spO2Service.getCurrentDaySpO2(email);
        if (spo2 != null) {
            return Response.success(spo2);
        } else {
            return Response.success("今日暂无血氧数据");
        }
    }

    @ApiOperation(value = "获取最近N天血氧历史数据")
    @GetMapping("/getSpO2History")
    @RequiresAuthentication
    public Response getSpO2History(HttpServletRequest request, @RequestParam(defaultValue = "7") int period) {
        String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        List<SpO2> spo2List = spO2Service.getSpO2History(email, period);
        return Response.success(spo2List);
    }

    @ApiOperation(value = "根据用户邮箱获取用户历史血氧信息", notes = "")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的血氧信息")
    })
    @GetMapping("/getSpO2HistorybyEmail")
    @RequiresAuthentication
    public Response getSpO2HistorybyEmail(@RequestParam String email) {
        return spO2Service.getSpO2HistorybyEmail(email);
    }
}
