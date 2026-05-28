package com.nwpu.healthsystem.backend.utils;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 对所有请求的响应类
 */

@Data
@ApiModel(description= "统一封装响应数据格式")
public class Response {

    /***
     * HTTP状态码是服务器和客户端之间交流信息的语言。
     */
    @ApiModelProperty(value = "状态码，200是正常，非200是异常")
    private int code; // 200是正常，非200是异常

    @ApiModelProperty(value = "信息")
    private String message;

    @ApiModelProperty(value = "返回对象")
    private Object result;

    /***
     * 请求成功的响应，响应结果 Object data 赋给 rsp.result
     * @param data
     * @return
     */
    public static Response success(Object data) {
        return success(200, "操作成功", data);
    }

    public static Response success(String msg, Object data) {
        return success(200, msg, data);
    }

    public static Response success(int code, String msg, Object data) {
        Response rsp = new Response();
        rsp.code = code;
        rsp.message = msg;
        rsp.result = data;
        return rsp;
    }


    /***
     * 请求失败的响应，具体错误信息 errorMessage 赋给 rsp.message
     * @param errorMessage
     * @return
     */
    public static Response fail(String errorMessage) {
        return fail(400, "操作失败", errorMessage);
    }

    public static Response fail(String message, Object result) {
        return fail(400, message, result);
    }

    public static Response fail(int code, String message, Object result) {
        Response r = new Response();
        r.setCode(code);
        r.setMessage(message);
        r.setResult(result);
        return r;
    }


    public enum ResultCode {

        /***
         * 200状态码：
         * 表示请求已成功，请求所希望的响应头或数据体将随此响应返回
         */
        SUCCESS(200, "操作成功"),

        /***
         * 500状态码：
         * 服务器遇到了一个未曾预料的状况，导致了它无法完成对请求的处理。一般来说，这个问题都会在服务器的程序码出错时出现。
         */
        FAIL(400, "操作失败");

        public int code;
        public String msg;

        ResultCode(int code, String msg) {
            this.code = code;
            this.msg = msg;
        }

    }
}
