package com.nwpu.healthsystem.backend.mapper.scale;

import com.nwpu.healthsystem.backend.entity.scale.Maia2;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface Maia2Mapper {
    int insert(Maia2 m);
    int update(Maia2 m);
    List<Maia2> getListByPage(@Param("userId") long userId, @Param("PageInfo") PageInfo pageInfo);
    int getToday(@Param("userId") long userId, @Param("date") Date date);
}
