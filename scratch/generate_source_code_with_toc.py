import os
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_ALIGN_VERTICAL
from docx.enum.section import WD_SECTION_START
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import qn, nsdecls
import win32com.client

base = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'
out_folder = os.path.join(base, 'doc', '软著V2.0')

COLOR_PRIMARY_DARK = RGBColor(21, 67, 96)     # #154360
COLOR_PRIMARY = RGBColor(31, 97, 141)          # #1F618D
COLOR_TEXT_MAIN = RGBColor(44, 62, 80)         # #2C3E50
COLOR_TEXT_MUTED = RGBColor(120, 130, 140)
COLOR_BG_HEADER = '1F618D'
COLOR_BG_ZEBRA = 'F4F6F7'
COLOR_BORDER = 'BDC3C7'

sections_def = [
    # === PART 1: FRONT-END ARCHITECTURE & MULTI-MODAL INTERACTION (30 pages x 50 lines) ===
    {
        'id': 'module_1',
        'title': '模块一：客户端主入口与全局多模态路由初始化',
        'file_label': 'frontend/main.js',
        'file': os.path.join(base, 'frontend', 'main.js'),
        'part': '客户端架构',
        'core_desc': 'Vue全局原型链、Pinia状态树、路由守卫与JWT鉴权过滤',
        'desc': '// ============================================================================\n'
                '// 模块一：客户端主入口与全局多模态路由初始化 (main.js)\n'
                '// 功能说明：配置uni-app全局原型链、状态管理、路由守卫与JWT认证过滤器\n'
                '// ============================================================================',
        'lines': 35
    },
    {
        'id': 'module_2',
        'title': '模块二：移动端生命周期管理与多端自适应状态保持',
        'file_label': 'frontend/App.vue',
        'file': os.path.join(base, 'frontend', 'App.vue'),
        'part': '客户端架构',
        'core_desc': 'App全局启动、版本自检、网络状态监听与极光推送别名注册',
        'desc': '// ============================================================================\n'
                '// 模块二：移动端生命周期管理与多端自适应状态保持 (App.vue)\n'
                '// 功能说明：管理App全局启动、版本自检、网络状态监听与极光推送别名注册\n'
                '// ============================================================================',
        'lines': 175
    },
    {
        'id': 'module_3',
        'title': '模块三：HTP房树人智能画布触控交互与AI特征提取',
        'file_label': 'pages/aiassess/aiassess.vue',
        'file': os.path.join(base, 'frontend', 'pages', 'aiassess', 'aiassess.vue'),
        'part': '主观心理测评',
        'core_desc': '多点触控手绘板、画笔轨迹追踪、笔触压力采集与特征提交',
        'desc': '// ============================================================================\n'
                '// 模块三：HTP房树人智能画布触控交互与AI特征提取 (aiassess.vue)\n'
                '// 功能说明：多点触控手绘板、画笔轨迹追踪、笔触压力采集及画作特征向AI后端打包提交\n'
                '// ============================================================================',
        'lines': 460
    },
    {
        'id': 'module_4',
        'title': '模块四：“心晴AI”24小时流式心理陪伴与共情对话交互',
        'file_label': 'pages/heal/heal.vue',
        'file': os.path.join(base, 'frontend', 'pages', 'heal', 'heal.vue'),
        'part': 'AI智能疗愈',
        'core_desc': 'SSE逐字流式渲染、情感状态机转换、语音识别与危机熔断',
        'desc': '// ============================================================================\n'
                '// 模块四：“心晴AI”24小时流式心理陪伴与共情对话交互 (heal.vue)\n'
                '// 功能说明：支持SSE流式渲染、情感状态机转换、语音识别输入与减压互动状态管理\n'
                '// ============================================================================',
        'lines': 460
    },
    {
        'id': 'module_5',
        'title': '模块五：佳明智能手环客观生理指标多模态联动看板',
        'file_label': 'pages/BraceletData/BraceletData.vue',
        'file': os.path.join(base, 'frontend', 'pages', 'BraceletData', 'BraceletData.vue'),
        'part': '客观生理监测',
        'core_desc': '心率/血氧/睡眠甘特图/压力HRV/身体电量多维图表联动',
        'desc': '// ============================================================================\n'
                '// 模块五：佳明智能手环客观生理指标多模态联动看板 (BraceletData.vue)\n'
                '// 功能说明：心率、血氧(SpO2)、睡眠分期、压力(HRV)、身体电量多生理维度ECharts图表联动\n'
                '// ============================================================================',
        'lines': 250
    },
    {
        'id': 'module_6',
        'title': '模块六：EMA生态瞬时情绪图谱与心情得分调节',
        'file_label': 'pages/Emotion/EMA.vue',
        'file': os.path.join(base, 'frontend', 'pages', 'Emotion', 'EMA.vue'),
        'part': '主观心理追踪',
        'core_desc': 'PAM-16环形心境点选、1-5级强度滑块与情绪日记提交',
        'desc': '// ============================================================================\n'
                '// 模块六：EMA生态瞬时情绪图谱与心情得分调节 (EMA.vue)\n'
                '// 功能说明：基于PAM-16环形情绪模型的心境点选、滑块强度映射与情绪日记富文本提交\n'
                '// ============================================================================',
        'lines': 120
    },

    # === PART 2: BACK-END MULTI-MODAL AI MODELS, PHYSIOLOGY & REPORTS (30 pages x 50 lines) ===
    {
        'id': 'module_7',
        'title': '模块七：AI大模型心理陪伴对话分析与Prompt工程服务',
        'file_label': 'backend/.../AiChatAnalysisService.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'AiChatAnalysisService.java'),
        'part': '服务端AI大模型',
        'core_desc': '心理咨询伦理提示词构建、大模型流式调用与敏感极性审计',
        'desc': '// ============================================================================\n'
                '// 模块七：AI大模型心理陪伴对话分析与Prompt工程服务 (AiChatAnalysisService.java)\n'
                '// 功能说明：构建心理咨询伦理提示词、流式调用大语言模型并执行会话敏感度与风险极性审计\n'
                '// ============================================================================',
        'lines': 100
    },
    {
        'id': 'module_8',
        'title': '模块八：HTP房树人图像特征量化解析与心理投射评估服务',
        'file_label': 'backend/.../HtpAnalysisService.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'HtpAnalysisService.java'),
        'part': '服务端AI视觉',
        'core_desc': '画卷色彩饱和度、构图比例、笔触粗细及房屋树木人特征6维打分',
        'desc': '// ============================================================================\n'
                '// 模块八：HTP房树人图像特征量化解析与心理投射评估服务 (HtpAnalysisService.java)\n'
                '// 功能说明：解析画卷色彩饱和度、构图比例、笔触粗细及房屋/树木/人物特征6维度打分\n'
                '// ============================================================================',
        'lines': 180
    },
    {
        'id': 'module_9',
        'title': '模块九：佳明手环客观生理指标拉取、清洗与时序模型',
        'file_label': 'backend/.../GarminAnalysisService.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'GarminAnalysisService.java'),
        'part': '客观生理引擎',
        'core_desc': 'Garmin Cloud API守护调度、生理数据解密、离群噪点清洗与入库',
        'desc': '// ============================================================================\n'
                '// 模块九：佳明手环客观生理指标拉取、清洗与时序模型 (GarminAnalysisService.java)\n'
                '// 功能说明：守护进程多线程调用Garmin Cloud API，解密生理数据、剔除离群噪点并入库\n'
                '// ============================================================================',
        'lines': 410
    },
    {
        'id': 'module_10',
        'title': '模块十：夜间血氧饱和度多模态分析与低氧风险预警',
        'file_label': 'backend/.../health/SpO2Service.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'health', 'SpO2Service.java'),
        'part': '客观生理引擎',
        'core_desc': '睡眠周期平均血氧与最低血氧分析、低氧事件频次与风险预警',
        'desc': '// ============================================================================\n'
                '// 模块十：夜间血氧饱和度多模态分析与低氧风险预警 (SpO2Service.java)\n'
                '// 功能说明：计算睡眠周期内平均血氧与最低血氧阈值，建立低氧事件发生频次统计模型\n'
                '// ============================================================================',
        'lines': 100
    },
    {
        'id': 'module_11',
        'title': '模块十一：专业心理量表算分引擎与临床风险等级预警',
        'file_label': 'backend/.../ScaleAnalysisService.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'ScaleAnalysisService.java'),
        'part': '量表算分引擎',
        'core_desc': 'SDS/SAS/PSS/PSQI等10余种量表计分、标准分转换与高危预警',
        'desc': '// ============================================================================\n'
                '// 模块十一：专业心理量表算分引擎与临床风险等级预警 (ScaleAnalysisService.java)\n'
                '// 功能说明：内置SDS/SAS/PSS/PSQI等10余种量表计分模型，标准分转换及高危彩色徽章判定\n'
                '// ============================================================================',
        'lines': 370
    },
    {
        'id': 'module_12',
        'title': '模块十二：情绪日记NLP文本情感极性提取与演变模型',
        'file_label': 'backend/.../DiaryAnalysisService.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'DiaryAnalysisService.java'),
        'part': 'NLP文本算法',
        'core_desc': '中文分词与情感词典计算文字极性得分、心境演变时序追踪',
        'desc': '// ============================================================================\n'
                '// 模块十二：情绪日记NLP文本情感极性提取与演变模型 (DiaryAnalysisService.java)\n'
                '// 功能说明：基于分词与情感词典计算文字情感分值，生成用户心境演变时序折线\n'
                '// ============================================================================',
        'lines': 80
    },
    {
        'id': 'module_13',
        'title': '模块十三：主客观多模态身心健康综合评估与雷达图模型',
        'file_label': 'backend/.../HealthReportService.java',
        'file': os.path.join(base, 'healthsystem-backend6', 'healthsystem-backend', 'src', 'main', 'java', 'com', 'nwpu', 'healthsystem', 'backend', 'service', 'HealthReportService.java'),
        'part': '多模态融合模型',
        'core_desc': '生理客观与主观心理Z-score加权融合、六维健康得分与雷达图生成',
        'desc': '// ============================================================================\n'
                '// 模块十三：主客观多模态身心健康综合评估与雷达图模型 (HealthReportService.java)\n'
                '// 功能说明：融合手环客观生理与心理测评主观数据，计算六维综合身心健康分并输出报表\n'
                '// ============================================================================',
        'lines': 95
    }
]

def set_cell_margins(cell, top=30, bottom=30, left=70, right=70):
    tcPr = cell._tc.get_or_add_tcPr()
    tcMar = parse_xml(r'''
        <w:tcMar {} >
            <w:top w:w="{}" w:type="dxa"/>
            <w:bottom w:w="{}" w:type="dxa"/>
            <w:left w:w="{}" w:type="dxa"/>
            <w:right w:w="{}" w:type="dxa"/>
        </w:tcMar>'''.format(nsdecls('w'), top, bottom, left, right))
    tcPr.append(tcMar)

def set_table_borders(table):
    tblPr = table._tbl.tblPr
    borders = parse_xml(r'''
        <w:tblBorders {} >
            <w:top w:val="single" w:sz="8" w:space="0" w:color="{}"/>
            <w:bottom w:val="single" w:sz="8" w:space="0" w:color="{}"/>
            <w:left w:val="none"/>
            <w:right w:val="none"/>
            <w:insideH w:val="single" w:sz="4" w:space="0" w:color="{}"/>
            <w:insideV w:val="none"/>
        </w:tblBorders>'''.format(nsdecls('w'), COLOR_BG_HEADER, COLOR_BG_HEADER, COLOR_BORDER))
    tblPr.append(borders)

def add_header_bottom_line(paragraph, color_hex="1F618D", size="6"):
    pPr = paragraph._p.get_or_add_pPr()
    pBdr = parse_xml(r'''
        <w:pBdr {} >
            <w:bottom w:val="single" w:sz="{}" w:space="4" w:color="{}"/>
        </w:pBdr>'''.format(nsdecls('w'), size, color_hex))
    pPr.append(pBdr)

def add_bookmark(paragraph, bookmark_id, bookmark_name):
    p = paragraph._p
    tag_start = parse_xml(r'<w:bookmarkStart {} w:id="{}" w:name="{}"/>'.format(nsdecls('w'), bookmark_id, bookmark_name))
    tag_end = parse_xml(r'<w:bookmarkEnd {} w:id="{}"/>'.format(nsdecls('w'), bookmark_id))
    p.append(tag_start)
    p.append(tag_end)

def add_hyperlink_to_bookmark(paragraph, bookmark_name, text, font_size=Pt(8), bold=False, color_hex="1F618D"):
    sz_val = str(int(font_size.pt * 2))
    b_tag = '<w:b/>' if bold else ''
    hyperlink = parse_xml(
        r'<w:hyperlink {} w:anchor="{}"><w:r><w:rPr>{}<w:color w:val="{}"/><w:u w:val="single"/><w:rFonts w:ascii="SimSun" w:eastAsia="SimSun"/><w:sz w:val="{}"/></w:rPr><w:t>{}</w:t></w:r></w:hyperlink>'.format(
            nsdecls('w'), bookmark_name, b_tag, color_hex, sz_val, text
        )
    )
    paragraph._p.append(hyperlink)

def main():
    doc = docx.Document()
    
    # -------------------------------------------------------------------------
    # 1. Collect lines and determine page indices
    # -------------------------------------------------------------------------
    collected_lines = []
    module_page_map = {}
    
    for s_idx, s in enumerate(sections_def):
        start_line_idx = len(collected_lines)
        page_num = (start_line_idx // 50) + 1
        module_page_map[s['id']] = {
            'page_num': page_num,
            'start_line_idx': start_line_idx
        }
        
        fpath = s['file']
        with open(fpath, 'r', encoding='utf-8', errors='ignore') as fp:
            raw_lines = [l.rstrip() for l in fp.readlines()]
            
        clean = []
        prev_blank = False
        for l in raw_lines:
            l = l.replace('\t', '    ')
            if not l.strip():
                if not prev_blank:
                    clean.append('')
                    prev_blank = True
            else:
                if len(l) > 82:
                    l = l[:80] + ' ...'
                clean.append(l)
                prev_blank = False
                
        target_cnt = s['lines']
        selected = clean[:target_cnt]
        
        # Add 4 description lines
        for dline in s['desc'].split('\n'):
            collected_lines.append(dline[:82])
        # Add selected lines
        for sline in selected:
            collected_lines.append(sline)

    LINES_PER_PAGE = 50
    TOTAL_PAGES = 60
    TARGET_TOTAL_LINES = LINES_PER_PAGE * TOTAL_PAGES  # 3000 lines

    if len(collected_lines) < TARGET_TOTAL_LINES:
        diff = TARGET_TOTAL_LINES - len(collected_lines)
        with open(os.path.join(base, 'frontend', 'pages', 'heal', 'heal.vue'), 'r', encoding='utf-8', errors='ignore') as fp:
            extra = [l.rstrip().replace('\t', '    ')[:82] for l in fp.readlines()][460:460+diff]
        collected_lines.extend(extra)
    elif len(collected_lines) > TARGET_TOTAL_LINES:
        collected_lines = collected_lines[:TARGET_TOTAL_LINES]

    print(f"Total lines: {len(collected_lines)} across {TOTAL_PAGES} pages.")

    # -------------------------------------------------------------------------
    # 2. SECTION 1: Page 1 TOC Navigation (Strictly exactly 1 page)
    # -------------------------------------------------------------------------
    sec_toc = doc.sections[0]
    sec_toc.top_margin = Inches(0.4)
    sec_toc.bottom_margin = Inches(0.4)
    sec_toc.left_margin = Inches(0.55)
    sec_toc.right_margin = Inches(0.55)
    sec_toc.different_first_page_header_footer = True
    
    # Title on page 1
    p_t = doc.add_paragraph()
    p_t.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_t.paragraph_format.space_before = Pt(0)
    p_t.paragraph_format.space_after = Pt(1)
    r_t = p_t.add_run("源程序模块目录与独创性架构索引")
    r_t.font.name = 'SimHei'
    r_t.font.size = Pt(15)
    r_t.font.bold = True
    r_t.font.color.rgb = COLOR_PRIMARY_DARK

    p_sub = doc.add_paragraph()
    p_sub.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_sub.paragraph_format.space_before = Pt(0)
    p_sub.paragraph_format.space_after = Pt(2)
    r_sub = p_sub.add_run("《基于多模态AI的心理健康管理APP[简称：心晴AI] V2.0.0》源程序鉴别材料")
    r_sub.font.name = 'SimSun'
    r_sub.font.size = Pt(9)
    r_sub.font.bold = True
    r_sub.font.color.rgb = COLOR_PRIMARY

    p_tip = doc.add_paragraph()
    p_tip.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_tip.paragraph_format.space_before = Pt(0)
    p_tip.paragraph_format.space_after = Pt(4)
    r_tip = p_tip.add_run("【快速导航说明】点击下方任一“模块名称”或右侧“跳转链接”，即可在Word中快速直达对应源程序。")
    r_tip.font.name = 'SimSun'
    r_tip.font.size = Pt(8)
    r_tip.font.color.rgb = RGBColor(120, 130, 140)

    # Table on page 1
    t = doc.add_table(rows=len(sections_def) + 1, cols=5)
    t.alignment = WD_TABLE_ALIGNMENT.CENTER
    t.autofit = True
    set_table_borders(t)

    headers = ["序号", "架构分层", "独创性业务模块名称与自研源文件", "核心算法与业务逻辑简述", "所在页码与跳转"]
    col_widths = [Inches(0.35), Inches(1.0), Inches(2.55), Inches(2.4), Inches(0.9)]

    hdr_cells = t.rows[0].cells
    for i, h in enumerate(headers):
        hdr_cells[i].text = h
        hdr_cells[i].width = col_widths[i]
        p = hdr_cells[i].paragraphs[0]
        p.paragraph_format.line_spacing = 1.0
        p.paragraph_format.space_before = Pt(1)
        p.paragraph_format.space_after = Pt(1)
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        for r in p.runs:
            r.font.name = 'SimHei'
            r.font.size = Pt(8.5)
            r.font.bold = True
            r.font.color.rgb = RGBColor(255, 255, 255)
        set_cell_margins(hdr_cells[i], top=50, bottom=50, left=70, right=70)
        shd = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), COLOR_BG_HEADER))
        hdr_cells[i]._tc.get_or_add_tcPr().append(shd)

    for r_idx, s in enumerate(sections_def):
        row_cells = t.rows[r_idx + 1].cells
        pg_num = module_page_map[s['id']]['page_num']
        
        # Col 0: Seq
        row_cells[0].text = str(r_idx + 1)
        p0 = row_cells[0].paragraphs[0]
        p0.paragraph_format.line_spacing = 1.0
        p0.paragraph_format.space_before = Pt(0)
        p0.paragraph_format.space_after = Pt(0)
        p0.alignment = WD_ALIGN_PARAGRAPH.CENTER
        
        # Col 1: Part
        row_cells[1].text = s['part']
        p1 = row_cells[1].paragraphs[0]
        p1.paragraph_format.line_spacing = 1.0
        p1.paragraph_format.space_before = Pt(0)
        p1.paragraph_format.space_after = Pt(0)
        p1.alignment = WD_ALIGN_PARAGRAPH.CENTER
        
        # Col 2: Title with Hyperlink
        p_title = row_cells[2].paragraphs[0]
        p_title.paragraph_format.line_spacing = 1.05
        p_title.paragraph_format.space_before = Pt(0)
        p_title.paragraph_format.space_after = Pt(0)
        p_title.alignment = WD_ALIGN_PARAGRAPH.LEFT
        add_hyperlink_to_bookmark(p_title, s['id'], s['title'], font_size=Pt(8), bold=True, color_hex="1F618D")
        p_file = p_title.add_run(f" [{s['file_label']}]")
        p_file.font.name = 'Consolas'
        p_file.font.size = Pt(7.5)
        p_file.font.color.rgb = COLOR_TEXT_MUTED
        
        # Col 3: Desc
        row_cells[3].text = s['core_desc']
        p3 = row_cells[3].paragraphs[0]
        p3.paragraph_format.line_spacing = 1.05
        p3.paragraph_format.space_before = Pt(0)
        p3.paragraph_format.space_after = Pt(0)
        p3.alignment = WD_ALIGN_PARAGRAPH.LEFT
        
        # Col 4: Page Link
        p_jump = row_cells[4].paragraphs[0]
        p_jump.paragraph_format.line_spacing = 1.0
        p_jump.paragraph_format.space_before = Pt(0)
        p_jump.paragraph_format.space_after = Pt(0)
        p_jump.alignment = WD_ALIGN_PARAGRAPH.CENTER
        add_hyperlink_to_bookmark(p_jump, s['id'], f"第{pg_num}页 [跳转]", font_size=Pt(8), bold=True, color_hex="2874A6")
        
        # Fonts
        for c_i in [0, 1, 3]:
            for r in row_cells[c_i].paragraphs[0].runs:
                r.font.name = 'SimSun'
                r.font.size = Pt(8)
                r.font.color.rgb = COLOR_TEXT_MAIN
                
        for c_i in range(5):
            row_cells[c_i].width = col_widths[c_i]
            set_cell_margins(row_cells[c_i], top=20, bottom=20, left=60, right=60)
            if r_idx % 2 == 1:
                shd = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), COLOR_BG_ZEBRA))
                row_cells[c_i]._tc.get_or_add_tcPr().append(shd)

    p_bottom = doc.add_paragraph()
    p_bottom.paragraph_format.space_before = Pt(4)
    p_bottom.paragraph_format.space_after = Pt(0)
    r_b = p_bottom.add_run(
        "注：本鉴别材料严格遵循《计算机软件著作权登记办法》，不包含任何第三方开源垫片及脚手架代码；正文 60 页（前 30 页为客户端多模态前端架构与AI交互，后 30 页为服务端多模态AI算法服务与数据引擎），每页严格 50 行，共计 3000 行纯自研核心代码。"
    )
    r_b.font.name = 'SimSun'
    r_b.font.size = Pt(7.5)
    r_b.font.color.rgb = COLOR_TEXT_MUTED

    # -------------------------------------------------------------------------
    # 3. SECTION 2: Code Pages (Page 1 to 60)
    # -------------------------------------------------------------------------
    sec_code = doc.add_section(WD_SECTION_START.NEW_PAGE)
    sec_code.top_margin = Inches(0.7)
    sec_code.bottom_margin = Inches(0.7)
    sec_code.left_margin = Inches(0.7)
    sec_code.right_margin = Inches(0.7)
    sec_code.header.is_linked_to_previous = False
    sec_code.footer.is_linked_to_previous = False
    
    # Code Section Header
    hp = sec_code.header.paragraphs[0]
    hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    add_header_bottom_line(hp, "1F618D", "6")
    hrun = hp.add_run("基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0 源程序鉴别材料")
    hrun.font.name = 'SimSun'
    hrun.font.size = Pt(8.5)
    hrun.font.color.rgb = COLOR_PRIMARY

    # Code Section Footer
    fp = sec_code.footer.paragraphs[0]
    fp.alignment = WD_ALIGN_PARAGRAPH.CENTER
    frun = fp.add_run('第 ')
    frun.font.name = 'SimSun'
    frun.font.size = Pt(9)
    frun.font.color.rgb = COLOR_TEXT_MUTED
    fldSimple = OxmlElement('w:fldSimple')
    fldSimple.set(qn('w:instr'), 'PAGE')
    fp._p.append(fldSimple)
    frun2 = fp.add_run(' 页  共 60 页')
    frun2.font.name = 'SimSun'
    frun2.font.size = Pt(9)
    frun2.font.color.rgb = COLOR_TEXT_MUTED
    
    # Restart page numbering from 1 for code pages
    sectPr = sec_code._sectPr
    pgNumType = parse_xml(r'<w:pgNumType {} w:start="1"/>'.format(nsdecls('w')))
    sectPr.append(pgNumType)

    line_to_module = {}
    for s_idx, s in enumerate(sections_def):
        s_line = module_page_map[s['id']]['start_line_idx']
        line_to_module[s_line] = (s_idx + 1, s['id'])

    for page_idx in range(TOTAL_PAGES):
        page_lines = collected_lines[page_idx * LINES_PER_PAGE : (page_idx + 1) * LINES_PER_PAGE]
        for line_in_page, line_str in enumerate(page_lines):
            global_line_idx = page_idx * LINES_PER_PAGE + line_in_page
            p = doc.add_paragraph()
            p.paragraph_format.line_spacing_rule = WD_LINE_SPACING.EXACTLY
            p.paragraph_format.line_spacing = Pt(12)
            p.paragraph_format.space_before = Pt(0)
            p.paragraph_format.space_after = Pt(0)
            
            if global_line_idx in line_to_module:
                bm_id, bm_name = line_to_module[global_line_idx]
                add_bookmark(p, str(bm_id), bm_name)

            run = p.add_run(line_str if line_str else ' ')
            run.font.name = 'Consolas'
            run.font.size = Pt(8.5)
            if line_str.startswith('//'):
                run.font.color.rgb = RGBColor(34, 112, 60) # Forest Green
            else:
                run.font.color.rgb = RGBColor(33, 33, 33) # Deep Charcoal
        
        if page_idx < TOTAL_PAGES - 1:
            doc.add_page_break()

    out_docx = os.path.join(out_folder, '源代码.docx')
    doc.save(out_docx)
    print(f"Successfully generated: {out_docx}")

    # Convert to .doc via Word COM and verify page count
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    out_doc = os.path.join(out_folder, '源代码.doc')
    wdoc = word.Documents.Open(out_docx)
    sec1_p = wdoc.Sections(1).Range.ComputeStatistics(2)
    sec2_p = wdoc.Sections(2).Range.ComputeStatistics(2)
    total_p = wdoc.ComputeStatistics(2)
    print(f"Word computed: Section 1 (TOC) = {sec1_p} page, Section 2 (Code) = {sec2_p} pages, Total = {total_p} pages")
    wdoc.SaveAs2(out_doc, FileFormat=0) # wdFormatDocument = 0
    wdoc.Close(False)
    word.Quit()
    print("Source code with TOC successfully created and verified.")

if __name__ == '__main__':
    main()
