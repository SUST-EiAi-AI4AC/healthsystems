package com.nwpu.healthsystem.backend.service;

import cn.jpush.api.push.model.PushPayload;
import com.nwpu.healthsystem.backend.entity.PushBean;

public interface JiGuangPushService {
 
    /**
     * 广播 (所有平台，所有设备, 不支持附加信息)
     * @return
     */
    public boolean pushAll(PushBean pushBean);
 
    /**
     * 推送全部ios ios广播
     * @return
     */
    public boolean pushIos(PushBean pushBean);
 
    /**
     * 推送ios 指定id
     * @return
     */
    public boolean pushIos(PushBean pushBean, String... registids);
 
    /**
     * 推送全部android
     * @return
     */
    public boolean pushAndroid(PushBean pushBean);
 
    /**
     * 推送android 指定id
     * @return
     */
    public boolean pushAndroid(PushBean pushBean, String... registids);
 
    /**
     * 剔除无效registed
     * @param registids
     * @return
     */
    public String[] checkRegistids(String[] registids);
 
    /**
     * 调用api推送
     * @param pushPayload 推送实体
     * @return
     */
    public boolean sendPush(PushPayload pushPayload);
} 