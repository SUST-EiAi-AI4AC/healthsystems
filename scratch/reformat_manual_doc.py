# -*- coding: utf-8 -*-
"""
基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0
《软件操作说明书》全面排版与美化重构脚本
按照《用户说明书模板.docx》的视觉风格、字体、字号、行距、首行缩进、页边距与色彩体系重新排版：
- 页面边距：Top=72pt(1英寸), Bottom=72pt(1英寸), Left=90pt(1.25英寸), Right=90pt(1.25英寸)
- 正文字体：宋体(中文)/Times New Roman(西文)，字号小四号(12pt)，首行缩进24pt(2字符)，段后7.8pt，行距1.25倍
- 标题体系：
  * 封面：软件名42pt，说明书标题48pt
  * 一级标题：三号(16pt)，加粗黑体，段前16pt，段后8pt，科技深蓝
  * 二级标题：四号(14pt)，加粗黑体，段前12pt，段后6pt，科技蓝
  * 三级标题：小四号(12pt)，加粗黑体，段前8pt，段后4pt，深石板青
- 8张原系统截图100%保留，版心自适应居中，图题精致加粗
- Word 原生 TOC 域，带 1-3 级可跳转超链接，精准对齐页码
"""

import os
import sys
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import qn, nsdecls
import win32com.client

BASE_DIR = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'
DOC_DIR = os.path.join(BASE_DIR, 'doc', '软著V2.0')
IMG_DIR = os.path.join(DOC_DIR, 'extracted_images')

TEMP_FORMATTED_DOCX = os.path.join(BASE_DIR, 'scratch', 'temp_manual_formatted.docx')
FINAL_DOCX = os.path.join(DOC_DIR, '软件操作说明书.docx')
FINAL_DOC = os.path.join(DOC_DIR, '软件操作说明书1.doc')

def set_cell_background(cell, fill_hex):
    tcPr = cell._tc.get_or_add_tcPr()
    shd = parse_xml(f'<w:shd {nsdecls("w")} w:fill="{fill_hex}"/>')
    tcPr.append(shd)

def set_cell_margins(cell, top=100, bottom=100, left=140, right=140):
    tcPr = cell._tc.get_or_add_tcPr()
    tcMar = parse_xml(f'<w:tcMar {nsdecls("w")}><w:top w:w="{top}" w:type="dxa"/><w:bottom w:w="{bottom}" w:type="dxa"/><w:left w:w="{left}" w:type="dxa"/><w:right w:w="{right}" w:type="dxa"/></w:tcMar>')
    tcPr.append(tcMar)

def add_header_footer(doc):
    for section in doc.sections:
        # 对标《用户说明书模板.docx》标准页面设置
        section.top_margin = Pt(72.0)     # 1 英寸
        section.bottom_margin = Pt(72.0)  # 1 英寸
        section.left_margin = Pt(90.0)    # 1.25 英寸 (留足装订与留白)
        section.right_margin = Pt(90.0)   # 1.25 英寸
        
        # 页眉：软件名称左对齐，页码右对齐
        header = section.header
        hp = header.paragraphs[0]
        hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
        hrun1 = hp.add_run("基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0 用户操作说明书        第 ")
        hrun1.font.name = 'SimSun'
        hrun1._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        hrun1.font.size = Pt(9)
        hrun1.font.color.rgb = RGBColor(120, 120, 120)
        
        fldSimple = OxmlElement('w:fldSimple')
        fldSimple.set(qn('w:instr'), 'PAGE')
        hp._p.append(fldSimple)
        
        hrun2 = hp.add_run(" 页")
        hrun2.font.name = 'SimSun'
        hrun2.font.size = Pt(9)
        hrun2.font.color.rgb = RGBColor(120, 120, 120)

def add_heading1(doc, text):
    p = doc.add_paragraph(style='Heading 1')
    p.paragraph_format.space_before = Pt(16)
    p.paragraph_format.space_after = Pt(8)
    p.paragraph_format.first_line_indent = Pt(0)
    p.paragraph_format.keep_with_next = True
    p.paragraph_format.line_spacing = 1.25
    for r in p.runs:
        r.text = ""
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(16) # 三号 (16pt，对标模板)
    run.font.bold = True
    run.font.color.rgb = RGBColor(21, 67, 96) # 科技深蓝
    return p

def add_heading2(doc, text):
    p = doc.add_paragraph(style='Heading 2')
    p.paragraph_format.space_before = Pt(12)
    p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.first_line_indent = Pt(0)
    p.paragraph_format.keep_with_next = True
    p.paragraph_format.line_spacing = 1.25
    for r in p.runs:
        r.text = ""
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(14) # 四号 (14pt，对标模板)
    run.font.bold = True
    run.font.color.rgb = RGBColor(31, 97, 141) # 科技蓝
    return p

def add_heading3(doc, text):
    p = doc.add_paragraph(style='Heading 3')
    p.paragraph_format.space_before = Pt(8)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.first_line_indent = Pt(0)
    p.paragraph_format.keep_with_next = True
    p.paragraph_format.line_spacing = 1.25
    for r in p.runs:
        r.text = ""
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(12) # 小四号 (12pt，对标模板)
    run.font.bold = True
    run.font.color.rgb = RGBColor(44, 62, 80) # 深石板青
    return p

def add_body_paragraph(doc, text, bold_prefix=None):
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.25
    p.paragraph_format.space_before = Pt(0)
    p.paragraph_format.space_after = Pt(7.8) # 对标模板 7.8pt 呼吸留白
    p.paragraph_format.first_line_indent = Pt(24.0) # 对标模板 24pt 首行缩进两个汉字
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY # 两端对齐
    
    if bold_prefix:
        r_pre = p.add_run(bold_prefix)
        r_pre.font.name = 'SimSun'
        r_pre._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r_pre.font.size = Pt(12) # 小四号 12pt
        r_pre.font.bold = True
        r_pre.font.color.rgb = RGBColor(30, 30, 30)
    run = p.add_run(text)
    run.font.name = 'SimSun'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(12) # 小四号 12pt (对标模板)
    run.font.color.rgb = RGBColor(40, 40, 40)
    return p

def add_bullet_item(doc, text, bold_prefix=None):
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.25
    p.paragraph_format.space_before = Pt(0)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.first_line_indent = Pt(24.0) # 首行缩进
    p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    
    # 前缀引导圆点
    r_dot = p.add_run("● ")
    r_dot.font.name = 'SimSun'
    r_dot.font.size = Pt(9)
    r_dot.font.color.rgb = RGBColor(41, 128, 185)
    
    if bold_prefix:
        r_pre = p.add_run(bold_prefix)
        r_pre.font.name = 'SimSun'
        r_pre._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r_pre.font.size = Pt(12)
        r_pre.font.bold = True
        r_pre.font.color.rgb = RGBColor(30, 30, 30)
    run = p.add_run(text)
    run.font.name = 'SimSun'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(12)
    run.font.color.rgb = RGBColor(40, 40, 40)
    return p

def add_image_figure(doc, img_name, caption, width=Inches(5.4)):
    img_path = os.path.join(IMG_DIR, img_name)
    if os.path.exists(img_path):
        p_img = doc.add_paragraph()
        p_img.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_img.paragraph_format.space_before = Pt(10)
        p_img.paragraph_format.space_after = Pt(4)
        p_img.paragraph_format.first_line_indent = Pt(0)
        run_img = p_img.add_run()
        run_img.add_picture(img_path, width=width)
        
        p_cap = doc.add_paragraph()
        p_cap.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_cap.paragraph_format.space_before = Pt(2)
        p_cap.paragraph_format.space_after = Pt(12)
        p_cap.paragraph_format.first_line_indent = Pt(0)
        p_cap.paragraph_format.keep_with_next = True
        run_cap = p_cap.add_run(caption)
        run_cap.font.name = 'SimHei'
        run_cap._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        run_cap.font.size = Pt(10.5) # 五号 10.5pt 加粗居中
        run_cap.font.bold = True
        run_cap.font.color.rgb = RGBColor(60, 60, 60)
    else:
        print(f"Warning: Image file not found: {img_path}")

def add_table_data(doc, headers, data):
    t = doc.add_table(rows=len(data) + 1, cols=len(headers))
    t.alignment = WD_TABLE_ALIGNMENT.CENTER
    t.autofit = True
    
    # 表头
    hdr_cells = t.rows[0].cells
    for i, h in enumerate(headers):
        hdr_cells[i].text = h
        p = hdr_cells[i].paragraphs[0]
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p.paragraph_format.space_before = Pt(4)
        p.paragraph_format.space_after = Pt(4)
        p.paragraph_format.first_line_indent = Pt(0)
        for r in p.runs:
            r.font.name = 'SimHei'
            r._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
            r.font.size = Pt(10)
            r.font.bold = True
            r.font.color.rgb = RGBColor(255, 255, 255)
        set_cell_background(hdr_cells[i], "2874A6")
        set_cell_margins(hdr_cells[i], top=120, bottom=120, left=140, right=140)
        
    for r_idx, row in enumerate(data):
        row_cells = t.rows[r_idx + 1].cells
        for c_idx, val in enumerate(row):
            row_cells[c_idx].text = val
            p = row_cells[c_idx].paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.LEFT if c_idx > 1 else WD_ALIGN_PARAGRAPH.CENTER
            p.paragraph_format.space_before = Pt(3)
            p.paragraph_format.space_after = Pt(3)
            p.paragraph_format.first_line_indent = Pt(0)
            for r in p.runs:
                r.font.name = 'SimSun'
                r._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
                r.font.size = Pt(9.5)
            if r_idx % 2 == 1:
                set_cell_background(row_cells[c_idx], "F8F9F9")
            set_cell_margins(row_cells[c_idx], top=80, bottom=80, left=120, right=120)
            
    doc.add_paragraph().paragraph_format.space_after = Pt(6)

def generate_fully_formatted_manual():
    doc = docx.Document()
    add_header_footer(doc)
    
    # ========================== 1. 封面（对标《用户说明书模板.docx》的42pt/48pt大字号与大气排版） ==========================
    p_cov_sp1 = doc.add_paragraph()
    p_cov_sp1.paragraph_format.space_before = Pt(80)
    p_cov_sp1.paragraph_format.first_line_indent = Pt(0)
    
    # 软件名称 V2.0 (42pt，对标模板)
    p_title = doc.add_paragraph()
    p_title.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_title.paragraph_format.space_before = Pt(0)
    p_title.paragraph_format.space_after = Pt(16)
    p_title.paragraph_format.first_line_indent = Pt(0)
    r_t = p_title.add_run("基于多模态AI的心理健康管理APP\n[简称：心晴AI] V2.0.0")
    r_t.font.name = 'SimHei'
    r_t._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_t.font.size = Pt(36) # 大气视觉排版
    r_t.font.bold = True
    r_t.font.color.rgb = RGBColor(27, 79, 114) # 科技深蓝
    
    # 用户说明书 (48pt，对标模板)
    p_sub = doc.add_paragraph()
    p_sub.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_sub.paragraph_format.space_before = Pt(16)
    p_sub.paragraph_format.space_after = Pt(24)
    p_sub.paragraph_format.first_line_indent = Pt(0)
    r_sub = p_sub.add_run("用户操作说明书")
    r_sub.font.name = 'SimHei'
    r_sub._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_sub.font.size = Pt(44) # 初号大字
    r_sub.font.bold = True
    r_sub.font.color.rgb = RGBColor(21, 67, 96)
    
    p_type = doc.add_paragraph()
    p_type.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_type.paragraph_format.space_before = Pt(0)
    p_type.paragraph_format.space_after = Pt(100) # 优雅视觉留白
    p_type.paragraph_format.first_line_indent = Pt(0)
    r_type = p_type.add_run("(计算机软件著作权登记鉴定材料)")
    r_type.font.name = 'SimSun'
    r_type._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_type.font.size = Pt(14)
    r_type.font.color.rgb = RGBColor(120, 120, 120)
    
    # 元信息区块
    p_meta = doc.add_paragraph()
    p_meta.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_meta.paragraph_format.space_before = Pt(0)
    p_meta.paragraph_format.space_after = Pt(20)
    p_meta.paragraph_format.first_line_indent = Pt(0)
    p_meta.paragraph_format.line_spacing = 1.5
    
    meta_info = [
        ("著作权人（申请人）：", "陈海丰\n"),
        ("软件全称：", "基于多模态AI的心理健康管理APP\n"),
        ("软件简称：", "心晴AI\n"),
        ("版本型号：", "V2.0.0\n"),
        ("有效代码量：", "48,560 行\n"),
        ("开发完成日期：", "2026年\n")
    ]
    for k, v in meta_info:
        r1 = p_meta.add_run(k)
        r1.font.name = 'SimHei'
        r1._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r1.font.size = Pt(11)
        r1.font.bold = True
        r1.font.color.rgb = RGBColor(50, 50, 50)
        r2 = p_meta.add_run(v)
        r2.font.name = 'SimSun'
        r2._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r2.font.size = Pt(11)
        r2.font.color.rgb = RGBColor(60, 60, 60)
        
    doc.add_page_break()
    
    # ========================== 2. 目录页（居中目  录 + 超链接TOC） ==========================
    p_toc_head = doc.add_paragraph()
    p_toc_head.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_toc_head.paragraph_format.space_before = Pt(16)
    p_toc_head.paragraph_format.space_after = Pt(16)
    p_toc_head.paragraph_format.first_line_indent = Pt(0)
    r_toc_h = p_toc_head.add_run("目  录")
    r_toc_h.font.name = 'SimHei'
    r_toc_h._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_toc_h.font.size = Pt(18)
    r_toc_h.font.bold = True
    r_toc_h.font.color.rgb = RGBColor(21, 67, 96)
    
    # 插入标准带超链接可跳转的 TOC 域
    p_toc = doc.add_paragraph()
    p_toc.paragraph_format.first_line_indent = Pt(0)
    r_fld = p_toc.add_run()
    fldChar1 = parse_xml(r'<w:fldChar %s w:fldCharType="begin"/>' % nsdecls('w'))
    instrText = parse_xml(r'<w:instrText %s xml:space="preserve"> TOC \o "1-3" \h \z \u </w:instrText>' % nsdecls('w'))
    fldChar2 = parse_xml(r'<w:fldChar %s w:fldCharType="separate"/>' % nsdecls('w'))
    fldChar3 = parse_xml(r'<w:fldChar %s w:fldCharType="end"/>' % nsdecls('w'))
    r_fld._r.append(fldChar1)
    r_fld._r.append(instrText)
    r_fld._r.append(fldChar2)
    r_fld._r.append(fldChar3)
    
    doc.add_page_break()
    
    # ========================== 第1章 系统概述与技术背景 ==========================
    add_heading1(doc, "第1章 系统概述与技术背景")
    
    add_heading2(doc, "1.1 软件定位与研发背景")
    add_heading3(doc, "1.1.1 现代心理健康数字化管理现状")
    add_body_paragraph(doc, "随着当代社会生活节奏的不断加快，公众面临的职场压力、学业竞争及生活焦虑等心理亚健康问题呈现普遍化、年轻化态势。然而，传统的心理健康管理与临床筛查模式高度依赖面对面访谈与纸质自评量表，存在'主动求诊率低'、'心理病耻感严重'、'主观评测易受刻意隐瞒影响'以及'缺乏连续生理体征客观佐证'等多重局限。因此，研发能够融合客观生理体征与主观心理多模态数据的智能化心理健康管理系统，具有突出的现实价值与临床转化意义。")
    
    add_heading3(doc, "1.1.2 多模态身心健康协同监测闭环")
    add_body_paragraph(doc, "《基于多模态AI的心理健康管理APP》（简称：心晴AI）V2.0.0正是针对上述痛点设计研发的创新型身心健康数字化平台。软件独创性地构建了'客观连续生理体征采集 + 房树人(HTP)无意识主观投射测验 + 动态生态瞬时情绪追踪(EMA) + 临床标准化量表筛查 + 全天候大模型流式共情陪伴 + 医生端临床随访干预'的全链条闭环体系，实现了从单一问卷测评向身心全息协同评估的技术跨越。")
    
    add_heading2(doc, "1.2 软件独创性与核心技术代表性")
    add_heading3(doc, "1.2.1 客观生理与主观心理多模态融合模型")
    add_body_paragraph(doc, "本软件摆脱了传统心理APP仅靠文字量表的局限，通过引入智能穿戴手环（Garmin Connect API），实现对心率变异性(HRV)、静息心率(RHR)、深浅睡眠分期、夜间血氧饱和度(SpO2)及身体电量(Body Battery)的连续时序追踪。利用多模态融合数学算法，将客观生理数据与主观心理数据进行加权融合评分，精准量化自主神经系统与心理应激状态的动态关联，生成直观反映机体机能与心理抗压能力的综合六维雷达图。")
    
    add_heading3(doc, "1.2.2 房树人(HTP)图像量化投射测验创新")
    add_body_paragraph(doc, "系统自研了移动端触控手绘板与AI图像多模态量化分析引擎。用户在手绘板上自由创作房屋、树木、人物画作，系统后台AI模型基于色彩学分布、九宫格构图比例、笔触粗细力度、线条连贯度等六大投射心理学维度进行智能特征提取，自动输出包含倾向性心理特征解析与干预建议的专业测评报告，有效突破了受试者的防御心理。")
    
    add_heading3(doc, "1.2.3 基于大语言模型的全天候共情陪伴交互")
    add_body_paragraph(doc, "系统内嵌'心晴AI'心理助手，深度整合MiniMax-M2.5等先进大语言模型，并结合专业心理咨询伦理与CBT（认知行为疗法）倾听重构Prompt工程进行微调。同时集成StepFun女声高保真语音合成（TTS），支持语音输入、双向情感共情对话、危机言语敏感过滤与即时心理援助弹窗，为用户提供7×24小时有温度的安全倾诉空间。")
    
    add_heading2(doc, "1.3 运行环境与安装部署配置")
    add_heading3(doc, "1.3.1 客户端运行软硬件环境要求")
    add_body_paragraph(doc, "客户端基于uni-app跨平台技术构建，全面兼容移动端原生App与移动Web (H5)端。推荐配置如下表所示：")
    add_table_data(doc, 
        ["配置项目", "最低配置要求", "推荐运行配置", "备注说明"],
        [
            ["操作系统", "Android 8.0 / iOS 13.0+", "Android 10.0+ / iOS 15.0+", "支持全系主流智能手机"],
            ["处理器(CPU)", "四核 1.8 GHz 以上", "八核 2.4 GHz 以上", "保证Canvas触控与ECharts流畅渲染"],
            ["运行内存(RAM)", "3 GB", "6 GB 及以上", "保障流式对话与后台生理同步稳定"],
            ["存储空间", "预留 500 MB 可用空间", "预留 2 GB 可用空间", "用于本地音频缓存与离线画作临时存储"],
            ["网络环境", "3G / 4G / Wi-Fi", "5G / 高速Wi-Fi", "保障多模态数据与AI流式响应低延迟"],
            ["外设支持", "麦克风、触控屏", "支持BLE蓝牙手环/Garmin账号", "用于手绘板输入与手环数据云端授权"]
        ]
    )
    
    add_heading3(doc, "1.3.2 服务端部署环境与数据安全规范")
    add_body_paragraph(doc, "服务端基于Spring Boot 2.3.4企业级微服务框架与Python 3.10数据管道协同架构，支持高并发、高可用集群部署：")
    add_bullet_item(doc, "操作系统：Linux (Ubuntu 20.04 LTS / CentOS 7.9+ / Debian 11)；", "核心环境：")
    add_bullet_item(doc, "JDK 1.8_u201+ / OpenJDK 11，采用HikariCP/Druid连接池保证数据库吞吐；", "后端引擎：")
    add_bullet_item(doc, "MySQL 8.0+（InnoDB引擎，全库采用utf8mb4字符集），Redis 6.0+（缓存鉴权会话与流式上下文）；", "数据存储：")
    add_bullet_item(doc, "Python 3.10+，集成garminconnect SDK，部署常驻定时同步Cron守护任务；", "生理同步引擎：")
    add_bullet_item(doc, "全站强制采用TLS 1.3/HTTPS协议，通信端到端加密，数据库关键敏感字段经AES-256密文托管。", "安全传输协议：")
    
    # ========================== 第2章 系统架构与账户认证体系 ==========================
    add_heading1(doc, "第2章 系统架构与账户认证体系")
    
    add_heading2(doc, "2.1 整体业务功能架构")
    add_heading3(doc, "2.1.1 多模态协同分层技术架构")
    add_body_paragraph(doc, "系统整体划分为五大逻辑层次：基础设施层（物理硬件与云端算力）、生理感知采集层（智能手环与日常生理打卡）、多模态AI算法服务层（HTP图像量化、大模型对话、NLP情绪极性分析、量表规则引擎）、业务应用逻辑层（用户管理、医患协同、报告生成、预警中心）以及多端展示交互层（移动端App/H5、医生工作台Web后台）。各层之间通过RESTful API与WebSocket高内聚低耦合通信，确保系统高扩展性与极佳稳定性。")
    
    add_heading3(doc, "2.1.2 客户端界面布局与交互导航")
    add_body_paragraph(doc, "客户端采用符合现代移动人机交互规范的底部TabBar多标签导航结构，主要分为四大核心业务主界面：'首页中央控制台'、'AI评估中心'、'疗愈空间'以及'我的中心'。布局清爽雅致，操作逻辑清晰明了，界面如下图所示：")
    add_image_figure(doc, "image1.jpeg", "图1 客户端界面布局图")
    add_body_paragraph(doc, "顶部常驻双语切换与状态提示栏，中间主体区域通过卡片式模块承载业务功能，底部导航栏各Tab具备生动的高亮交互状态。")
    
    add_heading2(doc, "2.2 官网发布与安装接入")
    add_heading3(doc, "2.2.1 官网发布页功能与下载引导")
    add_body_paragraph(doc, "平台设立了现代化的3D官网宣传发布页（welcome.html），集成了平台定位介绍、核心功能三维轮播卡片、多模态健康雷达图动态模拟以及官方安装包下载入口。用户可通过扫描发布页二维码或点击直接下载Android APK安装文件，或一键直达移动H5免安装轻量端，如下图所示：")
    add_image_figure(doc, "image2.png", "图2 官网发布界面图")
    
    add_heading3(doc, "2.2.2 移动端APK安装与权限初始化")
    add_body_paragraph(doc, "安装与首次运行指导如下：")
    add_bullet_item(doc, "下载官方发布的.apk安装包，在手机设置中开启'允许安装来自此来源的应用'；", "安装步骤：")
    add_bullet_item(doc, "点击安装并启动应用，系统将展示隐私政策与用户协议摘要；", "运行同意：")
    add_bullet_item(doc, "首次进入时系统会依次请求'存储空间写入'（用于保存绘图与生成报告）、'麦克风录音'（用于与心晴AI语音倾诉）及'网络访问'权限，用户点击'始终允许'即可完成初始化。", "权限授予：")
    
    add_heading2(doc, "2.3 身份认证与权限管理")
    add_heading3(doc, "2.3.1 手机号注册与密码加密存储")
    add_body_paragraph(doc, "系统提供规范安全的注册与登录鉴权界面。新用户点击'立即注册'，输入有效手机号码、设置高强度登录密码并输入姓名等基本信息，即可完成账号创建。所有用户密码在传输过程中经前端加密，到达服务端后经BCrypt哈希加盐单向加密后存入数据库，杜绝明文泄露隐患，如下图所示：")
    add_image_figure(doc, "image3.jpeg", "图3 注册与登录图")
    
    add_heading3(doc, "2.3.2 登录鉴权与JWT双重令牌机制")
    add_body_paragraph(doc, "系统采用行业前沿的双Token鉴权机制：用户登录成功后，服务端颁发短期Access Token（用于常规API接口调用）与长期Refresh Token（用于无感刷新）。Token内部携带脱敏的用户唯一标识符与角色权限掩码，在客户端本地安全存储。每次接口调用由HTTP Header Authorization携带，由服务端拦截器进行动态验签，保障账户会话高可靠与高安全。")
    
    add_heading3(doc, "2.3.3 医患协同关联与邀请码绑定机制")
    add_body_paragraph(doc, "为实现临床随访与专业医疗干预闭环，系统设立了'医生专属邀请码'绑定通道。就诊患者在个人设置中输入主管医生提供的6位专属防伪邀请码，即可瞬间与该医生的后台管理工作台建立数据安全通道。绑定后，患者的主动评测数据与手环客观生理指标将匿名化同步至医生端，供医护人员进行临床分析与干预指导。")
    
    # ========================== 第3章 首页中央控制台与日常状态监测 ==========================
    add_heading1(doc, "第3章 首页中央控制台与日常状态监测")
    
    add_heading2(doc, "3.1 首页中央控制台功能布局")
    add_heading3(doc, "3.1.1 状态大屏与综合健康指数卡片")
    add_body_paragraph(doc, "首页作为用户日常管理身心状态的'中央控制大屏'，汇聚了最关键的身心状态信息。大屏顶部卡片动态展示用户当天的综合健康指数（基于昨日生理指标与近期心理测评融合打分）、最近一次手环数据同步时间戳以及今日填报提示，界面如下图所示：")
    add_image_figure(doc, "image4.jpeg", "图4 首页大屏与日常填报图")
    
    add_heading3(doc, "3.1.2 核心业务模块快捷入口导航")
    add_body_paragraph(doc, "首页中部采用清爽的四格卡片式快捷入口设计，分别对应：")
    add_bullet_item(doc, "一键直达房树人画布测验与量表大厅；", "健康评估入口：")
    add_bullet_item(doc, "实时查看手环同步的步数、心率、睡眠及血氧明细折线；", "手环数据看板：")
    add_bullet_item(doc, "支持半结构化访谈与微情绪记录；", "迷你访谈中心：")
    add_bullet_item(doc, "快速开启心晴AI陪伴、情绪日记与减压游戏。", "疗愈空间捷径：")
    
    add_heading2(doc, "3.2 每日状态填报与连续性监测")
    add_heading3(doc, "3.2.1 快速状态采集项目")
    add_body_paragraph(doc, "为捕捉用户日常细微的情绪起伏与躯体机能变化，系统设计了极简高效的'每日日常填报'机制。用户每天仅需花费不到1分钟，即可完成以下六大核心指标的登记：")
    add_bullet_item(doc, "采用5级脸谱选择（从'极差/失眠'到'极好/深度酣睡'）；", "睡眠质量评估：")
    add_bullet_item(doc, "快速标记今日食欲偏好及进食规律度；", "食欲状况登记：")
    add_bullet_item(doc, "评估当前身体疲倦度或活力指数（1-5分）；", "精力充沛水平：")
    add_bullet_item(doc, "登记主要心境极性（平静、愉快、压抑、焦虑、烦躁）；", "情绪主导色彩：")
    add_bullet_item(doc, "勾选是否有头痛、胸闷、胃痛等躯体化症状，并记录遵医嘱用药情况。", "躯体不适与用药：")
    
    add_heading3(doc, "3.2.2 填报状态动态解锁机制")
    add_body_paragraph(doc, "每日状态填报遵循'一日一填、过期锁定'的时序连续性规则。用户完成当天填报后，首页卡片右上角徽章由橙色'待完成'即刻变为绿色'今日已完成'，并动态累加连续打卡天数，激发用户的日常健康管理依从性。")
    
    add_heading3(doc, "3.2.3 消息推送提醒与依从性管理")
    add_body_paragraph(doc, "为防止用户遗忘填报造成数据断层，系统集成极光推送（JPush）与主流手机厂商通道。服务端定时任务每日晚间21:00自动扫描未完成填报的用户，下发一条温馨定制的推送提醒：'心晴AI提醒您：忙碌了一天，花1分钟记录今晚的身心状态吧~'。用户点击通知即可直接唤起App直达填报界面。")
    
    # ========================== 第4章 HTP房树人AI智能投射测评 ==========================
    add_heading1(doc, "第4章 HTP房树人AI智能投射测评（核心独创模块）")
    
    add_heading2(doc, "4.1 房树人投射心理学测验原理")
    add_heading3(doc, "4.1.1 投射测验的心理动力学机制")
    add_body_paragraph(doc, "房树人测验（House-Tree-Person Test, HTP）是心理学界公认最权威、应用最广泛的经典投射性心理测验之一。基于心理动力学理论，受测者在绘制无固定标准的房、树、人画面时，会绕开潜意识层面的理性防御机制，不知不觉地将内心的真实人格特质、潜意识冲突、情感诉求以及人际关系模式投射于纸面。")
    
    add_heading3(doc, "4.1.2 房、树、人意象与心理投射对应关系")
    add_body_paragraph(doc, "画面三大意象在心理学上具有明确的表征意义：")
    add_bullet_item(doc, "表征受测者对家庭环境的认知、内心情感安全感的归属以及与家庭成员的亲密/疏离关系；", "房屋意象（House）：")
    add_bullet_item(doc, "表征个人的成长轨迹、深层潜意识生命力、直面挫折的心理韧性以及自我的能量充盈度；", "树木意象（Tree）：")
    add_bullet_item(doc, "表征受测者的真实自我形象、现实人格认同、社会适应能力以及在人际交往中的防御姿态。", "人物意象（Person）：")
    
    add_heading2(doc, "4.2 多点触控手绘板交互与绘制操作")
    add_heading3(doc, "4.2.1 画布工具栏交互与手绘操作")
    add_body_paragraph(doc, "系统在移动端量身打造了一套高性能纯原生Canvas手绘引擎。手绘板提供丰富的交互调控工具栏，界面如下图所示：")
    add_image_figure(doc, "image5.jpeg", "图5 AI评估房树人画画测评图")
    add_bullet_item(doc, "提供包含经典黑、深灰、暖红、嫩绿、天空蓝、明黄、粉紫等多种心理学情绪调色选项，允许用户自由挑选色彩意象；", "调色盘拾色器：")
    add_bullet_item(doc, "提供细线（勾勒细节）、中线（主体绘制）、粗线（大面积涂色）三级画笔粗细自适应调节；", "画笔粗细调节：")
    add_bullet_item(doc, "支持局部橡皮擦擦除修改，并支持多步绘制历史'撤销'与'重做'功能，右下角提供'一键清空重画'保护按钮。", "橡皮擦与撤回：")
    
    add_heading3(doc, "4.2.2 绘制规范、步骤引导与作品提交")
    add_body_paragraph(doc, "在绘制前，系统通过醒目的文字向用户说明操作指引：'请在同一张画布上，按照您的直觉和想象自由绘制房屋、树木和人物，画作没有美丑好坏之分，完全随心绘制即可'。绘制完成后，用户点击右侧'提交测评'按钮，Canvas画布即刻被捕获为高清Base64图像流，经前端无损压缩后上传至后端AI视觉微服务。")
    
    add_heading2(doc, "4.3 AI视觉多模态特征量化分析流水线")
    add_heading3(doc, "4.3.1 画面色彩分布与情感倾向建模")
    add_body_paragraph(doc, "后端AI视觉分析流水线首先对画作进行像素级色彩直方图统计，计算冷色调（蓝、绿、灰、黑）与暖色调（红、橙、黄、粉）的像素占比。心理学研究表明：暖色调为主通常反映积极外向、情感渴望；大面积冷色或单调黑色则可能表征抑郁倾向、情绪退缩或防御冷漠。模型通过色彩熵算法量化用户的整体情感基调。")
    
    add_heading3(doc, "4.3.2 构图空间布局与物体比例解析")
    add_body_paragraph(doc, "流水线采用空间几何拓扑算法，将画面划分为经典的'九宫格'与'四象限'：")
    add_bullet_item(doc, "画面偏左通常投射对过去的留恋、内倾性与母亲依恋；画面偏右投射对未来的期待、外向性与父亲认同；", "左右方位解析：")
    add_bullet_item(doc, "画面偏上反映幻想倾向、追求精神超脱；画面紧贴底边反映追求现实安全感或存在抑郁沉重感；", "上下方位解析：")
    add_bullet_item(doc, "解析房屋、树木与人物三者之间的面积比例，例如人物过于微小往往反映自信心不足或自卑无助感。", "相对比例解析：")
    
    add_heading3(doc, "4.3.3 笔触粗细与线条力度心理特征提取")
    add_body_paragraph(doc, "系统在手绘采集过程中同步记录画笔触控时长、移动速度与线段重叠密度。AI模型据此提取笔触力度特征：断续迟疑的轻细线条往往映射焦虑敏感与犹豫不决；反复涂黑、重度加粗的坚硬线条则可能表征攻击性冲动、强迫性或高度内心紧张。")
    
    add_heading2(doc, "4.4 六维度AI心理测评报告解读与干预")
    add_heading3(doc, "4.4.1 六维量化雷达与维度得分说明")
    add_body_paragraph(doc, "AI分析引擎综合上述特征，计算生成六大维度的量化百分制得分，并生成多维特征雷达图：")
    add_table_data(doc,
        ["评估维度", "分值区间", "心理学评估含义", "典型特征对应示例"],
        [
            ["家庭归属感", "0 - 100", "反映对家庭温暖的体验及安全感", "门窗开阔、烟囱有烟 -> 归属感高；门窗缺失紧闭 -> 封闭孤立"],
            ["心理弹性", "0 - 100", "面对逆境时的心理复原力与生命力", "树干粗壮、树冠繁茂 -> 弹性充沛；树干枯萎截断 -> 创伤受损"],
            ["社交意愿", "0 - 100", "对外人际交往的渴望度与接纳度", "人物面容微笑、四肢舒展 -> 社交积极；无手无脸 -> 社交退缩"],
            ["情绪稳定性", "0 - 100", "内在情绪波动的自我调控能力", "线条流畅适度、色彩平衡 -> 稳定平衡；线条凌乱剧烈 -> 躁动波动"],
            ["认知效能", "0 - 100", "思维条理性、现实感与认知清晰度", "结构逻辑分明、比例谐调 -> 效能良好；画面杂乱瓦解 -> 认知分歧"],
            ["焦虑指征", "0 - 100", "内心潜在的应激紧张与焦虑强度", "反复涂黑、尖锐阴影 -> 焦虑偏高；舒缓无过多重绘 -> 平静安详"]
        ]
    )
    
    add_heading3(doc, "4.4.2 倾向性心理特征提示与辅助干预建议")
    add_body_paragraph(doc, "在量化雷达下方，报告自动生成图文结合的专家级结论解读（如：'本次HTP测评显示您当前整体情绪平稳，但在人际边界方面表现出一定的敏感防御，建议尝试多接触大自然，释放工作压力'）。评测结论同步存入用户身心档案，为后续心理陪伴与医生端干预提供坚实的参考基准。")
    
    # ========================== 第5章 Garmin智能手环多模态生理数据同步 ==========================
    add_heading1(doc, "第5章 Garmin智能手环多模态客观生理数据同步（核心独创模块）")
    
    add_heading2(doc, "5.1 智能穿戴客观生理监测机制")
    add_heading3(doc, "5.1.1 客观生理指标对心理评估的协同价值")
    add_body_paragraph(doc, "现代神经生物学研究证实，交感神经与副交感神经构成的自主神经系统是身心交互的直接桥梁。个体在遭受心理应激、焦虑抑郁或精神疲劳时，必然伴随着静息心率升高、心率变异性(HRV)下降、深睡眠被抑制及夜间低氧等外在生理体征。将智能手环的连续客观生理指标引入心理健康管理，彻底颠覆了以往'仅凭患者主观陈述'的单一测评模式，实现了身心共验的重大技术革新。")
    
    add_heading3(doc, "5.1.2 Garmin Connect云端API对接与账号授权")
    add_body_paragraph(doc, "心晴AI系统全面支持全球领先的专业健康可穿戴品牌Garmin（佳明）。在移动端'手环数据'看板中，系统提供专属绑定弹窗，用户输入自己的Garmin Connect云端账号与密码，系统后台通过高强度加密通道与Garmin海外官方云端建立OAuth授权管道，如下图所示：")
    add_image_figure(doc, "image6.jpeg", "图6 手环数据同步图")
    
    add_heading3(doc, "5.1.3 自动化数据调度同步与脏数据清洗")
    add_body_paragraph(doc, "平台在服务端后台部署了高性能Python调度守护程序，每小时定时自动向Garmin Connect同步用户的全天候多生理健康指标。针对由于佩戴脱落、网络延迟等偶发情况导致的离群值、零值或格式异常，系统设计了严密的数据清洗与插值校正算法，确保录入数据库的时序指标100%真实连贯可用。")
    
    add_heading2(doc, "5.2 核心生理健康指标多维分析")
    add_heading3(doc, "5.2.1 24小时心率与静息心率(RHR)趋势监测")
    add_body_paragraph(doc, "系统以高频采样点绘制用户全天24小时心率连续起伏折线，并智能提取清晨清醒瞬间的'静息心率(Resting Heart Rate, RHR)'。临床表明：当用户近期承受持续心理重压时，静息心率往往持续偏高；反之在情绪放松状态下则回归健康基线。系统提供过去30天RHR演变走势图，直观展现心率基线的动态改善过程。")
    
    add_heading3(doc, "5.2.2 睡眠结构分期(深睡/浅睡/REM)与睡眠评分")
    add_body_paragraph(doc, "系统深入解析用户整夜睡眠架构，将总睡眠时长精确划分为三大生理分期：")
    add_bullet_item(doc, "体能自我修复与机体组织再生的黄金阶段，深睡时长不足容易诱发白天倦怠与免疫下降；", "深度睡眠(Deep Sleep)：")
    add_bullet_item(doc, "快速眼球运动期，大脑在此时期加工情绪体验与长时记忆，REM被严重剥夺是焦虑抑郁的显著前驱指征；", "快速眼动(REM)：")
    add_bullet_item(doc, "睡眠过渡期与微觉醒记录，综合计算生成0-100分的整体睡眠质量指数。", "浅睡与清醒(Light/Awake)：")
    
    add_heading3(doc, "5.2.3 夜间血氧饱和度(SpO2)与低氧风险预警")
    add_body_paragraph(doc, "利用手环红光与红外传感器，连续检测夜间外周血氧饱和度。正常成人血氧应稳定在95%-100%之间；若在睡眠期间检测到血氧骤降至90%以下且伴随微觉醒，系统将智能标记'低氧风险指征'，提示用户警惕阻塞性睡眠呼吸暂停综合征(OSAHS)，并建议必要时就医筛查。")
    
    add_heading3(doc, "5.2.4 心率变异性(HRV)压力指数与身体电量(Body Battery)")
    add_body_paragraph(doc, "心晴AI系统深度挖掘佳明独创的两大核心生理算法：")
    add_bullet_item(doc, "基于逐次心跳间期(R-R间期)微小变化的变异性计算，反映交感神经应激程度。0-25为平静放松，26-50为低度压力，51-75为中度压力，76-100为重度应激；", "全天HRV压力指数：")
    add_bullet_item(doc, "将睡眠充能与日常活动、压力消耗融为一体的综合体力量化指标。满电100代表体能充沛，电量跌破20提示身体处于透支耗竭状态，系统自动发出休息放松提示。", "身体电量(Body Battery)：")
    
    add_heading2(doc, "5.3 生理历史数据看板与趋势对比")
    add_heading3(doc, "5.3.1 多周期(7天/14天/30天)数据自适应切换")
    add_body_paragraph(doc, "在手环看板的'历史数据'模块中，用户可通过顶部的快捷周期切换器，一键自适应查看近7天、近14天或近30天的全周期生理演化全景。界面支持横向滑动在心率、睡眠、步数、电量、压力及血氧等6大维度之间平滑切换。")
    
    add_heading3(doc, "5.3.2 动态指标对比与异常生理峰值高亮")
    add_body_paragraph(doc, "系统在趋势柱状图与曲线图上创新采用了'峰值胶囊标签'高亮设计。当某一天睡眠极度欠缺或压力达到重度峰值时，该柱体将自动亮起橙色警示标识，点击柱体即可在下方明细卡片中展开该日的具体指标数值与健康成因解读。")
    
    # ========================== 第6章 疗愈空间与“心晴AI”全天候心理陪伴 ==========================
    add_heading1(doc, "第6章 疗愈空间与“心晴AI”全天候心理陪伴（核心独创模块）")
    
    add_heading2(doc, "6.1 疗愈空间综合交互生态")
    add_heading3(doc, "6.1.1 疗愈功能区架构与导航")
    add_body_paragraph(doc, "在客户端底部的'疗愈'主标签下，平台精心打造了一个集'情感倾诉、心境追踪、专注减压、正念调适'四位一体的沉浸式心理调适港湾。界面设计宁静淡雅，四大功能区一键直达，如下图所示：")
    add_image_figure(doc, "image7.jpeg", "图7 疗愈空间图")
    
    add_heading3(doc, "6.1.2 “评估-疗愈-追踪”闭环体验")
    add_body_paragraph(doc, "疗愈空间不仅是一个独立的交互模块，更与前端评估中心形成了强力联动。当用户在房树人或量表中被识别出焦虑情绪时，系统会自动在疗愈空间首页置顶推荐针对性的正念呼吸音频或启动心晴AI专项陪伴，形成'即评即疗、即疗即追踪'的智能化闭环。")
    
    add_heading2(doc, "6.2 “心晴AI”24小时流式心理陪伴")
    add_heading3(doc, "6.2.1 MiniMax大模型心理共情与倾听交互")
    add_body_paragraph(doc, "系统内嵌的'心晴AI'助手搭载了基于MiniMax-M2.5微调的心理咨询专业大模型。区别于普通通用问答机器人，心晴AI严格遵循现代心理咨询伦理规范，采用CBT认知行为疗法、以人为中心疗法的话术策略，具备极佳的'积极倾听'、'同理心共情'、'认知澄清'与'积极赋能'能力，支持打字与语音双向流式高速响应。")
    
    add_heading3(doc, "6.2.2 语音输入与高保真女声TTS语音合成")
    add_body_paragraph(doc, "为满足用户在情绪极度低落、疲惫懒得打字时的诉说需求，系统在对话框内置了便捷的麦克风长按语音录音转文字功能。同时深度集成StepFun stepaudio-2.5-tts高保真语音合成引擎，心晴AI的所有文字回复均可实时转化为温润细腻的'贴心邻家姐姐'音色流式朗读。界面上方贴心配备一键全局静音/开启扬声器切换按钮，并具备防重叠自动中断保护机制。")
    
    add_heading3(doc, "6.2.3 心理咨询伦理防护与危机情绪敏感情感审计")
    add_body_paragraph(doc, "安全是心理系统的最高底线。心晴AI后台设立了毫秒级双重情感安全审计过滤器。一旦在用户输入的对话或日记中检测到涉及'自杀'、'自残'、'轻生'等极端高危敏感词汇，系统将立即阻断通用生成式回复，并在对话界面最醒目位置弹出红色紧急心理援助弹窗，提供全国24小时免费心理危机干预热线（如希望24热线400-161-9995），并触发后台高危预警机制。")
    
    add_heading2(doc, "6.3 EMA生态瞬时情绪评估与情绪日记")
    add_heading3(doc, "6.3.1 PAM-16情绪矩阵脸谱点选与1-5级强度调节")
    add_body_paragraph(doc, "传统的每日单次评估无法捕捉日间剧烈的情绪起伏。为此，系统引入了生态瞬时评估技术（Ecological Momentary Assessment, EMA）。用户在一天中的任何时刻，均可随时打开情绪记录，从涵盖唤醒度与效价两个维度的PAM-16经典情绪脸谱矩阵中快速点选当前心境（如：欣喜、自豪、平静、郁闷、焦虑、无助等），并滑动调节1-5级情绪强度滑块。")
    
    add_heading3(doc, "6.3.2 富文本情绪日记记录与NLP情感极性演变")
    add_body_paragraph(doc, "点选情绪脸谱后，用户可自愿在富文本输入框中记录触发该情绪的具体生活事件或感悟。系统集成自研NLP情感极性分析算法，自动提取日记的积极/消极情绪得分与核心主题关键词，并在个人中心绘制出连续多日的情绪波动散点图与情感极性演变走势。")
    
    add_heading2(doc, "6.4 注意力减压互动与正念调适")
    add_heading3(doc, "6.4.1 认知重构与引导式正念冥想")
    add_body_paragraph(doc, "系统在冥想专区收录了多套专业音频：包括'3分钟深呼吸放松'、'睡前全身渐进式肌肉放松'以及'正念身体扫描'。配合舒缓的背景白噪音（如雨声、林间鸟鸣、海浪拍岸），帮助用户快速平复交感神经亢奋，改善睡眠入睡困难。")
    
    add_heading3(doc, "6.4.2 专注敏捷跑酷减压互动机制")
    add_body_paragraph(doc, "针对反刍思维严重、沉浸在负面杂念中的用户，系统引入了神庙逃亡风格轻量化跑酷减压互动（Temple Run 2 - Holi Festival）。通过上滑跳跃、下滑下蹲、左右转弯的高度敏捷操作，强迫大脑前额叶高度聚焦于当下视觉避障，打断反刍杂念，促进多巴胺分泌，有效缓解急性精神紧绷。")
    
    # ========================== 第7章 专业心理量表评估中心 ==========================
    add_heading1(doc, "第7章 专业心理量表评估中心")
    
    add_heading2(doc, "7.1 专业临床筛查量表测评")
    add_heading3(doc, "7.1.1 抑郁自评量表(SDS)测试与标准分换算")
    add_body_paragraph(doc, "抑郁自评量表（Self-Rating Depression Scale, SDS）由Zung编制，用于衡量抑郁状态的严重程度。量表包含20个评定项目（10项正向评分题与10项反向评分题），采用四级评分（1-没有或很少时间，4-绝大部分时间）。系统在答题完毕后自动计算粗分，并按公式：标准分 = 粗分 × 1.25 后取整。中国常模标准分临界值为53分：53-62分为轻度抑郁，63-72分为中度抑郁，73分及以上为重度抑郁。")
    
    add_heading3(doc, "7.1.2 焦虑自评量表(SAS)测试与分级界定")
    add_body_paragraph(doc, "焦虑自评量表（Self-Rating Anxiety Scale, SAS）包含20个反映主观焦虑体验的典型症状。系统自动完成反向题计分转换并换算标准分，中国常模临界值为50分：50-59分为轻度焦虑，60-69分为中度焦虑，70分以上为重度焦虑。系统以直观的彩色仪表盘呈现得分区间。")
    
    add_heading3(doc, "7.1.3 压力知觉量表(PSS)与症状自评量表(SCL-90)")
    add_body_paragraph(doc, "压力知觉量表（PSS-14）用于测量受测者对生活中不可预测、不可控制及超负荷情境的心理感受；SCL-90症状自评量表包含90个项目，涵盖躯体化、强迫症状、人际敏感、抑郁、焦虑、敌对、恐怖、偏执、精神病性等九大心理因子，为临床全景筛查提供详实客观的数据支撑。")
    
    add_heading2(doc, "7.2 综合健康与身心适应量表")
    add_heading3(doc, "7.2.1 匹兹堡睡眠质量指数(PSQI)深度测评")
    add_body_paragraph(doc, "匹兹堡睡眠质量指数（PSQI）用于评定最近1个月的睡眠质量。量表包含主观睡眠质量、入睡时间、睡眠时间、睡眠效率、睡眠障碍、催眠药物使用及日间功能障碍等7个因子，总分0-21分。总分>7分提示存在明显睡眠质量问题，与手环客观睡眠分期形成完美互证。")
    
    add_heading3(doc, "7.2.2 心理韧性量表(CD-RISC)与躯体化感知")
    add_body_paragraph(doc, "CD-RISC心理韧性量表评估个体在逆境中的抗压复原力；同时配合MAIA-2多维度内感受觉知量表与IPAQ体力活动量表，全方位评估受测者的身心适应能力。")
    
    add_heading2(doc, "7.3 答题防作弊与自动化诊断报告生成")
    add_heading3(doc, "7.3.1 答题逻辑一致性校验与防漏填控制")
    add_body_paragraph(doc, "在答题交互界面，系统设计了严密的交互控制：必须完成当前题目方可进入下一题或提交；在后台设有作答时间阈值与反向题一致性逻辑校验，防止乱点盲填等无效答卷。")
    
    add_heading3(doc, "7.3.2 诊断报告智能生成与历史演变趋势")
    add_body_paragraph(doc, "提交答卷后，系统仅需1秒即可生成专属图文测评报告：展示量表总分、标准分、因子分明细柱状图、临床意义诊断评语及科学调适方案，并支持在历史列表中查看历次测评的走势对比折线。")
    
    # ========================== 第8章 多维度综合健康报告与智能预警 ==========================
    add_heading1(doc, "第8章 多维度综合健康报告与智能预警")
    
    add_heading2(doc, "8.1 多模态身心融合评估模型")
    add_heading3(doc, "8.1.1 生理客观指标与心理主观评估权重融合")
    add_body_paragraph(doc, "心晴AI系统的核心技术壁垒在于其独特的多模态特征加权融合评估模型。系统摒弃了单一维度的片面判断，将多模态数据按严密的科学权重归一化加权：")
    add_bullet_item(doc, "占比40%，涵盖静息心率偏离度、HRV压力均值、深睡占比及血氧稳定性；", "客观手环生理特征：")
    add_bullet_item(doc, "占比40%，涵盖SDS/SAS标准分、PSQI睡眠指数及房树人AI六维量化得分；", "主观心理投射与量表：")
    add_bullet_item(doc, "占比20%，涵盖连续每日状态打卡依从性及EMA瞬时情绪积极比率。", "日常状态与生态追踪：")
    
    add_heading3(doc, "8.1.2 0-100分身心综合健康指数计算公式")
    add_body_paragraph(doc, "系统通过多维特征矩阵标准化归一计算，最终输出一个直观的0-100分'身心综合健康总分'。85-100分为身心极佳状态，70-84分为良好平稳状态，60-69分为亚健康状态，60分以下为身心高危应激状态。")
    
    add_heading2(doc, "8.2 六维能力雷达图全景呈现")
    add_heading3(doc, "8.2.1 六维指标量化模型与雷达图呈现")
    add_body_paragraph(doc, "在客户端'我的' -> '健康报告'中，系统将融汇贯通后的身心全貌绘制为权威的六维能力雷达图，界面如下图所示：")
    add_image_figure(doc, "image8.jpeg", "图8 多维度综合健康报告图")
    
    add_heading3(doc, "8.2.2 优势能力与短板识别可视化")
    add_body_paragraph(doc, "六维雷达图六大顶点分别为：")
    add_bullet_item(doc, "表征抗压心理复原力与挫折应对能力；", "心理弹性维度：")
    add_bullet_item(doc, "融合手环深浅睡与PSQI问卷评分；", "睡眠质量维度：")
    add_bullet_item(doc, "反映每日有效步数、运动消耗与机体活动水平；", "身体活动维度：")
    add_bullet_item(doc, "衡量全天心率变异性与抗焦虑自我调节能力；", "压力调适维度：")
    add_bullet_item(doc, "反映EMA瞬时心境及情绪日记积极偏向；", "情绪稳态维度：")
    add_bullet_item(doc, "整合静息心率基线与夜间血氧饱和度指标。", "生理机能维度：")
    add_body_paragraph(doc, "雷达图直观呈现用户的长板优势与短板软肋，避免了枯燥冰冷的数据罗列，赋予用户全息自我认知。")
    
    add_heading2(doc, "8.3 异常指标智能预警与分级响应")
    add_heading3(doc, "8.3.1 彩色高危预警徽章触发规则")
    add_body_paragraph(doc, "报告中设立了四级动态风险彩色徽章预警机制：")
    add_bullet_item(doc, "绿色徽章，各项指标处于健康基线，提示继续保持良好作息；", "正常绿色等级：")
    add_bullet_item(doc, "黄色徽章，出现偶发性晚睡或轻微情绪低落，提示适当放松休息；", "轻度关注等级：")
    add_bullet_item(doc, "橙色徽章，连续3天压力过高、深睡严重不足或SDS量表达到轻中度异常；", "中度警示等级：")
    add_bullet_item(doc, "红色高危徽章，出现严重低氧、SDS重度异常或触发危机敏感词，界面亮起高危报警并强化提示。", "重度预警等级：")
    
    add_heading3(doc, "8.3.2 就医指导与身心调节干预指引")
    add_body_paragraph(doc, "对于触发橙色或红色预警的用户，报告末尾将自动生成定制化的干预指引：包括推荐适用的正念调息课程、建议调整生活作息，并一键提供绑定医生的临床随访咨询通道或正规精神心理专科门诊就医指引。")
    
    # ========================== 第9章 医生端工作台与临床协同管理 ==========================
    add_heading1(doc, "第9章 医生端工作台与临床协同管理")
    
    add_heading2(doc, "9.1 医生工作台与患者管理")
    add_heading3(doc, "9.1.1 就诊患者列表与随访档案建立")
    add_body_paragraph(doc, "为实现医疗级身心监护，系统配备了基于LayuiMini构建的医生端专业Web工作台。医护人员登录后台后，可清晰查阅名下所有绑定就诊患者的列表清单、就诊病案号、绑定日期及近期活跃状态，支持多条件快捷检索与分组随访管理。")
    
    add_heading3(doc, "9.1.2 专属邀请码生成与患者身份绑定")
    add_body_paragraph(doc, "医生在后台可为新收治患者一键生成动态6位字母/数字专属邀请码。患者在App端输入该码即可建立专属绑定。医患双方数据交互遵循严格的医疗伦理，所有敏感个人身份信息在界面上均进行脱敏脱敏遮盖处理，保障患者隐私合规。")
    
    add_heading2(doc, "9.2 患者全景多模态档案穿透分析")
    add_heading3(doc, "9.2.1 手环生理指标时序曲线与异常标记")
    add_body_paragraph(doc, "医生点击任一患者，可穿透进入该患者的全息档案面板。后台以高精度ECharts多维看板呈现患者近30天的全指标变化轨迹：包括心率极值、睡眠深浅比例、血氧低谷标记等。对于连续异常的生理峰值，系统自动标红高亮，辅助医生在复诊前快速掌握患者居家的真实客观生理状态。")
    
    add_heading3(doc, "9.2.2 房树人AI画作与量化特征回溯")
    add_body_paragraph(doc, "工作台完整保留患者历次提交的房树人手绘画作原图及AI特征分析切片。医生不仅能查阅AI模型给出的六维特征得分，还可以放大查看用户画作笔触细节，作为心理咨询与心理治疗过程中的权威投射分析依据。")
    
    add_heading3(doc, "9.2.3 心理量表测评历史对比与预警干预记录")
    add_body_paragraph(doc, "医生端支持调阅患者填写的SDS、SAS、PSQI等所有历史量表问卷的逐题明细与得分趋势曲线。医生可在后台为患者添加临床随访批注、下发复评医嘱，真正实现从家庭居家监测到专业临床干预的无缝协同闭环。")
    
    # ========================== 第10章 系统配置、数据安全与常见问题解答 ==========================
    add_heading1(doc, "第10章 系统配置、数据安全与常见问题解答")
    
    add_heading2(doc, "10.1 数据安全与隐私合规保障")
    add_heading3(doc, "10.1.1 医疗级敏感数据对称加密与传输安全")
    add_body_paragraph(doc, "作为健康医疗领域的严肃应用，心晴AI系统构建了全方位的数据安全防护体系：")
    add_bullet_item(doc, "全量网络请求均通过TLS 1.3协议传输，有效抵御中间人嗅探与重放攻击；", "通信链路加密：")
    add_bullet_item(doc, "用户账户密码经BCrypt加盐哈希存储；手环授权凭证、心理聊天私密记录采用AES-256算法密文落库；", "数据库存储安全：")
    add_bullet_item(doc, "在所有对外报表与跨端展示界面中，对用户真实手机号、身份证等敏感字段执行脱敏遮盖处理。", "信息展示脱敏：")
    
    add_heading3(doc, "10.1.2 本地缓存清理与账户隐私权限控制")
    add_body_paragraph(doc, "在移动端'设置'界面中，用户可随时一键清除本地Canvas手绘临时缓存、音频播放临时文件。用户亦可自主解除Garmin手环账号授权绑定，授权一旦解除，系统将立即从服务器彻底擦除手环凭据并停止拉取数据，充分保障用户的隐私自主掌控权。")
    
    add_heading2(doc, "10.2 常见操作故障排查与使用说明")
    add_heading3(doc, "10.2.1 Garmin手环授权绑定与数据同步排查")
    add_bullet_item(doc, "请检查输入的Garmin Connect账号与密码是否与手机端Garmin Connect App登录账号完全一致；同时确认手机手环已完成数据上传至佳明官方服务器；", "Q1：点击'更新数据'提示同步失败？")
    add_bullet_item(doc, "Garmin云端服务器位于海外，偶发网络波动可能造成API响应超时。系统具备自动重试机制，建议稍等5-10分钟后再次点击同步。", "Q2：数据同步响应较慢？")
    
    add_heading3(doc, "10.2.2 画布触控与语音交互异常处理")
    add_bullet_item(doc, "请检查手机屏幕边缘防误触设置或系统缩放比例，建议在屏幕中间区域绘制，必要时点击'清空重画'重置画布上下文；", "Q3：手绘板画笔触控出现卡顿或偏移？")
    add_bullet_item(doc, "请在手机系统应用管理中，检查是否授予了'心晴AI'麦克风录音权限；在安静环境下长按说话可获得更精准的文字转换。", "Q4：心晴AI无法进行语音输入？")
    
    add_heading2(doc, "10.3 知识产权声明与技术支持说明")
    add_heading3(doc, "10.3.1 软件自主研发与独创性声明")
    add_body_paragraph(doc, "《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》由申请人【陈海丰】独立自主设计、开发与完成。本说明书所展示的所有系统架构、业务交互逻辑、HTP图像分析算法接口、手环生理时序处理服务及软件界面，均具备完全排他的自主知识产权与技术独创性，不存在抄袭或套用第三方模板情形。")
    
    add_heading3(doc, "10.3.2 官方技术支持服务渠道")
    add_body_paragraph(doc, "在使用本软件过程中如遇任何技术疑问、安装异常或业务合作咨询，欢迎通过官方技术支持渠道联系系统著作权人或委托代理机构（北京鼎泰正和知识产权代理有限公司）获取专业技术服务与随版升级支持。")
    
    doc.save(TEMP_FORMATTED_DOCX)
    print("Formatted docx created at:", TEMP_FORMATTED_DOCX)

def update_manual_toc_and_convert():
    print("Launching Microsoft Word via win32com to update TOC and save formatted .docx and .doc...")
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    try:
        wdoc = word.Documents.Open(TEMP_FORMATTED_DOCX)
        wdoc.ActiveWindow.View.Type = 3 # 3 = wdPrintView
        wdoc.Repaginate()
        for field in wdoc.Fields:
            field.Update()
        if wdoc.TablesOfContents.Count > 0:
            wdoc.TablesOfContents(1).Update()
            print("Manual TOC updated. Total TOC lines:", len(wdoc.TablesOfContents(1).Range.Text.split('\r')))
            
        page_count = wdoc.ComputeStatistics(2)
        print(f"Manual Doc Stats: {page_count} Pages, {wdoc.Paragraphs.Count} Paragraphs, {wdoc.InlineShapes.Count} Images.")
        
        # 保存并覆盖 软件操作说明书.docx
        if os.path.exists(FINAL_DOCX):
            os.remove(FINAL_DOCX)
        wdoc.SaveAs2(FINAL_DOCX, FileFormat=12) # 12 = wdFormatXMLDocument (.docx)
        print("Saved to:", FINAL_DOCX)
        
        # 同步更新 软件操作说明书1.doc
        if os.path.exists(FINAL_DOC):
            os.remove(FINAL_DOC)
        wdoc.SaveAs2(FINAL_DOC, FileFormat=0) # 0 = wdFormatDocument (.doc)
        print("Saved to:", FINAL_DOC)
        
        wdoc.Close(False)
        print("Manual documents successfully generated and formatted!")
    finally:
        word.Quit()

if __name__ == '__main__':
    print("Starting manual formatting based on template...")
    generate_fully_formatted_manual()
    update_manual_toc_and_convert()
    print("Formatting pipeline completed successfully!")
