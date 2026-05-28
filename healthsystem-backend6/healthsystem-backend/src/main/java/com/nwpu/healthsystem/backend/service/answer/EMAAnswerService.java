package com.nwpu.healthsystem.backend.service.answer;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.common.dto.echarts.Inference;
import com.nwpu.healthsystem.backend.common.dto.echarts.PamScoreResponseDto;
import com.nwpu.healthsystem.backend.entity.PushBean;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.entity.answer.EMAAnswer;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.mapper.answer.EMAAnswerMapper;
import com.nwpu.healthsystem.backend.mapper.answer.SpeakAnytimeMapper;
import com.nwpu.healthsystem.backend.mapper.answer.VideoMapper;
import com.nwpu.healthsystem.backend.service.JiGuangPushService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import com.nwpu.healthsystem.backend.utils.ResponseProcess;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.TemporalField;
import java.util.*;
import java.util.stream.Collectors;



@Slf4j
@Service
public class EMAAnswerService {
    private final EMAAnswerMapper emaAnswerMapper;
    private final SpeakAnytimeMapper speakAnytimeMapper;
    private final VideoMapper videoMapper;

    @Autowired
    private JiGuangPushService jiGuangPushService;

    @Autowired
    private UserInfoMapper userInfoMapper;

    EMAAnswerService(EMAAnswerMapper emaAnswerMapper,
                     SpeakAnytimeMapper speakAnytimeMapper,
                     VideoMapper videoMapper) {
        this.emaAnswerMapper = emaAnswerMapper;
        this.speakAnytimeMapper = speakAnytimeMapper;
        this.videoMapper = videoMapper;
    }


    public Response insert(EMAAnswer emaAnswer){
        try{
            // 进行校验，检查EMA问卷信息的id与token是否符合
//            AccountCheckUtil.checkByUserId(emaAnswer.getUserId());

            // 逻辑变了：前端不需要传userid了，后端直接从Token里面获取
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            emaAnswer.setUserId(userIdFromToken);
            if(emaAnswer.getId()==0){
                // 验证通过，插入数据
                int insertEmotionAnswer = emaAnswerMapper.insertEMAAnswer(emaAnswer);
            }else{
                int insertEmotionAnswer = emaAnswerMapper.updateEMAAnswer(emaAnswer);
            }

            return Response.success("");
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("添加失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getEMAAnswerList(int currentPage, int pageSize){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

//            // 获取总条数
//            int count = emaAnswerMapper.getCount(userIdFromToken);
//            pageInfo.setTotalNumber(count);
//            // 进行计算，共有多少页，页码越界纠正
//            pageInfo.count();

            // 查询一页的问卷信息
            List<EMAAnswer> emaAnswerList = emaAnswerMapper.getEMAAnswerListByPage(userIdFromToken, pageInfo);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", emaAnswerList)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

//    返回一段时间内的所有ema数据，单位：天
    public Response getEMAAnswerListBySelectTime(int period){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            List<EMAAnswer> emaAnswerListBySelectTime = emaAnswerMapper.getEMAAnswerListBySelectTime(userIdFromToken, period);
            // 封装返回信息
            return Response.success(emaAnswerListBySelectTime);
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    // 画pam、情绪图的接口（用户端）
    public Response getPamListByDate(Date date){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            // 查询 val 和 arousal的
            List<PamScoreResponseDto> pamListByDate = emaAnswerMapper.getPamListByDate(userIdFromToken, date);
            // 查询 audio 的情感
            List<Inference> inferenceByDate = speakAnytimeMapper.getInferenceByDate(userIdFromToken, date);
            // 查询 video 的情感
            List<Inference> inferenceByDate1 = videoMapper.getInferenceByDate(userIdFromToken, date);
            // 查询 ema 中的情感
            List<EMAAnswer> emaAnswerListByDate = emaAnswerMapper.getEMAAnswerListByDate(userIdFromToken, date);
            // 合并情感数据 按时间排序

            //  EMAAnswer 转 Inference
            // 整理 emaAnswerListByDate 数据（有的是英文标签，有的是中文标签，同一转换英文）
            for (EMAAnswer emaAnswer:
                    emaAnswerListByDate) {
                emaAnswer.setMood(C2EMap.get(emaAnswer.getMood()));

                Inference inference = new Inference(emaAnswer.getLogDate(), emaAnswer.getLogTime(), emaAnswer.getMood());
                inferenceByDate.add(inference);
            }

            // 将上面两个数组按时间顺序合并（视频和音频）
            inferenceByDate.addAll(inferenceByDate1);
            // 排序
            inferenceByDate.sort(Comparator.comparing(Inference::getLogTime));

            // 统计数目，包括一些异常情况
            HashMap<String, Integer> moodCount = new HashMap<String, Integer>();
            moodCount.put("Happy", 0);
            moodCount.put("Neutral", 0);
            moodCount.put("Sad", 0);
            moodCount.put("Angry", 0);
            moodCount.put("Fear", 0);
            moodCount.put("Anxious", 0);
            moodCount.put("Disgust", 0);
            moodCount.put("Tired", 0);      // 这一种是单独的，ema中的

            // 所有情感（有效的）的详细信息，用于前端页面画图
            ArrayList<Inference> inferences4Return = new ArrayList<>();

            // 遍历 情感信息列表（有些null， 有些错误信息）
            for (Inference infer:
                    inferenceByDate) {
                String mood = infer.getInference();

                // 还未处理完毕或者 有错误，数据库中的值是null；  移除这一项，继续循环（后来发现这种for循环还不能直接移除，移除会直接跳出循环）
                if(null == mood) {
                    // 这种迭代方式还不能 直接remove
//                    inferenceByDate.remove(infer);
                    continue;
                }

                //检查是否存在键：应对情绪名称不一样的意外情况和 出错的情况
                boolean isExist = moodCount.containsKey(mood);

                if(isExist) {
                    // 相应情感数 + 1；添加到返回列表
                    moodCount.put(mood, moodCount.get(mood) + 1);
                    inferences4Return.add(infer);
                } else {
                    // 相应错误信息 + 1；
                    moodCount.put(mood, 1);
                }
                // 不存在 加进去(统计情况)，返回给前端
            }

            int positiveMood = moodCount.get("Happy");
            int neutralMood = moodCount.get("Neutral");
            int negtiveMood = moodCount.get("Sad");
            negtiveMood += moodCount.get("Angry");
            negtiveMood += moodCount.get("Fear");
            negtiveMood += moodCount.get("Anxious");
            negtiveMood += moodCount.get("Disgust");
            negtiveMood += moodCount.get("Tired");

            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pam",pamListByDate)
                    .put("emotion",inferences4Return)
                    .put("countPositive",positiveMood)
                    .put("countNeutral",neutralMood)
                    .put("countNegtive",negtiveMood)
                    .put("emo-detail",moodCount)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    //  返回一段时间内 所有 pam数据，补0
    public Response getPamListBySelectTime(int period){
        try{
            Assert.isTrue(period >= 1, "时间区间长度至少要大于1");

            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            List<PamScoreResponseDto> pamListBySelectTime = emaAnswerMapper.getPamListBySelectTime(userIdFromToken, period);

            // 日期插值
            pamListBySelectTime = ResponseProcess.DateInterpolation(pamListBySelectTime, period, PamScoreResponseDto.class);
            // 封装返回信息
            return Response.success(pamListBySelectTime);
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }


    /*
    * 医生端接口
    *
    * */

    // 中英文映射
    public final static HashMap<String, String> C2EMap = new HashMap();
    static {
        C2EMap.put("高兴", "Happy");
        C2EMap.put("中性", "Neutral");
        C2EMap.put("悲伤", "Sad");
        C2EMap.put("生气", "Angry");
        C2EMap.put("恐惧", "Fear");
        C2EMap.put("焦虑", "Anxious");
        C2EMap.put("疲惫", "Tired");
    }

    //    医生端 画pam、情绪图的接口
    public Response getPamListByDate4Doctor(Date date, long userId){
        try{
            // 查询 val 和 arousal的
            List<PamScoreResponseDto> pamListByDate = emaAnswerMapper.getPamListByDate(userId, date);
            // 查询 audio 的情感
            List<Inference> inferenceByDate = speakAnytimeMapper.getInferenceByDate(userId, date);
            // 查询 video 的情感
            List<Inference> inferenceByDate1 = videoMapper.getInferenceByDate(userId, date);
            // 查询 ema 中的情感
            List<EMAAnswer> emaAnswerListByDate = emaAnswerMapper.getEMAAnswerListByDate(userId, date);
            // 合并情感数据 按时间排序

            //  EMAAnswer 转 Inference
            // 整理 emaAnswerListByDate 数据（有的是英文标签，有的是中文标签，同一转换英文）
            for (EMAAnswer emaAnswer:
                 emaAnswerListByDate) {
                emaAnswer.setMood(C2EMap.get(emaAnswer.getMood()));

                Inference inference = new Inference(emaAnswer.getLogDate(), emaAnswer.getLogTime(), emaAnswer.getMood());
                inferenceByDate.add(inference);
            }

            // 将上面两个数组按时间顺序合并（视频和音频）
            inferenceByDate.addAll(inferenceByDate1);
            // 排序
            inferenceByDate.sort(Comparator.comparing(Inference::getLogTime));

            // 统计数目，包括一些异常情况
            HashMap<String, Integer> moodCount = new HashMap<String, Integer>();
            moodCount.put("Happy", 0);
            moodCount.put("Neutral", 0);
            moodCount.put("Sad", 0);
            moodCount.put("Angry", 0);
            moodCount.put("Fear", 0);
            moodCount.put("Anxious", 0);
            moodCount.put("Disgust", 0);
            moodCount.put("Tired", 0);      // 这一种是单独的，ema中的

            // 所有情感（有效的）的详细信息，用于前端页面画图
            ArrayList<Inference> inferences4Return = new ArrayList<>();

            // 遍历 情感信息列表（有些null， 有些错误信息）
            for (Inference infer:
                 inferenceByDate) {
                String mood = infer.getInference();

                // 还未处理完毕或者 有错误，数据库中的值是null；  移除这一项，继续循环（后来发现这种for循环还不能直接移除，移除会直接跳出循环）
                if(null == mood) {
                    // 这种迭代方式还不能 直接remove
//                    inferenceByDate.remove(infer);
                    continue;
                }

                //检查是否存在键：应对情绪名称不一样的意外情况和 出错的情况
                boolean isExist = moodCount.containsKey(mood);

                if(isExist) {
                    // 相应情感数 + 1；添加到返回列表
                    moodCount.put(mood, moodCount.get(mood) + 1);
                    inferences4Return.add(infer);
                } else {
                    // 相应错误信息 + 1；
                    moodCount.put(mood, 1);
                }
                // 不存在 加进去(统计情况)，返回给前端
            }

            int positiveMood = moodCount.get("Happy");
            int neutralMood = moodCount.get("Neutral");
            int negtiveMood = moodCount.get("Sad");
            negtiveMood += moodCount.get("Angry");
            negtiveMood += moodCount.get("Fear");
            negtiveMood += moodCount.get("Anxious");
            negtiveMood += moodCount.get("Disgust");
            negtiveMood += moodCount.get("Tired");

            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pam",pamListByDate)
                    .put("emotion",inferences4Return)
                    .put("countPositive",positiveMood)
                    .put("countNeutral",neutralMood)
                    .put("countNegtive",negtiveMood)
                    .put("emo-detail",moodCount)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getRecentInput(){
        try{
            long userId = AccountCheckUtil.getUserIdFromToken();
            Date date = new Date(System.currentTimeMillis());
            List<EMAAnswer> recentInput = emaAnswerMapper.getRecentInput(userId,date);

            EMAAnswer es = null;
            LocalTime lt = LocalTime.now();
            int nowHour = lt.getHour();

            //根据当前时间，返回当前时间段的填报记录
            int startHour;
            int endHour;
            if(nowHour<12){
                startHour=0;
                endHour=11;
            } else if(nowHour>=12 && nowHour<18){
                startHour=12;
                endHour=17;
            }else {
                startHour=18;
                endHour=23;
            }
            if(recentInput!=null && recentInput.size()>0){
                List<EMAAnswer> collect = recentInput.stream().filter(e -> {
                    int hour = e.getLogTime().toLocalTime().getHour();
                    return hour >= startHour && hour <= endHour;
                }).collect(Collectors.toList());
                if(collect.size()>0){
                    es=collect.get(0);
                }
            }

            return Response.success(es);
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public void remindInput() {
        log.info("情绪提醒任务：开始执行");
        //晚上9点开始提醒
        LocalDateTime now = LocalDateTime.now();
        if(now.getHour()<10){
            log.info("情绪提醒任务：未到早上10点，无需提醒");
            return;
        }

        List<Long> usersNotAnswered = getNotAnsweredUsersIds(now);

        //定义和赋值推送实体
        PushBean pushBean = new PushBean();
        pushBean.setTitle("填报提醒");
        pushBean.setAlert("您当前时段还未填报情绪，请及时填报");

        //进行推送，推送到指定Android客户端的用户，返回推送结果布尔值
        String [] rids = usersNotAnswered.stream().map(e->e.toString()).collect(Collectors.toList()).toArray(new String[0]);
        if(rids!=null && rids.length>0){
            log.info("情绪提醒任务：开始推送消息，推送用户数量："+rids.length);
            boolean flag = jiGuangPushService.pushAndroid(pushBean,rids);
            if(flag){
                log.info("日常状态提醒任务：推送结果"+flag+"，推送用户数量："+rids.length);
            }
        }else{
            log.info("情绪提醒任务：无需要推送的用户");
        }
    }

    private List<Long> getNotAnsweredUsersIds(LocalDateTime searchTime) {
        //所有用户列表
        List<UserInfo> user = userInfoMapper.getUsersByRole("user");
        List<UserInfo> user2 = userInfoMapper.getUsersByRole("admin");
        user.addAll(user2);

        //填写了的用户列表
        Date date = new Date(System.currentTimeMillis());
        List<EMAAnswer> usersDone = emaAnswerMapper.getRecentInputs(date);

        int nowHour = searchTime.getHour();
        int startHour;
        int endHour;
        if(nowHour<12){
            startHour=0;
            endHour=11;
        } else if(nowHour>=12 && nowHour<18){
            startHour=12;
            endHour=17;
        }else {
            startHour=18;
            endHour=23;
        }

        //将当前时间段的填写记录筛选出来
        usersDone=usersDone.stream().filter(e->e.getLogTime().getHours()>startHour && e.getLogTime().getHours()<endHour
        ).collect(Collectors.toList());

        List<Long> answeredUserIds;
        if(usersDone!=null && usersDone.size()>0){
            answeredUserIds=usersDone.stream().map(e->e.getUserId()).collect(Collectors.toList());
        } else {
            answeredUserIds = new ArrayList<>();
        }

        List<Long> usersNotAnswered = user.stream().filter(e -> {
            //未答题
            boolean b = !answeredUserIds.contains(e.getUserId());

            //用户在200天内成功登录过，连接到了推送服务
            if(e.getPushConnected()==null)
                return false;

            long time = e.getPushConnected().getTime();
            long now = System.currentTimeMillis();
            return b && (now - time > 200 * 24 * 60 * 60 * 1000);
        }).map(e -> e.getUserId()).collect(Collectors.toList());
        return usersNotAnswered;
    }
}
