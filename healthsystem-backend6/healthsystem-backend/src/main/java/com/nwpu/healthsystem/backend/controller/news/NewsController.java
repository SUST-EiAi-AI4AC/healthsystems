package com.nwpu.healthsystem.backend.controller.news;

import com.nwpu.healthsystem.backend.entity.news.News;
import com.nwpu.healthsystem.backend.service.news.NewsService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(value = "")
@RestController
@RequestMapping("/news")
public class NewsController {
    @Autowired
    NewsService newsService;

    @ApiOperation(value = "添加")
    @ApiResponses({
            @ApiResponse(code=400,message="添加失败"),
            @ApiResponse(code=200,message="添加成功")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @RequiresAuthentication
    public Response insertNews(@RequestBody News news) {
        Response insert = newsService.insertNews(news);
        return insert;
    }

    @GetMapping(value = "/getNewsList")
    public Response getNewsList() {
        Response response = newsService.getNewsList();
        return response;
    }

    @ApiOperation(value = "查询")
    @GetMapping(value = "/getContentById")
    public Response getContentById(@RequestParam long newsId) {
        Response response = newsService.getContentById(newsId);
        return response;
    }

}
