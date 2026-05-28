package com.nwpu.healthsystem.backend.service.answer;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.common.dto.echarts.Inference;
import com.nwpu.healthsystem.backend.entity.answer.Video;
import com.nwpu.healthsystem.backend.mapper.answer.VideoMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;



@Service
@Slf4j
public class VideoService {
    private final VideoMapper videoMapper;

    VideoService(VideoMapper videoMapper){this.videoMapper=videoMapper;}

    /**
     * 1、将上传好的视频的地址保存到数据库
     *@param userId， 视频地址
     *@return 视频地址是否保存成功
     */
    public Boolean insertVideo(long userId, String videoUrl) {
        try{
            int insertSpeakAnytime = videoMapper.insertVideo(userId, videoUrl);
            return true;
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("添加失败，原因:" + e.getCause().getMessage());
            return false;
        }
    }

    /**
     *
     */

    public Response getVideoList4Doctor(long userId,int currentPage, int pageSize){

        try {
//            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            PageInfo pageInfo = new PageInfo(currentPage, pageSize);

            List<Video> videoList = videoMapper.getVideoListByPage(userId, pageInfo);

            return Response.success(MapUtil.builder()
                    .put("pageInfo",pageInfo)
                    .put("data",videoList)
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

    public Response getInferenceByDate(Date date) {
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            List<Inference> inferenceByDate = videoMapper.getInferenceByDate(userIdFromToken, date);
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
