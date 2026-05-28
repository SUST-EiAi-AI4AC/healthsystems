package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Pars3;
import com.nwpu.healthsystem.backend.mapper.scale.Pars3Mapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class Pars3Service {
    private final Pars3Mapper mapper;

    public Pars3Service(Pars3Mapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Pars3 p) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            p.setUserId(userId);
            p.setScore(calculateScore(p));
            if (p.getId() != 0) {
                mapper.update(p);
                return Response.success("更新成功", p.getScore());
            } else {
                Date date = new Date(System.currentTimeMillis());
                p.setLogDate(date);
                mapper.insert(p);
                return Response.success("记录成功", p.getScore());
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
            List<Pars3> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static short calculateScore(Pars3 p) {
        int v = (p.getQ1() & 0xFF) * (p.getQ2() & 0xFF) * (p.getQ3() & 0xFF);
        return (short) v;
        }
}
