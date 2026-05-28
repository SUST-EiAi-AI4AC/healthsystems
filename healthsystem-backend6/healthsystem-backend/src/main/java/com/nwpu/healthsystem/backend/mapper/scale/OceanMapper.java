package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.Ocean;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface OceanMapper {
    int insert(Ocean o);
    int update(Ocean o);
    List<Ocean> getListByPage(@Param("userId") long userId, @Param("PageInfo") PageInfo pageInfo);
    int getToday(@Param("userId") long userId, @Param("date") Date date);
}
