package com.nwpu.healthsystem.backend.mapper.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.Inference;
import com.nwpu.healthsystem.backend.entity.answer.SpeakAnytime;
import com.nwpu.healthsystem.backend.entity.answer.Video;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;


@Repository
public interface VideoMapper {

    // 插入
    int insertVideo(long userId, String videoUrl);


    //查询
    List<Video> getVideoListByPage(@Param("userId") long userId, @Param("pageInfo")PageInfo pageInfo);


    int updateInference(Video video);

    // 按日期查询 视频推断结果 （只有一天）
    List<Inference> getInferenceByDate(long userId, Date date);

}
