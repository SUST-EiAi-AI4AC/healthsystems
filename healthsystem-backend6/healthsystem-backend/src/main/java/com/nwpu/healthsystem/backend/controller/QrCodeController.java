package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.service.QrCodeService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;


@RestController
public class QrCodeController {
    @Autowired
    private QrCodeService codeService;

    @Value("${frontend.IP}")
    private String frontendIP;

    //生成二维码并将其返回给前端调用者_hutool
    @GetMapping("generate")
    public Response generateV3(long doctorId, HttpServletResponse servletResponse){
        try {
            String content = "/login?doctorId=";
            content = frontendIP + content;

            // 考虑到助理 的二维码中的id应该是 所属医生的。
            long groupId = codeService.getGroupId4QRCode(doctorId);
            String content_id = Long.toString(groupId);
            content += content_id;

            //将生成的二维码文件直接返回给前端响应流
            codeService.createCodeToStream(content, servletResponse);
            return Response.success(null);
        }catch (Exception e){
            return Response.fail("二维码生成错误");
        }
    }
}
