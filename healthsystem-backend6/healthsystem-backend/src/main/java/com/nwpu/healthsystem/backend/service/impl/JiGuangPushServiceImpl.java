package com.nwpu.healthsystem.backend.service.impl;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;
import com.google.gson.JsonObject;
import com.nwpu.healthsystem.backend.config.JiGuangConfig;
import com.nwpu.healthsystem.backend.entity.PushBean;
import com.nwpu.healthsystem.backend.service.JiGuangPushService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class JiGuangPushServiceImpl implements JiGuangPushService {
    private static final Logger log = LoggerFactory.getLogger(JiGuangPushServiceImpl.class);
    /** 一次推送最大数量 (极光限制1000) */
    private static final int max_size = 800;
 
    @Autowired
    private JiGuangConfig jPushConfig;
 
 
    /**
     * 广播 (所有平台，所有设备, 不支持附加信息)
     * @return
     */
    @Override
    public boolean pushAll(PushBean pushBean){
        return sendPush(PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.all())
                .setNotification(Notification.alert(pushBean.getAlert()))
                .build());
    }
 
    /**
     * 推送全部ios ios广播
     * @return
     */
    @Override
    public boolean pushIos(PushBean pushBean){
        return sendPush(PushPayload.newBuilder()
                .setPlatform(Platform.ios())
                .setAudience(Audience.all())
                .setNotification(Notification.ios(pushBean.getAlert(), pushBean.getExtras()))
                .build());
    }
 
    /**
     * 推送ios 指定id
     * @return
     */
    @Override
    public boolean pushIos(PushBean pushBean, String... registids){
        registids = checkRegistids(registids); // 剔除无效registed
        while (registids.length > max_size) { // 每次推送max_size个
            sendPush(PushPayload.newBuilder()
                    .setPlatform(Platform.ios())
                    .setAudience(Audience.registrationId(Arrays.copyOfRange(registids, 0, max_size)))
                    .setNotification(Notification.ios(pushBean.getAlert(), pushBean.getExtras()))
                    .build());
            registids = Arrays.copyOfRange(registids, max_size, registids.length);
        }
        return sendPush(PushPayload.newBuilder()
                .setPlatform(Platform.ios())
                .setAudience(Audience.registrationId(Arrays.copyOfRange(registids, 0, max_size)))
                .setNotification(Notification.ios(pushBean.getAlert(), pushBean.getExtras()))
                .build());
    }
 
    /**
     * 推送全部android
     * @return
     */
    @Override
    public boolean pushAndroid(PushBean pushBean){
        return sendPush(PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.all())
                .setNotification(Notification.android(pushBean.getAlert(), pushBean.getTitle(), pushBean.getExtras()))
                .build());
    }
 
    /**
     * 推送android 指定id
     * @return
     */
    @Override
    public boolean pushAndroid(PushBean pushBean, String... alias){
        alias = checkRegistids(alias); // 剔除无效registed
        while (alias.length > max_size) { // 每次推送max_size个
            sendPush(PushPayload.newBuilder()
                    .setPlatform(Platform.android())
                    .setAudience(Audience.alias(Arrays.copyOfRange(alias, 0, max_size)))
                    .setNotification(Notification.android(pushBean.getAlert(), pushBean.getTitle(), pushBean.getExtras()))
                    .setOptions(getOptions())
                    .build());
            alias = Arrays.copyOfRange(alias, max_size, alias.length);
        }

        return sendPush(PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.alias(alias))
                .setNotification(Notification.android(pushBean.getAlert(), pushBean.getTitle(), pushBean.getExtras()))
                .setOptions(getOptions())
                .build());
    }

    private Options getOptions() {
        Map<String, JsonObject> third_party_channel = new HashMap<>();
        JsonObject hwParam = new JsonObject();
        hwParam.addProperty("distribution","secondary_push");
        hwParam.addProperty("importance","NORMAL");
        hwParam.addProperty("category","IM");

        JsonObject honorParam = new JsonObject();
        honorParam.addProperty("importance","NORMAL");
        honorParam.addProperty("category","IM");

        JsonObject xmParam = new JsonObject();
//        xmParam.addProperty("distribution","secondary_push");
        xmParam.addProperty("channel_id","126334");

        JsonObject oppoParam = new JsonObject();
//        oppoParam.addProperty("distribution","secondary_push");
        oppoParam.addProperty("channel_id","12345");

        JsonObject vivoParam = new JsonObject();
        vivoParam.addProperty("classification",1);

        third_party_channel.put("huawei",hwParam);
        third_party_channel.put("xiaomi",xmParam);
        third_party_channel.put("oppo",oppoParam);
        third_party_channel.put("vivo",vivoParam);
        third_party_channel.put("honor",honorParam);

        Options option = Options.newBuilder()
//                .setApnsProduction(false)
//                .setClassification(1)
//                .setTimeToLive(43200)
                .setThirdPartyChannelV2(third_party_channel)
                .build();
        return option;
    }

    /**
     * 剔除无效registed
     * @param registids
     * @return
     */
    @Override
    public String[] checkRegistids(String[] registids) {
        List<String> regList = new ArrayList<String>(registids.length);
        for (String registid : registids) {
            if (registid!=null && !"".equals(registid.trim())) {
                regList.add(registid);
            }
        }
        return regList.toArray(new String[0]);
    }
 
    /**
     * 调用api推送
     * @param pushPayload 推送实体
     * @return
     */
    @Override
    public boolean sendPush(PushPayload pushPayload){
        PushResult result = null;
        try{
            result = jPushConfig.getJPushClient().sendPush(pushPayload);
        } catch (APIConnectionException e) {
            log.error("极光推送连接异常: ", e);
        } catch (APIRequestException e) {
            log.error("极光推送请求异常: ", e);
        }
        if (result!=null && result.isResultOK()) {
            log.info("极光推送请求成功: {}", result);
            return true;
        }else {
            log.info("极光推送请求失败: {}", result);
            return false;
        }
    }
} 