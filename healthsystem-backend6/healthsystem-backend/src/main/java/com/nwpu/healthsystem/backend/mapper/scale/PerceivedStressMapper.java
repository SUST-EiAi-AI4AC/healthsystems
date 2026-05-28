package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.PerceivedStress;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;


@Repository
public interface PerceivedStressMapper {

    /**
     * 根据 PerceivedStress 插入一条记录
     *@param  perceivedStress
     *@return
     */
    int insertPerceivedStressScale(PerceivedStress perceivedStress);

    /**
     * 分页查询
     *@param
     *@return
     */
    List<PerceivedStress> getPerceivedStressScaleListByPage(@Param("userId")long userId, @Param("PageInfo") PageInfo pageInfo);

    /**
     *@param userId, date
     *@return 今日是否有填报，有的话返回1，无返回0
     */
    int getToday(long userId, Date date);

    PerceivedStress getRecentInput(long userId);

    /**
     *@param perceivedStress
     *@return
     */
    int updatePerceivedStressScale(PerceivedStress perceivedStress);

    List<PerceivedStress> getRecentInputs();

    List<PerceivedStress> getAllData();

//    static Long getUserId();
}
