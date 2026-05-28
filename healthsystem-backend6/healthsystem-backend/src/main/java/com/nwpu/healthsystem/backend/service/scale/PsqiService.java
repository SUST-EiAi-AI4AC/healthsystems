package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Psqi;
import com.nwpu.healthsystem.backend.mapper.scale.PsqiMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class PsqiService {
    private final PsqiMapper mapper;

    public PsqiService(PsqiMapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Psqi p) {
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
            List<Psqi> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static byte calculateScore(Psqi p) {
        int c1 = p.getQ6();
        int c2 = p.getQ2() + p.getQ5a();
        c2 = Math.min(3, c2);
        int c3 = p.getQ4();
        int c4 = 0;
        int sumC5 = p.getQ5b() + p.getQ5c() + p.getQ5d() + p.getQ5e() + p.getQ5f() + p.getQ5g() + p.getQ5h() + p.getQ5i() + p.getQ5j();
        int c5 = sumC5 == 0 ? 0 : sumC5 <= 9 ? 1 : sumC5 <= 18 ? 2 : 3;
        int c6 = p.getQ7();
        int c7 = Math.min(3, p.getQ8() + p.getQ9());
        int total = c1 + c2 + c3 + c4 + c5 + c6 + c7;
        return (byte) total;
    }
}
