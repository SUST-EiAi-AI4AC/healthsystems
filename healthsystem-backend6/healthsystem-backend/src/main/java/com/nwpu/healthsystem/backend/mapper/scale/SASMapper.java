package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.SAS;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface SASMapper {
    /**
     * 根据 SAS 插入一条记录
     *@param  sas
     *@return
     */
    int insertSAS(SAS sas);

    /**
     * 分页查询
     *@param
     *@return
     */
    List<SAS> getSASListByPage(@Param("userId")long userId, @Param("PageInfo") PageInfo pageInfo);

    /**
     *@param userId, date
     *@return 今日是否有填报，有的话返回1，无返回0
     */
    int getToday(long userId, Date date);

    SAS getRecentInput(long userId);

    /**
     *@param sas
     *@return
     */
    int updateSAS(SAS sas);

    List<SAS> getRecentInputs();

    List<SAS> getAllData();

}
