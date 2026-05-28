package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.service.scale.PerceivedStressService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value = "")
@RestController
@RequestMapping("/page/whole/scale/ps")
public class PerceivedController {
    @Autowired
    PerceivedStressService perceivedStressService;

    @GetMapping(value = "/getAlldata")
    public Response getAlldata() {
        Response response = perceivedStressService.getAlldata();
        return response;
    }
    @GetMapping(value = "/getAllFormdata")
    public Response getAllFormdata() {
        Response response = perceivedStressService.getAllFormdata();
        return response;
    }
    @GetMapping(value = "/getAllDdata")
    public Response getAllDdata() {
        Response response = perceivedStressService.getAllDdata();
        return response;
    }
    @GetMapping(value = "/getAllZdata")
    public Response getAllZdata() {
        Response response = perceivedStressService.getAllZdata();
        return response;
    }
    @GetMapping(value = "/getAllGdata")
    public Response getAllGdata() {
        Response response = perceivedStressService.getAllGdata();
        return response;
    }
}
