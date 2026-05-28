package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.Pars3;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface Pars3Mapper {
    int insert(Pars3 p);
    int update(Pars3 p);
    List<Pars3> getListByPage(@Param("userId") long userId, @Param("PageInfo") PageInfo pageInfo);
    int getToday(@Param("userId") long userId, @Param("date") Date date);
}
