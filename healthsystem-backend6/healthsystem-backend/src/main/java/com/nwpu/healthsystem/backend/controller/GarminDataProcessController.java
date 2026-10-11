package com.nwpu.healthsystem.backend.controller;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import cn.hutool.core.io.resource.ClassPathResource;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.nwpu.healthsystem.backend.entity.UserInfo;
import com.nwpu.healthsystem.backend.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import com.nwpu.healthsystem.backend.utils.JWTUtil;
import com.nwpu.healthsystem.backend.utils.Response;

@RestController
@RequestMapping("/garminDataProcess")
public class GarminDataProcessController {

//    private static final String pythonPath = "E:/Users/learn/anaconda3/envs/garmin/python.exe";
    private static final String pythonPath = "/root/anaconda3/envs/garmin/bin/python";
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final Pattern DATE_PATTERN = Pattern.compile("garmin_.*_data_(\\d{8})_(\\d{8})\\.json");

    // Null数据记录实体类（对应JSON结构）
    private static class NullDataRecord {
        private String user_email;
        private String start_date;
        private String end_date;
        private List<String> null_dates;
        private String status;

        // Getter和Setter
        public String getUser_email() { return user_email; }
        public void setUser_email(String user_email) { this.user_email = user_email; }
        public String getStart_date() { return start_date; }
        public void setStart_date(String start_date) { this.start_date = start_date; }
        public String getEnd_date() { return end_date; }
        public void setEnd_date(String end_date) { this.end_date = end_date; }
        public List<String> getNull_dates() { return null_dates; }
        public void setNull_dates(List<String> null_dates) { this.null_dates = null_dates; }
        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
    }

    private String getScriptPath(String resourcePath) throws IOException {
        ClassPathResource resource = new ClassPathResource(resourcePath);
        return resource.getFile().getAbsolutePath();
    }

    @Autowired
    private UserInfoMapper userInfoMapper;

    @GetMapping("/getBinding")
    public Response getGarminBinding(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return Response.fail("未登录");
        }
        String userName = JWTUtil.getUsername(token);
        if (userName == null) {
            return Response.fail("Token 无效");
        }
        UserInfo userInfo = userInfoMapper.findByUserName(userName);
        if (userInfo == null) {
            return Response.fail("用户不存在");
        }
        Map<String, Object> data = new HashMap<>();
        String email = userInfo.getEmail();
        String pwd = userInfo.getGarminPassword();
        boolean isBound = (email != null && !email.trim().isEmpty() && pwd != null && !pwd.trim().isEmpty());
        data.put("isBound", isBound);
        data.put("email", email != null ? email : "");
        data.put("hasPassword", pwd != null && !pwd.trim().isEmpty());
        return Response.success(data);
    }

    @PostMapping("/bindGarmin")
    public Response bindGarmin(@RequestBody Map<String, String> body, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return Response.fail("未登录");
        }
        String userName = JWTUtil.getUsername(token);
        if (userName == null) {
            return Response.fail("Token 无效");
        }
        String email = body != null ? body.get("email") : null;
        String password = body != null ? body.get("password") : null;
        if (password == null && body != null) {
            password = body.get("garminPassword");
        }
        if (email == null || email.trim().isEmpty()) {
            return Response.fail("Garmin 账号邮箱不能为空");
        }
        if (password == null || password.trim().isEmpty()) {
            return Response.fail("Garmin 密码不能为空");
        }
        userInfoMapper.updateGarminCredentials(userName, email.trim(), password.trim());
        return Response.success("Garmin 账号绑定成功");
    }

    @PostMapping("/unbindGarmin")
    public Response unbindGarmin(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return Response.fail("未登录");
        }
        String userName = JWTUtil.getUsername(token);
        if (userName == null) {
            return Response.fail("Token 无效");
        }
        userInfoMapper.clearGarminCredentials(userName);
        return Response.success("Garmin 账号已解除绑定");
    }

    @PostMapping("/updateByUserName")
    public Map<String, Object> updateGarminDataByUserName(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 从 token 中获取 user_name
            String token = request.getHeader("Authorization");
            if (token == null || token.isEmpty()) {
                result.put("success", false);
                result.put("message", "缺少 Authorization token");
                return result;
            }

            String userName = JWTUtil.getUsername(token);
            if (userName == null) {
                result.put("success", false);
                result.put("message", "Token 无效，未获取到 user_name");
                return result;
            }

            // 查询数据库 user_info 表
            UserInfo userInfo = userInfoMapper.findByUserName(userName);
            if (userInfo == null) {
                result.put("success", false);
                result.put("message", "用户不存在: " + userName);
                return result;
            }

            String email = userInfo.getEmail();
            String garminPassword = userInfo.getGarminPassword();

            if (email == null || email.trim().isEmpty() || garminPassword == null || garminPassword.trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "请先绑定 Garmin 账号和密码");
                return result;
            }

            // 优先使用 sync_garmin.py 直连数据库进行多表实时同步
            String syncScriptPath = "/healthsystem-test/python_scripts/python-garminconnect-master/sync_garmin.py";
            File syncScriptFile = new File(syncScriptPath);
            if (!syncScriptFile.exists()) {
                syncScriptFile = new File("python-garminconnect-master/sync_garmin.py");
            }

            if (syncScriptFile.exists()) {
                List<String> syncCmd = new ArrayList<>();
                syncCmd.add(pythonPath);
                syncCmd.add(syncScriptFile.getAbsolutePath());
                syncCmd.add("--email");
                syncCmd.add(email);
                syncCmd.add("--password");
                syncCmd.add(garminPassword);
                syncCmd.add("--days");
                syncCmd.add("7");
                syncCmd.add("--skip-tunnel");

                System.out.println("[GarminSync] 执行数据同步命令：" + String.join(" ", syncCmd));
                try {
                    executePythonScript(syncCmd);
                    result.put("success", true);
                    result.put("message", "Garmin手环健康数据同步成功！");
                    return result;
                } catch (Exception syncErr) {
                    System.err.println("[GarminSync] sync_garmin 执行报错: " + syncErr.getMessage());
                    // 降级尝试 processGarminData
                }
            }

            // 降级调用原有处理逻辑
            LocalDate endDate = LocalDate.now().minusDays(1); // 昨天
            LocalDate startDate = endDate.minusDays(6); // 最近7天（包含昨天）

            String startDateStr = startDate.format(formatter);
            String endDateStr = endDate.format(formatter);

            String processResult = processGarminData(startDateStr, endDateStr, email, garminPassword);

            if (processResult.contains("成功") || processResult.contains("完成")) {
                result.put("success", true);
            } else {
                result.put("success", false);
            }
            result.put("message", processResult);

            return result;

        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "更新失败：" + e.getMessage());
            return result;
        }
    }

    @PostMapping("/process")
    public String processGarminData(
            @RequestParam String startDateStr,
            @RequestParam String endDateStr,
            @RequestParam String email,
            @RequestParam String password
    ) {
        try {
            // ===================== 第一步：优先处理未处理的Null数据记录 =====================
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
            String safeEmail = email.replace('@', '_');
//            String jsonBaseDir = "E:\\learn\\vue3\\health\\python_scripts\\json_data\\" + safeEmail;
//            String csvOutputDir = "E:\\learn\\vue3\\health\\python_scripts\\csv_data\\" + safeEmail;
            String jsonBaseDir = "/healthsystem-test/python_scripts/json_data/" + safeEmail;
            String csvOutputDir = "/healthsystem-test/python_scripts/csv_data/" + safeEmail;
            File nullDataFile = new File(jsonBaseDir, "null_data_records.json");
            List<NullDataRecord> nullDataRecords = new ArrayList<>();

            // 1. 读取Null数据文件（若存在）
            if (nullDataFile.exists() && nullDataFile.isFile()) {
                try {
                    nullDataRecords = objectMapper.readValue(
                            nullDataFile,
                            objectMapper.getTypeFactory().constructCollectionType(List.class, NullDataRecord.class)
                    );
                    System.out.println("[Null数据处理] 成功读取null_data_records.json，共" + nullDataRecords.size() + "条记录");
                } catch (Exception e) {
                    System.err.println("[Null数据处理] 解析null_data_records.json失败：" + e.getMessage());
                }
            } else {
                System.out.println("[Null数据处理] null_data_records.json不存在，跳过检查");
            }

            // 2. 筛选“未处理”的记录（仅当前用户）
            List<NullDataRecord> unprocessedRecords = nullDataRecords.stream()
                    .filter(record -> "未处理".equals(record.getStatus()) && email.equals(record.getUser_email()))
                    .collect(Collectors.toList());

            if (!unprocessedRecords.isEmpty()) {
                System.out.println("[Null数据处理] 发现" + unprocessedRecords.size() + "条未处理记录，开始优先处理");

                // 3. 逐个处理未处理记录（复用原有数据流程）
                for (NullDataRecord unprocessed : unprocessedRecords) {
                    String nullStart = unprocessed.getStart_date();
                    String nullEnd = unprocessed.getEnd_date();

                    // 验证日期格式
                    if (nullStart == null || nullEnd == null || !nullStart.contains("-") || !nullEnd.contains("-")) {
                        System.err.println("[Null数据处理] 日期格式无效，跳过：start=" + nullStart + "，end=" + nullEnd);
                        continue;
                    }

                    System.out.println("[Null数据处理] 开始处理：start=" + nullStart + "，end=" + nullEnd + "，null_dates=" + unprocessed.getNull_dates());

                    try {
                        // ① 执行Python数据获取脚本
//                        String pythonScriptPath = "E:\\learn\\vue3\\health\\python_scripts\\python-garminconnect-master\\example_modify_copy.py";
                        String pythonScriptPath = "/healthsystem-test/python_scripts/python-garminconnect-master/example_modify_copy.py";
                        List<String> getDataCmd = new ArrayList<>();
                        getDataCmd.add(pythonPath);
                        getDataCmd.add(pythonScriptPath);
                        getDataCmd.add("--email");
                        getDataCmd.add(email);
                        getDataCmd.add("--password");
                        getDataCmd.add(password);
                        getDataCmd.add("--start-date");
                        getDataCmd.add(nullStart);
                        getDataCmd.add("--end-date");
                        getDataCmd.add(nullEnd);
                        getDataCmd.add("--option");
                        getDataCmd.add("*");
                        System.out.println("[Null数据处理] 执行获取命令：" + String.join(" ", getDataCmd));
                        executePythonScript(getDataCmd);

                        // ② 执行退出脚本
                        List<String> exitCmd = new ArrayList<>();
                        exitCmd.add(pythonPath);
                        exitCmd.add(pythonScriptPath);
                        exitCmd.add("--email");
                        exitCmd.add(email);
                        exitCmd.add("--password");
                        exitCmd.add(password);
                        exitCmd.add("--start-date");
                        exitCmd.add(nullStart);
                        exitCmd.add("--end-date");
                        exitCmd.add(nullEnd);
                        exitCmd.add("--option");
                        exitCmd.add("Z");
                        System.out.println("[Null数据处理] 执行退出命令：" + String.join(" ", exitCmd));
                        executePythonScript(exitCmd);

                        // ③ 执行13个数据处理脚本
                        List<String> processScriptPaths = new ArrayList<>();
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\activity_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\body_battery_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\daily_steps_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\fitness_age_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\heart_rate_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\hrv_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\respiration_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\resting_heart_rate_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\sleep_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\spo2_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\stats_body_composition_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\steps_data_process.py");
//                        processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\stress_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/activity_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/body_battery_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/daily_steps_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/fitness_age_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/heart_rate_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/hrv_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/respiration_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/resting_heart_rate_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/sleep_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/spo2_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/stats_body_composition_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/steps_data_process.py");
                        processScriptPaths.add("/healthsystem-test/python_scripts/data_process/stress_data_process.py");

                        for (String scriptPath : processScriptPaths) {
                            String scriptName = new File(scriptPath).getName();
                            String dataType = extractDataType(scriptName);
                            String jsonFileName = String.format("garmin_%s_data_%s_%s.json",
                                    dataType, nullStart.replace("-", ""), nullEnd.replace("-", ""));
                            String jsonFilePath = new File(jsonBaseDir, jsonFileName).getAbsolutePath();

                            if (!new File(jsonFilePath).exists()) {
                                System.err.println("[Null数据处理] JSON文件不存在，跳过：" + jsonFilePath);
                                continue;
                            }

                            List<String> processCmd = new ArrayList<>();
                            processCmd.add(pythonPath);
                            processCmd.add(scriptPath);
                            processCmd.add("--json-file");
                            processCmd.add(jsonFilePath);
                            processCmd.add("--output-dir");
                            processCmd.add(csvOutputDir);
                            processCmd.add("--email");
                            processCmd.add(email);
                            System.out.println("[Null数据处理] 执行脚本：" + scriptName + "，命令：" + String.join(" ", processCmd));
                            executePythonScript(processCmd);
                        }

                        // ④ 执行数据库导入脚本（由该脚本负责更新null_data_records.json状态）
                        String dbImportScriptPath = "E:\\learn\\vue3\\health\\python_scripts\\data_process\\database_process.py";
                        List<String> dbCmd = new ArrayList<>();
                        dbCmd.add(pythonPath);
                        dbCmd.add(dbImportScriptPath);
                        dbCmd.add("--csv-root-dir");
                        dbCmd.add(csvOutputDir);
                        System.out.println("[Null数据处理] 执行数据库导入命令：" + String.join(" ", dbCmd));
                        executePythonScript(dbCmd);

                        System.out.println("[Null数据处理] 记录处理完成（状态更新由数据库脚本负责）：" + nullStart + "~" + nullEnd);

                    } catch (Exception e) {
                        System.err.println("[Null数据处理] 记录处理失败：" + e.getMessage());
                    }
                }
            } else {
                System.out.println("[Null数据处理] 无未处理记录，继续处理当前请求");
            }
            // ===================== Null数据处理结束 =====================

            // ===================== 处理当前请求 =====================
            // 1. 基础路径配置
            new File(jsonBaseDir).mkdirs();
            new File(csvOutputDir).mkdirs();

            // 2. 检查已有数据，调整日期范围
            LocalDate originalStart = LocalDate.parse(startDateStr, formatter);
            LocalDate originalEnd = LocalDate.parse(endDateStr, formatter);
            LocalDate adjustedStart = getAdjustedStartDate(jsonBaseDir, originalStart, originalEnd);

            if (adjustedStart.isAfter(originalEnd)) {
                return "数据已是最新，无需更新。最新数据截止到: " + originalEnd.format(formatter);
            }

            // 3. 执行当前请求的数据处理
            String adjustedStartStr = adjustedStart.format(formatter);
            String adjustedEndStr = originalEnd.format(formatter);
//            String pythonScriptPath = "E:\\learn\\vue3\\health\\python_scripts\\python-garminconnect-master\\example_modify_copy.py";
            String pythonScriptPath = "/healthsystem-test/python_scripts/python-garminconnect-master/example_modify_copy.py";
            List<String> processScriptPaths = new ArrayList<>();
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\activity_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\body_battery_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\daily_steps_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\fitness_age_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\heart_rate_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\hrv_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\respiration_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\resting_heart_rate_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\sleep_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\spo2_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\stats_body_composition_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\steps_data_process.py");
//            processScriptPaths.add("E:\\learn\\vue3\\health\\python_scripts\\data_process\\stress_data_process.py");
//            String dbImportScriptPath = "E:\\learn\\vue3\\health\\python_scripts\\data_process\\database_process.py";

            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/activity_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/body_battery_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/daily_steps_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/fitness_age_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/heart_rate_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/hrv_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/respiration_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/resting_heart_rate_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/sleep_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/spo2_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/stats_body_composition_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/steps_data_process.py");
            processScriptPaths.add("/healthsystem-test/python_scripts/data_process/stress_data_process.py");
            String dbImportScriptPath = "/healthsystem-test/python_scripts/data_process/database_process.py";

            // ① 获取数据
            List<String> getDataCmd = new ArrayList<>();
            getDataCmd.add(pythonPath);
            getDataCmd.add(pythonScriptPath);
            getDataCmd.add("--email");
            getDataCmd.add(email);
            getDataCmd.add("--password");
            getDataCmd.add(password);
            getDataCmd.add("--start-date");
            getDataCmd.add(adjustedStartStr);
            getDataCmd.add("--end-date");
            getDataCmd.add(adjustedEndStr);
            getDataCmd.add("--option");
            getDataCmd.add("*");
            System.out.println("[当前请求] 执行数据获取命令：" + String.join(" ", getDataCmd));
            executePythonScript(getDataCmd);

            // ② 退出脚本
            List<String> exitCmd = new ArrayList<>();
            exitCmd.add(pythonPath);
            exitCmd.add(pythonScriptPath);
            exitCmd.add("--email");
            exitCmd.add(email);
            exitCmd.add("--password");
            exitCmd.add(password);
            exitCmd.add("--start-date");
            exitCmd.add(adjustedStartStr);
            exitCmd.add("--end-date");
            exitCmd.add(adjustedEndStr);
            exitCmd.add("--option");
            exitCmd.add("Z");
            System.out.println("[当前请求] 执行退出命令：" + String.join(" ", exitCmd));
            executePythonScript(exitCmd);

            // ③ 处理数据脚本
            for (String scriptPath : processScriptPaths) {
                String scriptName = new File(scriptPath).getName();
                String dataType = extractDataType(scriptName);
                String jsonFileName = String.format("garmin_%s_data_%s_%s.json",
                        dataType, adjustedStartStr.replace("-", ""), adjustedEndStr.replace("-", ""));
                String jsonFilePath = new File(jsonBaseDir, jsonFileName).getAbsolutePath();

                if (!new File(jsonFilePath).exists()) {
                    System.err.println("[当前请求] JSON文件不存在，跳过：" + jsonFilePath);
                    continue;
                }

                List<String> processCmd = new ArrayList<>();
                processCmd.add(pythonPath);
                processCmd.add(scriptPath);
                processCmd.add("--json-file");
                processCmd.add(jsonFilePath);
                processCmd.add("--output-dir");
                processCmd.add(csvOutputDir);
                processCmd.add("--email");
                processCmd.add(email);
                System.out.println("[当前请求] 执行脚本：" + scriptName + "，命令：" + String.join(" ", processCmd));
                executePythonScript(processCmd);
            }

            // ④ 导入数据库
            List<String> dbCmd = new ArrayList<>();
            dbCmd.add(pythonPath);
            dbCmd.add(dbImportScriptPath);
            dbCmd.add("--csv-root-dir");
            dbCmd.add(csvOutputDir);
            System.out.println("[当前请求] 执行数据库导入命令：" + String.join(" ", dbCmd));
            executePythonScript(dbCmd);

            return "所有数据处理完成！处理范围：1. 未处理Null数据（已优先处理） 2. 当前请求：" + adjustedStartStr + " 至 " + adjustedEndStr;

        } catch (Exception e) {
            return "执行过程中发生错误：" + e.getMessage();
        }
    }

    // 原有方法：检查已有JSON，调整起始日期
    private LocalDate getAdjustedStartDate(String jsonBaseDir, LocalDate originalStartDate, LocalDate originalEndDate) {
        File jsonDir = new File(jsonBaseDir);
        if (!jsonDir.exists() || !jsonDir.isDirectory()) {
            return originalStartDate;
        }

        LocalDate latestEndDate = null;
        File[] jsonFiles = jsonDir.listFiles((dir, name) -> name.endsWith(".json") && name.startsWith("garmin_"));

        if (jsonFiles == null || jsonFiles.length == 0) {
            return originalStartDate;
        }

        for (File file : jsonFiles) {
            Matcher matcher = DATE_PATTERN.matcher(file.getName());
            if (matcher.matches()) {
                try {
                    String endDateStr = matcher.group(2);
                    LocalDate endDate = LocalDate.parse(
                            endDateStr.substring(0, 4) + "-" + endDateStr.substring(4, 6) + "-" + endDateStr.substring(6, 8),
                            formatter
                    );

                    if (!endDate.isAfter(originalEndDate)) {
                        if (latestEndDate == null || endDate.isAfter(latestEndDate)) {
                            latestEndDate = endDate;
                        }
                    }
                } catch (Exception e) {
                    System.err.println("解析文件日期失败: " + file.getName() + ", 错误: " + e.getMessage());
                }
            }
        }

        return latestEndDate != null ? latestEndDate.plus(1, ChronoUnit.DAYS) : originalStartDate;
    }

    // 原有方法：提取数据类型
    private static String extractDataType(String scriptName) {
        return scriptName.replace("_data_process.py", "");
    }

    // 原有方法：执行Python脚本
    private static void executePythonScript(List<String> command) throws IOException, InterruptedException {
        ProcessBuilder processBuilder = new ProcessBuilder(command);
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), "UTF-8"));
        StringBuilder output = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            output.append(line).append("\n");
        }

        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new IOException("Python脚本执行失败，错误码：" + exitCode + "\n错误输出：\n" + output.toString());
        }
    }
}