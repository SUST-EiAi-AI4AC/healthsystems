package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.service.scale.SASService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "")
@RestController
@RequestMapping("/page/whole/scale/sas")
public class SAS1Controller {
    @Autowired
    SASService sasService;

    @GetMapping(value = "/getAlldata")
    public Response getAlldata() {
        Response response = sasService.getAlldata();
        return response;
    }
    @GetMapping(value = "/getAllFormdata")
    public Response getAllFormdata() {
        Response response = sasService.getAllFormdata();
        return response;
    }
    @GetMapping(value = "/getAllDdata")
    public Response getAllDdata() {
        Response response = sasService.getAllDdata();
        return response;
    }
    @GetMapping(value = "/getAllZdata")
    public Response getAllZdata() {
        Response response = sasService.getAllZdata();
        return response;
    }
    @GetMapping(value = "/getAllGdata")
    public Response getAllGdata() {
        Response response = sasService.getAllGdata();
        return response;
    }
}
