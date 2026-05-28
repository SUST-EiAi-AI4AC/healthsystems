package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.entity.scale.SAS;
import com.nwpu.healthsystem.backend.service.scale.SASService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "SAS量表")
@RestController
@RequestMapping("/scale/sas")
public class SASController {
    @Autowired
    SASService sasService;

    @ApiOperation(value = "添加", notes = "如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @RequiresAuthentication
    public Response addOrUpdateScale(@RequestBody SAS sas) {
        Response insert = sasService.insertOrUpdate(sas);
        return insert;
    }

    @ApiOperation(value = "查询", notes = "分页查询")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getlist")
    @RequiresAuthentication
    public Response getScaleList(@RequestParam int currentPage, @RequestParam int pageSize) {
        Response response = sasService.getSASList(currentPage, pageSize);
        return response;
    }

    @ApiOperation(value = "查询今日是否填报", notes = "类似我们的疫情填报，会显示今天是否填报。如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/gettoday")
    @RequiresAuthentication
    public Response getScaleToday() {
        Response response = sasService.getToday();
        return response;
    }

    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getRecentInput")
    @RequiresAuthentication
    public Response getRecentInput() {
        Response response = sasService.getRecentInput();
        return response;
    }

    @GetMapping(value = "/getAlldata")
    @RequiresAuthentication
    public Response getAlldata() {
        Response response = sasService.getAlldata();
        return response;
    }
}
