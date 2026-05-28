package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.entity.scale.Sds;
import com.nwpu.healthsystem.backend.service.scale.SdsService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "SDS量表")
@RestController
@RequestMapping("/scale/phq9")
public class SDSController {
    @Autowired
    SdsService sdsService;

    @ApiOperation(value = "添加", notes = "如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @RequiresAuthentication
    public Response addOrUpdateScale(@RequestBody Sds sds) {
        Response insert = sdsService.insertOrUpdate(sds);
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
        Response response = sdsService.getPHQ9List(currentPage, pageSize);
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
        Response response = sdsService.getToday();
        return response;
    }

    @GetMapping(value = "/getRecentInput")
    @RequiresAuthentication
    public Response getRecentInput() {
        Response response = sdsService.getRecentInput();
        return response;
    }

    @GetMapping(value = "/getAlldata")
    @RequiresAuthentication
    public Response getAlldata() {
        Response response = sdsService.getAlldata();
        return response;
    }
}
