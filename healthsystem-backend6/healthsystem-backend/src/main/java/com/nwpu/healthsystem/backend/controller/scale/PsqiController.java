package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.entity.scale.Psqi;
import com.nwpu.healthsystem.backend.service.scale.PsqiService;
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
@RequestMapping("/scale/psqi")
public class PsqiController {
    @Autowired
    private PsqiService service;

    @ApiOperation(value = "添加", notes = "如果已填报，然后再次填报可覆盖")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @PostMapping("/add")
    @RequiresAuthentication
    public Response add(@RequestBody Psqi p) {
        return service.addOrUpdate(p);
    }

    @ApiOperation(value = "查询", notes = "分页查询")
    @GetMapping("/getlist")
    @RequiresAuthentication
    public Response getList(@RequestParam int currentPage, @RequestParam int pageSize) {
        return service.getList(currentPage, pageSize);
    }
}
