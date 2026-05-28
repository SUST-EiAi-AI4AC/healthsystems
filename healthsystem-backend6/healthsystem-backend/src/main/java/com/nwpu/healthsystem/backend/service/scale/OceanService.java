package com.nwpu.healthsystem.backend.service.scale;

import cn.hutool.core.map.MapUtil;
import com.nwpu.healthsystem.backend.entity.scale.Ocean;
import com.nwpu.healthsystem.backend.mapper.scale.OceanMapper;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.PageInfo;
import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class OceanService {
    private final OceanMapper mapper;

    public OceanService(OceanMapper mapper) {
        this.mapper = mapper;
    }

    public Response addOrUpdate(Ocean o) {
        try {
            long userId = AccountCheckUtil.getUserIdFromToken();
            o.setUserId(userId);
            o.setScore(calculateScore(o));
            if (o.getId() != 0) {
                mapper.update(o);
                return Response.success("更新成功", o.getScore());
            } else {
                Date date = new Date(System.currentTimeMillis());
                o.setLogDate(date);
                mapper.insert(o);
                return Response.success("记录成功", o.getScore());
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
            List<Ocean> list = mapper.getListByPage(userId, pageInfo);
            return Response.success(MapUtil.builder().put("pageInfo", pageInfo).put("data", list).map());
        } catch (Exception e) {
            log.error("查询失败: {}", e.getMessage());
            return Response.fail("");
        }
    }

    public static short calculateScore(Ocean o) {
        int total = 0;
        total += o.getQ1(); total += o.getQ2(); total += o.getQ3(); total += o.getQ4(); total += o.getQ5();
        total += o.getQ6(); total += o.getQ7(); total += o.getQ8(); total += o.getQ9(); total += o.getQ10();
        total += o.getQ11(); total += o.getQ12(); total += o.getQ13(); total += o.getQ14(); total += o.getQ15();
        total += o.getQ16(); total += o.getQ17(); total += o.getQ18(); total += o.getQ19(); total += o.getQ20();
        total += o.getQ21(); total += o.getQ22(); total += o.getQ23(); total += o.getQ24(); total += o.getQ25();
        total += o.getQ26(); total += o.getQ27(); total += o.getQ28(); total += o.getQ29(); total += o.getQ30();
        total += o.getQ31(); total += o.getQ32(); total += o.getQ33(); total += o.getQ34(); total += o.getQ35();
        total += o.getQ36(); total += o.getQ37(); total += o.getQ38(); total += o.getQ39(); total += o.getQ40();
        total += o.getQ41(); total += o.getQ42(); total += o.getQ43(); total += o.getQ44(); total += o.getQ45();
        total += o.getQ46(); total += o.getQ47(); total += o.getQ48(); total += o.getQ49(); total += o.getQ50();
        total += o.getQ51(); total += o.getQ52(); total += o.getQ53(); total += o.getQ54(); total += o.getQ55();
        total += o.getQ56(); total += o.getQ57(); total += o.getQ58(); total += o.getQ59(); total += o.getQ60();
        return (short) total;
    }
}
