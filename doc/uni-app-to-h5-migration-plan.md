## 项目背景

- **当前状态**：uni-app（Vue 2.x）跨平台应用，支持 iOS/Android/H5/小程序四端
- **目标状态**：以 H5 移动端网页为主要访问入口，用户通过网址直接访问
- **技术栈**：前端 uni-app + uView UI + ECharts，后端 Spring Boot 2.3.4 + Shiro + JWT，数据库 MySQL 8.0
- **现有优势**：`manifest.json` 已配置 `h5.router.mode = history`，H5 编译目标已存在基础配置

---

## 一、前端适配方案

### 1.1 核心策略：优先使用 uni-app H5 编译

uni-app 原生支持编译到 H5，无需重写代码，通过 HBuilderX 执行"发行 → 网站-H5手机版"即可生成标准 Web 产物。

**关键配置项（manifest.json `h5` 节点）**

| 配置项 | 当前值 | 建议值 | 说明 |
|--------|--------|--------|------|
| `router.mode` | `history` | `history` | 保持，支持真实 URL 路径 |
| `router.base` | `""` | `/`（或子路径） | 部署到根路径时填 `/` |
| `devServer.https` | `true` | 保持 | 与后端 HTTPS 一致 |
| `template` | `template.h5.html` | 保持 | 自定义 HTML 模板已配置 |

### 1.2 APP 专属特性处理

以下功能在 H5 端无法使用，需要条件编译或替代方案：

| 功能 | APP 实现 | H5 替代方案 |
|------|----------|-------------|
| 极光推送（JG-JPush） | 原生插件 | Web Push API（需 HTTPS + Service Worker）或降级为页内消息提示 |
| 相机/录音权限 | `uni.chooseImage` / `uni.getRecorderManager` | H5 `input[type=file]` + `MediaRecorder API` |
| 视频录制（video.html） | 原生控件 | 已有独立 H5 实现（`hybrid/html/video/`），直接复用 |
| 本地存储 `uni.getStorageSync` | uni API | H5 下自动映射到 `localStorage`，无需修改 |
| `uni.getSystemInfo` | 设备信息 | H5 下使用 `navigator.userAgent` / `window.screen` |

### 1.3 条件编译标记规范

在不兼容代码块外包裹条件编译指令：

```html
<!-- #ifdef APP-PLUS -->
<!-- 仅 APP 平台的推送注册代码 -->
<!-- #endif -->

<!-- #ifdef H5 -->
<!-- H5 端特有逻辑 -->
<!-- #endif -->
```

---

## 二、路由配置调整

### 2.1 现有路由结构分析

项目 `pages.json` 定义了 **47 个页面路由**，包含：
- 首页入口：`pages/home/home`（已配置 `aliasPath: "/"`）
- Tab 页：`pages/index/index`、`pages/mine/mine`
- 功能页：量表、图表、手环数据、登录注册等
- 子包：`pages/public/404`

### 2.2 H5 History 模式路由映射

history 模式下，uni-app 页面路径自动映射为：

```
pages/login/login     →  https://yourdomain.com/pages/login/login
pages/index/index     →  https://yourdomain.com/pages/index/index
pages/home/home       →  https://yourdomain.com/  （aliasPath 已配置）
```

### 2.3 Nginx 路由回退配置（关键）

History 模式必须在服务器配置路由回退，否则直接访问子路径会 404：

```nginx
location / {
    try_files $uri $uri/ /index.html;
}
```

### 2.4 路由跳转兼容性检查

| uni-app 路由 API | H5 支持情况 | 备注 |
|-----------------|-------------|------|
| `uni.navigateTo` | ✅ 支持 | 映射为 Vue Router push |
| `uni.redirectTo` | ✅ 支持 | 映射为 Vue Router replace |
| `uni.switchTab` | ✅ 支持 | Tab 切换 |
| `uni.navigateBack` | ✅ 支持 | 映射为 history.back() |
| `uni.reLaunch` | ✅ 支持 | 重置路由栈 |

### 2.5 深链接与分享链接

H5 模式下 URL 可直接分享，如：
```
https://yourdomain.com/pages/Scale/SDS  →  直接打开抑郁量表页
```
需确认每个页面的 `onLoad` 鉴权逻辑在 H5 下正常工作。

---

## 三、组件兼容性处理

### 3.1 uView UI 组件

uView UI 完整支持 H5 编译，无需特殊处理。

### 3.2 lime-echart 图表组件

项目使用 `uni_modules/lime-echart`，该组件封装了 ECharts，H5 端直接使用 DOM 渲染，性能更好。需确认版本支持 H5 模式。

### 3.3 自定义组件兼容性检查清单

| 组件 | 文件位置 | H5 兼容风险 |
|------|----------|-------------|
| `VueSelectImage` | `CustomComponents/vue-select-image/` | 低风险，纯 Vue 组件 |
| `ir-date-time-picker` | `components/ir-date-time-picker/` | 中风险，检查是否依赖原生 picker |
| `uni-easyinput` | `components/uni-easyinput/` | 低风险，uni 官方组件 |
| `uni-forms` | `components/uni-forms/` | 低风险，uni 官方组件 |
| `IndexSwiper` | `components/swiper/` | 低风险，检查 swiper 初始化 |
| `xp-picker` | `uni_modules/xp-picker/` | 中风险，检查 H5 下弹出层表现 |

### 3.4 移动端适配（视口和响应式）

在 `template.h5.html` 中确认以下 meta 标签存在：

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
```

建议最大宽度限制为 480px，超过时居中展示，模拟移动端效果。

---

## 四、API 接口适配

### 4.1 当前接口配置

- **开发环境**：`http://127.0.0.1:8081`
- **生产环境**：`http://47.109.49.174:8081`
- **认证方式**：JWT Token，存储于 `uni.getStorageSync('token')`（H5 下自动映射 localStorage）
- **Token 注入**：在 `requestConfig.js` 的 `requestStart` 拦截器中处理

### 4.2 CORS 跨域配置

H5 端发起的请求会产生跨域问题，需在 Spring Boot 后端添加 CORS 配置：

```java
// 在 Spring Boot 配置类中添加
@CrossOrigin(origins = {"https://yourdomain.com"}, allowCredentials = "true")
// 或全局配置 WebMvcConfigurer.addCorsMappings
```

允许的 Headers 需包含：
- `Authorization`（JWT Token）
- `Content-Type: application/json;charset=UTF-8`

### 4.3 HTTPS 一致性要求

H5 页面部署在 HTTPS 下时，所有接口调用**必须使用 HTTPS**，否则浏览器会拒绝混合内容请求。

**方案**：生产环境 `baseUrl` 从 `http://47.109.49.174:8081` 改为 `https://api.yourdomain.com`，并为后端服务配置 SSL 证书（或由 Nginx 反向代理统一终止 SSL）。

### 4.4 接口 baseUrl 多环境配置

在 `index.config.js` 中按环境区分：

```javascript
development: {
    baseUrl: "http://127.0.0.1:8081",   // 本地开发
},
production: {
    baseUrl: "https://api.yourdomain.com",  // 生产，通过 Nginx 反代后端
}
```

### 4.5 视频录制接口适配

`hybrid/html/video/` 目录下已有独立 H5 视频实现（RecordRTC.js），可通过 iframe 或 WebView 方式嵌入，或将接口改造为标准 fetch 调用。

---

## 五、部署架构

### 5.1 推荐部署架构（单服务器方案）

```
用户浏览器（HTTPS 443）
        │
        ▼
  ┌─────────────┐
  │  Nginx      │  ← SSL 终止、静态资源服务、反向代理
  │  (443/80)   │
  └──────┬──────┘
         │
    ┌────┴────┐
    │         │
    ▼         ▼
H5 静态文件   Spring Boot API
(dist目录)   (127.0.0.1:8081)
                │
                ▼
           MySQL 8.0
                │
                ▼
         Python 脚本服务
        (Garmin 数据同步)
```

### 5.2 Nginx 完整配置示例

```nginx
server {
    listen 443 ssl;
    server_name yourdomain.com;

    # SSL 证书
    ssl_certificate     /etc/ssl/certs/yourdomain.crt;
    ssl_certificate_key /etc/ssl/private/yourdomain.key;

    # H5 静态文件
    root /var/www/health-h5/dist;
    index index.html;

    # Vue Router history 模式回退
    location / {
        try_files $uri $uri/ /index.html;
    }

    # 静态资源缓存
    location ~* \.(js|css|png|jpg|ico|woff2)$ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }

    # API 反向代理
    location /api/ {
        proxy_pass http://127.0.0.1:8081;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# HTTP 强制跳转 HTTPS
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$host$request_uri;
}
```

### 5.3 服务器最低配置需求

| 资源 | 最低配置 | 推荐配置 |
|------|----------|----------|
| CPU | 1 核 | 2 核 |
| 内存 | 2 GB | 4 GB |
| 磁盘 | 20 GB SSD | 40 GB SSD |
| 带宽 | 1 Mbps | 5 Mbps |
| 操作系统 | Linux（Ubuntu 20.04 / CentOS 7） | Ubuntu 22.04 LTS |

### 5.4 构建产物部署流程

```bash
# 1. 在 HBuilderX 中发行 H5
# 菜单：发行 → 网站-H5手机版
# 产物输出到：frontend/unpackage/dist/build/h5/

# 2. 将产物上传至服务器
scp -r frontend/unpackage/dist/build/h5/* user@server:/var/www/health-h5/dist/

# 3. 重载 Nginx
nginx -s reload
```

---

## 六、域名和访问方式

### 6.1 域名规划建议

| 用途 | 建议域名 | 说明 |
|------|----------|------|
| H5 前端访问 | `https://yourdomain.com` | 主域名，用户直接访问 |
| API 接口 | `https://yourdomain.com/api/` | 同域名下通过路径区分，避免跨域 |
| 或独立 API 域名 | `https://api.yourdomain.com` | 前后端分离，需配置 CORS |

**推荐方案**：同域名 + Nginx 路径分发（`/api/` 反代后端），可彻底避免跨域问题。

### 6.2 SSL 证书获取

- **免费方案**：Let's Encrypt（certbot 自动申请，90天自动续期）
- **国内方案**：阿里云/腾讯云免费 DV 证书（1年有效期）
- **现有配置**：项目已使用 HTTPS 1443 端口，迁移时将端口统一到标准 443

### 6.3 移动端书签与 PWA

H5 页面可配置 PWA，使用户"添加到主屏幕"后获得类 APP 体验：

在 `template.h5.html` 中添加：
```html
<link rel="manifest" href="/manifest.webmanifest">
<meta name="theme-color" content="#a1c4fd">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
```

### 6.4 访问入口汇总

| 访问方式 | URL | 用途 |
|----------|-----|------|
| 直接访问 | `https://yourdomain.com` | 进入首页（home 页） |
| 登录页 | `https://yourdomain.com/pages/login/login` | 直接打开登录 |
| 量表链接 | `https://yourdomain.com/pages/Scale/SDS` | 直达功能页 |
| 扫码访问 | 生成二维码指向主域名 | 医院现场推广 |

---

## 七、性能优化

### 7.1 构建层优化

| 优化项 | 方案 |
|--------|------|
| 代码分割 | uni-app H5 编译默认支持路由懒加载 |
| Tree Shaking | 确认 `uni-icons` 等按需引入 |
| 图片压缩 | `static/` 目录图片使用 WebP 格式，或部署时添加 Nginx 压缩 |
| Gzip 压缩 | Nginx 开启 `gzip on; gzip_types text/javascript application/json;` |

### 7.2 资源加载优化

```nginx
# Nginx Gzip 配置
gzip on;
gzip_min_length 1024;
gzip_types text/plain text/css application/javascript application/json image/svg+xml;
gzip_vary on;
```

### 7.3 ECharts 按需加载

项目大量使用 `lime-echart` 组件，ECharts 库体积较大（约 700KB+），建议：
- 使用 ECharts 按需引入（只引入折线图、柱状图等实际使用的图表类型）
- 图表组件设置懒渲染（进入视口后再初始化）

### 7.4 移动端性能关键指标目标

| 指标 | 目标值 |
|------|--------|
| 首屏加载时间（FCP） | < 2.5 秒（4G 网络） |
| 交互响应时间（TTI） | < 3.5 秒 |
| JS 主包体积 | < 500 KB（gzip 后） |
| 图片单张体积 | < 200 KB |

### 7.5 缓存策略

| 资源类型 | 缓存策略 |
|----------|----------|
| `index.html` | `no-cache`（确保更新立即生效） |
| JS/CSS（带 hash） | `immutable, max-age=31536000` |
| 静态图片 | `max-age=2592000`（30天） |
| API 接口 | 由后端控制，前端不缓存敏感数据 |

---

## 八、测试方案

### 8.1 本地 H5 编译测试

**第一步：本地运行 H5 版本**
1. HBuilderX 运行 → 运行到浏览器，选择 Chrome
2. 使用 Chrome DevTools 切换到移动端模拟（iPhone/Android）
3. 逐页检查功能是否正常

**第二步：功能验证清单**

| 模块 | 测试要点 | 预期风险等级 |
|------|----------|-------------|
| 登录/注册/忘记密码 | 表单提交、Token 存储、跳转 | 低 |
| 首页/Tab 导航 | TabBar 展示、页面切换 | 低 |
| 量表（SDS/PSS/SAS） | 表单交互、提交后跳转报告页 | 低 |
| ECharts 图表 | 图表渲染、数据加载 | 中（需确认 lime-echart H5 表现） |
| 情绪记录（EMA）| 图片选择、分类展示 | 中 |
| 视频访谈 | RecordRTC 录制、上传 | 高（H5 权限、浏览器兼容） |
| 手环数据展示 | 数据请求、图表渲染 | 低 |
| 个人信息/设置 | 信息修改、密码修改 | 低 |
| 推送通知 | 极光推送失效，降级为页内提示 | 高（需改造） |

### 8.2 跨浏览器兼容性测试

| 浏览器 | 平台 | 优先级 |
|--------|------|--------|
| Chrome Mobile | Android | P0（必测） |
| Safari | iOS | P0（必测） |
| 微信内置浏览器 | Android/iOS | P1（常见入口） |
| Chrome Desktop | Windows | P1（开发测试） |
| Firefox Mobile | Android | P2 |

### 8.3 网络环境测试

- Chrome DevTools Network Throttling 模拟 4G/3G 网络
- 测试弱网下的加载状态、错误处理和 Toast 提示

### 8.4 接口联调测试

1. **跨域验证**：确认 CORS 配置正确，无 `Access-Control-Allow-Origin` 报错
2. **Token 认证**：完整走通登录 → 获取 Token → 请求接口 → Token 过期重登 流程
3. **HTTPS 混合内容**：确认无 Mixed Content 警告

### 8.5 上线过渡策略

| 阶段 | 时间 | 目标 |
|------|------|------|
| 阶段一：本地验证 | 第 1-2 周 | 完成 H5 编译，本地浏览器全功能测试 |
| 阶段二：测试环境部署 | 第 3 周 | 部署到测试服务器，内网访问联调 |
| 阶段三：灰度发布 | 第 4 周 | 部分用户（医护/管理员）试用 H5 版 |
| 阶段四：全量上线 | 第 5 周 | 全量切换，保留 APP 版本并行运行 |
| 阶段五：监控稳定 | 第 6-8 周 | 收集反馈，修复问题，优化性能 |

---

## 九、风险评估与应对

| 风险点 | 影响 | 应对措施 |
|--------|------|----------|
| 极光推送无法在 H5 使用 | 高 | 降级为页内消息中心或短信通知 |
| 视频录制兼容性问题 | 高 | 使用已有 RecordRTC H5 方案，限定支持 Chrome/Safari |
| ECharts 图表在 iOS Safari 渲染异常 | 中 | 升级 lime-echart，测试 Canvas 渲染模式 |
| 后端 HTTPS 迁移阻力 | 中 | Nginx 反代统一 SSL，后端内部 HTTP 不变 |
| 微信内置浏览器限制（相机、存储） | 中 | 引导用户"在浏览器中打开" |
| 老旧 Android 系统（< 5.0）兼容 | 低 | 设置 `browsersList`，目标 ES5+ |

---

## 十、实施优先级总结

```
优先级 P0（必须完成）：
  1. manifest.json H5 节点配置完善
  2. 后端 CORS 配置
  3. 生产环境 HTTPS 接口地址配置
  4. Nginx 部署（history 模式回退 + API 反代）
  5. 登录/核心功能页面测试验证

优先级 P1（重要）：
  6. 极光推送降级处理
  7. ECharts 图表 H5 适配验证
  8. 移动端视口和样式适配
  9. PWA 基础配置

优先级 P2（优化）：
  10. Gzip 压缩和缓存策略
  11. ECharts 按需加载
  12. Service Worker + 离线缓存
```
