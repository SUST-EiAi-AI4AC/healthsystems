# 🛠️ H5版本登录失败排查及修复建议 (ERR_CERT_DATE_INVALID)

## 🔍 问题诊断：证书过期
你的 H5 版本 `https://h.playe.top/` 在登录时失败，控制台报错：
`POST https://www.nwpuhs.cn/user/login net::ERR_CERT_DATE_INVALID`

### 1. 核心原因：SSL 证书过期
*   **错误解释**：`ERR_CERT_DATE_INVALID` 明确指出域名 `www.nwpuhs.cn` 的 SSL 证书已经不在有效期内（要么已过期，要么尚未生效）。
*   **为何本地正常？** 本地测试通常使用 `http://127.0.0.1:8081`，不经过 HTTPS，所以没有证书校验问题。
*   **为何怀疑数据库？** 浏览器因为安全原因直接拦截了请求，导致请求根本没有到达后端代码，前端收到的是 `request:fail`，这让你误以为是后端或数据库没连上。实际上，**请求被浏览器在“大门口”（SSL握手阶段）就拦住了**。

### 2. 关于数据库连接的分析
*   **本地测试正常**：说明后端代码、MyBatis 配置、数据库表结构以及阿里云数据库的白名单设置都是正确的。
*   **生产环境连接**：在 `application-deploy.yml` 中已经配置了外网 IP `47.109.49.174`。只要证书问题解决，请求能到达后端，数据库连接通常不会有问题。

---

## 🛠️ 解决方案

### 方案 A：更新后端域名证书 (最快路径)
如果 `www.nwpuhs.cn` 是你的后端专用域名，你需要：
1.  **续期证书**：在阿里云后台查看 `www.nwpuhs.cn` 的证书状态并续期，获取新的 `.pfx` 证书文件。
2.  **更新项目文件**：
    *   将新的 `.pfx` 证书文件放置在后端 resources 目录下：`healthsystem-backend6/healthsystem-backend/src/main/resources/nwpuhs.cn.pfx`
    *   在 `application.yml` 中确保密码正确：
        ```yaml
        server:
          ssl:
            key-store: classpath:nwpuhs.cn.pfx
            key-store-password: yz3ximrk # 如果新证书密码变了请修改
        ```
3.  **重新部署**：执行 `deploy.ps1` 重新打包并上传。

### 方案 B：统一使用 h.playe.top 域名 (架构优化)
目前前端在 `h.playe.top`，后端在 `www.nwpuhs.cn`。如果 `h.playe.top` 是通过 Nginx 托管的，建议：
1.  **配置 Nginx 反向代理**：将 `h.playe.top` 的 `/user/` 路径转发到后端的 HTTP 端口（8081）。
2.  **修改前端配置**：
    *   文件：`frontend/nxTemp/config/index.config.js`
    *   将 `production.baseUrl` 修改为 `https://h.playe.top`。
3.  **优势**：避开了 `www.nwpuhs.cn` 的证书维护问题，只需保证 `h.playe.top` 的证书有效即可。

---

## ✅ 快速验证步骤
1.  **证书确认**：在浏览器直接输入 `https://www.nwpuhs.cn/user/login`。如果看到“不安全”或“证书已过期”的警告，则证实了分析。
2.  **临时跳过验证**：在上述报错页面点击“高级” -> “继续前往”，然后再尝试登录 H5。如果此时能登录成功，说明数据库连接完全正常，只需处理证书。
3.  **检查服务器时间**：执行 `date` 命令确认服务器时间是否与当前北京时间一致。
