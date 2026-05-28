package com.nwpu.healthsystem.backend.service.depression;

import com.nwpu.healthsystem.backend.entity.depression.Media;
import com.nwpu.healthsystem.backend.mapper.depression.MediaMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


@Slf4j
@Service
public class MediaService {
    private final MediaMapper mediaMapper;

    MediaService(MediaMapper mediaMapper) {
        this.mediaMapper = mediaMapper;
    }

    // 将上传好的文件的文件地址保存到数据库
    public Boolean insertMedia(long userId, String fileType, String videoUrl, String questionEndTime) {
        try{
            int insertMedia = mediaMapper.insertMedia(userId, fileType, videoUrl,questionEndTime);
            return true;
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e){
            log.error("添加失败，原因:" + e.getCause().getMessage());
            return false;
        }
    }

    public Response getList() {
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();

            List<Media> inferenceByDate = mediaMapper.getList(userIdFromToken);
            // 封装返回信息
            return Response.success(inferenceByDate);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e){
            log.error("查询失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }




}

