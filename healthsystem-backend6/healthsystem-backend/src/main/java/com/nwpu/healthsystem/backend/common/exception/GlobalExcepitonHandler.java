package com.nwpu.healthsystem.backend.common.exception;

import com.nwpu.healthsystem.backend.utils.Response;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.ShiroException;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.io.IOException;

/**
 * 全局异常处理
 */
@Slf4j
@RestControllerAdvice
public class GlobalExcepitonHandler {
    /**
     * 处理Assert的异常
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(value = IllegalArgumentException.class)
    public Response handler(IllegalArgumentException e) throws IOException {
        log.error("Assert异常:-------------->{}",e.getMessage());
        return Response.fail(e.getMessage());
    }

    // 捕捉shiro的异常
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(ShiroException.class)
    public Response handle401() {
        return Response.fail(401,"您没有权限访问！", null);
    }

    /**
     * @Validated 校验错误异常处理
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public Response handler(MethodArgumentNotValidException e) throws IOException {
        BindingResult bindingResult = e.getBindingResult();

        ObjectError objectError = bindingResult.getAllErrors().stream().findFirst().get();
        log.error("校验错误异常:-------------->",objectError);
        return Response.fail(objectError.getDefaultMessage());
    }
}
