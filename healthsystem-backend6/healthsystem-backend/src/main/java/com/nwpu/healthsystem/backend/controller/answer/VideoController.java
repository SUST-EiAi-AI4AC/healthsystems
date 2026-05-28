package com.nwpu.healthsystem.backend.controller.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.DateRequestDto;
import com.nwpu.healthsystem.backend.mapper.answer.VideoMapper;
import com.nwpu.healthsystem.backend.service.AsyncTaskService;
import com.nwpu.healthsystem.backend.service.FileService;
import com.nwpu.healthsystem.backend.service.answer.VideoService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.Future;


@Api("视频模块")
@RestController
@RequestMapping("/video")
public class VideoController {
    @Autowired
    private FileService fileService;

    @Autowired
    private VideoService videoService;

    @Autowired
    private AsyncTaskService asyncTaskService;

    // 功能1：视频上传
    @ApiOperation(value = "视频文件上传", notes = "")
    @PostMapping("/upload")
    @RequiresAuthentication
    public Response upload(MultipartFile file, HttpServletRequest req)  throws InterruptedException{
        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        // 1、保存文件
        Response video = fileService.upload("video", userIdFromToken, file, req);
        // 2、保存文件地址到数据库
        Boolean insertVideo = videoService.insertVideo(userIdFromToken, (String) video.getResult());
        if(!insertVideo) {
            return Response.fail("文件地址插入数据库失败");
        }
        // 3、异步调用 执行 python脚本
        Future<String> stringFuture = asyncTaskService.videoInferenceTask((String) video.getResult());
        return video;
    }

    @ApiOperation(value = "根据日期返回某一天所有 随时说推断 数据", notes = "")
    @PostMapping(value = "/getInferenceByDate")
    @RequiresAuthentication
    public Response getVideoInferenceByDate(@RequestBody DateRequestDto dateRequestDto) {
        Response response = videoService.getInferenceByDate(dateRequestDto.getLogDate());
        return response;
    }

}
