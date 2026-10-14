import os
import sys

base = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'

sections = [
    {
        'id': 'module_1',
        'title': '模块一：客户端主入口与全局多模态路由初始化 (main.js)',
        'file': os.path.join(base, 'frontend', 'main.js'),
        'part': '客户端多模态交互',
        'lines': 35
    },
    {
        'id': 'module_2',
        'title': '模块二：移动端生命周期管理与多端自适应状态保持 (App.vue)',
        'file': os.path.join(base, 'frontend', 'App.vue'),
        'part': '客户端多模态交互',
        'lines': 175
    },
    {
        'id': 'module_3',
        'title': '模块三：HTP房树人智能画布触控交互与AI特征提取 (aiassess.vue)',
        'file': os.path.join(base, 'frontend', 'pages', 'aiassess', 'aiassess.vue'),
        'part': '客户端多模态交互',
        'lines': 460
    },
    {
        'id': 'module_4',
        'title': '模块四：“心晴AI”24小时流式心理陪伴与共情对话交互 (heal.vue)',
        'file': os.path.join(base, 'frontend', 'pages', 'heal', 'heal.vue'),
        'part': '客户端多模态交互',
        'lines': 460
    },
    {
        'id': 'module_5',
        'title': '模块五：佳明智能手环客观生理指标多模态联动看板 (BraceletData.vue)',
        'file': os.path.join(base, 'frontend', 'pages', 'BraceletData', 'BraceletData.vue'),
        'part': '客户端多模态交互',
        'lines': 250
    },
    {
        'id': 'module_6',
        'title': '模块六：EMA生态瞬时情绪图谱与心情得分调节 (EMA.vue)',
        'file': os.path.join(base, 'frontend', 'pages', 'Emotion', 'EMA.vue'),
        'part': '客户端多模态交互',
        'lines': 120
    },
    {
        'id': 'module_7',
        'title': '模块七：AI大模型心理陪伴对话分析与Prompt工程服务 (AiChatAnalysisService.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'AiChatAnalysisService.java'),
        'part': '服务端多模态AI模型',
        'lines': 100
    },
    {
        'id': 'module_8',
        'title': '模块八：HTP房树人图像特征量化解析与心理投射评估服务 (HtpAnalysisService.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'HtpAnalysisService.java'),
        'part': '服务端多模态AI模型',
        'lines': 180
    },
    {
        'id': 'module_9',
        'title': '模块九：佳明手环客观生理指标拉取、清洗与时序模型 (GarminAnalysisService.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'GarminAnalysisService.java'),
        'part': '服务端多模态AI模型',
        'lines': 410
    },
    {
        'id': 'module_10',
        'title': '模块十：夜间血氧饱和度多模态分析与低氧风险预警 (SpO2Service.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'health', 'SpO2Service.java'),
        'part': '服务端多模态AI模型',
        'lines': 100
    },
    {
        'id': 'module_11',
        'title': '模块十一：专业心理量表算分引擎与临床风险等级预警 (ScaleAnalysisService.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'ScaleAnalysisService.java'),
        'part': '服务端多模态AI模型',
        'lines': 370
    },
    {
        'id': 'module_12',
        'title': '模块十二：情绪日记NLP文本情感极性提取与演变模型 (DiaryAnalysisService.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'DiaryAnalysisService.java'),
        'part': '服务端多模态AI模型',
        'lines': 80
    },
    {
        'id': 'module_13',
        'title': '模块十三：主客观多模态身心健康综合评估与雷达图模型 (HealthReportService.java)',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'HealthReportService.java'),
        'part': '服务端多模态AI模型',
        'lines': 95
    }
]

# Track lines exactly
current_line = 0
module_locations = []

for s in sections:
    start_line = current_line
    start_page = (start_line // 50) + 1
    # 4 lines of comment description + code lines
    desc_lines = 4
    total_sec_lines = desc_lines + s['lines']
    current_line += total_sec_lines
    module_locations.append({
        'id': s['id'],
        'title': s['title'],
        'part': s['part'],
        'start_line': start_line + 1,
        'start_page': start_page,
        'lines': total_sec_lines
    })

print(f"{'序号':<4} {'模块ID':<10} {'起始行':<8} {'页码':<6} {'模块名称'}")
for i, m in enumerate(module_locations, 1):
    print(f"{i:<4} {m['id']:<10} {m['start_line']:<8} 第{m['start_page']}页  {m['title']}")
print(f"Total lines: {current_line}")
