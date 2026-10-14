import os
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.oxml import OxmlElement
from docx.oxml.ns import qn

base = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'
out_folder = os.path.join(base, 'doc', '软著V2.0')

sections = [
    # === PART 1: FRONT-END ARCHITECTURE & MULTI-MODAL INTERACTION (Target 1500 lines, exactly 30 pages x 50 lines) ===
    {
        'file': os.path.join(base, 'frontend', 'main.js'),
        'desc': '// ============================================================================\n'
                '// 模块一：客户端主入口与全局多模态路由初始化 (main.js)\n'
                '// 功能说明：配置uni-app全局原型链、状态管理、路由守卫与JWT认证过滤器\n'
                '// ============================================================================',
        'lines': 35
    },
    {
        'file': os.path.join(base, 'frontend', 'App.vue'),
        'desc': '// ============================================================================\n'
                '// 模块二：移动端生命周期管理与多端自适应状态保持 (App.vue)\n'
                '// 功能说明：管理App全局启动、版本自检、网络状态监听与极光推送别名注册\n'
                '// ============================================================================',
        'lines': 175
    },
    {
        'file': os.path.join(base, 'frontend', 'pages', 'aiassess', 'aiassess.vue'),
        'desc': '// ============================================================================\n'
                '// 模块三：HTP房树人智能画布触控交互与AI特征提取 (aiassess.vue)\n'
                '// 功能说明：多点触控手绘板、画笔轨迹追踪、笔触压力采集及画作特征向AI后端打包提交\n'
                '// ============================================================================',
        'lines': 460
    },
    {
        'file': os.path.join(base, 'frontend', 'pages', 'heal', 'heal.vue'),
        'desc': '// ============================================================================\n'
                '// 模块四：“心晴AI”24小时流式心理陪伴与共情对话交互 (heal.vue)\n'
                '// 功能说明：支持SSE流式渲染、情感状态机转换、语音识别输入与减压互动状态管理\n'
                '// ============================================================================',
        'lines': 460
    },
    {
        'file': os.path.join(base, 'frontend', 'pages', 'BraceletData', 'BraceletData.vue'),
        'desc': '// ============================================================================\n'
                '// 模块五：佳明智能手环客观生理指标多模态联动看板 (BraceletData.vue)\n'
                '// 功能说明：心率、血氧(SpO2)、睡眠分期、压力(HRV)、身体电量多生理维度ECharts图表联动\n'
                '// ============================================================================',
        'lines': 250
    },
    {
        'file': os.path.join(base, 'frontend', 'pages', 'Emotion', 'EMA.vue'),
        'desc': '// ============================================================================\n'
                '// 模块六：EMA生态瞬时情绪图谱与心情得分调节 (EMA.vue)\n'
                '// 功能说明：基于PAM-16环形情绪模型的心境点选、滑块强度映射与情绪日记富文本提交\n'
                '// ============================================================================',
        'lines': 120
    },

    # === PART 2: BACK-END MULTI-MODAL AI MODELS, PHYSIOLOGY & REPORTS (Target 1500 lines, exactly 30 pages x 50 lines) ===
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'AiChatAnalysisService.java'),
        'desc': '// ============================================================================\n'
                '// 模块七：AI大模型心理陪伴对话分析与Prompt工程服务 (AiChatAnalysisService.java)\n'
                '// 功能说明：构建心理咨询伦理提示词、流式调用大语言模型并执行会话敏感度与风险极性审计\n'
                '// ============================================================================',
        'lines': 100
    },
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'HtpAnalysisService.java'),
        'desc': '// ============================================================================\n'
                '// 模块八：HTP房树人图像特征量化解析与心理投射评估服务 (HtpAnalysisService.java)\n'
                '// 功能说明：解析画卷色彩饱和度、构图比例、笔触粗细及房屋/树木/人物特征6维度打分\n'
                '// ============================================================================',
        'lines': 180
    },
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'GarminAnalysisService.java'),
        'desc': '// ============================================================================\n'
                '// 模块九：佳明手环客观生理指标拉取、清洗与时序模型 (GarminAnalysisService.java)\n'
                '// 功能说明：守护进程多线程调用Garmin Cloud API，解密生理数据、剔除离群噪点并入库\n'
                '// ============================================================================',
        'lines': 410
    },
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'health', 'SpO2Service.java'),
        'desc': '// ============================================================================\n'
                '// 模块十：夜间血氧饱和度多模态分析与低氧风险预警 (SpO2Service.java)\n'
                '// 功能说明：计算睡眠周期内平均血氧与最低血氧阈值，建立低氧事件发生频次统计模型\n'
                '// ============================================================================',
        'lines': 100
    },
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'ScaleAnalysisService.java'),
        'desc': '// ============================================================================\n'
                '// 模块十一：专业心理量表算分引擎与临床风险等级预警 (ScaleAnalysisService.java)\n'
                '// 功能说明：内置SDS/SAS/PSS/PSQI等10余种量表计分模型，标准分转换及高危彩色徽章判定\n'
                '// ============================================================================',
        'lines': 370
    },
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'DiaryAnalysisService.java'),
        'desc': '// ============================================================================\n'
                '// 模块十二：情绪日记NLP文本情感极性提取与演变模型 (DiaryAnalysisService.java)\n'
                '// 功能说明：基于分词与情感词典计算文字情感分值，生成用户心境演变时序折线\n'
                '// ============================================================================',
        'lines': 80
    },
    {
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'HealthReportService.java'),
        'desc': '// ============================================================================\n'
                '// 模块十三：主客观多模态身心健康综合评估与雷达图模型 (HealthReportService.java)\n'
                '// 功能说明：融合手环客观生理与心理测评主观数据，计算六维综合身心健康分并输出报表\n'
                '// ============================================================================',
        'lines': 95
    }
]

def add_header_footer(doc, title_text):
    for section in doc.sections:
        section.top_margin = Inches(0.7)
        section.bottom_margin = Inches(0.7)
        section.left_margin = Inches(0.7)
        section.right_margin = Inches(0.7)
        
        # Header
        header = section.header
        hp = header.paragraphs[0]
        hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
        hrun = hp.add_run(title_text)
        hrun.font.name = 'SimSun'
        hrun.font.size = Pt(8.5)
        hrun.font.color.rgb = RGBColor(128, 128, 128)
        
        # Footer
        footer = section.footer
        fp = footer.paragraphs[0]
        fp.alignment = WD_ALIGN_PARAGRAPH.CENTER
        frun = fp.add_run('第 ')
        frun.font.name = 'SimSun'
        frun.font.size = Pt(9)
        frun.font.color.rgb = RGBColor(100, 100, 100)
        
        fldSimple = OxmlElement('w:fldSimple')
        fldSimple.set(qn('w:instr'), 'PAGE')
        fp._p.append(fldSimple)
        
        frun2 = fp.add_run(' 页  共 60 页')
        frun2.font.name = 'SimSun'
        frun2.font.size = Pt(9)
        frun2.font.color.rgb = RGBColor(100, 100, 100)

def main():
    doc = docx.Document()
    app_title = "基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0 源程序鉴别材料"
    add_header_footer(doc, app_title)

    # Collect code lines
    collected_lines = []
    for s in sections:
        fpath = s['file']
        with open(fpath, 'r', encoding='utf-8', errors='ignore') as fp:
            raw_lines = [l.rstrip() for l in fp.readlines()]
            
        clean = []
        prev_blank = False
        for l in raw_lines:
            # Replace tab with 4 spaces
            l = l.replace('\t', '    ')
            if not l.strip():
                if not prev_blank:
                    clean.append('')
                    prev_blank = True
            else:
                # Truncate lines longer than 82 chars to strictly prevent line wrapping
                if len(l) > 82:
                    l = l[:80] + ' ...'
                clean.append(l)
                prev_blank = False
                
        target_cnt = s['lines']
        selected = clean[:target_cnt]
        
        for dline in s['desc'].split('\n'):
            collected_lines.append(dline[:82])
        for sline in selected:
            collected_lines.append(sline)

    LINES_PER_PAGE = 50
    TOTAL_PAGES = 60
    TARGET_TOTAL_LINES = LINES_PER_PAGE * TOTAL_PAGES  # Exactly 3000 lines

    if len(collected_lines) < TARGET_TOTAL_LINES:
        diff = TARGET_TOTAL_LINES - len(collected_lines)
        with open(os.path.join(base, 'frontend', 'pages', 'heal', 'heal.vue'), 'r', encoding='utf-8', errors='ignore') as fp:
            extra = [l.rstrip().replace('\t', '    ')[:82] for l in fp.readlines()][460:460+diff]
        collected_lines.extend(extra)
    elif len(collected_lines) > TARGET_TOTAL_LINES:
        collected_lines = collected_lines[:TARGET_TOTAL_LINES]

    print(f"Final total lines formatted: {len(collected_lines)}")

    for page_idx in range(TOTAL_PAGES):
        page_lines = collected_lines[page_idx * LINES_PER_PAGE : (page_idx + 1) * LINES_PER_PAGE]
        for line_str in page_lines:
            p = doc.add_paragraph()
            p.paragraph_format.line_spacing_rule = WD_LINE_SPACING.EXACTLY
            p.paragraph_format.line_spacing = Pt(12)
            p.paragraph_format.space_before = Pt(0)
            p.paragraph_format.space_after = Pt(0)
            run = p.add_run(line_str if line_str else ' ')
            run.font.name = 'Consolas'
            run.font.size = Pt(8.5)
            if line_str.startswith('//'):
                run.font.color.rgb = RGBColor(0, 128, 0)
        
        if page_idx < TOTAL_PAGES - 1:
            doc.add_page_break()

    out_docx = os.path.join(out_folder, '源代码.docx')
    doc.save(out_docx)
    print(f"Successfully saved {out_docx}")

    # Convert to .doc via Word COM
    import win32com.client
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    out_doc = os.path.join(out_folder, '源代码.doc')
    wdoc = word.Documents.Open(out_docx)
    page_count = wdoc.ComputeStatistics(2)
    print(f"Word computed page count: {page_count}")
    wdoc.SaveAs2(out_doc, FileFormat=0) # wdFormatDocument = 0
    wdoc.Close(False)
    word.Quit()
    print(f"Successfully saved legacy {out_doc} with exact pages: {page_count}")

if __name__ == '__main__':
    main()
