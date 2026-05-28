package com.nwpu.healthsystem.backend.service.answer;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.common.dto.echarts.SleepAndSportsTimeResponseDto;
import com.nwpu.healthsystem.backend.entity.PushBean;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.mapper.answer.AnswerMapper;
import com.nwpu.healthsystem.backend.service.JiGuangPushService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import com.nwpu.healthsystem.backend.utils.ResponseProcess;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Time;
import java.time.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Slf4j
@Service
public class AnswerService {
    private final AnswerMapper answerMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private JiGuangPushService jiGuangPushService;

    AnswerService(AnswerMapper answerMapper) {
        this.answerMapper = answerMapper;
    }

    public Response insertOrUpdate(Answer answer) {
        try {
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            answer.setUserId(userIdFromToken);

//            // 数据预处理：睡眠时间不是直接传了，而是根据睡眠开始和结束时间计算
//            double sleepTimeByCal = getSleepTime(answer.getSleepTimeStart(), answer.getSleepTimeEnd());
//            answer.setSleepTime(sleepTimeByCal);

            // 查看数据库今天是否有记录， 有就更新，没有就插入
            Date date = new Date(System.currentTimeMillis());
            if (answer.getId() != 0) {
                int i = answerMapper.updateAnswer(answer);
                return Response.success("更新成功");
            } else {
//                answer.setLogDate(date);  // 这里使用的是系统当前日期
                // 设置逻辑日期
                Date logicalDate = getLogicalToday();
                answer.setLogDate(logicalDate);
                int i = answerMapper.insertAnswer(answer);
                return Response.success("记录成功");
            }
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e) {
            log.error("记录失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getAnswerList(int currentPage, int pageSize) {
        try {
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<Answer> answerListByPage = answerMapper.getAnswerListByPage(userIdFromToken, pageInfo);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", answerListByPage)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e) {
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    private Date getLogicalToday() {
        LocalDateTime now = LocalDateTime.now();

        if (now.getHour() < 5) {
            now = now.minusDays(1);
        }

        LocalDate logicalToday = now.toLocalDate();
        return Date.valueOf(logicalToday);
    }


    public Response getTodayDetail(){
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            Date logicalDate = getLogicalToday();  // 用逻辑上的今天
            return Response.success(answerMapper.getTodayDetail(userId, logicalDate));
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            log.error("查询失败，原因:" + e.getMessage());
            return Response.fail("");
        }
    }


    public Response getToday(){
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            Date logicalDate = getLogicalToday();  // 用逻辑上的今天

            if(answerMapper.getToday(userId, logicalDate) > 0) {
                return Response.success("今日已填报");
            } else {
                return Response.success("今日未填报");
            }
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getMessage());
            return Response.fail("");
        }
    }



    //  返回一段时间内 所有 sleep-time 数据，补0
    public Response getSleepAndSportsTimeBySelectTime(int period){
        try{
            Assert.isTrue(period >= 1, "时间区间长度至少要大于等于1");

            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            List<SleepAndSportsTimeResponseDto> sleepAndSportsTimeBySelectTime = answerMapper.getSleepAndSportsTimeBySelectTime(userIdFromToken, period);

            // 日期插值
            sleepAndSportsTimeBySelectTime = ResponseProcess.DateInterpolation(sleepAndSportsTimeBySelectTime,
                    period,
                    SleepAndSportsTimeResponseDto.class);
            // 封装返回信息
            return Response.success(sleepAndSportsTimeBySelectTime);
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }


    /*
     *
     * 医生端接口：
     * */
//  返回一段时间内 所有 slepp-time 数据，补0
    public Response getSleepAndSportsTime4Doctor(int period, long userId){
        try{
            Assert.isTrue(period >= 1, "时间区间长度至少要大于等于1");

//            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            // 注意：此处还有问题，此处应验证：要查询的用户是否属于该医生（user的doctorId == groupId）



            List<SleepAndSportsTimeResponseDto> sleepAndSportsTimeBySelectTime = answerMapper.getSleepAndSportsTimeBySelectTime(userId, period);

            // 日期插值
            sleepAndSportsTimeBySelectTime = ResponseProcess.DateInterpolation(sleepAndSportsTimeBySelectTime,
                    period,
                    SleepAndSportsTimeResponseDto.class);
            // 封装返回信息
            return Response.success(sleepAndSportsTimeBySelectTime);
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }


    double getSleepTime(Time start, Time end) {
        LocalTime from = start.toLocalTime();
        LocalTime to = end.toLocalTime();

        Duration d = Duration.between(from, to);

        long minutes = d.toMinutes();
        System.out.printf("minute:" + minutes);

        if(minutes < 0) {
            minutes = minutes + 24 * 60;
        }

        double hours = minutes / 60;

        long less_time = minutes % 60;
        if(less_time >= 45){
            hours += 1;
        }else if(less_time >= 15){
            hours += 0.5;
        }

        return hours;
    }


    public void remindInput() {
        log.info("日常状态提醒任务：开始执行");
        //晚上9点开始提醒
        LocalDateTime now = LocalDateTime.now();
        if(now.getHour()<21){
            log.info("日常状态提醒任务：未到晚上9点，无需提醒");
            return;
        }

        List<Long> usersNotAnswered = getNotAnsweredUsersIds();

        //定义和赋值推送实体
        PushBean pushBean = new PushBean();
        pushBean.setTitle("填报提醒");
        pushBean.setAlert("您今日还未填报日常状态，请及时填报");

        //进行推送，推送到指定Android客户端的用户，返回推送结果布尔值
        String [] rids = usersNotAnswered.stream().map(e->e.toString()).collect(Collectors.toList()).toArray(new String[0]);
        if(rids!=null && rids.length>0){
            log.info("日常状态提醒任务：开始推送消息，推送用户数量："+rids.length);
            boolean flag = jiGuangPushService.pushAndroid(pushBean,rids);
            if(flag){
                log.info("日常状态提醒任务：推送结果"+flag+"，推送用户数量："+rids.length);
            }
        }else{
            log.info("日常状态提醒任务：无需要推送的用户");
        }
    }

    private List<Long> getNotAnsweredUsersIds() {
        //所有用户列表
        List<UserInfo> user = userInfoMapper.getUsersByRole("user");
        List<UserInfo> user2 = userInfoMapper.getUsersByRole("admin");
        user.addAll(user2);

        //填写了今日状态的用户列表
        Date date = new Date(System.currentTimeMillis());
        List<Answer> usersDone = answerMapper.getTodayAnswered(date);
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

    /**
     * 根据用户 ID 查询该用户的全部填报信息
     * @param userId 要查询的用户 ID
     * @return 包含查询结果的 Response，若查询到数据，data 为 List<Answer>；若未查询到或出错，包含对应提示
     */
    public Response getAnswerListByUserId(Long userId) {
        try {
            // 校验用户 ID 合法性，比如不能为 null 或小于 0 等（可根据实际业务需求调整校验逻辑）
            Assert.notNull(userId, "用户 ID 不能为 null");
            Assert.isTrue(userId > 0, "用户 ID 需为正整数");

            // 调用 Mapper 方法查询该用户的全部填报信息
            List<Answer> answerList = answerMapper.getAnswerListByUserId(userId);

            if (answerList != null && !answerList.isEmpty()) {
                return Response.success(answerList);
            }
            return Response.fail("未查询到用户 ID 为 [" + userId + "] 的填报信息");
        } catch (IllegalArgumentException e) {
            // 处理 Assert 抛出的参数校验异常，可根据需要转换为更友好的提示返回给前端
            log.error("查询用户填报信息参数校验失败，原因: {}", e.getMessage());
            return Response.fail("参数校验失败：" + e.getMessage());
        } catch (Exception e) {
            log.error("查询用户填报信息失败，用户 ID: {}, 原因: {}", userId, e.getCause().getMessage());
            return Response.fail("查询用户填报信息失败，请稍后重试");
        }
    }

    /**
     * 检查用户在指定日期是否有填报记录
     * @param userId 用户ID
     * @param date 检查日期（可为null，默认逻辑今天）
     * @return 是否填报
     */
    public boolean hasReportRecord(Long userId, java.util.Date date) {  // 明确参数为java.util.Date
        if (userId == null) {
            throw new IllegalArgumentException("用户ID不能为空");
        }

        // 处理日期参数：未传则使用系统逻辑日期（复用已有逻辑）
        java.util.Date checkDate = (date == null) ? getLogicalToday() : date;

        // 将java.util.Date转换为LocalDate（基于系统默认时区）
        LocalDate localDate = checkDate.toInstant()
                .atZone(ZoneId.systemDefault())  // 现在ZoneId可正常使用
                .toLocalDate();

        // 定义查询时间范围
        java.util.Date startTime, endTime;
        if (date == null) {
            // 逻辑今天：昨天5点至今天5点
            LocalDateTime start = localDate.atTime(5, 0);
            LocalDateTime end = localDate.plusDays(1).atTime(5, 0);
            startTime = java.util.Date.from(start.atZone(ZoneId.systemDefault()).toInstant());
            endTime = java.util.Date.from(end.atZone(ZoneId.systemDefault()).toInstant());
        } else {
            // 指定日期：当天0点至次日0点
            LocalDateTime start = localDate.atStartOfDay();
            LocalDateTime end = localDate.plusDays(1).atStartOfDay();
            startTime = java.util.Date.from(start.atZone(ZoneId.systemDefault()).toInstant());
            endTime = java.util.Date.from(end.atZone(ZoneId.systemDefault()).toInstant());
        }

        // 转换为java.sql.Date供Mapper使用
        java.sql.Date sqlStart = new java.sql.Date(startTime.getTime());
        java.sql.Date sqlEnd = new java.sql.Date(endTime.getTime());

        // 调用Mapper查询
        int count = answerMapper.countByUserIdAndTimeRange(userId, sqlStart, sqlEnd);
        return count > 0;
    }
}
