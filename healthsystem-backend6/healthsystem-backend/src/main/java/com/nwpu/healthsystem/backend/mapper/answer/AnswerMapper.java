package com.nwpu.healthsystem.backend.mapper.answer;

import com.nwpu.healthsystem.backend.common.dto.echarts.SleepAndSportsTimeResponseDto;
import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;



@Repository
public interface AnswerMapper {

    /**
     * 根据 EMAAnswer 插入一条记录
     *@param answer
     *@return
     */
    int insertAnswer(Answer answer);

    /**
     *@param answer
     *@return
     */
    int updateAnswer(Answer answer);

    /**
     * 分页查询
     *@param
     *@return
     */
    List<Answer> getAnswerListByPage(@Param("userId")long userId, @Param("PageInfo")PageInfo pageInfo);

    /**
     *@param userId, date
     *@return 今日是否有填报，有的话返回1，无返回0
     */
    int getToday(long userId, Date date);


    Answer getTodayDetail(long userId, Date date);


//    List<SleepTimeResponseDto> getSleepTimeBySelectTime(long userId, int period);

    List<SleepAndSportsTimeResponseDto> getSleepAndSportsTimeBySelectTime(long userId, int period);

    List<Answer> getTodayAnswered(Date date);

    List<Answer> getAnswerListByUserId(@Param("userId") Long userId);

    int countByUserIdAndTimeRange(Long userId, Date startTime, Date endTime);
}
