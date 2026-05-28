package com.nwpu.healthsystem.backend.mapper.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.Inference;
import com.nwpu.healthsystem.backend.common.dto.echarts.PamScoreResponseDto;
import com.nwpu.healthsystem.backend.entity.answer.SpeakAnytime;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;


@Repository
public interface SpeakAnytimeMapper {

    /**
     *
     * @param userId
     * @param speechUrl
     * @return
     */
    int insertSpeakAnytime(long userId,String speechUrl);


    /**
     * 更新一条随时说
     * @param speakAnytime
     * @return
     */
    int updateSpeakAnytime(SpeakAnytime speakAnytime);


    /**
     * 根据Id获取随时说列表
     * @param userId
     * @param pageInfo
     * @return
     */
    List<SpeakAnytime> getSpeakAnytimeListByPage(@Param("userId")long userId, @Param("PageInfo") PageInfo pageInfo);

    /**
     *
     */
    int updateInference(SpeakAnytime speakAnytime);

    // 按日期查询 随时说推断结果 （只有一天）
    List<Inference> getInferenceByDate(long userId, Date date);


}
