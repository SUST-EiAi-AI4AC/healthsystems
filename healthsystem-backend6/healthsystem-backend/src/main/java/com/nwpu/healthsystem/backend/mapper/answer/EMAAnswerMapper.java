package com.nwpu.healthsystem.backend.mapper.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.PamScoreResponseDto;
import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.entity.answer.EMAAnswer;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;


@Repository
public interface EMAAnswerMapper {
    /**
     * 根据 EMAAnswer 插入一条记录
     *@param emaAnswer
     *@return
     */
    int insertEMAAnswer(EMAAnswer emaAnswer);

    int updateEMAAnswer(EMAAnswer answer);

    /**
     * 分页查询 按记录查询 ema
     *@param
     *@return
     */
    List<EMAAnswer> getEMAAnswerListByPage(@Param("userId")long userId, @Param("PageInfo")PageInfo pageInfo);

    // 按时间区间查询 ema
    List<EMAAnswer> getEMAAnswerListBySelectTime(@Param("userId")long userId, @Param("period")int period);



    List<EMAAnswer> getEMAAnswerListByDate(long userId, Date date);

    // 按日期查询 pam 只有一天
    List<PamScoreResponseDto> getPamListByDate(long userId, Date date);

    // 按时间区间查询 pam
    List<PamScoreResponseDto> getPamListBySelectTime(long userId, int period);

    List<EMAAnswer> getRecentInput(long userId, Date date);

    List<EMAAnswer> getRecentInputs(Date date);

}
