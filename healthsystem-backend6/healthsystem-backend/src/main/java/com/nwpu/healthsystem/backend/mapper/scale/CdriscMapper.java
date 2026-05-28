package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.Cdrisc;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface CdriscMapper {
    int insert(Cdrisc c);
    int update(Cdrisc c);
    List<Cdrisc> getListByPage(@Param("userId") long userId, @Param("PageInfo") PageInfo pageInfo);
    int getToday(@Param("userId") long userId, @Param("date") Date date);
}
