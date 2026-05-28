package com.nwpu.healthsystem.backend.controller.health;

import com.nwpu.healthsystem.backend.entity.health.Stress;
import com.nwpu.healthsystem.backend.service.health.StressService;
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
public class StressController {

    private final StressService stressService;
    private final UserInfoMapper userInfoMapper;

    public StressController(StressService stressService, UserInfoMapper userInfoMapper) {
        this.stressService = stressService;
        this.userInfoMapper = userInfoMapper;
    }

    @ApiOperation(value = "获取用户当前天的压力数据", notes = "查询指定用户今天的压力信息")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回压力数据")
    })
    @GetMapping("/getCurrentDayStress")
    @RequiresAuthentication
    public Response getCurrentDayStress(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        Stress stress = stressService.getCurrentDayStress(email);
        if (stress != null) {
            return Response.success(stress);
        } else {
            return Response.success("今日暂无压力数据");
        }
    }

    @ApiOperation(value = "获取最近N天的压力历史数据")
    @GetMapping("/getStressHistory")
    @RequiresAuthentication
    public Response getStressHistory(HttpServletRequest request, @RequestParam(defaultValue = "7") int period) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return Response.fail("缺少 token");
        }

        String userName = JWTUtil.getUsername(token);
        String email = userInfoMapper.getEmailByUserName(userName);
        if (email == null) {
            return Response.fail("未找到用户的 email");
        }

        List<Stress> stressList = stressService.getStressHistory(email, period);
        return Response.success(stressList);
    }

    @ApiOperation(value = "根据用户邮箱获取用户历史压力信息", notes = "")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户今天的压力信息")
    })
    @GetMapping("/getStressHistorybyEmail")
    @RequiresAuthentication
    public Response getStressHistorybyEmail(@RequestParam String email) {
        return stressService.getStressHistorybyEmail(email);
    }
}
