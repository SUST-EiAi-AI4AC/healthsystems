package com.nwpu.healthsystem.backend.shiro;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @Description preHandle->isAccessAllowed->isLoginAttempt->executeLogin
 */
public class JWTFilter extends BasicHttpAuthenticationFilter {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private String getRequestToken(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || token.trim().isEmpty()) {
            token = request.getHeader("token");
        }
        if (token == null) {
            return null;
        }
        token = token.trim();
        if (token.regionMatches(true, 0, "Bearer ", 0, 7)) {
            token = token.substring(7).trim();
        }
        return token.isEmpty() ? null : token;
    }

    /**
     * 如果带有 token，则对 token 进行检查，否则直接通过，也就是 guest 状态
     */
    /**
     * 这里我们详细说明下为什么最终返回的都是true，即允许访问 例如我们提供一个地址 GET /article 登入用户和游客看到的内容是不同的
     * 如果在这里返回了false，请求会被直接拦截，用户看不到任何东西 所以我们在这里返回true，Controller中可以通过
     * subject.isAuthenticated() 来判断用户是否登入
     * 如果有些资源只有登入用户才能访问，我们只需要在方法上面加上 @RequiresAuthentication 注解即可
     * 但是这样做有一个缺点，就是不能够对GET,POST等请求进行分别过滤鉴权(因为我们重写了官方的方法)，但实际上对应用影响不大
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws UnauthorizedException {
        //判断请求的请求头是否带上 "Authorization"
        if (isLoginAttempt(request, response)) {
            //如果存在，则进入 executeLogin 方法执行登入，检查 token 是否正确
            try {
                executeLogin(request, response);
                return true;
            } catch (Exception e) {     // Realm 里面的 doGetAuthenticationInfo 抛出的异常
                /**
                 * token 错误，有可能是过期、无效、还有可能是篡改等等
                 *
                 * 错误两种处理方式 ：
                 * 1. 将非法请求转发到/401的Controller处理，抛出自定义无权访问异常被全局捕捉再返回Response信息 （本项目按此）
                 * 2.无需转发，直接返回Response信息 一般使用第二种(更方便)
                 */
                responseError(response, e.getMessage());
                return false;
            }
        }
        //如果请求头不存在 Token，则可能是执行登陆操作或者是游客状态访问，无需检查 token，直接返回 true
        return true;
    }

    /**
     * 判断用户是否想要登入。
     * 检测 header 里面是否包含 Token 字段
     */
    @Override
    protected boolean isLoginAttempt(ServletRequest request, ServletResponse response) {
        HttpServletRequest req = (HttpServletRequest) request;
        String token = getRequestToken(req);
        return token != null;
    }

    /**
     * 当 isAccessAllowed 返回 false 时被调用。
     * 由于在 isAccessAllowed 中已通过 responseError 写入了 401 JSON 响应，
     * 此处直接返回 false 阻止请求继续流转，避免父类再次发送 WWW-Authenticate 挑战响应。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        return false;
    }

    /**
     * 执行登陆操作，会委托到 Realm里面进行 登录
     */
    @Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String token = getRequestToken(httpServletRequest);
        JWTToken jwtToken = new JWTToken(token);
        // 提交给realm进行登入，如果错误他会抛出异常并被捕获
        getSubject(request, response).login(jwtToken);
        // 如果没有抛出异常则代表登入成功，返回true
        return true;
    }

    /**
     * 对跨域提供支持
     */
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Access-control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", httpServletRequest.getHeader("Access-Control-Request-Headers"));
        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        // 跨域时会首先发送一个option请求，这里我们给option请求直接返回正常状态
        if (httpServletRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            httpServletResponse.setStatus(HttpStatus.OK.value());
            return false;
        }
        return super.preHandle(request, response);
    }

    /**
     * 将非法请求跳转到 /unauthorized/**
     * 这一部分也就是处理 token不准确的那一部分抛出的异常
     *
     * 为什么内部处理时重定向？
     *      经过测试发现，如果不重定向到无需jwt过滤器过滤的地址（config中定义了），还会走一遍验证，就是会报重复response的错误
     */
    private void responseError(ServletResponse response, String message) {
        try {
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
            httpServletResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
            httpServletResponse.setContentType("application/json;charset=UTF-8");
            com.nwpu.healthsystem.backend.utils.Response r = com.nwpu.healthsystem.backend.utils.Response.fail(401, message, null);
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(r);
            httpServletResponse.getWriter().write(json);
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }
}
