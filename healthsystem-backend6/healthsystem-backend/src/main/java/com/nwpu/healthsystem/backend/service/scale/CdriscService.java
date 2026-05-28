package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Cdrisc;
import com.nwpu.healthsystem.backend.mapper.scale.CdriscMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class CdriscService {
    private final CdriscMapper mapper;

    public CdriscService(CdriscMapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Cdrisc c) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            c.setUserId(userId);
            c.setScore(calculateScore(c));
            if (c.getId() != 0) {
                mapper.update(c);
                return Response.success("更新成功", c.getScore());
            } else {
                Date date = new Date(System.currentTimeMillis());
                c.setLogDate(date);
                mapper.insert(c);
                return Response.success("记录成功", c.getScore());
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
            List<Cdrisc> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static short calculateScore(Cdrisc c) {
        int total = 0;
        total += c.getQ1(); total += c.getQ2(); total += c.getQ3(); total += c.getQ4(); total += c.getQ5();
        total += c.getQ6(); total += c.getQ7(); total += c.getQ8(); total += c.getQ9(); total += c.getQ10();
        total += c.getQ11(); total += c.getQ12(); total += c.getQ13(); total += c.getQ14(); total += c.getQ15();
        total += c.getQ16(); total += c.getQ17(); total += c.getQ18(); total += c.getQ19(); total += c.getQ20();
        total += c.getQ21(); total += c.getQ22(); total += c.getQ23(); total += c.getQ24(); total += c.getQ25();
        return (short) total;
    }
}
