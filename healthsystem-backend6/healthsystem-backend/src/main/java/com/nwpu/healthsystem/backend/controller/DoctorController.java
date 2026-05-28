package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.common.dto.DepressedInfoDto;
import com.nwpu.healthsystem.backend.common.dto.RegisterDoctorDto;
import com.nwpu.healthsystem.backend.common.dto.UserAllInfoDto;
import com.nwpu.healthsystem.backend.common.dto.echarts.DateRequestDto;
import com.nwpu.healthsystem.backend.service.DoctorService;
import com.nwpu.healthsystem.backend.service.answer.AnswerService;
import com.nwpu.healthsystem.backend.service.answer.EMAAnswerService;
import com.nwpu.healthsystem.backend.service.answer.SpeakAnytimeService;
import com.nwpu.healthsystem.backend.service.answer.VideoService;
import com.nwpu.healthsystem.backend.service.scale.SASService;
import com.nwpu.healthsystem.backend.service.scale.SdsService;
import com.nwpu.healthsystem.backend.service.scale.PerceivedStressService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;


// 注意这里不是RestController
@Api
@RestController
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    DoctorService doctorService;
    @Autowired
    AnswerService answerService;
    @Autowired
    EMAAnswerService emaAnswerService;
    @Autowired
    SdsService sdsService;
    @Autowired
    PerceivedStressService perceivedStressService;
    @Autowired
    SASService sasService;
    @Autowired
    SpeakAnytimeService speakAnytimeService;
    @Autowired
    VideoService videoService;

    @ApiOperation(value = "医生获取用户信息列表", notes = "")
    @RequestMapping(value = "/getuserlist", method = RequestMethod.GET)
    @RequiresRoles("doctor")
    public Response getUsersOfDoctor(@RequestParam(required = true) int currentPage,
                                     @RequestParam(required = true) int pageSize,
                                     @RequestParam(required = false) String userName,
                                     @RequestParam(required = false) String realName,
                                     @RequestParam(required = false) String sex,
                                     @RequestParam(required = false) String phone){
        Response usersInfoOfDoctor = doctorService.getUsersInfoOfDoctor(currentPage, pageSize, userName, realName, sex, phone);
        return usersInfoOfDoctor;
    }


    @ApiOperation(value = "医生修改用户信息", notes = "")
    @ApiResponses({
            @ApiResponse(code=400,message="修改失败"),
            @ApiResponse(code=200,message="修改成功", response = UserAllInfoDto.class)
    })
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    @RequiresRoles("doctor")
    public Object updateUser(@RequestBody UserAllInfoDto userAllInfoDto) {
        Response update = doctorService.updateUserAllInfoByDoctor(userAllInfoDto);
        return update;
    }


    @ApiOperation(value = "根据时间区间查询 sleeptime sportstime 记录", notes = "参数：period，单位天数。返回最近几天的所有 sleeptime 数据，按照时间顺序")
    @GetMapping(value = "/getSleepTimeByTime")
    @RequiresRoles("doctor")
    public Response getSleepTimeBySelectTime(@RequestParam int period, @RequestParam long userId) {
        Response response = answerService.getSleepAndSportsTime4Doctor(period, userId);
        return response;
    }

    @ApiOperation(value = "根据日期返回某一天所有pam数据", notes = "参数：DateRequestDto。返回某个日期对应的所有pam数据，按照时间顺序")
    @PostMapping(value = "/getPamListByDate")
    @RequiresRoles("doctor")
    public Response getPamListByDate(@RequestBody DateRequestDto dateRequestDto, @RequestParam long userId) {
        Response response = emaAnswerService.getPamListByDate4Doctor(dateRequestDto.getLogDate(), userId);
        return response;
    }


    @ApiOperation(value = "查询 phq9", notes = "分页查询")
    @GetMapping(value = "/getph9list")
    @RequiresRoles("doctor")
    public Response getPHQ9ScaleList(@RequestParam int currentPage, @RequestParam int pageSize,@RequestParam long userId) {
        Response response = sdsService.getPHQ9List4Doctor(currentPage, pageSize, userId);
        return response;
    }

    @ApiOperation(value = "查询 pss", notes = "分页查询")
    @GetMapping(value = "/getpsslist")
    @RequiresRoles("doctor")
    public Response getPSSScaleList(@RequestParam int currentPage, @RequestParam int pageSize,@RequestParam long userId) {
        Response response = perceivedStressService.getPerceivedStressList4Doctor(currentPage, pageSize,userId);
        return response;
    }

    @ApiOperation(value = "查询 sas", notes = "分页查询")
    @GetMapping(value = "/getsaslist")
    @RequiresRoles("doctor")
    public Response getSASScaleList(@RequestParam int currentPage, @RequestParam int pageSize,@RequestParam long userId) {
        Response response = sasService.getSASList4Doctor(currentPage, pageSize,userId);
        return response;
    }

    @ApiOperation(value = "分页查询audio记录", notes = "分页查询")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getspeakanytimelist")
    @RequiresAuthentication
    public Response getSpeakAnytimeList(@RequestParam long userId,@RequestParam int currentPage, @RequestParam int pageSize) {
        Response response = speakAnytimeService.getSpeakAnytimeList4Doctor(userId,currentPage, pageSize);
        return response;
    }
    @ApiOperation(value ="分页查询视频记录",notes = "分页查询")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping("/getvideolist")
    public Response getVideoList(@RequestParam long userId,@RequestParam int currentPage,@RequestParam int pageSize){
        Response response=videoService.getVideoList4Doctor(userId, currentPage, pageSize);
        return response;
    }


    @ApiOperation(value = "医生修改标注信息", notes = "")
    @ApiResponses({
            @ApiResponse(code=400,message="修改失败"),
            @ApiResponse(code=200,message="修改成功", response = DepressedInfoDto.class)
    })
    @RequestMapping(value = "/updateDepressedInfo", method = RequestMethod.POST)
    @RequiresRoles("doctor")
    public Object updateDepressedInfo(@RequestBody DepressedInfoDto depressedInfoDto) {
        Response update = doctorService.updateDepressedInfo(depressedInfoDto.getUserIdList(),
                depressedInfoDto.getDepressed(),
                depressedInfoDto.getRemark());

        return update;
    }

    /**
     * 注册账号:普通用户
     * @param userAllInfoDto
     * @return
     */
    @ApiOperation(value = "医生端用户注册", notes = "")
    @ApiResponses({
            @ApiResponse(code=400,message="注册失败：手机号/用户名已被使用"),
            @ApiResponse(code=200,message="注册成功", response = UserAllInfoDto.class)
    })
    @RequestMapping(value = "/addNewUser", method = RequestMethod.POST)
    @RequiresRoles("doctor")
    public Object insertUser(@RequestBody UserAllInfoDto userAllInfoDto) {
        Response register = doctorService.registerUserByDoctor(userAllInfoDto);
        return register;
    }

    /**
     * 注册账号: 医生/管理员
     * @param registerDoctorDto
     * @return
     */
    @ApiOperation(value = "医生注册", notes = "")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Object register(@RequestBody RegisterDoctorDto registerDoctorDto,
                           HttpServletResponse response) {
        Response register = doctorService.registerForDoctor(registerDoctorDto, response);
        return register;
    }

    @ApiOperation(value = "获得邀请码", notes = "")
    @RequestMapping(value = "/getInvitionCode", method = RequestMethod.POST)
    @RequiresRoles("doctor")
    public Object getInvitionCode() {
        Response register = doctorService.getInvitionCode4Doctor();
        return register;
    }

    @ApiOperation(value = "检查用户指定日期是否填报", notes = "根据用户ID和日期判断是否有填报记录，默认未指定日期则默认检查当天")
    @GetMapping(value = "/checkReportStatus")
    @RequiresRoles("doctor")
    public Response checkReportStatus(
            @RequestParam(required = true) Long userId,
            // 接收前端日期字符串，转换为java.util.Date
            @RequestParam(required = false)
            @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) { // 此处为java.util.Date
        try {
            // 处理日期参数：未传则默认当前系统时间（java.util.Date）
            Date checkDate = (date == null) ? new Date() : date;

            // 调用服务层（参数为java.util.Date）
            boolean hasReported = answerService.hasReportRecord(userId, checkDate);

            return Response.success(hasReported);
        } catch (IllegalArgumentException e) {
            return Response.fail("参数错误：" + e.getMessage());
        } catch (Exception e) {
            return Response.fail("查询填报状态失败：" + e.getMessage());
        }
    }
}
