package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.entity.scale.HtpDrawingRecord;
import com.nwpu.healthsystem.backend.service.scale.HtpDrawingService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;


/**
 * HTP 绘画测验历史记录接口
 *
 * <p>典型前端调用流程：</p>
 * <ol>
 *   <li>绘画完成后，调用 {@code POST /uploadDrawing?type=drawing} 上传画布图片，得到图片路径</li>
 *   <li>调用 {@code POST /htp/add} 提交评分、报告及图片路径，服务端写入数据库并返回新记录 id</li>
 *   <li>历史记录页调用 {@code GET /htp/getlist} 分页查询，支持按日期范围和评分筛选</li>
 *   <li>点击某条记录调用 {@code GET /htp/getById/{id}} 查看详情及图片</li>
 * </ol>
 */
@Api(value = "HTP绘画测验历史记录")
@RestController
@RequestMapping("/htp")
public class HtpDrawingController {

    @Autowired
    private HtpDrawingService htpDrawingService;

    // ============================================================
    // 写入接口
    // ============================================================

    @ApiOperation(value = "保存 HTP 绘画记录",
            notes = "提交本次 HTP 评分、AI报告全文及图片路径（图片路径由 /uploadDrawing 接口上传后获得）。" +
                    "userId 由后端从 Token 自动获取，logDate 自动设置为当天，无需前端传入。" +
                    "成功后返回新记录的 id。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "保存成功，result 为新记录 id"),
            @ApiResponse(code = 400, message = "保存失败，message 中含错误原因")
    })
    @PostMapping("/add")
    @RequiresAuthentication
    public Response add(@RequestBody HtpDrawingRecord record) {
        return htpDrawingService.saveRecord(record);
    }

    @ApiOperation(value = "更新绘画记录（全字段）",
            notes = "更新指定 id 的绘画记录，支持修改评分、报告、图片路径等所有字段。" +
                    "只能更新本人的记录，userId 由 Token 决定，无法篡改他人数据。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "更新成功"),
            @ApiResponse(code = 400, message = "更新失败，记录不存在或无权限")
    })
    @PutMapping("/update")
    @RequiresAuthentication
    public Response update(@RequestBody HtpDrawingRecord record) {
        return htpDrawingService.updateRecord(record);
    }

    @ApiOperation(value = "更新绘画图片路径",
            notes = "仅更新指定记录的图片路径。" +
                    "用于图片上传后回填，或重新上传图片后替换旧路径。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "图片路径更新成功"),
            @ApiResponse(code = 400, message = "更新失败，记录不存在或无权限")
    })
    @PutMapping("/updateImage/{id}")
    @RequiresAuthentication
    public Response updateImage(
            @ApiParam(value = "绘画记录ID", required = true) @PathVariable long id,
            @ApiParam(value = "绘画图片路径") @RequestParam(required = false) String drawingImgUrl) {
        return htpDrawingService.updateImageUrl(id, drawingImgUrl);
    }

    // ============================================================
    // 查询接口
    // ============================================================

    @ApiOperation(value = "分页查询历史绘画记录",
            notes = "查询当前登录用户的历史 HTP 绘画记录，支持按日期范围和综合评分范围过滤。" +
                    "所有过滤参数均为可选；返回结构包含 pageInfo（分页信息）和 data（记录列表）。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功"),
            @ApiResponse(code = 400, message = "查询失败")
    })
    @GetMapping("/getlist")
    @RequiresAuthentication
    public Response getList(
            @ApiParam(value = "当前页，从 1 开始", defaultValue = "1")
            @RequestParam(defaultValue = "1") int currentPage,

            @ApiParam(value = "每页条数", defaultValue = "10")
            @RequestParam(defaultValue = "10") int pageSize,

            @ApiParam(value = "开始日期，格式 yyyy-MM-dd，不传表示不限")
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date startDate,

            @ApiParam(value = "结束日期，格式 yyyy-MM-dd，不传表示不限")
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date endDate,

            @ApiParam(value = "最低综合评分（0-100），不传表示不限")
            @RequestParam(required = false) Integer minScore,

            @ApiParam(value = "最高综合评分（0-100），不传表示不限")
            @RequestParam(required = false) Integer maxScore) {

        Date sqlStart = startDate != null ? new Date(startDate.getTime()) : null;
        Date sqlEnd   = endDate   != null ? new Date(endDate.getTime())   : null;

        return htpDrawingService.getList(currentPage, pageSize, sqlStart, sqlEnd, minScore, maxScore);
    }

    @ApiOperation(value = "查询单条绘画记录详情",
            notes = "根据记录 id 查询详情（含图片路径和报告全文）。" +
                    "普通用户只能查看本人记录；医生/管理员可查看所有用户记录。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功"),
            @ApiResponse(code = 400, message = "记录不存在"),
            @ApiResponse(code = 403, message = "无权限查看他人记录")
    })
    @GetMapping("/getById/{id}")
    @RequiresAuthentication
    public Response getById(
            @ApiParam(value = "记录ID", required = true) @PathVariable long id) {
        return htpDrawingService.getById(id);
    }

    @ApiOperation(value = "查询全量绘画记录（医生/管理员端）",
            notes = "返回所有用户的 HTP 绘画记录，含用户名，按创建时间倒序排列。仅供医生或管理员使用。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功"),
            @ApiResponse(code = 400, message = "查询失败")
    })
    @GetMapping("/getAlldata")
    @RequiresAuthentication
    public Response getAllData() {
        return htpDrawingService.getAllData();
    }
}
