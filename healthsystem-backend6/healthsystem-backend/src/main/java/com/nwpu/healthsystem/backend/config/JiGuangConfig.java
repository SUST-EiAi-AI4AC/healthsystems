package com.nwpu.healthsystem.backend.config;

import cn.jpush.api.JPushClient;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class JiGuangConfig {
    /**
     * 极光官网-个人管理中心-appkey
     * https://www.jiguang.cn/
     */
//    @Value("${jpush.appkey}")
    private String appkey ="8638aca5a7ac143bb077aaa4";
 
    /**
     * 极光官网-个人管理中心-点击查看-secret
     */
//    @Value("${jpush.secret}")
    private String secret = "0b73410e170dc444e1bc4b36";
 
 
    private JPushClient jPushClient;
 
    /**
     * 推送客户端
     * @return
     */
    @PostConstruct
    public void initJPushClient() {
        jPushClient = new JPushClient(secret, appkey);
    }
 
    /**
     * 获取推送客户端
     * @return
     */
    public JPushClient getJPushClient() {
        return jPushClient;
    }
} 