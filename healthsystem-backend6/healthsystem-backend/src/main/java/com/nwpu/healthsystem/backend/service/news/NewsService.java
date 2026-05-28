package com.nwpu.healthsystem.backend.service.news;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.news.News;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import com.nwpu.healthsystem.backend.mapper.news.NewsMapper;
import com.nwpu.healthsystem.backend.service.JiGuangPushService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.sql.Date;

@Slf4j
@Service
public class NewsService {
    private final NewsMapper newsMapper;

    @Autowired
    private JiGuangPushService jiGuangPushService;

    @Autowired
    private UserInfoMapper userInfoMapper;

    public NewsService(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }


    public Response insertNews(News news){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            news.setUserId(userIdFromToken);
            Date date = new Date(System.currentTimeMillis());
            news.setLogDate(date);

            int insertResult = newsMapper.insertNews(news);

            // 检查插入结果，通常如果插入成功，会返回1（表示影响的行数）
            if (insertResult > 0) {
                return Response.success("记录成功");
            } else {
                return Response.fail("记录失败，未知原因");
            }
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e){
            // 捕获所有其他异常，并记录错误日志
            log.error("记录信息失败，原因:", e);
            return Response.fail("记录信息失败，原因:" + (e.getMessage() != null ? e.getMessage() : "未知错误"));
        }
    }


    public Response getNewsList() {
        try{
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            List<News> allData = newsMapper.getNewsList();
            return Response.success(0, "操作成功",
                    MapUtil.builder()
                            .put("data", allData)
                            .map());
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getMessage());
            return Response.fail("查询失败，原因:" + e.getMessage());
        }
    }

    public Response getContentById(long newsId) {
        try{

            List<News> contentById = newsMapper.getContentById(newsId);
            // 封装返回信息
            return Response.success(MapUtil.builder()
                    .put("data", contentById)
                    .map());
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }
}
