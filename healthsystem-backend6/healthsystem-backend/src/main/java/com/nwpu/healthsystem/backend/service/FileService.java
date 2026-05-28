package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.utils.Response;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

// 文件上传服务

@Service
public class FileService {
    @Value("${file.filePath}")
    private String fileBasePath;

    /**
     *@param
     *@return
     */
    public Response upload(String fileType, long userIdFromToken, MultipartFile file, HttpServletRequest req) {
        // 1、格式化 上传的文件的文件名
        // 添加日期信息
        SimpleDateFormat sdf = new SimpleDateFormat("_yyyyMMdd");
        String format = sdf.format(new Date());
        // 通过不同的格式（问卷格式）区分文件保存路径
        String realPath = fileBasePath + '/' + fileType;

        File folder = new File(realPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        String oldName = file.getOriginalFilename();
        // 重命名，格式：userId_fileType_formatDate_UUID.xxx
        // UUID用于处理前端传的同名文件等等，这样每次都有一个名字；  而且可以防止恶意下载一些文件（无法得知文件名字，这样下载就无需限制了）。
        String newName = userIdFromToken + "_" + fileType + format + "_"+ UUID.randomUUID().toString();
        newName += oldName.substring(oldName.lastIndexOf("."));

        // 2、转储文件
        try {
            File dest = new File(folder, newName);
//            file.transferTo(dest);
            FileUtils.copyInputStreamToFile(file.getInputStream(), dest);
            // 4、构造返回值：文件的地址
            String url = '/' + fileType + '/' + newName;
            return Response.success(url);
        } catch (Exception e) {
            return Response.fail(e.getMessage());
        }
    }


}
