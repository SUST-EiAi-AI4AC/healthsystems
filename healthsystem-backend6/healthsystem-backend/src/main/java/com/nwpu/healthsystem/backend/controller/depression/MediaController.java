package com.nwpu.healthsystem.backend.controller.depression;



import com.nwpu.healthsystem.backend.service.AsyncTaskService;
import com.nwpu.healthsystem.backend.service.FileService;
import com.nwpu.healthsystem.backend.service.depression.MediaService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.concurrent.Future;


@RestController
@RequestMapping("/depressionmedia")
public class MediaController {
    @Autowired
    MediaService mediaService;

    @Autowired
    private FileService fileService;

    @Autowired
    private AsyncTaskService asyncTaskService;


    @PostMapping("/upload/video")
    @RequiresAuthentication
    public Response uploadVideo(MultipartFile file, HttpServletRequest req)  throws InterruptedException{
        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        // 1、保存文件
        Response video = fileService.upload("depression-video", userIdFromToken, file, req);
        String questionEndTime = req.getParameter("questionEndTime");
        // 2、保存文件地址到数据库
        Boolean insertMedia = mediaService.insertMedia(userIdFromToken, "depression-video", (String) video.getResult(),questionEndTime);
        // 3、异步调用 执行 python脚本
        Future<String> stringFuture = asyncTaskService.depressionVideoInferenceTask((String) video.getResult());

        return video;
    }

    @GetMapping(value = "/getList")
    @RequiresAuthentication
    public Response getList() {
        Response response = mediaService.getList();
        return response;
    }

}

