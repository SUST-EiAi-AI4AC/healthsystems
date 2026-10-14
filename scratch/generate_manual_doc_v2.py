import os
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_ALIGN_VERTICAL
from docx.enum.section import WD_SECTION_START
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import qn, nsdecls

base = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'
out_folder = os.path.join(base, 'doc', '软著V2.0')
img_folder = os.path.join(out_folder, 'extracted_images')
crop_folder = os.path.join(img_folder, 'cropped')

COLOR_PRIMARY_DARK = RGBColor(21, 67, 96)     # #154360 Deep Navy
COLOR_PRIMARY = RGBColor(31, 97, 141)          # #1F618D Classic Blue
COLOR_SECONDARY = RGBColor(40, 116, 166)       # #2874A6
COLOR_TEXT_MAIN = RGBColor(44, 62, 80)         # #2C3E50 Dark Slate
COLOR_TEXT_MUTED = RGBColor(100, 110, 120)     # Muted Gray
COLOR_BG_HEADER = '1F618D'
COLOR_BG_ZEBRA = 'F4F6F7'
COLOR_BORDER = 'BDC3C7'

def set_cell_margins(cell, top=120, bottom=120, left=160, right=160):
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

def add_heading1(doc, text):
    p = doc.add_paragraph()
    p.paragraph_format.space_before = Pt(18)
    p.paragraph_format.space_after = Pt(8)
    p.paragraph_format.keep_with_next = True
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run.font.size = Pt(15.5)
    run.font.bold = True
    run.font.color.rgb = COLOR_PRIMARY_DARK

def add_heading2(doc, text):
    p = doc.add_paragraph()
    p.paragraph_format.space_before = Pt(13)
    p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.keep_with_next = True
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run.font.size = Pt(13)
    run.font.bold = True
    run.font.color.rgb = COLOR_PRIMARY

def add_heading3(doc, text):
    p = doc.add_paragraph()
    p.paragraph_format.space_before = Pt(9)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.keep_with_next = True
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run.font.size = Pt(11)
    run.font.bold = True
    run.font.color.rgb = COLOR_SECONDARY

def add_body(doc, text, bold_prefix=None):
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.35
    p.paragraph_format.space_before = Pt(0)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.first_line_indent = Pt(21) # 2 Chinese chars indent
    if bold_prefix:
        r_pre = p.add_run(bold_prefix)
        r_pre.font.name = 'SimSun'
        r_pre.font.size = Pt(10.5)
        r_pre.font.bold = True
        r_pre.font.color.rgb = RGBColor(20, 20, 20)
    run = p.add_run(text)
    run.font.name = 'SimSun'
    run.font.size = Pt(10.5)
    run.font.color.rgb = COLOR_TEXT_MAIN
    return p

def add_bullet(doc, text, bold_prefix=None):
    p = doc.add_paragraph(style='List Bullet')
    p.paragraph_format.line_spacing = 1.3
    p.paragraph_format.space_before = Pt(1)
    p.paragraph_format.space_after = Pt(2)
    p.paragraph_format.left_indent = Inches(0.3)
    if bold_prefix:
        r_pre = p.add_run(bold_prefix)
        r_pre.font.name = 'SimSun'
        r_pre.font.size = Pt(10)
        r_pre.font.bold = True
        r_pre.font.color.rgb = COLOR_PRIMARY_DARK
    run = p.add_run(text)
    run.font.name = 'SimSun'
    run.font.size = Pt(10)
    run.font.color.rgb = COLOR_TEXT_MAIN

def add_callout(doc, text, bold_title="【规范指引与系统说明】"):
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.3
    p.paragraph_format.space_before = Pt(6)
    p.paragraph_format.space_after = Pt(8)
    p.paragraph_format.left_indent = Inches(0.2)
    p.paragraph_format.right_indent = Inches(0.2)
    
    pPr = p._p.get_or_add_pPr()
    callout_xml = parse_xml(r'''
        <w:pBdr {} >
            <w:left w:val="single" w:sz="24" w:space="8" w:color="1F618D"/>
            <w:top w:val="none"/>
            <w:right w:val="none"/>
            <w:bottom w:val="none"/>
        </w:pBdr>'''.format(nsdecls('w')))
    shd_xml = parse_xml(r'<w:shd {} w:fill="EBF5FB"/>'.format(nsdecls('w')))
    pPr.append(callout_xml)
    pPr.append(shd_xml)
    
    r_t = p.add_run(bold_title + "\n")
    r_t.font.name = 'SimHei'
    r_t.font.size = Pt(10)
    r_t.font.bold = True
    r_t.font.color.rgb = COLOR_PRIMARY_DARK
    
    r_c = p.add_run(text)
    r_c.font.name = 'SimSun'
    r_c.font.size = Pt(9.5)
    r_c.font.color.rgb = COLOR_TEXT_MAIN

def add_image_figure(doc, img_path, caption, width=Inches(5.2)):
    if os.path.exists(img_path):
        p_img = doc.add_paragraph()
        p_img.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_img.paragraph_format.space_before = Pt(8)
        p_img.paragraph_format.space_after = Pt(3)
        run_img = p_img.add_run()
        run_img.add_picture(img_path, width=width)
        
        p_cap = doc.add_paragraph()
        p_cap.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_cap.paragraph_format.space_before = Pt(2)
        p_cap.paragraph_format.space_after = Pt(10)
        run_cap = p_cap.add_run(caption)
        run_cap.font.name = 'SimHei'
        run_cap.font.size = Pt(9.5)
        run_cap.font.bold = True
        run_cap.font.color.rgb = RGBColor(70, 70, 70)
    else:
        print(f"Warning: image missing: {img_path}")

def add_table_data(doc, table_caption, headers, data):
    p_cap = doc.add_paragraph()
    p_cap.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_cap.paragraph_format.space_before = Pt(8)
    p_cap.paragraph_format.space_after = Pt(4)
    run_cap = p_cap.add_run(table_caption)
    run_cap.font.name = 'SimHei'
    run_cap.font.size = Pt(9.5)
    run_cap.font.bold = True
    run_cap.font.color.rgb = COLOR_PRIMARY_DARK
    
    t = doc.add_table(rows=len(data) + 1, cols=len(headers))
    t.alignment = WD_TABLE_ALIGNMENT.CENTER
    t.autofit = True
    set_table_borders(t)
    
    hdr_cells = t.rows[0].cells
    for i, h in enumerate(headers):
        hdr_cells[i].text = h
        p = hdr_cells[i].paragraphs[0]
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        for r in p.runs:
            r.font.name = 'SimHei'
            r.font.size = Pt(9.5)
            r.font.bold = True
            r.font.color.rgb = RGBColor(255, 255, 255)
        set_cell_margins(hdr_cells[i], top=140, bottom=140, left=180, right=180)
        shd = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), COLOR_BG_HEADER))
        hdr_cells[i]._tc.get_or_add_tcPr().append(shd)
        
    for r_idx, row in enumerate(data):
        row_cells = t.rows[r_idx + 1].cells
        for c_idx, val in enumerate(row):
            row_cells[c_idx].text = val
            p = row_cells[c_idx].paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.LEFT if c_idx > 1 else WD_ALIGN_PARAGRAPH.CENTER
            for r in p.runs:
                r.font.name = 'SimSun'
                r.font.size = Pt(9)
                r.font.color.rgb = COLOR_TEXT_MAIN
            set_cell_margins(row_cells[c_idx], top=100, bottom=100, left=160, right=160)
            if r_idx % 2 == 1:
                shd = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), COLOR_BG_ZEBRA))
                row_cells[c_idx]._tc.get_or_add_tcPr().append(shd)
                
    doc.add_paragraph().paragraph_format.space_after = Pt(6)

def build_manual_v2():
    doc = docx.Document()
    
    # =========================================================================
    # SECTION 1: COVER PAGE
    # =========================================================================
    sec_cover = doc.sections[0]
    sec_cover.top_margin = Inches(1.2)
    sec_cover.bottom_margin = Inches(1.2)
    sec_cover.left_margin = Inches(1.2)
    sec_cover.right_margin = Inches(1.2)
    sec_cover.different_first_page_header_footer = True
    
    # Top decorative line
    p_dec = doc.add_paragraph()
    p_dec.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_dec.paragraph_format.space_before = Pt(30)
    p_dec.paragraph_format.space_after = Pt(20)
    r_dec = p_dec.add_run("—" * 28)
    r_dec.font.color.rgb = COLOR_PRIMARY
    
    # Title
    p_t = doc.add_paragraph()
    p_t.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_t.paragraph_format.space_before = Pt(10)
    p_t.paragraph_format.space_after = Pt(8)
    r_t = p_t.add_run("基于多模态AI的心理健康管理APP\n[简称：心晴AI] V2.0.0")
    r_t.font.name = 'SimHei'
    r_t.font.size = Pt(22)
    r_t.font.bold = True
    r_t.font.color.rgb = COLOR_PRIMARY_DARK
    
    # Subtitle
    p_sub = doc.add_paragraph()
    p_sub.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_sub.paragraph_format.space_before = Pt(6)
    p_sub.paragraph_format.space_after = Pt(6)
    r_sub = p_sub.add_run("软 件 操 作 说 明 书")
    r_sub.font.name = 'SimHei'
    r_sub.font.size = Pt(16)
    r_sub.font.bold = True
    r_sub.font.color.rgb = COLOR_PRIMARY
    
    p_en = doc.add_paragraph()
    p_en.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_en.paragraph_format.space_before = Pt(0)
    p_en.paragraph_format.space_after = Pt(60)
    r_en = p_en.add_run("User Operation & Technical Specification Manual")
    r_en.font.name = 'Calibri'
    r_en.font.size = Pt(11)
    r_en.font.color.rgb = COLOR_TEXT_MUTED

    # Meta card table on cover
    t_meta = doc.add_table(rows=6, cols=2)
    t_meta.alignment = WD_TABLE_ALIGNMENT.CENTER
    t_meta.autofit = True
    meta_info = [
        ("软件全称", "基于多模态AI的心理健康管理APP"),
        ("软件简称", "心晴AI"),
        ("版本型号", "V2.0.0"),
        ("申请人（著作权人）", "陈海丰"),
        ("文档性质", "计算机软件著作权登记鉴定材料（软件操作说明书）"),
        ("编制完成日期", "2026年")
    ]
    for r_i, (k, v) in enumerate(meta_info):
        c0, c1 = t_meta.rows[r_i].cells
        c0.text = k
        p0 = c0.paragraphs[0]
        p0.alignment = WD_ALIGN_PARAGRAPH.RIGHT
        r0 = p0.runs[0]
        r0.font.name = 'SimSun'
        r0.font.size = Pt(11)
        r0.font.bold = True
        r0.font.color.rgb = COLOR_PRIMARY_DARK
        
        c1.text = "： " + v
        p1 = c1.paragraphs[0]
        p1.alignment = WD_ALIGN_PARAGRAPH.LEFT
        r1 = p1.runs[0]
        r1.font.name = 'SimSun'
        r1.font.size = Pt(11)
        r1.font.color.rgb = COLOR_TEXT_MAIN
        set_cell_margins(c0, 60, 60, 100, 100)
        set_cell_margins(c1, 60, 60, 100, 100)

    # Footer notice on cover
    p_cp = doc.add_paragraph()
    p_cp.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_cp.paragraph_format.space_before = Pt(80)
    r_cp = p_cp.add_run("版权所有 © 2026 陈海丰 保留所有权利")
    r_cp.font.name = 'SimSun'
    r_cp.font.size = Pt(9.5)
    r_cp.font.color.rgb = COLOR_TEXT_MUTED

    # =========================================================================
    # SECTION 2: TOC & BODY
    # =========================================================================
    sec_body = doc.add_section(WD_SECTION_START.NEW_PAGE)
    sec_body.top_margin = Inches(0.9)
    sec_body.bottom_margin = Inches(0.9)
    sec_body.left_margin = Inches(0.9)
    sec_body.right_margin = Inches(0.9)
    sec_body.header.is_linked_to_previous = False
    sec_body.footer.is_linked_to_previous = False
    
    # Body Header
    hp = sec_body.header.paragraphs[0]
    hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    add_header_bottom_line(hp, "1F618D", "6")
    hrun = hp.add_run("基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0 软件操作说明书")
    hrun.font.name = 'SimSun'
    hrun.font.size = Pt(8.5)
    hrun.font.color.rgb = COLOR_PRIMARY

    # Body Footer
    fp = sec_body.footer.paragraphs[0]
    fp.alignment = WD_ALIGN_PARAGRAPH.CENTER
    frun = fp.add_run("第 ")
    frun.font.name = 'SimSun'
    frun.font.size = Pt(9)
    frun.font.color.rgb = COLOR_TEXT_MUTED
    fldSimple = OxmlElement('w:fldSimple')
    fldSimple.set(qn('w:instr'), 'PAGE')
    fp._p.append(fldSimple)
    frun2 = fp.add_run(" 页")
    frun2.font.name = 'SimSun'
    frun2.font.size = Pt(9)
    frun2.font.color.rgb = COLOR_TEXT_MUTED
    
    # Restart page number at 1
    sectPr = sec_body._sectPr
    pgNumType = parse_xml(r'<w:pgNumType {} w:start="1"/>'.format(nsdecls('w')))
    sectPr.append(pgNumType)

    # TOC
    add_heading1(doc, "目  录")
    p_line = doc.add_paragraph()
    p_line.paragraph_format.space_after = Pt(8)
    r_l = p_line.add_run("—" * 42)
    r_l.font.color.rgb = RGBColor(200, 200, 200)

    toc_items = [
        ("1 软件概述", "1"),
        ("  1.1 软件研发背景与定位", "1"),
        ("  1.2 多模态身心健康评估闭环", "1"),
        ("  1.3 系统独创性与核心技术特色", "2"),
        ("  1.4 软件运行与部署环境配置", "3"),
        ("2 系统功能架构与账户认证", "4"),
        ("  2.1 整体功能架构设计", "4"),
        ("  2.2 官网发布页与下载安装", "5"),
        ("  2.3 用户注册与登录鉴权流程", "6"),
        ("  2.4 医患协同与邀请码绑定机制", "7"),
        ("3 首页中央控制台与日常状态填报", "8"),
        ("  3.1 首页功能布局与快捷卡片", "8"),
        ("  3.2 每日状态填报流程与解锁机制", "9"),
        ("  3.3 定时催填推送与依从性管理", "10"),
        ("4 HTP 房树人 AI 智能投射测评（核心独创模块）", "11"),
        ("  4.1 房树人投射心理学测验原理", "11"),
        ("  4.2 多点触控手绘板交互与绘制操作", "12"),
        ("  4.3 AI视觉大模型多模态特征识别流程", "13"),
        ("  4.4 色彩、构图、笔触等六维度心理量化报告解读", "14"),
        ("5 Garmin 智能手环多模态客观生理数据同步（核心独创模块）", "15"),
        ("  5.1 智能手环客观生理数据同步机制", "15"),
        ("  5.2 24小时心率与静息心率(RHR)趋势监测", "16"),
        ("  5.3 睡眠结构分期(深睡/浅睡/REM)与睡眠质量评分", "17"),
        ("  5.4 夜间血氧饱和度(SpO2)与低氧风险预警", "18"),
        ("  5.5 心率变异性(HRV)压力指数与身体电量平衡图谱", "19"),
        ("6 疗愈空间与“心晴AI”全天候心理陪伴（核心独创模块）", "20"),
        ("  6.1 24小时在流式心理陪伴共情对话交互", "20"),
        ("  6.2 EMA生态瞬时情绪脸谱与心境强度追踪", "21"),
        ("  6.3 情绪日记富文本记录与情感极性演变趋势", "22"),
        ("  6.4 引导式正念冥想与注意力减压解压互动", "23"),
        ("7 专业心理量表评估中心", "24"),
        ("  7.1 临床常用心理筛查量表体系(SDS/SAS/PSS)", "24"),
        ("  7.2 日常健康与生理心理筛查量表体系(PSQI/CD-RISC等)", "25"),
        ("  7.3 量表测评答题交互与防漏题智能校验", "26"),
        ("  7.4 自动化计分引擎与临床风险等级预警", "27"),
        ("8 模拟微访谈音视频录制模块", "28"),
        ("  8.1 浏览器音视频权限申请与设备环境检测", "28"),
        ("  8.2 12道半结构化情境提问与录制交互", "29"),
        ("  8.3 访谈音视频加密打包与安全上传", "30"),
        ("9 主客观多模态综合身心健康报告", "31"),
        ("  9.1 主客观多模态融合身心健康指数(0-100分)", "31"),
        ("  9.2 六维能力雷达图全景分析", "32"),
        ("  9.3 异常指标高危彩色徽章预警与医生协同干预", "33"),
        ("  9.4 综合健康评估PDF报表一键导出与归档", "34"),
        ("10 医生端协同管理工作台", "35"),
        ("  10.1 医生工作台与就诊患者档案管理", "35"),
        ("  10.2 患者主客观多模态生理与心理数据交叉印证", "36"),
        ("  10.3 随访干预指导与6位邀请码生成", "37"),
        ("11 常见问题排查与数据安全须知", "38"),
        ("  11.1 手环同步与网络连接故障排查", "38"),
        ("  11.2 临床级数据加密与隐私安全保障", "39"),
        ("  11.3 软件版本维护与技术服务说明", "40")
    ]
    for item, page in toc_items:
        p_t = doc.add_paragraph()
        p_t.paragraph_format.line_spacing = 1.2
        p_t.paragraph_format.space_before = Pt(1)
        p_t.paragraph_format.space_after = Pt(2)
        r_item = p_t.add_run(item)
        r_item.font.name = 'SimSun'
        r_item.font.size = Pt(10)
        if not item.startswith("  "):
            r_item.font.bold = True
            r_item.font.color.rgb = COLOR_PRIMARY_DARK
        else:
            r_item.font.color.rgb = COLOR_TEXT_MAIN
            
        dots_count = max(4, 52 - len(item) * 2)
        r_dots = p_t.add_run(" " + ". " * (dots_count // 2) + " ")
        r_dots.font.color.rgb = RGBColor(180, 180, 180)
        r_pg = p_t.add_run(page)
        r_pg.font.name = 'Calibri'
        r_pg.font.size = Pt(10)
        r_pg.font.bold = True
        r_pg.font.color.rgb = COLOR_PRIMARY

    doc.add_page_break()

    # === CHAPTER 1 ===
    add_heading1(doc, "1 软件概述")
    add_heading2(doc, "1.1 软件研发背景与定位")
    add_body(doc, "在现代高快节奏的社会环境下，人群面临学业、职场、生活等多重压力，心理亚健康状态（如焦虑、抑郁、睡眠障碍等）日益普遍。传统的心理测评与干预主要依赖线下面对面问卷或心理咨询，存在主观误差大、时间滞后、门槛高以及缺乏日常连续监测等局限。")
    add_body(doc, "《基于多模态AI的心理健康管理APP》（简称：心晴AI）V2.0.0是由陈海丰先生自主研发的移动端智能化综合身心健康管理系统。本系统立足于现代“心身医学（Psychosomatic Medicine）”前沿理念，突破传统单一心理问卷的局限，创造性地将“主观心理投射感知（房树人绘图、瞬时EMA情绪、心理自评量表、AI陪伴倾诉）”与“客观连续生理体征（Garmin手环心率、夜间血氧SpO2、睡眠分期、压力指数HRV、身体电量）”相融合，构建起“客观测生理 + 主观测心理”的多模态大数据心理健康管理闭环。")

    add_heading2(doc, "1.2 多模态身心健康评估闭环")
    add_body(doc, "心晴AI系统围绕“监测 - 评估 - 疗愈 - 追踪 - 干预”五大核心阶段，实现全面的数字化健康闭环：")
    add_bullet(doc, "通过智能穿戴设备（Garmin Connect API）7×24小时无感化采集连续心率、夜间脉搏血氧、睡眠深度分期与自主神经压力水平，获取真实的生理机能状态。", "1. 客观生理监测：")
    add_bullet(doc, "提供 HTP（House-Tree-Person）多点触控智能手绘白板，依托 AI 视觉大模型深度提取画作构图、色彩、笔触粗细等多维投射特征，输出六大维度心理学量化评估报告。", "2. 投射心理评估：")
    add_bullet(doc, "内置 SCL-90、SDS、SAS、PSQI、大五人格等 10 余种临床黄金标准与日常健康筛查量表，智能计分并输出前后对比走势。", "3. 临床量表自测：")
    add_bullet(doc, "提供 24 小时在线心理陪伴对话、引导式正念冥想音频与敏捷专注力减压小游戏，帮助用户在日常状态下自我舒缓负面情绪。", "4. 智能疗愈陪伴：")
    add_bullet(doc, "基于 EMA（生态瞬时评估）PAM-16 情绪图谱采集全天不同时刻的心境起伏，NLP 大模型自动提取日记情感极性与心情分值。", "5. 瞬时情绪追踪：")
    add_bullet(doc, "通过 6 位专属邀请码与医生端管理后台打通，主治医生可随时调阅患者的主客观交叉印证档案，针对高危异常预警及时开展随访干预。", "6. 医患协同干预：")

    add_heading2(doc, "1.3 系统独创性与核心技术特色")
    add_body(doc, "本软件在技术架构与业务逻辑上具备高度的独创性与自主知识产权，核心技术特征如下：")
    add_bullet(doc, "客户端基于 uni-app + Vue 跨平台前端架构开发，实现 Android 原生 App、iOS、移动端 H5 浏览器等多端高保真一致性渲染，界面流畅自然。", "1. 跨平台多端自适应架构：")
    add_bullet(doc, "服务端开发多线程守护代理，通过加密隧道跨国拉取海外 Garmin Cloud 生理数据，建立自研的时序滤波与离群值清洗算法，解决跨时区数据对齐难点。", "2. 穿戴式生理数据异构调度模型：")
    add_bullet(doc, "自主研发 HTP 画卷图像特征量化打分引擎与 AI 心理陪伴流式交互提示词工程（Prompt Engineering），实现专业的共情倾听、认知重构与风险极性审计。", "3. 多模态 AI 大模型垂直赋能：")
    add_bullet(doc, "后端构建多模态数学加权融合模型，将手环生理指标与心理测评得分归一化融合，输出 0-100 分综合健康指数与六维身心雷达图，支持一键 PDF 临床导出。", "4. 主客观多维融合评估算法：")
    add_bullet(doc, "采用 Apache Shiro + JWT 双重网关鉴权机制，患者生理隐私与对话记录全部经由对称加密（AES）存储，严格保护临床级医疗健康数据。", "5. 金融级数据隐私与安全架构：")

    add_heading2(doc, "1.4 软件运行与部署环境配置")
    add_body(doc, "为保证软件的最佳运行体验，推荐的软硬件配置要求如下表所示：")
    
    env_headers = ["配置类别", "项目名称", "推荐配置与规范要求"]
    env_data = [
        ["客户端运行", "移动端操作系统", "Android 8.0 及以上版本 / iOS 12.0 及以上版本 / 主流移动浏览器"],
        ["客户端运行", "硬件设备", "八核处理器，运行内存 4GB 及以上，存储空间空闲 1GB 及以上，支持触控操作"],
        ["服务端运行", "服务器操作系统", "Linux (CentOS 7.9+ / Ubuntu 20.04 LTS+) 或 Windows Server 2019+"],
        ["服务端运行", "基础运行环境", "JDK 1.8+, Python 3.10+, Nginx 1.20+, MySQL 8.0+"],
        ["网络通信", "网络协议与带宽", "支持 HTTPS (TLS 1.2+), WebSocket, 带宽推荐 10Mbps 及以上独立公网 IP"],
        ["外部接口支持", "第三方集成", "Garmin Connect 开放平台 API, 极光推送 (JPush SDK) 移动端通知组件"]
    ]
    add_table_data(doc, "表 1-1 系统软硬件运行与网络部署配置规范表", env_headers, env_data)

    doc.add_page_break()

    # === CHAPTER 2 ===
    add_heading1(doc, "2 系统功能架构与账户认证")
    add_heading2(doc, "2.1 整体功能架构设计")
    add_body(doc, "心晴AI系统采用了清晰的分层解耦设计，主要包含展现层（移动客户端/医生Web端）、网关鉴权层（Shiro+JWT）、业务逻辑层（多模态分析、AI对话、量表引擎、手环同步、报告生成）以及数据持久层（MySQL、时序数据库与加密文件存储）。客户端界面布局如图 2-1 所示：")
    
    add_image_figure(doc, os.path.join(img_folder, "image1.jpeg"), "图 2-1 心晴AI移动端界面布局与功能导航总览", width=Inches(5.2))
    add_body(doc, "客户端底部导航栏包含四大核心功能 Tab：")
    add_bullet(doc, "展示今日身心状态综合评分、每日打卡填报任务、手环实时状态及核心功能快捷入口。", "1. 首页 (pages/home)：")
    add_bullet(doc, "聚合 HTP 房树人智能绘画测评、临床筛查量表（SDS/SAS）以及日常自测量表中心。", "2. 评估 (pages/aiassess)：")
    add_bullet(doc, "提供 24h 心晴AI 心理陪伴流式对话、EMA 瞬时情绪脸谱图谱、情绪日记与正念减压空间。", "3. 疗愈 (pages/heal)：")
    add_bullet(doc, "包含个人健康档案、Garmin手环账号授权绑定、主客观多模态健康雷达图、主治医生绑定信息等。", "4. 我的 (pages/mine)：")

    add_heading2(doc, "2.2 官网发布页与下载安装")
    add_body(doc, "系统配备了专业高颜值的 Web 官方发布门户，如图 2-2 所示。用户可通过手机浏览器扫描官网二维码或点击下载链接，一键获取 Android APK 安装包或在 iOS 浏览器中直接添加为桌面轻应用（PWA/H5）。")
    add_image_figure(doc, os.path.join(img_folder, "image2.png"), "图 2-2 心晴AI官方发布门户与下载界面", width=Inches(4.8))

    add_heading2(doc, "2.3 用户注册与登录鉴权流程")
    add_body(doc, "首次使用系统的用户须完成账号注册。系统采用手机号与加密密码作为唯一凭证，登录成功后系统发放无状态 JWT 令牌，保证单次登录后在有效期内自动保持在线状态，界面如图 2-3 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image3_part1.jpeg"), "图 2-3 用户注册与登录认证界面", width=Inches(4.5))
    add_body(doc, "【操作步骤】")
    add_bullet(doc, "打开应用，未登录状态下进入欢迎与登录页面。", "步骤 1：")
    add_bullet(doc, "若已有账号，输入注册手机号及密码，点击“立即登录”；系统校验通过后下发 JWT Token 并跳转至首页。", "步骤 2：")
    add_bullet(doc, "若无账号，点击“快速注册”切换至注册表单，填写真实手机号码、设置 6-16 位安全密码并勾选《用户协议与隐私保护政策》。", "步骤 3：")

    add_heading2(doc, "2.4 医患协同与邀请码绑定机制")
    add_body(doc, "为确保临床心理数据的严肃性与医患隐私协同，心晴AI设计了“专属 6 位邀请码绑定机制”，如图 2-4 所示。")
    add_image_figure(doc, os.path.join(crop_folder, "image3_part2.jpeg"), "图 2-4 医患协同绑定与个人健康资料设置", width=Inches(4.5))
    add_body(doc, "【操作步骤】")
    add_bullet(doc, "注册时或进入“我的 - 个人资料”页面，输入主治医生提供的 6 位专属字母数字邀请码。", "步骤 1：")
    add_bullet(doc, "点击“确认绑定”，系统将校验邀请码的有效性并建立医患安全双向映射关联。", "步骤 2：")
    add_bullet(doc, "绑定成功后，患者提交的生理监测异常、HTP房树人量化报告及重度量表预警将实时对接到主治医生后台，便于临床跟踪。", "步骤 3：")

    add_callout(doc, "医患绑定邀请码为 6 位不重复的字母与数字组合，由主治医生在医生端后台一键生成。每个邀请码与唯一医生档案严格关联，保障临床级隐私隔离。", "【医患绑定合规提示】")

    doc.add_page_break()

    # === CHAPTER 3 ===
    add_heading1(doc, "3 首页中央控制台与日常状态填报")
    add_heading2(doc, "3.1 首页功能布局与快捷卡片")
    add_body(doc, "首页是用户日常身心管理的中央仪表盘，顶部展示用户的个人健康状态概括与未完成任务提示，中部以网格式栅卡片呈现核心功能快捷入口，下部滚动展示每日心理健康科普与舒缓小贴士，如图 3-1 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image4_part1.jpeg"), "图 3-1 首页中央控制台功能卡片与大屏布局", width=Inches(4.5))
    add_body(doc, "【快捷服务卡片说明】")
    add_bullet(doc, "快捷直达 HTP 绘画测评与量表中心，支持一键发起身心体检。", "• AI评估中心：")
    add_bullet(doc, "直观查看当前佳明手环同步的心率、步数、睡眠时长及电量指标。", "• 手环生理数据：")
    add_bullet(doc, "一键启动 24h 心晴AI 心理陪伴流式对话与情绪日记记录。", "• 疗愈空间：")
    add_bullet(doc, "进入摄像头麦克风音视频半结构化访谈录制模块。", "• 迷你情境访谈：")

    add_heading2(doc, "3.2 每日状态填报流程与解锁机制")
    add_body(doc, "为保证心理学研究与临床监测的时间序列连续性，系统设计了“每日早晨 08:00 定时解锁日常填报任务”的机制，填报界面如图 3-2 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image4_part2.jpeg"), "图 3-2 每日日常身心状态填报表单界面", width=Inches(4.5))
    add_body(doc, "【操作步骤与指标选项】")
    add_bullet(doc, "每天 08:00 起，首页顶部弹出“今日状态待填报”提示横幅，点击进入填报表单。", "步骤 1：")
    add_bullet(doc, "快速单选记录前一晚的睡眠质量（极佳、良好、一般、较差、严重失眠）。", "步骤 2：")
    add_bullet(doc, "标记今日早晨的进食食欲、精神活力水平以及当前情绪基调。", "步骤 3：")
    add_bullet(doc, "选择是否存在头痛、胸闷、胃痛等躯体化身体不适，并勾选当前是否处于服药治疗期。", "步骤 4：")
    add_bullet(doc, "点击“提交打卡”，系统将数据存入时序健康数据库，并在首页点亮今日连续打卡徽章。", "步骤 5：")

    add_heading2(doc, "3.3 定时催填推送与依从性管理")
    add_body(doc, "系统集成 Spring Scheduled 与极光推送（JPush SDK），在每日 21:00 对当日尚未填报日常状态的用户发起精准别名推送提醒（“心晴提醒：今天过得怎么样？花 1 分钟记录一下今天的心情吧”），若 23:00 仍未打卡则触发二次弱提醒，保障临床研究数据样本的高依从性与完整性。")

    doc.add_page_break()

    # === CHAPTER 4 ===
    add_heading1(doc, "4 HTP 房树人 AI 智能投射测评（核心独创模块）")
    add_heading2(doc, "4.1 房树人投射心理学测验原理")
    add_body(doc, "HTP（House-Tree-Person Test）房树人测验是临床心理学经典的投射测验之一。受试者在同一画面上绘制房屋、树木与人物，其潜意识中的自我认知、家庭归属感、人际交往模式、情感成熟度以及内心压抑均会不自觉地通过画面的空间构图、色彩搭配、笔触力度等物理特征投射出来。")
    add_body(doc, "本软件在业内率先实现了“移动端多点触控手绘板 + AI 视觉大模型多模态解析”的技术突破，受试者无须专业画纸即可在手机屏幕上自由挥洒，AI 算法实时提取画面特征并输出临床级量化打分。")

    add_heading2(doc, "4.2 多点触控手绘板交互与绘制操作")
    add_body(doc, "用户进入“评估 - 房树人画画”页面，系统呈现高响应率的多点触控 Canvas 手绘白板，如图 4-1 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image5_part1.jpeg"), "图 4-1 HTP房树人多点触控智能画板绘制交互界面", width=Inches(4.5))
    add_body(doc, "【画板功能与操作指南】")
    add_bullet(doc, "系统提供丰富的专业调色板（包含暖红、冷蓝、自然绿、阳光黄、静谧紫、沉稳黑等 12 种心理学常用主色调），轻触色块即可无缝切换画笔颜色。", "1. 调色盘与画笔选择：")
    add_bullet(doc, "支持滑动滑块精细调节笔刷像素粗细（1px - 20px），满足从精细轮廓描绘到大面积涂鸦的不同需求。", "2. 笔触粗细无级调节：")
    add_bullet(doc, "提供橡皮擦擦除、一键全屏清空（带有防误触二次确认对话框）以及上一步撤回（Undo）操作，保障良好的绘画体验。", "3. 擦除与历史回退：")
    add_bullet(doc, "绘制要求受测者在同一张画卷中画出一座房子、一棵树和一个完整的人物，不要求美术技巧，尽情画出真实感受即可。", "4. 画面构图引导：")

    add_heading2(doc, "4.3 AI视觉大模型多模态特征识别流程")
    add_body(doc, "受试者点击“提交测评”后，前端将 Canvas 像素数据转码为高质量 Base64/PNG 图像文件，通过安全接口上传至服务端。服务端调用自主研发的 HtpAnalysisService 算法引擎：")
    add_bullet(doc, "统计画面 RGB 分布、主导色调占比（如冷色系与暖色系比例）、色彩丰富度指数。", "1. 图像色彩直方图分析：")
    add_bullet(doc, "计算画作像素在画卷中的四象限空间占位、重心偏移量（居中/偏上/偏下/偏左/偏右）以及空白率。", "2. 空间几何构图分析：")
    add_bullet(doc, "分析线条曲折度、断续性、笔触平均粗细与涂抹密度，量化投射受试者的紧张度与攻击性倾向。", "3. 笔触力道与纹理特征：")
    add_bullet(doc, "结合多模态大模型视觉特征提取，精准识别房屋门窗结构、树木树冠比例、人物肢体完整性。", "4. 语义目标级解析：")

    add_heading2(doc, "4.4 色彩、构图、笔触等六维度心理量化报告解读")
    add_body(doc, "AI 算法在数秒内即可生成具有专业临床指导价值的六维度分析报告，如图 4-2 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image5_part2.jpeg"), "图 4-2 AI房树人测评六维度量化打分与心理分析报告", width=Inches(4.5))
    
    htp_headers = ["评估维度", "算法特征提取指标", "心理学投射含义与解读标准"]
    htp_data = [
        ["色彩丰富度", "色彩种类、暖色/冷色占比、明度分布", "高暖色通常反映开朗乐观；高冷色或单一暗黑可能暗示情绪压抑或防御倾向"],
        ["空间构图", "画面中心距、偏左/偏右、边缘靠拢", "偏左倾向反映留恋过去；偏右反映渴望未来；偏上暗示逃避现实；居中表明自我稳固"],
        ["画面面积占比", "画面覆盖像素比例、留白比率", "面积适中（50%-75%）显示内心自信均衡；过小（<20%）反映内向退缩自卑；过大可能反映控制欲"],
        ["房屋特征", "屋顶高度、墙壁线条、门窗开放度", "象征受试者的家庭观念与安全感。门窗紧闭反映社交隔离；门窗大开反映开放包容"],
        ["树木特征", "树干粗细、树冠丰满度、树根深度", "象征个体生命能量与潜意识本我。树干粗壮代表坚韧抗逆；树枝枯萎反映精疲力竭或挫败"],
        ["人物特征", "面部表情、肢体动作、躯干完整度", "象征现实自我形象与社交适应。五官模糊可能反映自我认同困惑；表情微笑反映良好适应"]
    ]
    add_table_data(doc, "表 4-1 HTP房树人AI六大心理学量化维度与特征映射标准", htp_headers, htp_data)
    add_body(doc, "系统给出综合得分（如“78分 - 身心状态处于积极健康区间”）并附带通俗易懂的专家心理学寄语，支持用户点击一键保存分享卡片或同步至医生端档案。")

    doc.add_page_break()

    # === CHAPTER 5 ===
    add_heading1(doc, "5 Garmin 智能手环多模态客观生理数据同步（核心独创模块）")
    add_heading2(doc, "5.1 智能手环客观生理数据同步机制")
    add_body(doc, "为摆脱传统心理评估“仅凭主观问卷、无法量化生理基础”的致命弱点，心晴AI突破性地引入 Garmin（佳明）智能穿戴手环连续客观生理数据采集体系。")
    add_body(doc, "系统设计了异步后台轮询调度引擎，结合 AES-256 对称加密保护用户佳明账号凭证，定时调用海外 Garmin Connect Cloud API，自动拉取用户佩戴手环产生的一整套高精度生理数据。生理数据看板界面如图 5-1 与图 5-2 所示：")
    
    add_image_figure(doc, os.path.join(crop_folder, "image6_part1.jpeg"), "图 5-1 Garmin智能手环生理数据综合看板与趋势图谱", width=Inches(4.5))

    add_heading2(doc, "5.2 24小时心率与静息心率(RHR)趋势监测")
    add_body(doc, "【临床意义与数据呈现】")
    add_bullet(doc, "系统展示 24 小时每两分钟密度的连续心率走势折线图，精确标记全天最高心率、最低心率及全天平均心率。", "1. 连续心率时序图：")
    add_bullet(doc, "静息心率是评估心血管健康与植物神经系统疲劳度的黄金指标。当用户长期处于重度焦虑或心理压力负荷下时，静息心率通常会异常上升 5-10 bpm。系统自动绘制近 7 天/近 30 天静息心率演变平滑曲线，帮助捕捉隐匿的身心应激反应。", "2. 静息心率 (RHR) 追踪：")

    add_heading2(doc, "5.3 睡眠结构分期(深睡/浅睡/REM)与睡眠质量评分")
    add_body(doc, "睡眠障碍是抑郁症与焦虑症的核心前兆和伴随症状。本系统将手环采集的复杂睡眠时序深度解构，如图 5-2 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image6_part2.jpeg"), "图 5-2 睡眠深度分期甘特图与血氧压力综合趋势", width=Inches(4.5))
    add_body(doc, "【睡眠监测指标解读】")
    add_bullet(doc, "总睡眠时长：记录昨夜入睡与清醒的具体时间节点，计算实际睡眠有效时长；", "• 时长统计：")
    add_bullet(doc, "四阶段睡眠甘特图：区分 深睡眠（恢复体力与生长激素分泌）、浅睡眠、快速眼动期（REM，梦境与情绪记忆整理）以及清醒时段，色彩化柱状图一目了然；", "• 结构分期：")
    add_bullet(doc, "基于睡眠时长、深睡比例、REM眼动期比例及翻身清醒次数，算法输出 0-100 分综合睡眠评分。", "• 睡眠质量综合得分：")

    add_heading2(doc, "5.4 夜间血氧饱和度(SpO2)与低氧风险预警")
    add_body(doc, "夜间血氧饱和度是防范睡眠呼吸暂停综合征（OSA）与夜间惊恐发作的重要生理防线。")
    add_bullet(doc, "通过红外光学脉搏传感器在夜间睡眠时段持续监测外周毛细血管血氧饱和度，正常区间处于 95%-100% 之间。", "• 监测原理：")
    add_bullet(doc, "系统设置 SpO2 < 90% 为警界线。若检测到持续低于 90% 的低氧时段（长于 30 秒），系统在早晨生成醒目的“低氧事件提醒”，并在多模态报告中自动提示呼吸与睡眠风险。", "• 低氧预警阈值：")

    add_heading2(doc, "5.5 心率变异性(HRV)压力指数与身体电量平衡图谱")
    add_body(doc, "【压力指数与身体电量机制】")
    add_bullet(doc, "利用手环捕获的连续心拍间隔变异（HRV），计算交感神经与副交感神经的兴奋张力平衡度，将压力映射为 0-100 的实时指标（0-25 休息放松、26-50 低压力、51-75 中压力、76-100 高压力）。", "1. 压力指数 (Stress)：")
    add_bullet(doc, "综合睡眠补电（充能）与白天运动、工作、压力耗电，展示如同手机电量般的身体电能百分比（0-100%），帮助用户合理安排劳逸结合。", "2. 身体电量 (Body Battery)：")

    doc.add_page_break()

    # === CHAPTER 6 ===
    add_heading1(doc, "6 疗愈空间与“心晴AI”全天候心理陪伴（核心独创模块）")
    add_heading2(doc, "6.1 24小时在流式心理陪伴共情对话交互")
    add_body(doc, "当用户面临突发情绪危机、孤独失落或焦虑紧绷时，心晴AI提供 24 小时随时可及的温暖数字避风港，交互界面如图 6-1 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image7_part1.jpeg"), "图 6-1 “心晴AI”心理陪伴流式对话交互界面", width=Inches(4.5))
    add_body(doc, "【核心功能与操作特性】")
    add_bullet(doc, "支持键盘打字输入、趣味表情包发送以及长按语音转文字倾诉，降低用户在情绪低谷时的输入心理阻力。", "1. 多通道输入支持：")
    add_bullet(doc, "后端搭载针对心理咨询话术微调的大模型服务，采用 SSE（Server-Sent Events）逐字流式打印响应，带来极为生动真实的拟人陪伴感。", "2. 流式共情反馈机制：")
    add_bullet(doc, "AI 角色遵循专业心理咨询伦理，具备“无条件积极关注、澄清、情感共鸣与认知重塑”对话技巧，杜绝粗暴指责与说教。", "3. 心理专业性赋能：")
    add_bullet(doc, "内置敏感词过滤与自伤自残危机干预熔断网关。一旦识别到极高自杀/危机倾向，系统立即暂停普通闲聊，弹出红底紧急援助电话与心理危机干预热线（400-161-9995）。", "4. 安全合规与危机熔断：")

    add_heading2(doc, "6.2 EMA生态瞬时情绪脸谱与心境强度追踪")
    add_body(doc, "传统量表属于“回溯性自测”，受试者容易产生记忆偏差。心晴AI引入 EMA（Ecological Momentary Assessment，生态瞬时评估）技术，让用户在真实生活场景中随时捕捉瞬时心境，界面如图 6-2 所示：")
    add_image_figure(doc, os.path.join(crop_folder, "image7_part2.jpeg"), "图 6-2 EMA生态瞬时情绪图谱与情绪日记记录界面", width=Inches(4.5))
    add_body(doc, "【EMA 交互方式】")
    add_bullet(doc, "页面提供基于 PAM-16 情绪模型的 16 种生动拟人脸谱（覆盖平静、喜悦、振奋、感恩、焦虑、郁闷、愤怒、悲伤等不同象限）。", "步骤 1：情绪点选：")
    add_bullet(doc, "点击脸谱后，下方弹出强度滑块，支持在 1-5 级之间滑动调节感受强烈程度（1为微弱，5为极致）。", "步骤 2：强度标记：")
    add_bullet(doc, "点击“记录”，系统自动打上时间戳入库，全天可多次打卡，自动串联成“24小时瞬时心境波动曲线”。", "步骤 3：时序沉淀：")

    add_heading2(doc, "6.3 情绪日记富文本记录与情感极性演变趋势")
    add_body(doc, "用户可以在 EMA 记录时附带写下此时此刻的心情日记，记录触发事件（如“今天在组会汇报被表扬了”或“项目上线遇到bug很受挫”）。后端自然语言处理引擎（DiaryAnalysisService）自动提取文本正负面情感词汇，计算 -1.0 到 +1.0 之间的情感极性分，在日历上形成彩色情绪足迹图。")

    add_heading2(doc, "6.4 引导式正念冥想与注意力减压解压互动")
    add_body(doc, "疗愈空间内置了引导式正念呼吸音频组件与轻量化注意力敏捷跑酷小游戏（Temple Run 2 Holi Festival）。研究表明，在急性焦虑状态下，通过高度专注的视觉追踪与指尖敏捷交互，可以迅速切断大脑反刍思维的负性循环，促进多巴胺分泌，有效平抑身心紧张。")

    doc.add_page_break()

    # === CHAPTER 7 ===
    add_heading1(doc, "7 专业心理量表评估中心")
    add_heading2(doc, "7.1 临床常用心理筛查量表体系(SDS/SAS/PSS)")
    add_body(doc, "系统在“评估”模块集成了国际心理医学公认的临床自评金标准量表体系：")
    add_bullet(doc, "含 20 道题目，涵盖抑郁心境、躯体化障碍、精神运动性迟滞及心理障碍四大维度。系统自动将原始分通过乘 1.25 后取整换算为标准分，53分为中国常模临界值。", "1. SDS 抑郁自评量表 (Self-Rating Depression Scale)：")
    add_bullet(doc, "含 20 道题目，重点测量自主神经系统兴奋性、惊恐症状及肌肉紧张等焦虑体验，50分为标准分临界值。", "2. SAS 焦虑自评量表 (Self-Rating Anxiety Scale)：")
    add_bullet(doc, "含 14 道题目，评估用户在过去一个月内对不可控事件与超负荷情境的内心压力感知水平。", "3. PSS 压力知觉量表 (Perceived Stress Scale)：")

    add_heading2(doc, "7.2 日常健康与生理心理筛查量表体系(PSQI/CD-RISC等)")
    add_body(doc, "针对亚健康防治，系统还提供了丰富的日常自评量表库：")
    add_bullet(doc, "评估受测者近 1 个月的睡眠潜伏期、睡眠效率、催眠药物使用及日间功能障碍。", "• PSQI 匹兹堡睡眠质量指数：")
    add_bullet(doc, "评估个体在面对困境挫折时的坚韧、力量与乐观三大心理韧性维度。", "• CD-RISC 心理韧性量表：")
    add_bullet(doc, "评估内感受敏感性、身体情绪连接与注意力调节能力。", "• MAIA 内感受意识多维评估量表：")
    add_bullet(doc, "量化分析用户的日常身体活动水平与久坐行为。", "• PARS-3 / IPAQ 身体活动评定量表：")

    add_heading2(doc, "7.3 量表测评答题交互与防漏题智能校验")
    add_body(doc, "量表答题界面设计了防漏题导航器与答题进度条。当用户点击“提交测评”时，前端逻辑自动校验是否存在未答题目，若有漏填则以黄色高亮定位，并自动平滑滚动至漏选题目处，杜绝无效提交。")

    add_heading2(doc, "7.4 自动化计分引擎与临床风险等级预警")
    add_body(doc, "答卷提交后，后端 ScaleAnalysisService 自动完成反向计分题转换、维度加权计算及标准分换算，即刻呈现结果卡片，并标注清晰的风险等级：")
    add_bullet(doc, "标准分处于安全健康常模，给出鼓励性健康维持建议。", "• 绿色徽章（正常）：")
    add_bullet(doc, "处于临界或轻度亚健康，提示加强运动、规律作息与正念调节。", "• 黄色徽章（轻度异常）：")
    add_bullet(doc, "提示明显的精神健康负担，系统自动弹出绑定的主治医生咨询入口，并在医生端高亮报警。", "• 红色/紫色徽章（中/重度风险）：")

    doc.add_page_break()

    # === CHAPTER 8 ===
    add_heading1(doc, "8 模拟微访谈音视频录制模块")
    add_heading2(doc, "8.1 浏览器音视频权限申请与设备环境检测")
    add_body(doc, "在“首页 - 迷你访谈”入口中，系统支持进行 12 道半结构化心理访谈音视频录制。用户进入页面后，系统首先发起 WebRTC 权限申请，提示用户允许使用摄像头与麦克风，并在本地完成视频画面镜像预览与音量分贝动态波形校验，确保光线充足且收音清晰。")

    add_heading2(doc, "8.2 12道半结构化情境提问与录制交互")
    add_body(doc, "系统预置了临床经典的半结构化访谈问题链（涵盖：“最近让你最开心的一件事是什么？”、“遇到挫折时你通常如何应对？”、“你对未来半年的规划与期待”等）。")
    add_body(doc, "用户点击“开始录制”后，屏幕上方弹出倒计时并逐题呈现情境提问，受试者自然面向镜头回答。系统支持分段录制、重录与实时预览播放。")

    add_heading2(doc, "8.3 访谈音视频加密打包与安全上传")
    add_body(doc, "录制完成后，前端通过 MediaRecorder 接口将视频流封装为标准 MP4/WebM 格式文件，采用分片断点续传机制安全上传至服务器私有文件存储区，仅授权的主治医生可在后台播放审计，严格保障患者隐私。")

    doc.add_page_break()

    # === CHAPTER 9 ===
    add_heading1(doc, "9 主客观多模态综合身心健康报告")
    add_heading2(doc, "9.1 主客观多模态融合身心健康指数(0-100分)")
    add_body(doc, "心晴AI系统的最大独创价值在于“多模态身心数据的大融合”。在“我的 - 健康报告”页面中，系统将用户过去 7 天内沉淀的手环客观生理数据与主观心理测评结果输入自研的多模态评分数学模型中：")
    add_body(doc, "数学模型对各维度指标进行标准化 Z-score 归一化，依据心身医学权重分配算法（客观生理占 45%，主观心理占 55%），最终输出统一的【0-100分身心健康综合得分】。健康报告页面如图 9-1 与图 9-2 所示：")
    
    add_image_figure(doc, os.path.join(crop_folder, "image8_part1.jpeg"), "图 9-1 多维度综合健康报告与六维能力雷达图全景", width=Inches(4.5))

    add_heading2(doc, "9.2 六维能力雷达图全景分析")
    add_body(doc, "系统采用 ECharts 构建了炫酷直观的身心健康全景雷达图，覆盖以下六个核心支柱维度：")
    add_bullet(doc, "基于 CD-RISC 心理韧性量表得分与压力应对能力评估；", "1. 心理弹性维度：")
    add_bullet(doc, "基于手环深睡时长、REM眼动期比例、PSQI睡眠问卷得分与夜间清醒频次综合评估；", "2. 睡眠质量维度：")
    add_bullet(doc, "基于日常步数、中高强度活动分钟数与久坐时长综合计算；", "3. 身体活动维度：")
    add_bullet(doc, "基于手环 HRV 压力指数平均值、高压时段占比及 PSS 压力感知量表得分评估；", "4. 压力管理维度：")
    add_bullet(doc, "基于 EMA 瞬时情绪正向率、日记情感极性均值及 SDS/SAS 焦虑抑郁指数评估；", "5. 情绪状态维度：")
    add_bullet(doc, "基于静息心率健康度、身体电量充放电平衡指数与夜间 SpO2 血氧指标评估。", "6. 生理机能维度：")

    add_heading2(doc, "9.3 异常指标高危彩色徽章预警与医生协同干预")
    add_body(doc, "如图 9-2 所示，在报告下方，系统自动罗列各项细分指标的健康诊断卡片：")
    add_image_figure(doc, os.path.join(crop_folder, "image8_part2.jpeg"), "图 9-2 HTP房树人速览、细分指标明细与异常预警", width=Inches(4.5))
    add_bullet(doc, "若某项指标长期偏离健康阈值（如连续 3 天压力值 > 80，或 PSQI 得分极差），卡片亮起红色预警徽章，并提供一键预约主治医生的便捷通道。", "• 异常高危预警机制：")
    add_bullet(doc, "展示最近一次 HTP 房树人测验的量化分值及画面面积、笔触力度条形对比图，形成完整的图文诊断档案。", "• 房树人报告图表联动：")

    add_heading2(doc, "9.4 综合健康评估PDF报表一键导出与归档")
    add_body(doc, "用户或医护人员可点击右上角的“导出完整报告”按钮，前端将图表与评估文本即时渲染为标准的 PDF 电子病历报告，支持下载至手机本地或直接无线打印，极大地方便了线下就医时的临床参考。")

    doc.add_page_break()

    # === CHAPTER 10 ===
    add_heading1(doc, "10 医生端协同管理工作台")
    add_heading2(doc, "10.1 医生工作台与就诊患者档案管理")
    add_body(doc, "主治医生通过 PC 端 Web 浏览器登录心晴AI医生端管理后台。工作台首页展示当前绑定的患者总数、今日异常报警人数及待随访干预清单。医生可按患者姓名、手机号或风险等级进行多条件组合筛选。")

    add_heading2(doc, "10.2 患者主客观多模态生理与心理数据交叉印证")
    add_body(doc, "点击患者姓名进入其全景多模态身心档案详情页：")
    add_bullet(doc, "医生可对照患者的 24 小时手环心率/压力曲线，与患者当日填写的 EMA 情绪日记及量表自评进行时间轴重叠比对，打破传统心理诊断“无客观证据支持”的技术盲区，极大提升了临床诊断的精准性。", "• 时空对齐交叉比对：")
    add_bullet(doc, "后台支持全屏查看患者提交的高清 HTP 房树人画卷，AI 自动标注出的构图重心、色彩分布直方图与门窗结构，辅助医生深入剖析患者潜意识。", "• 房树人画卷多维审阅：")

    add_heading2(doc, "10.3 随访干预指导与6位邀请码生成")
    add_body(doc, "主治医生可在后台为每一位初诊患者生成专属的 6 位数字字母邀请码，并向患者手机端推送针对性的随访医嘱（如“建议今晚睡前进行 15 分钟正念呼吸，减少睡前剧烈运动”），实现全程关怀。")

    doc.add_page_break()

    # === CHAPTER 11 ===
    add_heading1(doc, "11 常见问题排查与数据安全须知")
    add_heading2(doc, "11.1 手环同步与网络连接故障排查")
    add_bullet(doc, "答：首先检查在“我的 - 佳明手环绑定”中所填写的 Garmin Connect 账号密码是否正确；其次，请确保手机上的官方 Garmin Connect App 能够正常连接手环并完成与佳明云端的数据上传。由于佳明服务器在海外，网络同步可能存在 10-30 分钟延迟，可在手环看板点击“手动刷新”按钮触发即时抓取。", "Q1：为什么手环数据没有及时更新？")
    add_bullet(doc, "答：HTP 绘画测验与多模态雷达图评估属于智能化心理筛查与日常健康管理辅助工具，其结果为身心亚健康预警提供了高价值依据，但不等同于具有法律效力的法定精神医学诊断书。如感到持续情绪痛苦，应及时在绑定的医生协同指导下寻求专业医疗机构诊疗。", "Q2：AI 评估结果具有临床诊断效力吗？")

    add_heading2(doc, "11.2 临床级数据加密与隐私安全保障")
    add_body(doc, "本软件严格遵守《中华人民共和国数据安全法》与《个人信息保护法》：")
    add_bullet(doc, "所有用户生理体征、心理量表、日记与对话记录均经由 AES-256 算法加密落盘存储；网络传输全程强制采用 TLS 1.3 高强度证书加密。", "1. 存储与传输加密：")
    add_bullet(doc, "患者数据仅对绑定的主治医生可见，未经用户明确授权，系统绝不向任何第三方机构泄露或共享用户身心隐私数据。", "2. 严格访问权限隔离：")
    add_bullet(doc, "用户享有个人数据完全查阅权与注销被遗忘权，可在“我的 - 设置 - 注销账号”中一键彻底销毁全部历史监测档案。", "3. 数据销毁保障：")

    add_heading2(doc, "11.3 软件版本维护与技术服务说明")
    add_body(doc, "本软件著作权完全归陈海丰先生独立所有。开发者将持续根据现代心理健康管理前沿技术与穿戴式传感器的发展演进，提供定期的系统维护与算法模型迭代升级。用户在使用过程中如遇任何技术咨询或操作问题，可通过官方支持渠道获得及时的运维保障。")

    # Save to docx
    out_docx = os.path.join(out_folder, "软件操作说明书.docx")
    doc.save(out_docx)
    print(f"Generated: {out_docx}")

    # Convert to doc via win32com
    import win32com.client
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    out_doc = os.path.join(out_folder, "软件操作说明书.doc")
    wdoc = word.Documents.Open(out_docx)
    page_count = wdoc.ComputeStatistics(2)
    print(f"Verified Word manual page count: {page_count}")
    wdoc.SaveAs2(out_doc, FileFormat=0) # wdFormatDocument = 0
    wdoc.Close(False)
    word.Quit()
    print("Operation manual formatting completed successfully.")

if __name__ == '__main__':
    build_manual_v2()
