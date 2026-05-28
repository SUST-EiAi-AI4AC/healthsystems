package com.nwpu.healthsystem.backend.service.answer;

import com.nwpu.healthsystem.backend.entity.answer.Answer;
import com.nwpu.healthsystem.backend.entity.answer.BasicInfo;
import com.nwpu.healthsystem.backend.mapper.answer.BasicInfoMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Slf4j
@Service
public class BasicInfoService {
    private final BasicInfoMapper basicInfoMapper;

    BasicInfoService(BasicInfoMapper basicInfoMapper) {this.basicInfoMapper = basicInfoMapper;}

    public Response insertOrUpdate(BasicInfo basicInfo){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            basicInfo.setUserId(userIdFromToken);
            Date date = new Date(System.currentTimeMillis());
            basicInfo.setLogDate(date);
            if (basicInfoMapper.getRecord(userIdFromToken) > 0) {
                int i = basicInfoMapper.updateBasicInfo(basicInfo);
                return Response.success("更新成功");
            } else {
                int i = basicInfoMapper.insertBasicInfo(basicInfo);
                return Response.success("记录成功");
            }
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("记录失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getRecord(){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
             return Response.success(basicInfoMapper.getRecord(userIdFromToken));
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }

    public Response getRecordDetail(Long userId){
        try{
            long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
            return Response.success(basicInfoMapper.getRecordDetail(userId));
//            return Response.success(basicInfoMapper.getRecordDetail(userIdFromToken));
        } catch (IllegalArgumentException e) {
            // 全局处理 Assert 异常
            throw e;
        } catch (Exception e){
            log.error("失败，原因:" + e.getCause().getMessage());
            return Response.fail("");
        }
    }
}
