package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Maia2;
import com.nwpu.healthsystem.backend.mapper.scale.Maia2Mapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class Maia2Service {
    private final Maia2Mapper mapper;

    public Maia2Service(Maia2Mapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Maia2 m) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            m.setUserId(userId);
            m.setScore(calculateScore(m));
            if (m.getId() != 0) {
                mapper.update(m);
                return Response.success("更新成功", m.getScore());
            } else {
                Date date = new Date(System.currentTimeMillis());
                m.setLogDate(date);
                mapper.insert(m);
                return Response.success("记录成功", m.getScore());
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
            List<Maia2> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static short calculateScore(Maia2 m) {
        int total = 0;
        total += m.getQ1(); total += m.getQ2(); total += m.getQ3(); total += m.getQ4(); total += m.getQ5();
        total += m.getQ6(); total += m.getQ7(); total += m.getQ8(); total += m.getQ9(); total += m.getQ10();
        total += m.getQ11(); total += m.getQ12(); total += m.getQ13(); total += m.getQ14(); total += m.getQ15();
        total += m.getQ16(); total += m.getQ17(); total += m.getQ18(); total += m.getQ19(); total += m.getQ20();
        total += m.getQ21(); total += m.getQ22(); total += m.getQ23(); total += m.getQ24(); total += m.getQ25();
        total += m.getQ26(); total += m.getQ27(); total += m.getQ28(); total += m.getQ29(); total += m.getQ30();
        total += m.getQ31(); total += m.getQ32(); total += m.getQ33(); total += m.getQ34(); total += m.getQ35();
        total += m.getQ36(); total += m.getQ37();
        return (short) total;
    }
}
