package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.service.scale.SdsService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "")
@RestController
@RequestMapping("/page/whole/scale/phq9")
public class SDS1Controller {
    @Autowired
    SdsService sdsService;

    @GetMapping(value = "/getAlldata")
    public Response getAlldata() {
        Response response = sdsService.getAlldata();
        return response;
    }
    @GetMapping(value = "/getAllFormdata")
    public Response getAllFormdata() {
        Response response = sdsService.getAllFormdata();
        return response;
    }
    @GetMapping(value = "/getAllDdata")
    public Response getAllDdata() {
        Response response = sdsService.getAllDdata();
        return response;
    }
    @GetMapping(value = "/getAllZdata")
    public Response getAllZdata() {
        Response response = sdsService.getAllZdata();
        return response;
    }
    @GetMapping(value = "/getAllGdata")
    public Response getAllGdata() {
        Response response = sdsService.getAllGdata();
        return response;
    }
}
