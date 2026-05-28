package com.nwpu.healthsystem.backend.service.answer;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.common.dto.echarts.Inference;
import com.nwpu.healthsystem.backend.common.dto.echarts.PamScoreResponseDto;
import com.nwpu.healthsystem.backend.entity.answer.SpeakAnytime;
import com.nwpu.healthsystem.backend.mapper.answer.SpeakAnytimeMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.thymeleaf.util.MapUtils;
import lombok.extern.slf4j.Slf4j;
import java.sql.Date;
import java.util.List;
import java.util.ResourceBundle;



@Service
@Slf4j
public class SpeakAnytimeService {
    private final SpeakAnytimeMapper speakAnytimeMapper;

    SpeakAnytimeService(SpeakAnytimeMapper speakAnytimeMapper) {
        this.speakAnytimeMapper = speakAnytimeMapper;
    }

    public Boolean insertSpeakAnytime( long userId,String audioUrl){
        try{
            int insertSpeakAnytime = speakAnytimeMapper.insertSpeakAnytime(userId,audioUrl);

            return true;
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("添加失败，原因:" + e.getCause().getMessage());
            return false;
        }
    }
    public Response getSpeakAnytimeList(int currentPage, int pageSize){

        try {
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<SpeakAnytime> speakAnytimeList = speakAnytimeMapper.getSpeakAnytimeListByPage(userIdFromToken, pageInfo);

            return Response.success(MapUtil.builder()
            .put("pageInfo",pageInfo)
            .put("data",speakAnytimeList)
            .map());
        }
        catch(IllegalArgumentException e){

            throw e;

        }
        catch(Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }

    }

    public Response getSpeakAnytimeList4Doctor(long userId,int currentPage, int pageSize){
        try {
//            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<SpeakAnytime> speakAnytimeList = speakAnytimeMapper.getSpeakAnytimeListByPage(userId, pageInfo);

            return Response.success(MapUtil.builder()
                    .put("pageInfo",pageInfo)
                    .put("data",speakAnytimeList)
                    .map());
        } catch(IllegalArgumentException e){
            throw e;
        } catch(Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getInferenceByDate(Date date) {
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            List<Inference> inferenceByDate = speakAnytimeMapper.getInferenceByDate(userIdFromToken, date);
            // 封装返回信息
            return Response.success(inferenceByDate);
        } catch (IllegalArgumentException e) {
            // Assert 异常
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }


}
