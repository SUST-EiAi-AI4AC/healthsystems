package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Scl90;
import com.nwpu.healthsystem.backend.mapper.scale.Scl90Mapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class Scl90Service {
    private final Scl90Mapper mapper;

    public Scl90Service(Scl90Mapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Scl90 scl90) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            scl90.setUserId(userId);
            scl90.setScore(calculateScore(scl90));
            if (scl90.getId() != 0) {
                mapper.update(scl90);
                return Response.success("更新成功", scl90.getScore());
            } else {
                Date date = new Date(System.currentTimeMillis());
                scl90.setLogDate(date);
                mapper.insert(scl90);
                return Response.success("记录成功", scl90.getScore());
            }
        } catch (Exception e) {
            log.error("记录失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public Response getList(int currentPage, int pageSize) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            PageInfo pageInfo = new PageInfo(currentPage, pageSize);
            List<Scl90> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static short calculateScore(Scl90 s) {
        int total = 0;
        total += s.getQ1(); total += s.getQ2(); total += s.getQ3(); total += s.getQ4(); total += s.getQ5();
        total += s.getQ6(); total += s.getQ7(); total += s.getQ8(); total += s.getQ9(); total += s.getQ10();
        total += s.getQ11(); total += s.getQ12(); total += s.getQ13(); total += s.getQ14(); total += s.getQ15();
        total += s.getQ16(); total += s.getQ17(); total += s.getQ18(); total += s.getQ19(); total += s.getQ20();
        total += s.getQ21(); total += s.getQ22(); total += s.getQ23(); total += s.getQ24(); total += s.getQ25();
        total += s.getQ26(); total += s.getQ27(); total += s.getQ28(); total += s.getQ29(); total += s.getQ30();
        total += s.getQ31(); total += s.getQ32(); total += s.getQ33(); total += s.getQ34(); total += s.getQ35();
        total += s.getQ36(); total += s.getQ37(); total += s.getQ38(); total += s.getQ39(); total += s.getQ40();
        total += s.getQ41(); total += s.getQ42(); total += s.getQ43(); total += s.getQ44(); total += s.getQ45();
        total += s.getQ46(); total += s.getQ47(); total += s.getQ48(); total += s.getQ49(); total += s.getQ50();
        total += s.getQ51(); total += s.getQ52(); total += s.getQ53(); total += s.getQ54(); total += s.getQ55();
        total += s.getQ56(); total += s.getQ57(); total += s.getQ58(); total += s.getQ59(); total += s.getQ60();
        total += s.getQ61(); total += s.getQ62(); total += s.getQ63(); total += s.getQ64(); total += s.getQ65();
        total += s.getQ66(); total += s.getQ67(); total += s.getQ68(); total += s.getQ69(); total += s.getQ70();
        total += s.getQ71(); total += s.getQ72(); total += s.getQ73(); total += s.getQ74(); total += s.getQ75();
        total += s.getQ76(); total += s.getQ77(); total += s.getQ78(); total += s.getQ79(); total += s.getQ80();
        total += s.getQ81(); total += s.getQ82(); total += s.getQ83(); total += s.getQ84(); total += s.getQ85();
        total += s.getQ86(); total += s.getQ87(); total += s.getQ88(); total += s.getQ89(); total += s.getQ90();
        return (short) total;
    }
}
