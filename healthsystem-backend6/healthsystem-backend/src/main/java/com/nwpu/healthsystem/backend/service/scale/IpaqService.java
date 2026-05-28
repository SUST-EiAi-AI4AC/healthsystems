package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Ipaq;
import com.nwpu.healthsystem.backend.mapper.scale.IpaqMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class IpaqService {
    private final IpaqMapper mapper;

    public IpaqService(IpaqMapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Ipaq ipaq) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            ipaq.setUserId(userId);
            ipaq.setScore(calculateMet(ipaq));
            if (ipaq.getId() != 0) {
                mapper.update(ipaq);
                return Response.success("更新成功", ipaq.getScore());
            } else {
                Date date = new Date(System.currentTimeMillis());
                ipaq.setLogDate(date);
                mapper.insert(ipaq);
                return Response.success("记录成功", ipaq.getScore());
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
            List<Ipaq> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static int calculateMet(Ipaq i) {
        int v1 = (i.getQ1Days() & 0xFF) * ((i.getQ1Hours() * 60) + i.getQ1Minutes()) * 8;
        int v2 = (i.getQ2Days() & 0xFF) * ((i.getQ2Hours() * 60) + i.getQ2Minutes()) * 4;
        int v3 = (i.getQ3Days() & 0xFF) * ((i.getQ3Hours() * 60) + i.getQ3Minutes()) * 33 / 10;
        return v1 + v2 + v3;
    }
}
