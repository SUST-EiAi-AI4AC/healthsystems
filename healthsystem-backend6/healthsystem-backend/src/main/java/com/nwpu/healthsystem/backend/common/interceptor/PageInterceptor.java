package com.nwpu.healthsystem.backend.common.interceptor;

import com.nwpu.healthsystem.backend.utils.PageInfo;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;


@Intercepts(@Signature(
        type = StatementHandler.class,
        method = "prepare",
        args = {Connection.class, Integer.class}
))
public class PageInterceptor implements Interceptor {
    @Override
    public Object intercept(Invocation invocation) throws Throwable {

        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();

        BoundSql boundSql = statementHandler.getBoundSql();
        String sql = boundSql.getSql();
        Object paramObject = boundSql.getParameterObject();

        MetaObject metaObject = SystemMetaObject.forObject(statementHandler);
        MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");

        String mapperMethodName = mappedStatement.getId();
        if(mapperMethodName.matches(".*ByPage$")) {
            PageInfo pageInfo = null;
            if(paramObject instanceof PageInfo) {
                pageInfo = (PageInfo) paramObject;
            } else {
                Map<String, Object> params = (Map<String, Object>) paramObject;
                for (Map.Entry<String, Object> entry : params.entrySet()) {
                    if (entry.getValue() instanceof PageInfo) {
                        pageInfo = (PageInfo) entry.getValue();
                        break;
                    }
                }
            }

            String countSql = "Select count(0) from (" + sql + ") a";

            Connection conn = (Connection) invocation.getArgs()[0];
            PreparedStatement countStatement = conn.prepareStatement(countSql);
            ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
            parameterHandler.setParameters(countStatement);
            ResultSet rs = countStatement.executeQuery();
            if(rs.next()) {
                pageInfo.setTotalNumber(rs.getInt(1));
            }
            rs.close();
            countStatement.close();
            pageInfo.count();

            String pageSql = this.generaterPageSql(sql, pageInfo);
            metaObject.setValue("delegate.boundSql.sql", pageSql);
        }
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {
    }

    public String generaterPageSql(String sql, PageInfo pageInfo) {
        StringBuffer sb = new StringBuffer();
        sb.append(sql);
        sb.append(" limit " + pageInfo.getStartIndex() + " , " + pageInfo.getPageSize());
        return sb.toString();
    }
}
