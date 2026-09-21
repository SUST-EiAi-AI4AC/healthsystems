# H5端全局中英文双语一键切换系统实施方案

> **文档版本**：v1.0.0  
> **适用项目**：MindApp 健康关怀系统 (HealthSystems Frontend - Uni-App / Vue2 / H5)  
> **核心目标**：在 H5 端首页顶部右侧打造高质感中英文切换胶囊按钮，实现【首页】、【AI评估】、【疗愈】、【我的】四大主导航及所有界面中英文全局一键无缝切换与持久化存储。

---

## 目录
1. [方案概述与设计目标](#一方案概述与设计目标)
2. [技术选型与架构设计](#二技术选型与架构设计)
3. [首页顶部右侧切换按钮 UI/UX 规范](#三首页顶部右侧切换按钮-uiux-规范)
4. [四大主模块全量中英文词条字典对照表](#四大主模块全量中英文词条字典对照表)
   - [4.1 全局通用词条 (Common)](#41-全局通用词条-common)
   - [4.2 底部导航栏 (TabBar)](#42-底部导航栏-tabbar)
   - [4.3 首页模块 (Home / Index)](#43-首页模块-home--index)
   - [4.4 AI评估模块 (AI Assessment)](#44-ai评估模块-ai-assessment)
   - [4.5 疗愈模块 (Healing)](#45-疗愈模块-healing)
   - [4.6 我的模块 (Mine / Profile)](#46-我的模块-mine--profile)
5. [分步实施方案指南 (Step-by-Step)](#五分步实施方案指南-step-by-step)
   - [步骤一：搭建国际化核心引擎 (Locale Engine)](#步骤一搭建国际化核心引擎-locale-engine)
   - [步骤二：在 main.js 中全局挂载 $t 与响应式对象](#步骤二在-mainjs-中全局挂载-t-与响应式对象)
   - [步骤三：实现 TabBar 与页面标题动态双语联动刷新](#步骤三实现-tabbar-与页面标题动态双语联动刷新)
   - [步骤四：首页顶部右侧精美切换按钮实现](#步骤四首页顶部右侧精美切换按钮实现)
   - [步骤五：四大核心页面代码国际化改造示例](#步骤五四大核心页面代码国际化改造示例)
6. [排版与长文本样式防御规范](#六排版与长文本样式防御规范)
7. [测试用例与验证验收标准](#七测试用例与验证验收标准)

---

## 一、方案概述与设计目标

### 1.1 需求背景
随着健康关怀与心理支持系统的国际化推广，需要在当前已有的 H5 端前端项目中提供对英文用户的友好支持。用户在首页顶部可以直观看到具有现代质感、美观优雅的中英文切换入口，点击后立即完成整站界面文案的响应式切换，且无需刷新页面或重新登录。

### 1.2 核心目标
1. **视觉美观**：在首页顶部右侧增加极具现代感与科技感的双语胶囊切换开关（采用 Glassmorphism 毛玻璃拟态、轻柔微阴影与滑动高亮微动画），与系统现有的清爽蓝白色调完美融合。
2. **全局覆盖**：全面覆盖底部四大主菜单：
   - 🏠 **首页 (Home)**：顶部轮播、日常状态、健康评估、手环同步、迷你访谈、疗愈卡片、温馨贴士。
   - 🎨 **AI评估 (AI Assessment)**：画画测验 (HTP)、量表测评 (PARS-3/IPAQ/MAIA-2/CD-RISC 等)、认知评估。
   - 🌸 **疗愈 (Healing)**：AI心理助手聊天 (心晴)、情绪日记、疗愈游戏、冥想助眠。
   - 👤 **我的 (Mine)**：用户个人信息、健康报告、历史记录、系统设置、修改密码、退出登录、头像更换弹窗。
3. **原生联动**：自动同步切换底部原生 TabBar 文案（通过 `uni.setTabBarItem`）和各页面顶部导航标题（`uni.setNavigationBarTitle`）。
4. **状态持久化**：记录用户语言偏好于本地缓存（`uni.setStorageSync('mindapp_locale', lang)`），下次进入自动保持。

---

## 二、技术选型与架构设计

### 2.1 技术选型分析
本项目基于 **Uni-App (Vue 2.x)** 开发，并在 H5 端部署运行。
针对国际化，存在两种方案：
- **方案 A (第三方 vue-i18n@8.x 插件)**：功能完善，但对于非 Node 编译环境或特殊 Uni-App 打包环境可能存在 bundle 体积增加或依赖冲突。
- **方案 B (原生轻量响应式 i18n 引擎，推荐首选)**：利用 `Vue.observable` 创建响应式语言状态池，轻量无依赖（< 2KB），100% 兼容 Uni-App 运行机制与 H5 构建体系，支持 `$t('key.subkey')` 链式解析、动态切换即时重绘、Tab 栏与标题即刻联动。

> **结论**：本方案采用基于 `Vue.observable` 的轻量级、企业级响应式国际化架构，同时保持标准 `$t` 调用方式，便于后期如果迁移至 vue-i18n 可做到零成本无缝平替。

### 2.2 整体架构拓扑图

```
+-------------------------------------------------------------+
|                      用户界面 (H5 视图层)                      |
|  [首页右上方 🌐 中/EN 胶囊按钮]                                  |
+------------------------------+------------------------------+
                               | 点击触发 switchLang('zh' | 'en')
                               v
+-------------------------------------------------------------+
|               i18n 核心管理调度层 (frontend/locale)           |
|  - index.js: 响应式 currentLang (Vue.observable)             |
|  - storage: 本地持久化缓存 ('mindapp_locale')                   |
|  - eventBus: uni.$emit('localeChange', lang)                 |
+--------------+-------------------------------+--------------+
               |                               |
               v                               v
+------------------------------+ +----------------------------+
|     静态语言包字典库           | |       原生与全局系统联动     |
|  - zh.js: 简体中文语言包      | |  - uni.setTabBarItem (4大项)|
|  - en.js: 英文语言包          | |  - uni.setNavigationBarTitle|
+------------------------------+ +----------------------------+
               |
               v
+-------------------------------------------------------------+
|          Vue 挂载: Vue.prototype.$t / computed / mixin       |
|    首页 (Index)  |  AI评估 (Assess)  |  疗愈 (Heal)  |  我的 (Mine)  |
+-------------------------------------------------------------+
```

---

## 三、首页顶部右侧切换按钮 UI/UX 规范

### 3.1 视觉设计要求
- **定位**：固定或悬浮于首页最顶部右上侧（避让安全边距），`top: 14px; right: 16px; z-index: 999;`。
- **材质质感**：现代毛玻璃拟态（Glassmorphism），半透明白底 `rgba(255, 255, 255, 0.85)` + 模糊滤镜 `backdrop-filter: blur(12px)`。
- **边框与阴影**：`1px solid rgba(255, 255, 255, 0.6)`，外发光微阴影 `box-shadow: 0 4px 16px rgba(94, 135, 197, 0.16)`。
- **微交互设计**：
  - 点击时有细腻弹性缩放（`active: scale(0.94)`）。
  - 双语指示器高亮胶囊：当前激活的语言（如 EN）呈现渐变背景胶囊 (`linear-gradient(135deg, #5E87C5, #84DFF7)`) 与白色字体，未激活的呈现典雅中灰。

### 3.2 按钮结构与视觉效果预览
```
+--------------------------------+
|  🌐   [  中  |  EN  ] (活跃高亮) |
+--------------------------------+
```

---

## 四、四大主模块全量中英文词条字典对照表

### 4.1 全局通用词条 (Common)

| 键名 (Key) | 简体中文 (zh) | 英文 (en) |
|---|---|---|
| `common.appName` | 健康关怀 | MindApp Care |
| `common.confirm` | 确定 | Confirm |
| `common.cancel` | 取消 | Cancel |
| `common.save` | 保存 | Save |
| `common.submit` | 提交 | Submit |
| `common.loading` | 加载中... | Loading... |
| `common.success` | 操作成功 | Success |
| `common.error` | 操作失败 | Failed |
| `common.notice` | 提示 | Notice |
| `common.more` | 更多 | More |
| `common.back` | 返回 | Back |
| `common.status` | 状态 | Status |
| `common.history` | 历史 | History |

### 4.2 底部导航栏 (TabBar)

| 导航索引 | 键名 (Key) | 简体中文 (zh) | 英文 (en) |
|---|---|---|---|
| Tab 0 | `tabbar.home` | 首页 | Home |
| Tab 1 | `tabbar.aiassess` | AI评估 | AI Assessment |
| Tab 2 | `tabbar.heal` | 疗愈 | Healing |
| Tab 3 | `tabbar.mine` | 我的 | Profile |

### 4.3 首页模块 (Home / Index)

| 键名 (Key) | 简体中文 (zh) | 英文 (en) |
|---|---|---|
| `index.navTitle` | 首页 | Home |
| `index.quickEntryTag` | 每日填报 | Daily Log |
| `index.dailyReportTitle` | 日常状态 | Daily Check-in |
| `index.dailyReportDesc` | 每日晚八点后提交1次 | Submit once after 20:00 daily |
| `index.healthAssessTitle` | 健康评估 | Health Assessment |
| `index.healthAssessDesc` | 3大科学心理量表 | 3 Scientific Scales |
| `index.braceletTitle` | 手环数据 | Wristband Data |
| `index.braceletDesc` | 连接 GARMIN 智能手环 | Sync with GARMIN Smartband |
| `index.miniInterviewTitle` | 迷你访谈 | Mini Interview |
| `index.miniInterviewSub` | Mini-interviews Assessment | Mini-interviews Assessment |
| `index.miniInterviewDesc` | 说说最近的事和心情吧 | Share recent thoughts & feelings |
| `index.healingCardTitle` | 疗愈 | Healing Space |
| `index.healingCardSub` | Healing & Companionship | Healing & Companionship |
| `index.healingCardDesc` | 24h聊天/游戏/日记陪伴 | 24h Chat / Games / Diary |
| `index.warmTipDefault` | 保持规律作息，让心灵沐浴阳光 ☀️ | Maintain a balanced routine and embrace peace ☀️ |

### 4.4 AI评估模块 (AI Assessment)

| 键名 (Key) | 简体中文 (zh) | 英文 (en) |
|---|---|---|
| `aiassess.navTitle` | AI评估 | AI Assessment |
| `aiassess.tabDrawing` | 🎨 画画 | 🎨 Drawing |
| `aiassess.tabTesting` | 📋 测评 | 📋 Scales |
| `aiassess.tabEvaluation` | 🧠 评估 | 🧠 Cognitive |
| `aiassess.htpBannerTitle` | 房树人心理测验 | House-Tree-Person Test |
| `aiassess.htpBannerSub` | HTP Test · House · Tree · Person | HTP Test · House · Tree · Person |
| `aiassess.htpIntroTitle` | ✨ 关于 HTP 测验 | ✨ About HTP Test |
| `aiassess.htpIntroDesc` | 房树人测验是一种投射性心理测验。通过分析绘制的房屋、树木和人物，综合评估心理健康状态与情商水平。 | The HTP Test is a projective assessment evaluating your mental well-being and EQ through your drawings of houses, trees, and figures. |
| `aiassess.htpStartBtn` | 开始绘画测验 | Start Drawing Test |
| `aiassess.htpFooterTip` | 拿起画笔，让内心说话。 | Pick up the brush and let your heart speak. |
| `aiassess.scaleSectionTitle` | 心理测评量表 | Psychological Scales |
| `aiassess.scaleSectionDesc` | 以下量表用于全面评估心理健康状态，请根据实际情况填写 | Comprehensive scales for mental status. Please answer truthfully. |
| `aiassess.scalePars3Title` | PARS-3 体育活动等级量表 | PARS-3 Physical Activity Scale |
| `aiassess.scalePars3Desc` | 5个条目 · 评估上月体育锻炼 | 5 items · Past month exercise |
| `aiassess.scaleIpaqTitle` | IPAQ 国际体力活动量表 | IPAQ Physical Activity Scale |
| `aiassess.scaleIpaqDesc` | 7个条目 · 评估过去7天体力活动 | 7 items · Past 7-day activity |
| `aiassess.scaleMaia2Title` | MAIA-2 多维度内感受意识量表 | MAIA-2 Interoceptive Awareness |
| `aiassess.scaleMaia2Desc` | 37个条目 · 8个维度评估身体与情绪感知 | 37 items · 8 dimensions |
| `aiassess.scaleCdriscTitle` | CD-RISC 心理弹性量表 | CD-RISC Resilience Scale |
| `aiassess.scaleCdriscDesc` | 25个条目 · 评估应对逆境的复原力 | 25 items · Coping & Resilience |
| `aiassess.scaleSdsTitle` | SDS 抑郁自评量表 | SDS Depression Scale |
| `aiassess.scaleSasTitle` | SAS 焦虑自评量表 | SAS Anxiety Scale |
| `aiassess.scalePssTitle` | PSS 压力知觉量表 | PSS Perceived Stress Scale |

### 4.5 疗愈模块 (Healing)

| 键名 (Key) | 简体中文 (zh) | 英文 (en) |
|---|---|---|
| `heal.navTitle` | 疗愈 | Healing |
| `heal.tabChat` | 聊天 | Chat |
| `heal.tabDiary` | 日记 | Diary |
| `heal.tabGame` | 游戏 | Games |
| `heal.tabBreathe` | 冥想 | Meditation |
| `heal.aiAssistantName` | 心晴 | Sunny AI |
| `heal.aiRoleTag` | AI 心理助手 | AI Mental Assistant |
| `heal.online` | 在线 | Online |
| `heal.volumeOn` | 🔊 音量开 | 🔊 Audio On |
| `heal.volumeOff` | 🔇 音量关 | 🔇 Audio Off |
| `heal.chatBannerDesc` | 24h专业倾听，温暖陪伴，随时为你解忧 🌸 | 24h empathetic listening and warm companionship 🌸 |
| `heal.history` | 历史 | History |
| `heal.inputPlaceholder` | 告诉我你的感受，我在听... | Share your thoughts, I'm listening... |
| `heal.sendBtn` | 发送 | Send |
| `heal.diaryTitle` | 心情日记 | Mood Diary |
| `heal.diaryWriteBtn` | 记录此刻心情 | Write a Journal |
| `heal.gameBreath` | 腹式深呼吸 | Deep Breathing |
| `heal.gameForest` | 森林漫步冥想 | Forest Stroll Soundscape |

### 4.6 我的模块 (Mine / Profile)

| 键名 (Key) | 简体中文 (zh) | 英文 (en) |
|---|---|---|
| `mine.navTitle` | 我的 | Profile |
| `mine.userLabel` | 用户： | User: |
| `mine.notLoggedIn` | 未登录 | Not Logged In |
| `mine.basicInfo` | 个人信息 | Personal Info |
| `mine.infoIncomplete` | 个人信息待完善 | Profile Incomplete |
| `mine.serviceTitle` | 服务 | Services |
| `mine.healthReportTitle` | 健康报告 | Health Report |
| `mine.healthReportDesc` | 查看综合健康评估报告 | View comprehensive health analysis |
| `mine.historyChartTitle` | 历史记录 | History Records |
| `mine.historyChartDesc` | 查询过去提交的记录 | Check previous submissions & trends |
| `mine.settingsTitle` | 系统设置 | Settings |
| `mine.settingsDesc` | 管理通知与隐私偏好 | Manage notifications & privacy |
| `mine.modifyPwdTitle` | 修改密码 | Change Password |
| `mine.modifyPwdDesc` | 修改您的登录密码 | Update account password |
| `mine.logout` | 退出登录 | Log Out |
| `mine.logoutConfirm` | 确定要退出登录吗？ | Are you sure you want to log out? |
| `mine.changeAvatar` | 更换头像 | Change Avatar |
| `mine.uploadCustomAvatar` | 上传自定义头像 | Upload Custom Avatar |
| `mine.maleStyle` | 男性风格 | Male Styles |
| `mine.femaleStyle` | 女性风格 | Female Styles |

---

## 五、分步实施方案指南 (Step-by-Step)

### 步骤一：搭建国际化核心引擎 (Locale Engine)

在 `frontend/` 目录下创建 `locale/` 文件夹：
- `frontend/locale/zh.js` (中文词典)
- `frontend/locale/en.js` (英文词典)
- `frontend/locale/tabbar.js` (原生 TabBar 联动工具)
- `frontend/locale/index.js` (国际化管理与响应式驱动)

#### 1. `frontend/locale/zh.js`
```javascript
export default {
    tabbar: {
        home: '首页',
        aiassess: 'AI评估',
        heal: '疗愈',
        mine: '我的'
    },
    index: {
        navTitle: '首页',
        quickEntryTag: '每日填报',
        dailyReportTitle: '日常状态',
        dailyReportDesc: '每日晚八点后提交1次',
        healthAssessTitle: '健康评估',
        healthAssessDesc: '3大科学心理量表',
        braceletTitle: '手环数据',
        braceletDesc: '连接 GARMIN 智能手环',
        miniInterviewTitle: '迷你访谈',
        miniInterviewSub: 'Mini-interviews Assessment',
        miniInterviewDesc: '说说最近的事和心情吧',
        healingCardTitle: '疗愈',
        healingCardSub: 'Healing & Companionship',
        healingCardDesc: '24h聊天/游戏/日记陪伴',
        warmTipDefault: '保持规律作息，让心灵沐浴阳光 ☀️'
    },
    aiassess: {
        navTitle: 'AI评估',
        tabDrawing: '🎨 画画',
        tabTesting: '📋 测评',
        tabEvaluation: '🧠 评估',
        htpBannerTitle: '房树人心理测验',
        htpBannerSub: 'HTP Test · House · Tree · Person',
        htpIntroTitle: '✨ 关于 HTP 测验',
        htpIntroDesc: '房树人测验是一种投射性心理测验。通过分析绘制的房屋、树木和人物，综合评估心理健康状态与情商水平。',
        htpStartBtn: '开始绘画测验',
        htpFooterTip: '拿起画笔，让内心说话。',
        scaleSectionTitle: '心理测评量表',
        scaleSectionDesc: '以下量表用于全面评估心理健康状态，请根据实际情况填写'
    },
    heal: {
        navTitle: '疗愈',
        tabChat: '聊天',
        tabDiary: '日记',
        tabGame: '游戏',
        tabBreathe: '冥想',
        aiAssistantName: '心晴',
        aiRoleTag: 'AI 心理助手',
        online: '在线',
        volumeOn: '🔊 音量开',
        volumeOff: '🔇 音量关',
        chatBannerDesc: '24h专业倾听，温暖陪伴，随时为你解忧 🌸',
        history: '历史',
        inputPlaceholder: '告诉我你的感受，我在听...',
        sendBtn: '发送'
    },
    mine: {
        navTitle: '我的',
        userLabel: '用户：',
        notLoggedIn: '未登录',
        basicInfo: '个人信息',
        infoIncomplete: '个人信息待完善',
        serviceTitle: '服务',
        healthReportTitle: '健康报告',
        healthReportDesc: '查看综合健康评估报告',
        historyChartTitle: '历史记录',
        historyChartDesc: '查询过去提交的记录',
        settingsTitle: '系统设置',
        settingsDesc: '管理通知与隐私偏好',
        modifyPwdTitle: '修改密码',
        modifyPwdDesc: '修改您的登录密码',
        logout: '退出登录',
        changeAvatar: '更换头像',
        uploadCustomAvatar: '上传自定义头像'
    },
    common: {
        confirm: '确定',
        cancel: '取消',
        save: '保存',
        success: '操作成功'
    }
};
```

#### 2. `frontend/locale/en.js`
```javascript
export default {
    tabbar: {
        home: 'Home',
        aiassess: 'AI Assessment',
        heal: 'Healing',
        mine: 'Profile'
    },
    index: {
        navTitle: 'Home',
        quickEntryTag: 'Daily Log',
        dailyReportTitle: 'Daily Check-in',
        dailyReportDesc: 'Submit once after 20:00 daily',
        healthAssessTitle: 'Health Assessment',
        healthAssessDesc: '3 Scientific Scales',
        braceletTitle: 'Wristband Data',
        braceletDesc: 'Sync with GARMIN Smartband',
        miniInterviewTitle: 'Mini Interview',
        miniInterviewSub: 'Mini-interviews Assessment',
        miniInterviewDesc: 'Share recent thoughts & feelings',
        healingCardTitle: 'Healing',
        healingCardSub: 'Healing & Companionship',
        healingCardDesc: '24h Chat / Games / Diary',
        warmTipDefault: 'Maintain a balanced routine and embrace peace ☀️'
    },
    aiassess: {
        navTitle: 'AI Assessment',
        tabDrawing: '🎨 Drawing',
        tabTesting: '📋 Scales',
        tabEvaluation: '🧠 Cognitive',
        htpBannerTitle: 'House-Tree-Person Test',
        htpBannerSub: 'HTP Test · House · Tree · Person',
        htpIntroTitle: '✨ About HTP Test',
        htpIntroDesc: 'The HTP Test is a projective assessment evaluating your mental well-being and EQ through drawings of houses, trees, and figures.',
        htpStartBtn: 'Start Drawing Test',
        htpFooterTip: 'Pick up the brush and let your heart speak.',
        scaleSectionTitle: 'Psychological Scales',
        scaleSectionDesc: 'Comprehensive scales for mental status. Please answer truthfully.'
    },
    heal: {
        navTitle: 'Healing',
        tabChat: 'Chat',
        tabDiary: 'Diary',
        tabGame: 'Games',
        tabBreathe: 'Meditation',
        aiAssistantName: 'Sunny AI',
        aiRoleTag: 'AI Assistant',
        online: 'Online',
        volumeOn: '🔊 Audio On',
        volumeOff: '🔇 Audio Off',
        chatBannerDesc: '24h empathetic listening and warm companionship 🌸',
        history: 'History',
        inputPlaceholder: 'Share your thoughts, I\'m listening...',
        sendBtn: 'Send'
    },
    mine: {
        navTitle: 'Profile',
        userLabel: 'User: ',
        notLoggedIn: 'Not Logged In',
        basicInfo: 'Personal Info',
        infoIncomplete: 'Profile Incomplete',
        serviceTitle: 'Services',
        healthReportTitle: 'Health Report',
        healthReportDesc: 'View comprehensive health analysis',
        historyChartTitle: 'History Records',
        historyChartDesc: 'Check previous submissions & trends',
        settingsTitle: 'Settings',
        settingsDesc: 'Manage notifications & privacy',
        modifyPwdTitle: 'Change Password',
        modifyPwdDesc: 'Update account password',
        logout: 'Log Out',
        changeAvatar: 'Change Avatar',
        uploadCustomAvatar: 'Upload Custom Avatar'
    },
    common: {
        confirm: 'Confirm',
        cancel: 'Cancel',
        save: 'Save',
        success: 'Success'
    }
};
```

#### 3. `frontend/locale/tabbar.js` (TabBar 动态同步模块)
```javascript
import i18n from './index';

export function updateTabBarLanguage(lang = i18n.currentLang) {
    const tabList = [
        { index: 0, key: 'tabbar.home' },
        { index: 1, key: 'tabbar.aiassess' },
        { index: 2, key: 'tabbar.heal' },
        { index: 3, key: 'tabbar.mine' }
    ];

    tabList.forEach(item => {
        try {
            uni.setTabBarItem({
                index: item.index,
                text: i18n.t(item.key)
            });
        } catch (e) {
            // 忽略非 Tab 页面报错
        }
    });
}
```

#### 4. `frontend/locale/index.js` (响应式 i18n 管理驱动)
```javascript
import Vue from 'vue';
import zh from './zh';
import en from './en';
import { updateTabBarLanguage } from './tabbar';

const STORAGE_KEY = 'mindapp_locale';
const messages = { zh, en };

// 获取初始化语言
const defaultLang = uni.getStorageSync(STORAGE_KEY) || 'zh';

// 创建 Vue 响应式状态
const i18nState = Vue.observable({
    currentLang: defaultLang
});

// 解析 "index.dailyReportTitle" 的深层对象值
function getValue(obj, path) {
    if (!obj || !path) return '';
    const keys = path.split('.');
    let res = obj;
    for (const k of keys) {
        if (res && typeof res === 'object' && k in res) {
            res = res[k];
        } else {
            return path; // 未匹配到返回 key 本身
        }
    }
    return res;
}

export const i18n = {
    get currentLang() {
        return i18nState.currentLang;
    },
    set currentLang(val) {
        i18nState.currentLang = val;
        uni.setStorageSync(STORAGE_KEY, val);
        updateTabBarLanguage(val);
        uni.$emit('localeChanged', val);
    },
    t(key) {
        const currentDict = messages[i18nState.currentLang] || messages.zh;
        return getValue(currentDict, key);
    },
    switchLang(targetLang) {
        const next = targetLang || (i18nState.currentLang === 'zh' ? 'en' : 'zh');
        this.currentLang = next;
        return next;
    }
};

export default i18n;
```

---

### 步骤二：在 main.js 中全局挂载 $t 与响应式对象

在 `frontend/main.js` 中全局挂载：
```javascript
import Vue from "vue";
import App from "./App";
import { router, RouterMount } from "@/nxTemp/router";
import store from "@/nxTemp/store";
import nxTemp from "@/nxTemp";
import uView from '@/uni_modules/uview-ui';

// 引入国际化支持
import i18n from '@/locale';

Vue.prototype.$t = function(key) {
    return i18n.t(key);
};
Vue.prototype.$i18n = i18n;

async function bootstrap() {
    App.mpType = "app";
    Vue.use(router);
    Vue.use(nxTemp);
    Vue.use(uView);

    const app = new Vue({
        store,
        ...App
    });
    // #ifdef H5
    RouterMount(app, router, "#app");
    // #endif
    // #ifndef H5
    app.$mount();
    // #endif
}

bootstrap();
```

---

### 步骤三：实现 TabBar 与页面标题动态双语联动刷新

在 `App.vue` 或各主页面的 `onShow()` 生命周期中执行：
```javascript
import { updateTabBarLanguage } from '@/locale/tabbar';

export default {
    onShow() {
        // 同步当前 TabBar 语言
        updateTabBarLanguage(this.$i18n.currentLang);
        // 动态设置当前页面 NavigationBarTitle
        uni.setNavigationBarTitle({
            title: this.$t('index.navTitle') // 当前页面对应的标题 key
        });
    }
}
```

---

### 步骤四：首页顶部右侧精美切换按钮实现

在 `frontend/pages/index/index.vue` 中植入切换按钮：

#### 1. Template 部分 (置于首页顶部区域)
```html
<template>
    <view class="index-page-container">
        <!-- 顶部右侧中英文一键切换胶囊按钮 -->
        <view class="lang-switch-capsule" @click="handleToggleLanguage" id="langSwitchBtn">
            <view class="lang-globe-wrap">
                <text class="lang-globe-icon">🌐</text>
            </view>
            <view class="lang-slider-bg" :class="currentLang">
                <view class="lang-option" :class="{ active: currentLang === 'zh' }">
                    <text class="lang-text">中</text>
                </view>
                <view class="lang-option" :class="{ active: currentLang === 'en' }">
                    <text class="lang-text">EN</text>
                </view>
                <!-- 滑动的指示高亮小胶囊 -->
                <view class="lang-active-pill" :style="{ transform: currentLang === 'en' ? 'translateX(100%)' : 'translateX(0)' }"></view>
            </view>
        </view>

        <!-- 现有首页内容... -->
        <div class="content-all2">
            <!-- ... -->
        </div>
    </view>
</template>
```

#### 2. Script 逻辑
```javascript
import i18n from '@/locale';
import { updateTabBarLanguage } from '@/locale/tabbar';

export default {
    data() {
        return {
            // ...
        };
    },
    computed: {
        currentLang() {
            return this.$i18n.currentLang;
        }
    },
    methods: {
        handleToggleLanguage() {
            const newLang = this.$i18n.switchLang();
            // 提示轻弹窗
            uni.showToast({
                title: newLang === 'zh' ? '已切换至简体中文' : 'Switched to English',
                icon: 'none',
                duration: 1500
            });
            // 刷新页面 Title 与 TabBar
            uni.setNavigationBarTitle({
                title: this.$t('index.navTitle')
            });
            updateTabBarLanguage(newLang);
        }
    },
    onShow() {
        updateTabBarLanguage(this.$i18n.currentLang);
        uni.setNavigationBarTitle({
            title: this.$t('index.navTitle')
        });
    }
};
```

#### 3. 唯美毛玻璃高质感 Style (SCSS/CSS)
```scss
/* 顶部右侧中英文切换胶囊按钮 */
.lang-switch-capsule {
    position: fixed;
    top: calc(12px + env(safe-area-inset-top));
    right: 14px;
    z-index: 9999;
    display: flex;
    align-items: center;
    padding: 3px 6px 3px 6px;
    background: rgba(255, 255, 255, 0.88);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    border: 1px solid rgba(255, 255, 255, 0.7);
    border-radius: 20px;
    box-shadow: 0 4px 14px rgba(94, 135, 197, 0.18), 0 1px 3px rgba(0, 0, 0, 0.04);
    cursor: pointer;
    user-select: none;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);

    &:active {
        transform: scale(0.94);
        box-shadow: 0 2px 8px rgba(94, 135, 197, 0.12);
    }

    .lang-globe-wrap {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 4px;

        .lang-globe-icon {
            font-size: 14px;
            opacity: 0.85;
            transition: transform 0.3s ease;
        }
    }

    .lang-slider-bg {
        position: relative;
        display: flex;
        align-items: center;
        width: 66px;
        height: 24px;
        background: rgba(226, 235, 248, 0.55);
        border-radius: 12px;
        padding: 2px;
        box-sizing: border-box;

        .lang-option {
            position: relative;
            z-index: 2;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            text-align: center;
            transition: color 0.25s ease;

            .lang-text {
                font-size: 11px;
                font-weight: 500;
                color: #72849a;
            }

            &.active .lang-text {
                color: #ffffff;
                font-weight: 600;
            }
        }

        .lang-active-pill {
            position: absolute;
            top: 2px;
            left: 2px;
            width: calc(50% - 2px);
            height: 20px;
            background: linear-gradient(135deg, #5E87C5 0%, #84DFF7 100%);
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(94, 135, 197, 0.35);
            transition: transform 0.28s cubic-bezier(0.34, 1.56, 0.64, 1);
            z-index: 1;
        }
    }
}
```

---

### 步骤五：四大核心页面代码国际化改造示例

#### 1. 首页 `pages/index/index.vue`
```html
<!-- 改造前 -->
<div class="qe-tag">每日填报</div>
<div class="qe-large-title">日常状态</div>
<div class="qe-large-desc">每日晚八点后提交1次</div>

<!-- 改造后 -->
<div class="qe-tag">{{ $t('index.quickEntryTag') }}</div>
<div class="qe-large-title">{{ $t('index.dailyReportTitle') }}</div>
<div class="qe-large-desc">{{ $t('index.dailyReportDesc') }}</div>
```

#### 2. AI评估 `pages/aiassess/aiassess.vue`
```html
<!-- 改造前 -->
<view class="tab-btn" :class="{ active: currentTab === 0 }" @click="switchTab(0)">🎨 画画</view>
<view class="tab-btn" :class="{ active: currentTab === 1 }" @click="switchTab(1)">📋 测评</view>
<view class="tab-btn" :class="{ active: currentTab === 2 }" @click="switchTab(2)">🧠 评估</view>

<!-- 改造后 -->
<view class="tab-btn" :class="{ active: currentTab === 0 }" @click="switchTab(0)">{{ $t('aiassess.tabDrawing') }}</view>
<view class="tab-btn" :class="{ active: currentTab === 1 }" @click="switchTab(1)">{{ $t('aiassess.tabTesting') }}</view>
<view class="tab-btn" :class="{ active: currentTab === 2 }" @click="switchTab(2)">{{ $t('aiassess.tabEvaluation') }}</view>

<view class="brush-handle">
    <text class="brush-text">{{ $t('aiassess.htpStartBtn') }}</text>
</view>
```

#### 3. 疗愈 `pages/heal/heal.vue`
```html
<!-- 改造前 -->
<text class="chat-banner-name">心晴</text>
<view class="chat-banner-tag">AI 心理助手</view>
<text class="chat-banner-online-text">在线</text>
<text class="chat-banner-desc">24h专业倾听，温暖陪伴，随时为你解忧 🌸</text>

<!-- 改造后 -->
<text class="chat-banner-name">{{ $t('heal.aiAssistantName') }}</text>
<view class="chat-banner-tag">{{ $t('heal.aiRoleTag') }}</view>
<text class="chat-banner-online-text">{{ $t('heal.online') }}</text>
<text class="chat-banner-desc">{{ $t('heal.chatBannerDesc') }}</text>
```

#### 4. 我的 `pages/mine/mine.vue`
```html
<!-- 改造前 -->
<div class="greet">用户：{{ userInfo.userName || "未登录" }}</div>
<div class="title">服务</div>
<div class="box-title">健康报告</div>
<div class="box-data"><span>查看综合健康评估报告</span></div>

<!-- 改造后 -->
<div class="greet">{{ $t('mine.userLabel') }}{{ userInfo.userName || $t('mine.notLoggedIn') }}</div>
<div class="title">{{ $t('mine.serviceTitle') }}</div>
<div class="box-title">{{ $t('mine.healthReportTitle') }}</div>
<div class="box-data"><span>{{ $t('mine.healthReportDesc') }}</span></div>
```

---

## 六、排版与长文本样式防御规范

由于英文单词长度通常较中文长 30% ~ 100%，需注意以下 CSS 样式调整：
1. **换行与截断**：
   ```css
   /* 防止长单词溢出卡片 */
   word-break: break-word;
   overflow-wrap: break-word;
   ```
2. **卡片标题弹性伸缩**：
   在 `.qe-large-title`、`.box-title` 等类中，建议将固定高度或字号稍作微调：
   ```css
   .qe-large-title {
       font-size: clamp(16px, 4vw, 20px);
       line-height: 1.25;
   }
   ```
3. **按钮内间距弹性自适应**：
   避免使用写死的绝对宽度，优先使用 `min-width` + `padding: 0 12px`。

---

## 七、测试用例与验证验收标准

| 序号 | 测试维度 | 测试操作 | 预期结果 |
|---|---|---|---|
| 1 | **UI/UX 显示** | 打开 H5 首页，检查右上角胶囊切换按钮 | 按钮居右、毛玻璃通透、图标与中英文字符显示清晰、无遮挡 |
| 2 | **一键切换** | 点击顶部胶囊按钮 | 触发微回弹动画，高亮指示胶囊平滑滑动到目标语言，弹出切换提示 Toast |
| 3 | **首页响应** | 观察首页快捷卡片与功能文案 | 文本即时由中文转换为英文，无页面闪烁或重刷 |
| 4 | **TabBar 联动** | 观察底部 4 个 TabBar 项目名称 | 底部【首页、AI评估、疗愈、我的】动态更新为【Home, AI Assessment, Healing, Profile】 |
| 5 | **跨页面一致性** | 切换至【AI评估】、【疗愈】、【我的】页面 | 页面内部标题、标签、卡片文案同步展示为英文 |
| 6 | **持久化保持** | 在英文状态下手动刷新浏览器 (F5) 或关闭重新打开 | 页面依然保持英文状态，本地 LocalStorage 正确保留 `mindapp_locale: 'en'` |
| 7 | **反向切换验证** | 再次点击切换回中文 | 全局所有界面顺畅还原为简体中文 |

---

## 八、总结与后续落地时间线建议

- **阶段一 (0.5 天)**：建立 `locale/` 语言包与响应式核心，完成 `main.js` 挂载与 TabBar 联动工具。
- **阶段二 (0.5 天)**：在 `pages/index/index.vue` 完成顶部毛玻璃胶囊切换按钮的布局与交互。
- **阶段三 (1.5 天)**：依次替换 4 大主页面及主要子组件的静态中文字符为 `$t()`。
- **阶段四 (0.5 天)**：英文长文本排版与样式走查，完成真机/H5 响应式适配验收。
