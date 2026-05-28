package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.PushBean;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.entity.scale.SAS;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.mapper.scale.SASMapper;
import com.nwpu.healthsystem.backend.service.JiGuangPushService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
public class SASService {
    private final SASMapper sasMapper;

    @Autowired
    private JiGuangPushService jiGuangPushService;

    @Autowired
    private UserInfoMapper userInfoMapper;

    public SASService(SASMapper sasMapper) {
        this.sasMapper = sasMapper;
    }

    public Response insertOrUpdate(SAS sas){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            sas.setUserId(userIdFromToken);

            //  计算分数
            sas.setScore(calculateScore(sas));

            if(sas.getId()==0){
                Date date = new Date(System.currentTimeMillis());
                sas.setLogDate(date);

                int i = sasMapper.insertSAS(sas);
                return Response.success("记录成功", sas.getScore());
            }else{
                int i = sasMapper.updateSAS(sas);
                return Response.success("更新成功", sas.getScore());
            }
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("记录失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getSASList(int currentPage, int pageSize){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<SAS> sasListByPage = sasMapper.getSASListByPage(userIdFromToken, pageInfo);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", sasListByPage)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getSASList4Doctor(int currentPage, int pageSize, long userId){
        try{

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<SAS> sasScaleListByPage = sasMapper.getSASListByPage(userId, pageInfo);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", sasScaleListByPage)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getToday(){
        try{
            long userId = AccountCheckUtil.getUserIdFromToken();
            // 查看数据库今天是否有记录， 有就更新，没有就插入
            Date date = new Date(System.currentTimeMillis());
            // 这里不知道会不会有个问题： 由于要验证数据库里面有没有今天的记录，所有要核对日期，有没有可能java的时间和数据库的时间不一样？
            if(0 < sasMapper.getToday(userId, date)) {
                return Response.success("今日已填报");
            } else {
                return Response.success("今日未填报");
            }
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    // 计算分数
    public static byte calculateScore(SAS sas) {
        byte score = 0;

        score += sas.getSasQ1();
        score += sas.getSasQ2();
        score += sas.getSasQ3();
        score += sas.getSasQ4();
        score += (byte) (5 - sas.getSasQ5());
        score += sas.getSasQ6();
        score += sas.getSasQ7();
        score += sas.getSasQ8();
        score += (byte) (5 - sas.getSasQ9());
        score += sas.getSasQ10();
        score += sas.getSasQ11();
        score += sas.getSasQ12();
        score += (byte) (5 - sas.getSasQ13());
        score += sas.getSasQ14();
        score += sas.getSasQ15();
        score += sas.getSasQ16();
        score += (byte) (5 - sas.getSasQ17());
        score += sas.getSasQ18();
        score += (byte) (5 - sas.getSasQ19());
        score += sas.getSasQ20();
        score = (byte) (score * 1.25);

        return score;
    }

    public Response getRecentInput(){
        try{
            long userId = AccountCheckUtil.getUserIdFromToken();
            return Response.success(sasMapper.getRecentInput(userId));
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public void remindInput() {
        log.info("SAS提醒任务：开始执行");
        //每周日12点开始提醒
        LocalDateTime now = LocalDateTime.now();
        if(now.getDayOfWeek() != DayOfWeek.SUNDAY && now.getHour() < 11){
            log.info("SAS提醒任务：未到周日12点以后，无需提醒");
            return;
        }

        List<Long> usersNotAnswered = getNotAnsweredUsersIds();

        //定义和赋值推送实体
        PushBean pushBean = new PushBean();
        pushBean.setTitle("填报提醒");
        pushBean.setAlert("您近两周还未填报焦虑自测量表SAS，请及时填报");

        //进行推送，推送到指定Android客户端的用户，返回推送结果布尔值
        String [] rids = usersNotAnswered.stream().map(e->e.toString()).collect(Collectors.toList()).toArray(new String[0]);
        if(rids!=null && rids.length>0){
            log.info("SAS提醒任务：开始推送消息，推送用户数量："+rids.length);
            boolean flag = jiGuangPushService.pushAndroid(pushBean,rids);
            if(flag){
                log.info("SAS提醒任务：推送结果"+flag+"，推送用户数量："+rids.length);
            }
        }else{
            log.info("SAS提醒任务：无需要推送的用户");
        }
    }

    private List<Long> getNotAnsweredUsersIds() {
        //所有用户列表
        List<UserInfo> user = userInfoMapper.getUsersByRole("user");
        List<UserInfo> user2 = userInfoMapper.getUsersByRole("admin");
        user.addAll(user2);

        //填写了的用户列表
        List<SAS> usersDone = sasMapper.getRecentInputs();
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

    public Response getAlldata() {
        try{
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            List<SAS> allData = sasMapper.getAllData();
            List<SAS> submissions =new ArrayList<>();
            for (int i = 0; i < allData.size(); i++) {
                Date logDate = allData.get(i).getLogDate();
                long userId = allData.get(i).getUserId();
                byte score = allData.get(i).getScore();
                String username = allData.get(i).getUsername();
                submissions.add(new SAS(userId,logDate,score,username));
            }
            System.out.println("submissions"+submissions);
            Map<Integer, List<SAS>> submissionsByUser = new HashMap<>();
            for (SAS sas : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sas.getUserId(), k -> new ArrayList<>())
                        .add(sas);
            }
            List<SAS> firstSubmissions = new ArrayList<>();
            List<SAS> secondSubmissions = new ArrayList<>();
            List<SAS> thirdSubmissions = new ArrayList<>();
            for (Map.Entry<Integer, List<SAS>> entry : submissionsByUser.entrySet()) {
                List<SAS> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(sub -> sub.getLogDate().toString()));

                if (userSubmissions.size() > 0) {
                    firstSubmissions.add(userSubmissions.get(0));
                }
                if (userSubmissions.size() > 1) {
                    secondSubmissions.add(userSubmissions.get(1));
                }
                if (userSubmissions.size() > 2) {
                    thirdSubmissions.add(userSubmissions.get(2));
                }
            }
            System.out.println("第一次提交的数据: " + firstSubmissions);
            System.out.println("第二次提交的数据: " + secondSubmissions);
            System.out.println("第三次提交的数据: " + thirdSubmissions);
            HashMap<String, List<SAS>> objectObjectHashMap = new HashMap<>();
            objectObjectHashMap.put("1", firstSubmissions);
            objectObjectHashMap.put("2", secondSubmissions);
            objectObjectHashMap.put("3", thirdSubmissions);
            return Response.success(objectObjectHashMap);
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getAllFormdata() {
        try{
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            List<SAS> allData = sasMapper.getAllData();
            List<SAS> submissions =new ArrayList<>();
            for (int i = 0; i < allData.size(); i++) {
                Date logDate = allData.get(i).getLogDate();
                long userId = allData.get(i).getUserId();
                byte score = allData.get(i).getScore();
                String username = allData.get(i).getUsername();
                submissions.add(new SAS(userId,logDate,score,username));
            }
            System.out.println("submissions"+submissions);
            Map<Integer, List<SAS>> submissionsByUser = new HashMap<>();
            for (SAS sas : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sas.getUserId(), k -> new ArrayList<>())
                        .add(sas);
            }
            List<SAS> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<SAS>> entry : submissionsByUser.entrySet()) {
                List<SAS> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(sub -> sub.getLogDate().toString()));

                SAS first = userSubmissions.get(0);
                SAS second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                SAS third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;

                System.out.println("User ID: " + entry.getKey());
                System.out.println("第一次: " + first);
                if (second!=null){
                    first.setScore2(second.getScore());
                    first.setLogDate2(second.getLogDate());
                }
                if (third != null) {
                    first.setScore3(third.getScore());
                    first.setLogDate3(third.getLogDate());
                }
                if (second != null) {
                    System.out.println("第二次: " + second);
                }
                if (third != null) {
                    System.out.println("第三次: " + third);
                }
                objects.add(first);
            }
            return Response.success(0, "操作成功",
                    MapUtil.builder()
                            .put("data", objects)
                            .map());
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getAllDdata() {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            List<SAS> allData = sasMapper.getAllData();

            // 遍历数据，将不在0-19范围内的score置为null
            for (SAS sas : allData) {
                if (sas.getScore() < 50 || sas.getScore() > 59) {
                    sas.setScore((byte) 0); // 假设setScore接受null或可以修改为Integer类型
                }
            }

            List<SAS> submissions = new ArrayList<>(allData); // 无需过滤，因为所有数据都需要

            Map<Integer, List<SAS>> submissionsByUser = new HashMap<>();
            for (SAS sas : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sas.getUserId(), k -> new ArrayList<>())
                        .add(sas);
            }

            List<SAS> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<SAS>> entry : submissionsByUser.entrySet()) {
                List<SAS> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(SAS::getLogDate));

                if (!userSubmissions.isEmpty()) {
                    SAS first = userSubmissions.get(0);
                    SAS second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                    SAS third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;
                    if (second != null) {
                        first.setScore2(second.getScore()); // 注意这里不会将null设置为second.getScore()，如果second的score是null，则保持first.score2不变
                        first.setLogDate2(second.getLogDate());
                    }
                    if (third != null) {
                        first.setScore3(third.getScore()); // 注意这里不会将null设置为second.getScore()，如果second的score是null，则保持first.score2不变
                        first.setLogDate3(third.getLogDate());
                    }
                    objects.add(first);
                }
            }
            return Response.success(0, "操作成功", MapUtil.builder().put("data", objects).map());
        } catch (Exception e) {
            log.error("查询失败，原因: " + e.getMessage());
            return Response.fail("查询失败");
        }
    }

    public Response getAllZdata() {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            List<SAS> allData = sasMapper.getAllData();

            // 遍历数据，将不在0-19范围内的score置为null
            for (SAS sas : allData) {
                if (sas.getScore() < 60 || sas.getScore() > 69) {
                    sas.setScore((byte) 0); // 假设setScore接受null或可以修改为Integer类型
                }
            }

            List<SAS> submissions = new ArrayList<>(allData); // 无需过滤，因为所有数据都需要

            Map<Integer, List<SAS>> submissionsByUser = new HashMap<>();
            for (SAS sas : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sas.getUserId(), k -> new ArrayList<>())
                        .add(sas);
            }

            List<SAS> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<SAS>> entry : submissionsByUser.entrySet()) {
                List<SAS> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(SAS::getLogDate));

                if (!userSubmissions.isEmpty()) {
                    SAS first = userSubmissions.get(0);
                    SAS second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                    SAS third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;
                    if (second != null) {
                        first.setScore2(second.getScore()); // 注意这里不会将null设置为second.getScore()，如果second的score是null，则保持first.score2不变
                        first.setLogDate2(second.getLogDate());
                    }
                    if (third != null) {
                        first.setScore3(third.getScore()); // 注意这里不会将null设置为second.getScore()，如果second的score是null，则保持first.score2不变
                        first.setLogDate3(third.getLogDate());
                    }
                    objects.add(first);
                }
            }
            return Response.success(0, "操作成功", MapUtil.builder().put("data", objects).map());
        } catch (Exception e) {
            log.error("查询失败，原因: " + e.getMessage());
            return Response.fail("查询失败");
        }
    }

    public Response getAllGdata() {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            List<SAS> allData = sasMapper.getAllData();

            // 遍历数据，将不在0-19范围内的score置为null
            for (SAS sas : allData) {
                if (sas.getScore() < 70) {
                    sas.setScore((byte) 0); // 假设setScore接受null或可以修改为Integer类型
                }
            }

            List<SAS> submissions = new ArrayList<>(allData); // 无需过滤，因为所有数据都需要

            Map<Integer, List<SAS>> submissionsByUser = new HashMap<>();
            for (SAS sas : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sas.getUserId(), k -> new ArrayList<>())
                        .add(sas);
            }

            List<SAS> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<SAS>> entry : submissionsByUser.entrySet()) {
                List<SAS> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(SAS::getLogDate));

                if (!userSubmissions.isEmpty()) {
                    SAS first = userSubmissions.get(0);
                    SAS second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                    SAS third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;
                    if (second != null) {
                        first.setScore2(second.getScore()); // 注意这里不会将null设置为second.getScore()，如果second的score是null，则保持first.score2不变
                        first.setLogDate2(second.getLogDate());
                    }
                    if (third != null) {
                        first.setScore3(third.getScore()); // 注意这里不会将null设置为second.getScore()，如果second的score是null，则保持first.score2不变
                        first.setLogDate3(third.getLogDate());
                    }
                    objects.add(first);
                }
            }
            return Response.success(0, "操作成功", MapUtil.builder().put("data", objects).map());
        } catch (Exception e) {
            log.error("查询失败，原因: " + e.getMessage());
            return Response.fail("查询失败");
        }
    }

}
