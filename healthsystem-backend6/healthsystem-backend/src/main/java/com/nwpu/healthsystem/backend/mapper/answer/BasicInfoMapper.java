package com.nwpu.healthsystem.backend.mapper.answer;

import com.nwpu.healthsystem.backend.entity.answer.BasicInfo;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BasicInfoMapper {
    int insertBasicInfo(BasicInfo basicInfo);

    int updateBasicInfo(BasicInfo basicInfo);

    /**
     *
     * @param userId
     * @return 是否已填报
     */
    int getRecord(long userId);

    BasicInfo getRecordDetail(long userId);
}
