package com.nwpu.healthsystem.backend.utils;

import com.nwpu.healthsystem.backend.common.dto.echarts.DateRequestDto;
import com.nwpu.healthsystem.backend.common.dto.echarts.PamScoreResponseDto;
import com.nwpu.healthsystem.backend.common.dto.echarts.SleepAndSportsTimeResponseDto;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ResponseProcess {

    public static <T> List DateInterpolation(List<T> input, int period, Class<T> tClass) {
        // 输出列表
        ArrayList<T> output = new ArrayList<T>();
        // 开始日期
        LocalDate now = LocalDate.now();
        LocalDate beginDate = now.minusDays(period - 1);
        LocalDate endDate = now.plusDays(1);
        for (LocalDate date = beginDate; date.isBefore(endDate); date = date.plusDays(1)) {
            LocalDate logDate = null;
            T t = null;
            // 有可能 input 已经遍历完了，或者一开始就是空的
            if(input.isEmpty()) {
                logDate = endDate;
                // 这里t 就会 == null 判断类型的逻辑要更改
            } else {
                t = input.get(0);
                logDate = ((DateRequestDto) t).getLogDate().toLocalDate();
            }

            if (date.isBefore(logDate)) {
                // 我傻了，下面代码走不到
                // 一开始 output有可能为空， 此时 date<logDate，必然要补
                // 生成相应对象
                String name = tClass.getName();
                if (name.equals(PamScoreResponseDto.class.getName())) {
                    PamScoreResponseDto pamScoreResponseDto = new PamScoreResponseDto(Date.valueOf(date));
                    output.add((T) pamScoreResponseDto);
                } else if (name.equals(SleepAndSportsTimeResponseDto.class.getName())) {
                    SleepAndSportsTimeResponseDto sleepAndSportsTimeResponseDto = new SleepAndSportsTimeResponseDto(Date.valueOf(date));
                    // 这里出来的竟然时 DateResponseDto 莫名其妙，类型不对
                    // 最后发现，原来时 @Data 注解忘了加 服了
//                    System.out.println(sleepTimeResponseDto.getClass());
                    output.add((T) sleepAndSportsTimeResponseDto);
                }
            } else if (date.isEqual(logDate)) {
                // 因为有些记录一天多次，加了一层循环
                while (date.isEqual(logDate)) {
                    output.add(t);
                    input.remove(t);
                    // 循环取出
                    if(input.isEmpty()) {
                        logDate = endDate;
                    } else {
                        t = input.get(0);
                        logDate = ((DateRequestDto) t).getLogDate().toLocalDate();
                    }
                }
            } else {
                // 极限情况，理论上不会到这里 date > logDate，弹出多余logDate即可
                while (date.isAfter(logDate)) {
                    input.remove(t);
                    // 循环取出
                    if(input.isEmpty()) {
                        logDate = endDate;
                    } else {
                        t = input.get(0);
                        logDate = ((DateRequestDto) t).getLogDate().toLocalDate();
                    }
                }
            }
        }

        return output;
    }
}
