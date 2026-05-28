package com.nwpu.healthsystem.backend.controller.answer;

import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.service.answer.AnswerService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "每日一次记录")
@RestController
@RequestMapping("/answer")
public class AnswerController {
    @Autowired
    AnswerService answerService;

    @ApiOperation(value = "添加每日一次问卷记录", notes = "如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @RequiresAuthentication
    public Response addOrUpdateAnswer(@RequestBody Answer answer) {
        Response insert = answerService.insertOrUpdate(answer);
        return insert;
    }

    @ApiOperation(value = "查询每日一次问卷记录", notes = "分页查询")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getlist")
    @RequiresAuthentication
    public Response getAnswerList(@RequestParam int currentPage, @RequestParam int pageSize) {
        Response response = answerService.getAnswerList(currentPage, pageSize);
        return response;
    }

    @ApiOperation(value = "查询今日是否填报", notes = "类似我们的疫情填报，会显示今天是否填报。如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/gettoday")
    @RequiresAuthentication
    public Response getEMAAnswerList() {
        Response response = answerService.getToday();
        return response;
    }


    @ApiOperation(value = "查询今日是否填报", notes = "类似我们的疫情填报，会显示今天是否填报。如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/gettodaydetail")
    @RequiresAuthentication
    public Response getTodayDetail() {
        Response response = answerService.getTodayDetail();
        return response;
    }

    @ApiOperation(value = "根据时间区间查询 sleeptime sportstime 记录", notes = "参数：period，单位天数。返回最近几天的所有 sleeptime 数据，按照时间顺序")
    @GetMapping(value = "/getSleepTimeByTime")
    @RequiresAuthentication
    public Response getSleepTimeBySelectTime(@RequestParam int period) {
        Response response = answerService.getSleepAndSportsTimeBySelectTime(period);
        return response;
    }

    @ApiOperation(value = "根据用户id查询填报全部信息", notes = "查询指定用户的所有填报记录信息")
    @ApiResponses({
            @ApiResponse(code = 400, message = "查询失败"),
            @ApiResponse(code = 200, message = "查询成功，返回用户的填报信息列表")
    })
    @GetMapping(value = "/getByUserId")
    @RequiresAuthentication // 若需要认证权限，可保留该注解；若不需要可移除
    public Response getAnswerListByUserId(@RequestParam Long userId) {
        return answerService.getAnswerListByUserId(userId);
    }

}
