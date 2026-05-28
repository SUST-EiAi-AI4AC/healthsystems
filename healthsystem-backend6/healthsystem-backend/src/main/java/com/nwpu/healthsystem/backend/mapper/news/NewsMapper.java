package com.nwpu.healthsystem.backend.mapper.news;

import com.nwpu.healthsystem.backend.entity.news.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface NewsMapper {
    int insertNews(News news);

    List<News> getNewsList();

    List<News> getContentById(@Param("newsId")long newsId);
}
