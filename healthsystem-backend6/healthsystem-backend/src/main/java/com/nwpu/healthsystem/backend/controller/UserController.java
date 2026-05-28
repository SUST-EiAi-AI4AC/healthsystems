package com.nwpu.healthsystem.backend.controller;

import com.nwpu.healthsystem.backend.common.dto.LoginRequestDto;
import com.nwpu.healthsystem.backend.common.dto.PasswordRequestDto;
import com.nwpu.healthsystem.backend.common.dto.UserAllInfoDto;
import com.nwpu.healthsystem.backend.service.UserService;
import com.nwpu.healthsystem.backend.utils.AccountCheckUtil;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.*;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;


@Api(value = "用户管理：登录、注册、更新")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;


    @ApiOperation(value = "用户登录", notes = "既可以是手机号也可以是用户名 + 密码。手机号是纯数字，用户名不能是全数字")
    @ApiResponses({
            @ApiResponse(code=400,message="用户名/手机号或密码错误，登录失败"),
            @ApiResponse(code=200,message = "登录成功", response = UserAllInfoDto.class)
    })
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Object getUser(@RequestBody LoginRequestDto loginDto, HttpServletResponse response) {
        Response login = userService.login(loginDto, response);
        return login;
    }


    @ApiOperation(value = "用户注册", notes = "用户注册需要确定的信息。 " +
            "要求：前端传数据变量名一定要一样，注意数据类型。\n" +
            "注意：1、要有医生id（用id=1测试就好，这和需求也是一致的，一般一开始要确认医生id）\n" +
            "数据格式说明：1、字符串类型数据请不要传null（1、字段名不一致，后台会变成null。2、手动填null），请传空字符串或者真实值（只有身份证号例外，只能是null或真实值）" +
            "2、时间戳不知道怎么传，可以设置为0({}\u5220掉，就填一个0)，然后从服务器获得数据之后就有值了。（这一项数据库来维护数据）" +
            "3、数开类型数据没有太多要求")
    @ApiResponses({
            @ApiResponse(code=400,message="注册失败：手机号/用户名已被使用"),
            @ApiResponse(code=200,message="注册成功", response = UserAllInfoDto.class)
    })
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Object insertUser(@RequestBody UserAllInfoDto userAllInfoDto, HttpServletResponse response) {
        Response register = userService.register(userAllInfoDto, response);
        return register;
    }
    
    
    @ApiOperation(value = "验证邀请码是否有效", notes = "默认邀请码为2026，其他邀请码需在数据库中存在")
    @ApiResponses({
            @ApiResponse(code=400,message="邀请码无效"),
            @ApiResponse(code=200,message="邀请码有效")
    })
    @PostMapping("/checkInviteCode")
    public Response checkInviteCode(@RequestParam String inviteCode) {
        return userService.checkInviteCode(inviteCode);
    }


    @ApiOperation(value = "修改用户信息", notes = "用户进一步完善信息。  update接口测试：无更新40ms，有更新200ms")
    @ApiResponses({
            @ApiResponse(code=400,message="修改失败"),
            @ApiResponse(code=200,message="修改成功", response = UserAllInfoDto.class)
    })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @RequiresAuthentication
    public Object updateUser(@RequestBody UserAllInfoDto userAllInfoDto) {
        Response update = userService.update(userAllInfoDto);
        return update;
    }


    @ApiOperation(value = "修改用户密码", notes = "")
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @RequiresAuthentication
    public Object updatePassword(@RequestBody PasswordRequestDto passwordRequestDto) {
        Response update = userService.updatePassword(passwordRequestDto.getOldPassword(), passwordRequestDto.getNewPassword());
        return update;
    }

    @ApiOperation(value = "修改用户头像", notes = "")
    @RequestMapping(value = "/updateAvatar", method = RequestMethod.POST)
    @RequiresAuthentication
    public Object updateAvatar(@RequestBody UserAllInfoDto userAllInfoDto) {
        Response update = userService.updateAvatar(userAllInfoDto.getAvatar());
        return update;
    }

    @ApiOperation(value = "根据用户ID删除用户", notes = "根据提供的用户ID删除用户")
    @GetMapping(value = "/deleteUserById")
    public Response deleteUserById(@RequestParam long userId) {
        return userService.deleteUserById(userId);
    }

    // ************************** 无关 **************************
    @ApiIgnore
    @RequestMapping(path = "/unauthorized/{message}")
    public Response unauthorized(@PathVariable String message) throws UnsupportedEncodingException {
        return Response.fail(401, message, null);
    }

    @ApiIgnore
    @GetMapping("/getVipMessage")
    @ApiOperation(value = "权限测试 无需登录 ", notes = "")
    public Response getVipMessage() {
        return Response.success("成功获得 vip 信息！");
    }

    @ApiIgnore
    @GetMapping("/getVipMessage2")
    @RequiresAuthentication
    @ApiOperation(value = "权限测试 需登录 ", notes = "")
    public Response getVipMessage2() {
        return Response.success("成功获得 vip 信息！");
    }

    @ApiIgnore
    @GetMapping("/getVipMessage3")
    @RequiresRoles("doctor")
    @ApiOperation(value = "权限测试 需角色：doctor ", notes = "")
    public Response getVipMessage3() {
        return Response.success("成功获得 vip 信息！");
    }

    @ApiIgnore
    @GetMapping("/getVipMessage4")
    @RequiresPermissions("vip")
    public Response getVipMessage4() {
        return Response.success("成功获得 vip 信息！");
    }

    @ApiIgnore
    @GetMapping("/getVipMessage5")
    @RequiresRoles("user")
    @ApiOperation(value = "权限测试 需角色：user ", notes = "")
    public Response getVipMessage5() {
        return Response.success("成功获得 vip 信息！");
    }

    @ApiIgnore
    @GetMapping("/getVipMessage6")
    @RequiresPermissions("normal")
    public Response getVipMessage6() {
        return Response.success("成功获得 vip 信息！");
    }

    @ApiIgnore
    @GetMapping("/getVipMessage7")
    @RequiresRoles(logical = Logical.OR, value = {"doctor", "admin"})
    @ApiOperation(value = "权限测试 需角色：doctor 或admin", notes = "")
    public Response getVipMessage7() {
        if(AccountCheckUtil.checkHasRole("doctor")){
            return Response.success("doctor");
        } else if(AccountCheckUtil.checkHasRole("admin")){
            return Response.success("admin");
        }
        return Response.fail("错误");
    }

    @GetMapping(value = "/pushConnected")
    @RequiresAuthentication
    public Response pushConnected() {
        long userIdFromToken = AccountCheckUtil.getUserIdFromToken();
        return Response.success(userService.pushConnected(userIdFromToken));
    }

    @ApiOperation(value = "根据id找到真实姓名", notes = "")
    @PostMapping(value = "/selectRealNameByUserId")
//    @RequiresAuthentication
    public Response selectRealNameByUserId(@RequestParam("userId") long userId){
        return userService.selectRealNameByUserId(userId);
    }
}
