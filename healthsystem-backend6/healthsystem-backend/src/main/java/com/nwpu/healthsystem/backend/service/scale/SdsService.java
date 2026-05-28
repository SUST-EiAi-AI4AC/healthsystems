package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.PushBean;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.entity.scale.Sds;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.mapper.scale.SdsMapper;
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
public class SdsService {
    private final SdsMapper sdsMapper;

    @Autowired
    private JiGuangPushService jiGuangPushService;

    @Autowired
    private UserInfoMapper userInfoMapper;

    public SdsService(SdsMapper sdsMapper) {
        this.sdsMapper = sdsMapper;
    }

    public Response insertOrUpdate(Sds sds){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            sds.setUserId(userIdFromToken);

            //  计算分数
            sds.setScore(calculateScore(sds));
            if(sds.getId()!=0){
                int i = sdsMapper.updateSds(sds);
                return Response.success("更新成功", sds.getScore());
            }else{
                Date date = new Date(System.currentTimeMillis());
                sds.setLogDate(date);
                int i = sdsMapper.insertSds(sds);
                return Response.success("记录成功", sds.getScore());
            }
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("记录失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getPHQ9List(int currentPage, int pageSize){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<Sds> sdsListByPage = sdsMapper.getSdsListByPage(userIdFromToken, pageInfo);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", sdsListByPage)
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
            if(0 < sdsMapper.getToday(userId, date)) {
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

    public Response getRecentInput(){
        try{
            long userId = AccountCheckUtil.getUserIdFromToken();
            return Response.success(sdsMapper.getRecentInput(userId));
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getPHQ9List4Doctor(int currentPage, int pageSize, long userId){
        try{

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<Sds> sdsListByPage = sdsMapper.getSdsListByPage(userId, pageInfo);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("pageInfo", pageInfo)
                    .put("data", sdsListByPage)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }
    // 计算分数
    public static byte calculateScore(Sds sds) {
        byte score = 0;

        score += sds.getQ1();
        score += 5-sds.getQ2();
        score += sds.getQ3();
        score += sds.getQ4();
        score += 5-sds.getQ5();
        score += 5-sds.getQ6();
        score += sds.getQ7();
        score += sds.getQ8();
        score += sds.getQ9();
        score += sds.getQ10();
        score += 5-sds.getQ11();
        score += 5-sds.getQ12();
        score += sds.getQ13();
        score += 5-sds.getQ14();
        score += sds.getQ15();
        score += 5-sds.getQ16();
        score += 5-sds.getQ17();
        score += 5-sds.getQ18();
        score += sds.getQ19();
        score += 5-sds.getQ20();

        score=(byte)(score*1.25);
        return score;
    }

    public void remindInput() {
        log.info("SDS提醒任务：开始执行");
        //每周日12点开始提醒
        LocalDateTime now = LocalDateTime.now();
        if(now.getDayOfWeek() != DayOfWeek.SUNDAY && now.getHour() < 11){
            log.info("SDS提醒任务：未到周日12点以后，无需提醒");
            return;
        }

        List<Long> usersNotAnswered = getNotAnsweredUsersIds();

        //定义和赋值推送实体
        PushBean pushBean = new PushBean();
        pushBean.setTitle("填报提醒");
        pushBean.setAlert("您近两周还未填报抑郁自测量表SDS，请及时填报");

        //进行推送，推送到指定Android客户端的用户，返回推送结果布尔值
        String [] rids = usersNotAnswered.stream().map(e->e.toString()).collect(Collectors.toList()).toArray(new String[0]);

        if(rids!=null && rids.length>0){
            log.info("SDS提醒任务：开始推送消息，推送用户数量："+rids.length);
            boolean flag = jiGuangPushService.pushAndroid(pushBean,rids);
            if(flag){
                log.info("SDS提醒任务：推送结果"+flag+"，推送用户数量："+rids.length);
            }
        }else{
            log.info("SDS提醒任务：无需要推送的用户");
        }
    }

    private List<Long> getNotAnsweredUsersIds() {
        //所有用户列表
        List<UserInfo> user = userInfoMapper.getUsersByRole("user");
        List<UserInfo> user2 = userInfoMapper.getUsersByRole("admin");
        user.addAll(user2);

        //填写了的用户列表
        List<Sds> usersDone = sdsMapper.getRecentInputs();
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
            List<Sds> allData = sdsMapper.getAllData();
            List<Sds> submissions =new ArrayList<>();
            for (int i = 0; i < allData.size(); i++) {
                Date logDate = allData.get(i).getLogDate();
                long userId = allData.get(i).getUserId();
                byte score = allData.get(i).getScore();
                String username = allData.get(i).getUsername();
                submissions.add(new Sds(userId,logDate,score,username));
            }
            System.out.println("submissions"+submissions);
            Map<Integer, List<Sds>> submissionsByUser = new HashMap<>();
            for (Sds sds : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sds.getUserId(), k -> new ArrayList<>())
                        .add(sds);
            }
            List<Sds> firstSubmissions = new ArrayList<>();
            List<Sds> secondSubmissions = new ArrayList<>();
            List<Sds> thirdSubmissions = new ArrayList<>();
            for (Map.Entry<Integer, List<Sds>> entry : submissionsByUser.entrySet()) {
                List<Sds> userSubmissions = entry.getValue();
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
            HashMap<String, List<Sds>> objectObjectHashMap = new HashMap<>();
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
            List<Sds> allData = sdsMapper.getAllData();
            List<Sds> submissions =new ArrayList<>();
            for (int i = 0; i < allData.size(); i++) {
                Date logDate = allData.get(i).getLogDate();
                long userId = allData.get(i).getUserId();
                byte score = allData.get(i).getScore();
                String username = allData.get(i).getUsername();
                submissions.add(new Sds(userId,logDate,score,username));
            }
            System.out.println("submissions"+submissions);
            Map<Integer, List<Sds>> submissionsByUser = new HashMap<>();
            for (Sds perceivedStress : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) perceivedStress.getUserId(), k -> new ArrayList<>())
                        .add(perceivedStress);
            }
            List<Sds> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<Sds>> entry : submissionsByUser.entrySet()) {
                List<Sds> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(sub -> sub.getLogDate().toString()));

                Sds first = userSubmissions.get(0);
                Sds second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                Sds third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;

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
            List<Sds> allData = sdsMapper.getAllData();

            // 遍历数据，将不在0-19范围内的score置为null
            for (Sds sds : allData) {
                if (sds.getScore() < 53 || sds.getScore() > 62) {
                    sds.setScore((byte) 0); // 假设setScore接受null或可以修改为Integer类型
                }
            }

            List<Sds> submissions = new ArrayList<>(allData); // 无需过滤，因为所有数据都需要

            Map<Integer, List<Sds>> submissionsByUser = new HashMap<>();
            for (Sds sds : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sds.getUserId(), k -> new ArrayList<>())
                        .add(sds);
            }

            List<Sds> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<Sds>> entry : submissionsByUser.entrySet()) {
                List<Sds> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(Sds::getLogDate));

                if (!userSubmissions.isEmpty()) {
                    Sds first = userSubmissions.get(0);
                    Sds second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                    Sds third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;
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
            List<Sds> allData = sdsMapper.getAllData();

            // 遍历数据，将不在0-19范围内的score置为null
            for (Sds sds : allData) {
                if (sds.getScore() < 63 || sds.getScore() > 72) {
                    sds.setScore((byte) 0); // 假设setScore接受null或可以修改为Integer类型
                }
            }

            List<Sds> submissions = new ArrayList<>(allData); // 无需过滤，因为所有数据都需要

            Map<Integer, List<Sds>> submissionsByUser = new HashMap<>();
            for (Sds sds : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sds.getUserId(), k -> new ArrayList<>())
                        .add(sds);
            }

            List<Sds> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<Sds>> entry : submissionsByUser.entrySet()) {
                List<Sds> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(Sds::getLogDate));

                if (!userSubmissions.isEmpty()) {
                    Sds first = userSubmissions.get(0);
                    Sds second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                    Sds third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;
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
            List<Sds> allData = sdsMapper.getAllData();

            // 遍历数据，将不在0-19范围内的score置为null
            for (Sds sds : allData) {
                if (sds.getScore() < 73) {
                    sds.setScore((byte) 0); // 假设setScore接受null或可以修改为Integer类型
                }
            }

            List<Sds> submissions = new ArrayList<>(allData); // 无需过滤，因为所有数据都需要

            Map<Integer, List<Sds>> submissionsByUser = new HashMap<>();
            for (Sds sds : submissions) {
                submissionsByUser
                        .computeIfAbsent((int) sds.getUserId(), k -> new ArrayList<>())
                        .add(sds);
            }

            List<Sds> objects = new ArrayList<>();
            for (Map.Entry<Integer, List<Sds>> entry : submissionsByUser.entrySet()) {
                List<Sds> userSubmissions = entry.getValue();
                userSubmissions.sort(Comparator.comparing(Sds::getLogDate));

                if (!userSubmissions.isEmpty()) {
                    Sds first = userSubmissions.get(0);
                    Sds second = userSubmissions.size() > 1 ? userSubmissions.get(1) : null;
                    Sds third = userSubmissions.size() > 2 ? userSubmissions.get(2) : null;
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
