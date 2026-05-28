package com.nwpu.healthsystem.backend.controller.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.DateRequestDto;
import com.nwpu.healthsystem.backend.entity.answer.EMAAnswer;
import com.nwpu.healthsystem.backend.service.answer.EMAAnswerService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "EMA问卷记录")
@RestController
@RequestMapping("/emaanswer")
public class EMAAnswerController {

    @Autowired
    EMAAnswerService emaAnswerService;

    @ApiOperation(value = "添加EMA问卷记录", notes = "")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @RequiresAuthentication
    public Response addEMAAnswer(@RequestBody EMAAnswer emaAnswer) {
        Response insert = emaAnswerService.insert(emaAnswer);
        return insert;
    }

    @ApiOperation(value = "分页查询EMA问卷记录", notes = "分页查询")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getlist")
    @RequiresAuthentication
    public Response getEMAAnswerList(@RequestParam int currentPage, @RequestParam int pageSize) {
        Response response = emaAnswerService.getEMAAnswerList(currentPage, pageSize);
        return response;
    }

    @ApiOperation(value = "根据时间查询EMA问卷记录", notes = "参数：period，单位天数。返回最近几天的所有ema数据，按照时间顺序")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getlistbytime")
    @RequiresAuthentication
    public Response getEMAAnswerListBySelectTime(@RequestParam int period) {
        Response response = emaAnswerService.getEMAAnswerListBySelectTime(period);
        return response;
    }

    @ApiOperation(value = "根据日期返回某一天所有pam数据", notes = "参数：DateRequestDto。返回某个日期对应的所有pam数据，按照时间顺序")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @PostMapping(value = "/getPamListByDate")
    @RequiresAuthentication
    public Response getPamListByDate(@RequestBody DateRequestDto dateRequestDto) {
        Response response = emaAnswerService.getPamListByDate(dateRequestDto.getLogDate());
        return response;
    }

    @ApiOperation(value = "根据时间区间查询pam记录", notes = "参数：period，单位天数。返回最近几天的所有ema数据，按照时间顺序")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getPamListByTime")
    @RequiresAuthentication
    public Response getPamListBySelectTime(@RequestParam int period) {
        Response response = emaAnswerService.getPamListBySelectTime(period);
        return response;
    }

    @GetMapping(value = "/getRecentInput")
    @RequiresAuthentication
    public Response getRecentInput() {
        Response response = emaAnswerService.getRecentInput();
        return response;
    }
}
