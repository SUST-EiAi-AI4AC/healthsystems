package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


@RestController
public class FileController {
//    这里需要绝对路径，不然报错，比如  ~\Desktop\czw\Files
    @Value("${file.filePath}")
    private String fileBasePath;

    @ApiOperation(value = "文件上传", notes = "路径参数filetype表示文件类型：比如ema、pam等，指问卷类型，后台根据文件来自的问卷类型来分别存储。也就是说这里告诉后端要存储进的文件夹")
    @PostMapping("/upload/{filetype}")
    @RequiresAuthentication
    @Deprecated
    public Response upload(@PathVariable(name = "filetype") String fileType, MultipartFile file, HttpServletRequest req) {
        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        SimpleDateFormat sdf = new SimpleDateFormat("_yyyyMMdd");
        String format = sdf.format(new Date());
        String realPath = fileBasePath + '/' + fileType;

        File folder = new File(realPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        String oldName = file.getOriginalFilename();
        String newName = userIdFromToken + "_" + fileType + format + "_"+ UUID.randomUUID().toString();
        newName += oldName.substring(oldName.lastIndexOf("."));

        try {
            File dest = new File(folder, newName);
            FileUtils.copyInputStreamToFile(file.getInputStream(), dest);
            String url = '/' + fileType + '/' + newName;
            return Response.success(url);
        } catch (Exception e) {
            return Response.fail(e.getMessage());
        }
    }

    @ApiOperation(value = "音频文件上传", notes = "返回文件存储路径，如/audio/1_audio_20201208_8c4d1e20-0e17-4d1a-9b03-562cfdf7a7f8.mp3")
    @PostMapping("/uploadAudio")
    @RequiresAuthentication
    public Response uploadAudio(MultipartFile file, HttpServletRequest req,
                                HttpServletResponse response) {
        String fileType = "audio";

        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        SimpleDateFormat sdf = new SimpleDateFormat("_yyyyMMdd");
        String format = sdf.format(new Date());
        String realPath = fileBasePath + '/' + fileType;

        File folder = new File(realPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        String oldName = file.getOriginalFilename();
        String newName = userIdFromToken + "_" + fileType + format + "_"+ UUID.randomUUID().toString();
        newName += oldName.substring(oldName.lastIndexOf("."));

        try {
            File dest = new File(folder, newName);
            FileUtils.copyInputStreamToFile(file.getInputStream(), dest);
            String url = '/' + fileType + '/' + newName;
            return Response.success(url);
        } catch (Exception e) {
            return Response.fail(e.getMessage());
        }
    }


    @ApiOperation(value = "HTP绘画图片上传",
            notes = "上传 HTP 绘画图片，参数 type 取值：drawing 或 canvas（两者等效）。" +
                    "返回图片在服务器上的相对路径，如 /htp/1_drawing_20260330_uuid.png。" +
                    "前端在拿到路径后，连同其他字段一起调用 POST /htp/add 写入数据库。")
    @PostMapping("/uploadDrawing")
    @RequiresAuthentication
    public Response uploadDrawing(
            @RequestParam(name = "type") String drawingType,
            MultipartFile file,
            HttpServletRequest req) {

        // type 仅允许 drawing / canvas，防止目录穿越
        if (!drawingType.equals("drawing") && !drawingType.equals("canvas")) {
            return Response.fail("参数 type 无效，仅接受 drawing、canvas");
        }

        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String dateStr = sdf.format(new Date());
        String realPath = fileBasePath + "/htp";

        File folder = new File(realPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        String oldName = file.getOriginalFilename();
        String ext = (oldName != null && oldName.contains("."))
                ? oldName.substring(oldName.lastIndexOf("."))
                : ".png";
        String newName = userIdFromToken + "_drawing_" + dateStr + "_" + UUID.randomUUID() + ext;

        try {
            File dest = new File(folder, newName);
            FileUtils.copyInputStreamToFile(file.getInputStream(), dest);
            String url = "/htp/" + newName;
            return Response.success(url);
        } catch (Exception e) {
            return Response.fail("图片上传失败: " + e.getMessage());
        }
    }

    @ApiOperation(value = "文件下载", notes = "eg: http://127.0.0.1:8081/download?filePath=/mp3/1_mp3_20201130_6e98e24b-572c-48b1-97c1-3797233f53b5.mp3" +
            "参数filePath：/文件类型/文件名（用户id_文件类型_日期_UUID.xxx）")
    @GetMapping("/download")
    public String download(@RequestParam(name = "filePath") String filePath,
                             HttpServletRequest request,
                             HttpServletResponse response) {
        try {
            String filename = filePath.substring(filePath.lastIndexOf("/") + 1);

            response.setContentType("application/octet-stream");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment;fileName="
                    + filename);

            String path = fileBasePath + filePath;
            File tempFile =new File(path);

            IOUtils.copy(FileUtils.openInputStream(tempFile), response.getOutputStream());
        } catch (FileNotFoundException e) {
            return "未找到文件，文件下载失败";
        }catch (IOException e) {
            return "文件下载失败" + e.getMessage();
        }
        return "下载成功";
    }
}
