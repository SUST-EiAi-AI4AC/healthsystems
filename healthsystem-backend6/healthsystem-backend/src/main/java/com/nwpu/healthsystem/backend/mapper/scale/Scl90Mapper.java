package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.Scl90;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface Scl90Mapper {
    int insert(Scl90 scl90);
    int update(Scl90 scl90);
    List<Scl90> getListByPage(@Param("userId") long userId, @Param("PageInfo") PageInfo pageInfo);
    int getToday(@Param("userId") long userId, @Param("date") Date date);
    Scl90 getRecentInput(@Param("userId") long userId);
}
