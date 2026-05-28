package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.service.scale.HealDiaryService;
import com.nwpu.healthsystem.backend.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 疗愈日记接口
 *
 * <p>典型前端调用流程：</p>
 * <ol>
 *   <li>页面加载时调用 {@code GET /heal-diary/list} 拉取日记列表并渲染</li>
 *   <li>用户写完日记点击保存时调用 {@code POST /heal-diary/save} 新增</li>
 *   <li>用户编辑日记后调用 {@code PUT /heal-diary/{id}} 更新</li>
 *   <li>用户左滑删除时调用 {@code DELETE /heal-diary/{id}} 删除</li>
 * </ol>
 */
@Api(value = "疗愈日记")
@RestController
@RequestMapping("/heal-diary")
public class HealDiaryController {

    @Autowired
    private HealDiaryService healDiaryService;

    // ================================================================
    // 查询接口
    // ================================================================

    @ApiOperation(value = "获取当前用户的全部日记列表", notes = "按 log_date 降序返回当前登录用户的全部疗愈日记。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "查询成功"),
            @ApiResponse(code = 400, message = "查询失败")
    })
    @GetMapping("/list")
    @RequiresAuthentication
    public Response listDiaries() {
        return healDiaryService.listDiaries();
    }

    // ================================================================
    // 新增接口
    // ================================================================

    @ApiOperation(
            value = "新增一条疗愈日记",
            notes = "请求体示例：{\"content\":\"今天心情不错\",\"moodScore\":8,\"moodLabel\":\"开心\",\"imageUrls\":\"[]\",\"logDate\":\"2026-03-30\"}\n" +
                    "content 为必填；其余字段均可选；userId 由 Token 自动获取。"
    )
    @ApiResponses({
            @ApiResponse(code = 200, message = "保存成功，result 为新日记 id"),
            @ApiResponse(code = 400, message = "保存失败")
    })
    @PostMapping("/save")
    @RequiresAuthentication
    public Response saveDiary(@RequestBody Map<String, Object> params) {
        return healDiaryService.saveDiary(params);
    }

    // ================================================================
    // 更新接口
    // ================================================================

    @ApiOperation(
            value = "更新指定日记",
            notes = "只能修改本人的日记。请求体示例：{\"content\":\"修改后的内容\",\"moodScore\":7,\"moodLabel\":\"平静\"}"
    )
    @ApiResponses({
            @ApiResponse(code = 200, message = "更新成功"),
            @ApiResponse(code = 400, message = "更新失败，日记不存在或无权限")
    })
    @PutMapping("/{id}")
    @RequiresAuthentication
    public Response updateDiary(
            @ApiParam(value = "日记ID", required = true) @PathVariable long id,
            @RequestBody Map<String, Object> params) {
        return healDiaryService.updateDiary(id, params);
    }

    // ================================================================
    // 删除接口
    // ================================================================

    @ApiOperation(value = "删除指定日记", notes = "只能删除本人的日记，删除后不可恢复。")
    @ApiResponses({
            @ApiResponse(code = 200, message = "删除成功"),
            @ApiResponse(code = 400, message = "删除失败，日记不存在或无权限")
    })
    @DeleteMapping("/{id}")
    @RequiresAuthentication
    public Response deleteDiary(
            @ApiParam(value = "日记ID", required = true) @PathVariable long id) {
        return healDiaryService.deleteDiary(id);
    }
}
