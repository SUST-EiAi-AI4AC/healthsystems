package com.nwpu.healthsystem.backend.controller.answer;

import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.entity.answer.BasicInfo;
import com.nwpu.healthsystem.backend.service.answer.BasicInfoService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(value = "用户基础信息")
@RestController
@RequestMapping("/basicInfo")
public class BasicInfoController {
    @Autowired
    BasicInfoService basicInfoService;

    @ApiOperation(value = "添加基本信息记录", notes = "如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @RequiresAuthentication
    public Response addOrUpdateBasicInfo(@RequestBody BasicInfo basicInfo) {
        Response insert = basicInfoService.insertOrUpdate(basicInfo);
        return insert;
    }

    @RequestMapping(value = "/getRecord", method = RequestMethod.GET)
    @RequiresAuthentication
    public Response getRecord() {
        return basicInfoService.getRecord();
    }

    @RequestMapping(value = "/getRecordDetail", method = RequestMethod.GET)
    @RequiresAuthentication
    public Response getRecordDetail(@RequestParam("userId") Long userId) {
        return basicInfoService.getRecordDetail(userId);
    }
}
