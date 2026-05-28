package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.entity.PushBean;
import com.nwpu.healthsystem.backend.service.JiGuangPushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/ctl/jgPush")
public class JgPushController {
 
    @Autowired
    private JiGuangPushService jiGuangService;
 
 
    @GetMapping("/jgTest")
    public void jgTest()
    {
        //定义和赋值推送实体
        PushBean pushBean = new PushBean();
        pushBean.setTitle("标题");
        pushBean.setAlert("测试消息");
        //额外推送信息
        Map<String,String> map = new HashMap<>();
        map.put("userName","张三");
        pushBean.setExtras(map);
        //进行推送，推送到指定Android客户端的用户，返回推送结果布尔值
        String [] rids = new String[1];
        rids[0]  = "ljr";//指定id
        boolean flag = jiGuangService.pushAndroid(pushBean,rids);
    }
} 