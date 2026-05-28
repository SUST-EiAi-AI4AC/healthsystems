package com.nwpu.healthsystem.backend.mapper.depression;

import com.nwpu.healthsystem.backend.entity.depression.Media;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface MediaMapper {
    int insertMedia(long userId, String fileType, String filePath, String questionEndTime);

    List<Media> getList(long userId);

    int updateInference(Media media);
}
