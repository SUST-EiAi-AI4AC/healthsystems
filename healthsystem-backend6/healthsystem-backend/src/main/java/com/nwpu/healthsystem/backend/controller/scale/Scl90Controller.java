package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.entity.scale.Scl90;
import com.nwpu.healthsystem.backend.service.scale.Scl90Service;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(value = "")
@RestController
@RequestMapping("/scale/scl90")
public class Scl90Controller {
    @Autowired
    private Scl90Service service;

    @ApiOperation(value = "添加", notes = "如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @PostMapping("/add")
    @RequiresAuthentication
    public Response add(@RequestBody Scl90 scl90) {
        return service.addOrUpdate(scl90);
    }

    @ApiOperation(value = "查询", notes = "分页查询")
    @GetMapping("/getlist")
    @RequiresAuthentication
    public Response getList(@RequestParam int currentPage, @RequestParam int pageSize) {
        return service.getList(currentPage, pageSize);
    }
}
