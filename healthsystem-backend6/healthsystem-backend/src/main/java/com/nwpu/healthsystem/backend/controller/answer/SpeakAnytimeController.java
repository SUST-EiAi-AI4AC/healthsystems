package com.nwpu.healthsystem.backend.controller.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.DateRequestDto;
import com.nwpu.healthsystem.backend.entity.answer.SpeakAnytime;
import com.nwpu.healthsystem.backend.service.AsyncTaskService;
import com.nwpu.healthsystem.backend.service.FileService;
import com.nwpu.healthsystem.backend.service.answer.SpeakAnytimeService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.Future;


@Api(value = "随时说")
@RestController
@RequestMapping("/speakanytime")
public class SpeakAnytimeController {

    @Autowired
    SpeakAnytimeService speakAnytimeService;

    @Autowired
    private FileService fileService;

    @Autowired
    private AsyncTaskService asyncTaskService;


    // 功能1：视频上传
    @ApiOperation(value = "语音文件上传", notes = "")
    @PostMapping("/upload")
    @RequiresAuthentication
    public Response upload(MultipartFile file, HttpServletRequest req)  throws InterruptedException {
        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        // 1、保存文件
        Response audio = fileService.upload("audio", userIdFromToken, file, req);

        // 2、保存文件地址到数据库
        Boolean insertVideo = speakAnytimeService.insertSpeakAnytime(userIdFromToken, (String) audio.getResult());
        if(!insertVideo) {
            return Response.fail("文件地址插入数据库失败");
        }
        // 3、异步调用 执行 python脚本
        Future<String> stringFuture = asyncTaskService.audioInferenceTask((String) audio.getResult());

        return audio;
    }

    @ApiOperation(value = "分页查询记录", notes = "分页查询")
    @ApiResponses({
            @ApiResponse(code=400,message="查询失败"),
            @ApiResponse(code=200,message="查询成功")
    })
    @GetMapping(value = "/getlist")
    @RequiresAuthentication
    @Deprecated
    public Response getSpeakAnytimeList(@RequestParam int currentPage, @RequestParam int pageSize) {
        Response response = speakAnytimeService.getSpeakAnytimeList(currentPage, pageSize);
        return response;
    }


    @ApiOperation(value = "根据日期返回某一天所有 随时说推断 数据", notes = "")
    @PostMapping(value = "/getInferenceByDate")
    @RequiresAuthentication
    public Response getAudioInferenceByDate(@RequestBody DateRequestDto dateRequestDto) {
        Response response = speakAnytimeService.getInferenceByDate(dateRequestDto.getLogDate());
        return response;
    }
}
