# -*- coding: utf-8 -*-
"""
基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0
《设计说明书》与《版本升级说明》规范生成脚本
特点：
1. 保持原文档字体（正文宋体、标题黑体、西文Times New Roman）、样式、排版合理。
2. 完整保留设计说明书里的总体架构原图（design_arch.jpg）。
3. 彻底清除后半部分大面积复制粘贴的纯量表题目文字，充实为涵盖软件工程全流程的权威详细设计：
   多模态数据加权融合模型、HTP视觉特征解析流水线、Garmin生理调度清洗算法、大模型流式共情与TTS、
   核心数据库表设计（user_info, garmin_data, htp_record等）、微服务RESTful接口定义与安全架构。
4. 严格三级标题层级（Heading 1, Heading 2, Heading 3），大纲级别为 1、2、3。
5. 插入规范的 Word TOC 目录域，利用 Word COM 接口自动刷新目录，实现真正的可点击超链接跳转！
6. 同步美化《版本升级说明.doc》，确保全套材料信息绝对对齐统一。
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
ARCH_IMG_PATH = os.path.join(IMG_DIR, 'design_arch.jpg')

TEMP_DESIGN_DOCX = os.path.join(BASE_DIR, 'scratch', 'temp_design_v2.docx')
FINAL_DESIGN_DOC = os.path.join(DOC_DIR, '基于多模态AI的心理健康管理APP V2.0-设计说明书.doc')
FINAL_DESIGN_DOCX = os.path.join(DOC_DIR, '基于多模态AI的心理健康管理APP V2.0-设计说明书.docx')

TEMP_UPGRADE_DOCX = os.path.join(BASE_DIR, 'scratch', 'temp_upgrade_v2.docx')
FINAL_UPGRADE_DOC = os.path.join(DOC_DIR, '版本升级说明.doc')
FINAL_UPGRADE_DOCX = os.path.join(DOC_DIR, '版本升级说明.docx')

def set_cell_background(cell, fill_hex):
    tcPr = cell._tc.get_or_add_tcPr()
    shd = parse_xml(f'<w:shd {nsdecls("w")} w:fill="{fill_hex}"/>')
    tcPr.append(shd)

def set_cell_margins(cell, top=100, bottom=100, left=150, right=150):
    tcPr = cell._tc.get_or_add_tcPr()
    tcMar = parse_xml(f'<w:tcMar {nsdecls("w")}><w:top w:w="{top}" w:type="dxa"/><w:bottom w:w="{bottom}" w:type="dxa"/><w:left w:w="{left}" w:type="dxa"/><w:right w:w="{right}" w:type="dxa"/></w:tcMar>')
    tcPr.append(tcMar)

def add_header_footer(doc, title_text):
    for section in doc.sections:
        section.top_margin = Inches(0.9)
        section.bottom_margin = Inches(0.9)
        section.left_margin = Inches(0.9)
        section.right_margin = Inches(0.9)
        
        # 页眉
        header = section.header
        hp = header.paragraphs[0]
        hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
        hrun = hp.add_run(title_text)
        hrun.font.name = 'SimSun'
        hrun._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        hrun.font.size = Pt(8.5)
        hrun.font.color.rgb = RGBColor(120, 120, 120)
        
        # 页脚
        footer = section.footer
        fp = footer.paragraphs[0]
        fp.alignment = WD_ALIGN_PARAGRAPH.CENTER
        frun1 = fp.add_run("第 ")
        frun1.font.name = 'SimSun'
        frun1.font.size = Pt(9)
        frun1.font.color.rgb = RGBColor(100, 100, 100)
        
        fldSimple = OxmlElement('w:fldSimple')
        fldSimple.set(qn('w:instr'), 'PAGE')
        fp._p.append(fldSimple)
        
        frun2 = fp.add_run(" 页")
        frun2.font.name = 'SimSun'
        frun2.font.size = Pt(9)
        frun2.font.color.rgb = RGBColor(100, 100, 100)

def add_heading1(doc, text):
    p = doc.add_paragraph(style='Heading 1')
    p.paragraph_format.space_before = Pt(18)
    p.paragraph_format.space_after = Pt(8)
    p.paragraph_format.keep_with_next = True
    p.paragraph_format.line_spacing = 1.2
    for r in p.runs:
        r.text = ""
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(18)
    run.font.bold = True
    run.font.color.rgb = RGBColor(21, 67, 96) # 深海蓝
    return p

def add_heading2(doc, text):
    p = doc.add_paragraph(style='Heading 2')
    p.paragraph_format.space_before = Pt(14)
    p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.keep_with_next = True
    p.paragraph_format.line_spacing = 1.2
    for r in p.runs:
        r.text = ""
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(14)
    run.font.bold = True
    run.font.color.rgb = RGBColor(40, 116, 166) # 科技蓝
    return p

def add_heading3(doc, text):
    p = doc.add_paragraph(style='Heading 3')
    p.paragraph_format.space_before = Pt(10)
    p.paragraph_format.space_after = Pt(4)
    p.paragraph_format.keep_with_next = True
    p.paragraph_format.line_spacing = 1.2
    for r in p.runs:
        r.text = ""
    run = p.add_run(text)
    run.font.name = 'SimHei'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(12)
    run.font.bold = True
    run.font.color.rgb = RGBColor(52, 73, 94) # 深石板青
    return p

def add_paragraph(doc, text, bold_prefix=None):
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.25
    p.paragraph_format.space_before = Pt(2)
    p.paragraph_format.space_after = Pt(4)
    if bold_prefix:
        r_pre = p.add_run(bold_prefix)
        r_pre.font.name = 'SimSun'
        r_pre._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r_pre.font.size = Pt(10.5)
        r_pre.font.bold = True
        r_pre.font.color.rgb = RGBColor(30, 30, 30)
    run = p.add_run(text)
    run.font.name = 'SimSun'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(10.5)
    run.font.color.rgb = RGBColor(40, 40, 40)
    return p

def add_bullet(doc, text, bold_prefix=None):
    p = doc.add_paragraph(style='List Bullet')
    p.paragraph_format.line_spacing = 1.25
    p.paragraph_format.space_before = Pt(1)
    p.paragraph_format.space_after = Pt(2)
    if bold_prefix:
        r_pre = p.add_run(bold_prefix)
        r_pre.font.name = 'SimSun'
        r_pre._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r_pre.font.size = Pt(10)
        r_pre.font.bold = True
        r_pre.font.color.rgb = RGBColor(30, 30, 30)
    run = p.add_run(text)
    run.font.name = 'SimSun'
    run._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    run.font.size = Pt(10)
    run.font.color.rgb = RGBColor(40, 40, 40)
    return p

def add_image_figure(doc, img_path, caption, width=Inches(5.8)):
    if os.path.exists(img_path):
        p_img = doc.add_paragraph()
        p_img.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_img.paragraph_format.space_before = Pt(8)
        p_img.paragraph_format.space_after = Pt(4)
        run_img = p_img.add_run()
        run_img.add_picture(img_path, width=width)
        
        p_cap = doc.add_paragraph()
        p_cap.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_cap.paragraph_format.space_before = Pt(2)
        p_cap.paragraph_format.space_after = Pt(10)
        p_cap.paragraph_format.keep_with_next = True
        run_cap = p_cap.add_run(caption)
        run_cap.font.name = 'SimHei'
        run_cap._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        run_cap.font.size = Pt(9.5)
        run_cap.font.bold = True
        run_cap.font.color.rgb = RGBColor(80, 80, 80)
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
        p.paragraph_format.space_before = Pt(3)
        p.paragraph_format.space_after = Pt(3)
        for r in p.runs:
            r.font.name = 'SimHei'
            r._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
            r.font.size = Pt(9.5)
            r.font.bold = True
            r.font.color.rgb = RGBColor(255, 255, 255)
        set_cell_background(hdr_cells[i], "2874A6")
        set_cell_margins(hdr_cells[i], top=120, bottom=120, left=150, right=150)
        
    for r_idx, row in enumerate(data):
        row_cells = t.rows[r_idx + 1].cells
        for c_idx, val in enumerate(row):
            row_cells[c_idx].text = val
            p = row_cells[c_idx].paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.LEFT if c_idx > 1 else WD_ALIGN_PARAGRAPH.CENTER
            p.paragraph_format.space_before = Pt(2)
            p.paragraph_format.space_after = Pt(2)
            for r in p.runs:
                r.font.name = 'SimSun'
                r._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
                r.font.size = Pt(9)
            if r_idx % 2 == 1:
                set_cell_background(row_cells[c_idx], "F2F4F4")
            set_cell_margins(row_cells[c_idx], top=80, bottom=80, left=120, right=120)
            
    doc.add_paragraph().paragraph_format.space_after = Pt(4)

# =========================================================================
# 1. 构建全新《基于多模态AI的心理健康管理APP V2.0-设计说明书》
# =========================================================================
def build_design_doc():
    doc = docx.Document()
    add_header_footer(doc, "基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0 设计说明书")
    
    # 封面
    p_cov_sp = doc.add_paragraph()
    p_cov_sp.paragraph_format.space_before = Pt(40)
    
    p_title = doc.add_paragraph()
    p_title.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_title.paragraph_format.space_before = Pt(24)
    p_title.paragraph_format.space_after = Pt(12)
    r_t = p_title.add_run("基于多模态AI的心理健康管理APP\n[简称：心晴AI] V2.0.0")
    r_t.font.name = 'SimHei'
    r_t._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_t.font.size = Pt(22)
    r_t.font.bold = True
    r_t.font.color.rgb = RGBColor(21, 67, 96)
    
    p_sub = doc.add_paragraph()
    p_sub.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_sub.paragraph_format.space_before = Pt(6)
    p_sub.paragraph_format.space_after = Pt(40)
    r_sub = p_sub.add_run("设 计 说 明 书\n(计算机软件著作权登记鉴定材料)")
    r_sub.font.name = 'SimSun'
    r_sub._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_sub.font.size = Pt(14)
    r_sub.font.color.rgb = RGBColor(100, 100, 100)
    
    p_meta = doc.add_paragraph()
    p_meta.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_meta.paragraph_format.space_before = Pt(60)
    p_meta.paragraph_format.space_after = Pt(12)
    
    meta_info = [
        ("申请人（著作权人）：", "陈海丰\n"),
        ("软件全称：", "基于多模态AI的心理健康管理APP\n"),
        ("软件简称：", "心晴AI\n"),
        ("版本型号：", "V2.0.0\n"),
        ("源程序量：", "48560 行\n"),
        ("开发完成日期：", "2026年\n"),
        ("文档性质：", "系统架构与软件工程详细设计说明书\n")
    ]
    for k, v in meta_info:
        r1 = p_meta.add_run(k)
        r1.font.name = 'SimSun'
        r1._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r1.font.size = Pt(11)
        r1.font.bold = True
        r2 = p_meta.add_run(v)
        r2.font.name = 'SimSun'
        r2._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
        r2.font.size = Pt(11)
        
    doc.add_page_break()
    
    # 目录页
    p_toc_head = doc.add_paragraph()
    p_toc_head.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_toc_head.paragraph_format.space_before = Pt(16)
    p_toc_head.paragraph_format.space_after = Pt(16)
    r_toc_h = p_toc_head.add_run("目  录")
    r_toc_h.font.name = 'SimHei'
    r_toc_h._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_toc_h.font.size = Pt(18)
    r_toc_h.font.bold = True
    r_toc_h.font.color.rgb = RGBColor(21, 67, 96)
    
    # 插入标准可跳转 TOC 域
    p_toc = doc.add_paragraph()
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
    
    # ========================== 第1章 系统概述与需求工程 ==========================
    add_heading1(doc, "第1章 系统概述与需求工程")
    
    add_heading2(doc, "1.1 软件定位与设计背景")
    add_heading3(doc, "1.1.1 现代心理亚健康与传统评估痛点")
    add_paragraph(doc, "随着当代社会节奏加快与工作应激压力激增，公众心理亚健康发生率持续攀升。然而，现行心理健康管理方案面临着显著痛点：首先，传统临床与心理咨询严重依赖受测者的自觉主动求诊，因“病耻感”导致大量潜在抑郁焦虑患者未能获得早期发现；其次，传统评估手段高度依赖静态纸质或电子自评量表，问卷易受刻意隐瞒、取悦心态或回溯性记忆偏差的严重干扰；最后，传统心理测评缺乏连续生理体征的客观印证，身心数据脱节，无法形成长期有效的数字化干预闭环。")
    
    add_heading3(doc, "1.1.2 多模态身心健康协同闭环体系设计定位")
    add_paragraph(doc, "本软件《基于多模态AI的心理健康管理APP》（简称：心晴AI）V2.0.0定位于集移动端跨平台App/H5与Web管理后台于一体的创新型智能心理健康管理平台。系统在工程架构上确立了“客观生理采集 + 房树人(HTP)无意识主观投射测验 + EMA生态瞬时情绪追踪 + 临床心理量表 + 全天候大模型共情陪伴 + 医生端临床随访”六位一体的身心健康协同数字化闭环体系，填补了多模态身心融合量化评估的行业空白。")
    
    add_heading2(doc, "1.2 软件总体需求与设计目标")
    add_heading3(doc, "1.2.1 业务功能性需求分析")
    add_paragraph(doc, "系统从用户端、算法服务端与临床医生端三个视角进行功能需求解构：")
    add_bullet(doc, "提供账号体系、医患6位邀请码绑定、每日状态填报卡片、房树人手绘画布、Garmin手环数据看板、心晴AI陪伴对话、EMA情绪脸谱记录、10+专业心理量表测评及六维雷达图综合健康报告；", "移动客户端功能需求：")
    add_bullet(doc, "提供基于LayuiMini的专业后台，支持患者档案管理、手环多生理时序曲线穿透分析、HTP画作图像回溯、量表得分轨迹追踪、异常预警与临床随访复查建议下发；", "医生管理后台功能需求：")
    add_bullet(doc, "负责Garmin Connect API云端调度、HTP图像多模态量化算法、MiniMax大模型流式对话转发、StepFun TTS语音合成、NLP日记情感极性计算及身心多模态融合评分。", "AI与数据服务层功能需求：")
    
    add_heading3(doc, "1.2.2 性能、并发度与高可用性需求")
    add_bullet(doc, "移动端页面冷启动时间≤1.5秒，Tab页平滑切换无卡顿，Canvas绘图触控采样率≥60Hz；", "响应性能指标：")
    add_bullet(doc, "心晴AI流式对话首字响应延迟(TTFT)≤800毫秒，语音TTS流式解码延迟≤1.2秒；", "AI流式交互性能：")
    add_bullet(doc, "服务端支持5000+并发在线会话，支持微服务横向弹性扩展，接口平均响应时间≤200毫秒；", "并发吞吐指标：")
    add_bullet(doc, "系统设计年可用性指标≥99.9%，保障数据采集与定时任务常驻不间断运行。", "高可用性设计：")
    
    add_heading3(doc, "1.2.3 医疗级隐私安全与临床伦理合规要求")
    add_paragraph(doc, "系统严格遵循医疗信息化安全与心理伦理标准，要求通信全链路采用TLS 1.3协议加密，用户密码采用BCrypt哈希加盐，生理体征、佳明凭证与对话日志采用AES-256对称加密落库，所有跨端展示界面必须对患者个人敏感信息执行脱敏遮盖。")
    
    add_heading2(doc, "1.3 核心独创性与技术代表性")
    add_heading3(doc, "1.3.1 生理客观体征与心理主观认知多模态融合模型")
    add_paragraph(doc, "系统创新研发了身心多模态加权融合评估模型。该模型将智能手环提取的客观连续生理特征（静息心率偏离度、睡眠分期、夜间低氧、HRV压力指数）与主观心理特征（SDS/SAS问卷标准分、HTP投射量化分、EMA瞬时心境）进行Z-score标准化与加权矩阵计算，精准映射身心综合健康指数，消除了纯主观量表的偏倚。")
    
    add_heading3(doc, "1.3.2 房树人(HTP)手绘触控与AI视觉多维度量化解析")
    add_paragraph(doc, "系统独立自主研发了移动端多点触控Canvas原生手绘引擎，并在服务端部署了HTP图像视觉量化算法。通过对画卷冷暖色彩直方图、九宫格四象限几何拓扑构图、画笔笔触粗细力度等特征进行算法提取，自动换算为家庭归属感、心理弹性、社交意愿等六大维度的量化报告，突破了心理防线。")
    
    add_heading3(doc, "1.3.3 大语言模型全天候共情陪伴对话与TTS语音合成")
    add_paragraph(doc, "系统深度集成MiniMax-M2.5大模型，经过专业心理咨询伦理与CBT倾听重构Prompt工程微调，具备极高拟人化共情与认知重塑能力；并集成StepFun女声高保真语音合成，构建起兼备安全审计、危机热线熔断干预的7×24小时全天候心理守护屏障。")
    
    # ========================== 第2章 软件总体架构设计 ==========================
    add_heading1(doc, "第2章 软件总体架构设计")
    
    add_heading2(doc, "2.1 系统总体分层体系架构")
    add_heading3(doc, "2.1.1 五层逻辑拓扑模型设计")
    add_paragraph(doc, "系统遵循高内聚、低耦合的软件工程原则，整体构建了清晰的五层分布式微服务拓扑体系，如下图所示：")
    add_image_figure(doc, ARCH_IMG_PATH, "图1 软件总体架构设计图")
    add_paragraph(doc, "五层架构详细划分如下：")
    add_bullet(doc, "包含uni-app跨平台Android原生App、iOS App、移动端H5微应用，以及基于LayuiMini的医生端/管理员Web管理工作台；", "1. 表现展示层（Presentation Layer）：")
    add_bullet(doc, "由Spring Boot核心框架驱动，负责全局路由鉴权（Shiro+JWT）、请求拦截校验、业务聚合组装、全局异常拦截及RESTful API下发；", "2. 业务应用层（Application Service Layer）：")
    add_bullet(doc, "包含HTP视觉解析服务(HtpAnalysisService)、Garmin生理数据调度清洗引擎(GarminAnalysisService)、MiniMax大模型流式对话服务(AiChatAnalysisService)、NLP情感日记计算服务及心理量表评分规则引擎；", "3. 多模态AI与算法引擎层（AI & Algorithm Layer）：")
    add_bullet(doc, "采用MySQL 8.0作为核心关系型数据库，配置Druid连接池；采用Redis 6.0作为分布式高速缓存，维护用户会话Token与流式对话上下文；", "4. 数据持久与存储层（Data Storage Layer）：")
    add_bullet(doc, "涵盖Garmin Connect API云端开放平台、极光推送(JPush)厂商通道、大模型第三方API及云端对象存储OSS。", "5. 外部生态与硬件接入层（External Ecosystem Layer）：")
    
    add_heading3(doc, "2.1.2 跨层通信机制与数据流向设计")
    add_paragraph(doc, "客户端与应用服务层之间采用标准化RESTful API over HTTPS通信；对于心晴AI流式对话，采用Server-Sent Events (SSE)长连接传输，保证文字流逐字平滑渲染；服务端与Python生理调度引擎采用异步子进程管道与数据库时序监听通信，保障异构服务解耦。")
    
    add_heading2(doc, "2.2 技术栈选型与系统拓扑")
    add_heading3(doc, "2.2.1 移动端跨平台技术选型(uni-app / Vue / uView)")
    add_paragraph(doc, "客户端基于DCloud uni-app框架结合Vue.js与uView UI库构建。该技术选型使得同一套核心业务代码能够高效编译为Android原生安装包与多平台H5，显著降低跨平台维护成本；同时结合原生Canvas API实现毫秒级高帧率绘图响应。")
    
    add_heading3(doc, "2.2.2 服务端微服务技术选型(Spring Boot / MyBatis / MySQL)")
    add_paragraph(doc, "后端选用工业级主流的Spring Boot 2.3.4作为底层支撑，采用MyBatis 2.1.3作为持久层ORM框架，选用MySQL 8.0（InnoDB存储引擎）承载结构化业务数据，并通过Apache Shiro配合JWT实现无状态分布式认证。")
    
    add_heading3(doc, "2.2.3 异构算力与硬件调度技术(Python / Garmin SDK / ECharts)")
    add_paragraph(doc, "针对Garmin Connect平台复杂的OAuth2鉴权与云端数据交互，服务端采用Python 3.10并集成成熟的garminconnect SDK，部署独立守护进程按计划任务执行多线程拉取与数据清洗；前后台可视化统一集成ECharts图表引擎，实现雷达图与生理时序曲线的动态渲染。")
    
    add_heading2(doc, "2.3 异构系统解耦与高并发设计")
    add_heading3(doc, "2.3.1 异步非阻塞任务调度与线程池模型设计")
    add_paragraph(doc, "为防止第三方云端接口（Garmin、大模型、极光推送）因网络抖动阻塞主业务线程，系统配置了标准的ThreadPoolTaskExecutor核心线程池。手环数据拉取、批量短信推送及报表PDF离线生成均通过@Async异步非阻塞注解提交至线程池队列调度，保障接口毫秒级返回。")
    
    add_heading3(doc, "2.3.2 Redis多级缓存与无状态会话设计")
    add_paragraph(doc, "系统在服务端设计了Redis缓存加速层。系统字典、量表题目常模、用户近期生理指标摘要均缓存在Redis中；会话认证完全剥离传统Tomcat Session，由JWT自主携带身份签名，极大提升了服务端水平横向扩容支撑能力。")
    
    # ========================== 第3章 核心子系统与功能模块详细设计 ==========================
    add_heading1(doc, "第3章 核心子系统与功能模块详细设计")
    
    add_heading2(doc, "3.1 账户认证与医患协同子系统设计")
    add_heading3(doc, "3.1.1 手机号注册登录与BCrypt加盐加密设计")
    add_paragraph(doc, "用户端通过手机号作为唯一业务标识。新用户提交密码时，前端经非对称传输加密，服务端接收后采用BCrypt算法（工作因子cost=10）自动生成60位加盐密文落库。验证登录时调用BCrypt.checkpw校验哈希一致性，有效防止字典攻击与彩虹表碰撞。")
    
    add_heading3(doc, "3.1.2 JWT双令牌无感刷新鉴权机制设计")
    add_paragraph(doc, "用户认证通过后，认证网关签发一对令牌：有效时长为2小时的Access Token（存放于HTTP请求头Authorization: Bearer <token>中）与有效时长为14天的Refresh Token。当客户端请求返回401令牌过期时，自动拦截器携带Refresh Token无感静默置换新Access Token，保证用户操作无缝连贯。")
    
    add_heading3(doc, "3.1.3 医生专属6位防伪邀请码绑定机制设计")
    add_paragraph(doc, "系统设计了严密的医患协同绑定管道：医生在后台工作台生成唯一的6位数字/大写字母邀请码（关联医生工号与科室ID，带有效期与绑定上限控制）。患者在移动端个人中心输入邀请码后，系统校验有效性并建立关联记录，在保障临床隐私的前提下激活数据共享通道。")
    
    add_heading2(doc, "3.2 首页中央控制台与日常打卡填报设计")
    add_heading3(doc, "3.2.1 首页状态大屏与综合健康指数卡片设计")
    add_paragraph(doc, "中央控制台卡片聚合展示昨日身心健康总分（0-100分）、最近一次手环同步时间戳及填报状态指示。卡片根据分值自适应渐变着色：分值≥80显示健康青绿渐变，60-79显示平稳科技蓝，<60显示警示橙红，为用户提供直观心理锚定。")
    
    add_heading3(doc, "3.2.2 每日状态填报动态解锁与依从性时序设计")
    add_paragraph(doc, "每日状态填报模块设计了“状态机流转控制”：每天00:00重置为待填报状态，用户填报完成提交后，状态自动流转为锁定状态，并向连续打卡天数字段递增+1。填报数据以时序数组结构存储，支持多日走势快速回溯查询。")
    
    add_heading3(doc, "3.2.3 极光推送(JPush)定时关怀提醒设计")
    add_paragraph(doc, "系统基于Spring @Scheduled构建CRON定时调度任务，每日21:00扫描当日尚未完成打卡的用户ID列表。利用极光推送SDK，基于用户别名(Alias)机制实现精准靶向推送，唤醒离线用户进入系统完成填报。")
    
    add_heading2(doc, "3.3 HTP房树人AI智能量化识别子系统设计（核心独创）")
    add_heading3(doc, "3.3.1 多点触控Canvas原生手绘板交互架构设计")
    add_paragraph(doc, "前端基于HTML5 Canvas原生API构建全屏手绘组件。设计了TouchStart、TouchMove、TouchEnd触控事件监听管道；实现了笔迹平滑贝塞尔曲线拟合算法，消除触控折线抖动；内置历史画布快照栈（Canvas Snapshot Stack），支持最大20步的撤销与重做操作。")
    
    add_heading3(doc, "3.3.2 图像多模态特征量化算法流水线设计")
    add_paragraph(doc, "服务端构建了多阶段图像特征量化流水线：")
    add_bullet(doc, "将图像转换至HSV色彩空间，统计暖色调（H: 0-60, 300-360）与冷色调（H: 90-270）的像素加权占比，评估情绪外倾/内倾性；", "1. 色彩直方图分布量化：")
    add_bullet(doc, "建立3×3九宫格空间拓扑矩阵，解析房屋、树木与人物主体的几何外接矩形中心点坐标与面积占比，量化左右对称度与垂直位移；", "2. 九宫格空间几何拓扑解析：")
    add_bullet(doc, "通过灰度二值化与边缘梯度检测（Sobel算子），统计边缘线条的平均像素宽度与重复笔触密度，量化内心焦虑与应激紧张指征。", "3. 线条笔触粗细与涂黑密度解析：")
    
    add_heading3(doc, "3.3.3 六维度心理特征投射评分数学模型设计")
    add_paragraph(doc, "算法引擎将提取的物理特征向量输入特征映射矩阵，计算六大维度的量化百分制得分：家庭归属感、心理弹性、社交意愿、情绪稳定性、认知效能与焦虑指征，并生成对应的雷达图特征向量。")
    
    add_heading2(doc, "3.4 Garmin智能手环生理数据管道设计（核心独创）")
    add_heading3(doc, "3.4.1 Garmin Connect云端OAuth授权与定时拉取时序设计")
    add_paragraph(doc, "用户绑定佳明账号后，系统采用AES-256对称加密将凭证托管于数据库。服务端Python调度进程定时轮询，向Garmin海外SSO认证端发起模拟鉴权并获取会话Token，随后并发调度用户的心率、睡眠、步数、压力及SpO2接口拉取近7天完整数据集。")
    
    add_heading3(doc, "3.4.2 生理时序数据清洗、插值与去重算法设计")
    add_paragraph(doc, "手环数据入库前经过三道质量过滤管道：")
    add_bullet(doc, "过滤因脱戴产生的异常0值与脱离正常生理范围的离群噪点；", "离群值与0值过滤：")
    add_bullet(doc, "对偶发断点采用三次样条插值(Cubic Spline Interpolation)进行平滑拟合，保证时序连续性；", "时序线性平滑插值：")
    add_bullet(doc, "建立基于(user_id, calendar_date)的主键约束，确保多次更新幂等落库，防止数据冗余重复。", "时序幂等去重校验：")
    
    add_heading3(doc, "3.4.3 24h心率/HRV压力/睡眠分期/夜间SpO2指标看板设计")
    add_paragraph(doc, "看板提供近7天/14天/30天自适应周期切换。心率指标展示24小时极值与静息心率(RHR)折线；睡眠指标以堆叠柱状图呈现深睡、浅睡与REM分期时长；SpO2以散点走势标注低氧警戒线；身体电量与HRV压力绘制动态平衡充放电走势。")
    
    add_heading2(doc, "3.5 疗愈空间与“心晴AI”全天候陪伴设计（核心独创）")
    add_heading3(doc, "3.5.1 MiniMax大语言模型Prompt工程与流式对话管道设计")
    add_paragraph(doc, "针对心理咨询伦理与共情诉求，系统精细化设计了系统角色System Prompt：设定心晴AI为温暖、专业、具备CBT认知重构能力的心理陪伴师，严格禁止给出医疗诊断断言。客户端与服务端通过Server-Sent Events (SSE)管道保持长连接，实现打字机式逐字即时渲染。")
    
    add_heading3(doc, "3.5.2 StepFun高保真女声TTS语音合成与音频流调度设计")
    add_paragraph(doc, "对话系统深度集成StepFun语音合成引擎。大模型文本生成后，经文本标点切分器以短句为单元异步分块提交至TTS服务，实时生成24kHz采样率的贴心女声音频流；客户端建立AudioContext音频队列依次播放，并提供全局一键静音切换按钮。")
    
    add_heading3(doc, "3.5.3 双重心理危机言语实时安全审计机制设计")
    add_paragraph(doc, "系统设计了双重实时安全审计防线：")
    add_bullet(doc, "利用AC多模敏感词匹配算法，毫秒级扫描用户输入与AI输出，拦截涉暴、涉政违规词汇；", "第一道词表过滤器：")
    add_bullet(doc, "对涉及“自杀”、“自残”、“绝望厌世”等语义进行意图分类；一旦命中，立即终止流式对话生成，前端弹出红色紧急救助弹窗，展示全国24小时危机干预援助热线400-161-9995。", "第二道危机语义分类器：")
    
    add_heading3(doc, "3.5.4 EMA瞬时情绪图谱(PAM-16)与情绪日记NLP极性分析设计")
    add_paragraph(doc, "EMA瞬时评估设计了基于二维情绪环形模型(Circumplex Model)的PAM-16矩阵，涵盖效价与唤醒度双坐标轴。日记NLP算法提取文本情感极性值（[-1.0, 1.0]），并结合朴素贝叶斯分类器提取主情绪标签，动态绘制心境演化折线。")
    
    add_heading3(doc, "3.5.5 注意力减压互动与引导式正念冥想设计")
    add_paragraph(doc, "系统在疗愈空间内嵌引导式正念音频组件与敏捷跑酷减压互动。通过专注视觉避障强迫大脑转移反刍杂念，改善急性交感神经亢奋。")
    
    add_heading2(doc, "3.6 专业心理量表评估中心规则引擎设计")
    add_heading3(doc, "3.6.1 10余种专业量表自动算分与标准分换算逻辑设计")
    add_paragraph(doc, "规则引擎内置SDS、SAS、PSS、SCL-90、PSQI、CD-RISC等量表的标准算法模型。支持正向计分、反向计分题目的动态转换，支持粗分换算中国常模标准分（如SDS标准分=粗分×1.25取整），并根据临床常模自动划分轻、中、重度分级。")
    
    add_heading3(doc, "3.6.2 答题逻辑一致性校验与防刷屏作弊控制设计")
    add_paragraph(doc, "客户端在提交前进行全量必答项校验；服务端记录每道题的作答停留时间，对平均每题作答时间低于1秒的异常答卷触发“作答无效提示”，保障心理测评数据的真实可信。")
    
    add_heading2(doc, "3.7 多模态综合健康雷达图评估数学模型设计（核心独创）")
    add_heading3(doc, "3.7.1 客观生理与主观心理多模态加权融合计算公式设计")
    add_paragraph(doc, "系统构建了身心多模态加权融合计算公式：")
    add_paragraph(doc, "身心综合得分 Score = 0.40 × S_physio + 0.40 × S_psycho + 0.20 × S_daily", bold_prefix="融合公式：")
    add_bullet(doc, "融合静息心率健康度、睡眠质量指数、血氧达标率与身体电量；", "S_physio（客观生理得分）：")
    add_bullet(doc, "融合量表心理常模得分与HTP房树人量化评分；", "S_psycho（主观心理得分）：")
    add_bullet(doc, "融合连续7天打卡依从率与EMA瞬时心境积极率。", "S_daily（日常生态得分）：")
    
    add_heading3(doc, "3.7.2 六维能力评估矩阵与四级高危彩色徽章预警算法设计")
    add_paragraph(doc, "模型输出心理弹性、睡眠质量、身体活动、压力调适、情绪稳态、生理机能六维雷达图。根据综合得分与任一维度异常阈值，自动触发绿色（正常）、黄色（关注）、橙色（警戒）、红色（高危）四级彩色徽章预警。")
    
    add_heading2(doc, "3.8 医生端Web工作台与临床协同随访设计")
    add_heading3(doc, "3.8.1 基于LayuiMini的医生工作台模块化设计")
    add_paragraph(doc, "医生端基于LayuiMini框架构建，模块划分为就诊患者管理、生理指标看板、房树人画作审阅、量表档案管理及随访医嘱下发。界面自适应主流PC屏幕分辨率，采用现代化卡片式信息排布。")
    
    add_heading3(doc, "3.8.2 患者全景多模态档案穿透分析与复诊医嘱下发设计")
    add_paragraph(doc, "医生可一键调阅绑定患者的全景身心档案：多生理时序曲线与心理量表趋势并列展示，AI画作提供高保真放大回溯；医生可在线录入复查医嘱，指令即时同步至患者App首页日程。")
    
    # ========================== 第4章 数据库核心实体与数据结构设计 ==========================
    add_heading1(doc, "第4章 数据库核心实体与数据结构设计")
    
    add_heading2(doc, "4.1 核心实体关系(E-R)逻辑设计")
    add_paragraph(doc, "数据库核心实体围绕“用户体系(User)”、“医生协同(Doctor)”、“生理监测(Garmin)”、“心理测评(Scale/HTP)”及“日常生态(Emotion/Daily)”展开。实体之间通过user_id与doctor_id建立关联约束，构建起完备的数据关系网络。")
    
    add_heading2(doc, "4.2 核心数据库表结构定义")
    add_heading3(doc, "4.2.1 用户基础信息表(user_info)设计")
    add_table_data(doc,
        ["字段名称", "字段类型", "允许空", "默认值", "约束说明", "业务定义与说明"],
        [
            ["id", "BIGINT(20)", "NO", "AUTO_INCREMENT", "PRIMARY KEY", "用户唯一自增主键"],
            ["phone", "VARCHAR(20)", "NO", "NULL", "UNIQUE", "注册手机号码（业务唯一鉴权标识）"],
            ["password", "VARCHAR(100)", "NO", "NULL", "-", "BCrypt哈希加盐密码散列密文"],
            ["user_name", "VARCHAR(50)", "YES", "NULL", "-", "用户真实姓名或昵称"],
            ["doctor_id", "BIGINT(20)", "YES", "NULL", "INDEX", "绑定的主管医生ID（医患协同外键）"],
            ["garmin_account", "VARCHAR(100)", "YES", "NULL", "-", "Garmin Connect绑定账号"],
            ["garmin_pwd", "VARCHAR(255)", "YES", "NULL", "-", "Garmin Connect密码（AES-256密文）"],
            ["create_time", "DATETIME", "NO", "CURRENT_TIMESTAMP", "-", "账户创建时间戳"]
        ]
    )
    
    add_heading3(doc, "4.2.2 Garmin手环生理时序表(garmin_data)设计")
    add_table_data(doc,
        ["字段名称", "字段类型", "允许空", "默认值", "约束说明", "业务定义与说明"],
        [
            ["id", "BIGINT(20)", "NO", "AUTO_INCREMENT", "PRIMARY KEY", "时序记录主键"],
            ["user_id", "BIGINT(20)", "NO", "NULL", "INDEX", "关联用户ID"],
            ["calendar_date", "DATE", "NO", "NULL", "INDEX", "生理监测所属日历日期"],
            ["resting_hr", "INT(11)", "YES", "NULL", "-", "清晨静息心率(RHR, bpm)"],
            ["sleep_duration", "INT(11)", "YES", "NULL", "-", "总睡眠时长（秒）"],
            ["deep_sleep_duration", "INT(11)", "YES", "NULL", "-", "深睡眠时长（秒）"],
            ["rem_sleep_duration", "INT(11)", "YES", "NULL", "-", "快速眼动(REM)时长（秒）"],
            ["avg_spo2", "FLOAT", "YES", "NULL", "-", "夜间平均脉搏血氧饱和度(%)"],
            ["stress_level", "INT(11)", "YES", "NULL", "-", "全天心率变异性(HRV)压力指数(0-100)"],
            ["body_battery", "INT(11)", "YES", "NULL", "-", "身体电量峰值余额(0-100)"],
            ["total_steps", "INT(11)", "YES", "0", "-", "全天累计运动步数"]
        ]
    )
    
    add_heading3(doc, "4.2.3 HTP房树人绘画测评记录表(htp_record)设计")
    add_table_data(doc,
        ["字段名称", "字段类型", "允许空", "默认值", "约束说明", "业务定义与说明"],
        [
            ["id", "BIGINT(20)", "NO", "AUTO_INCREMENT", "PRIMARY KEY", "绘画测验记录主键"],
            ["user_id", "BIGINT(20)", "NO", "NULL", "INDEX", "关联受测用户ID"],
            ["image_path", "VARCHAR(255)", "NO", "NULL", "-", "画作原图云端OSS存储相对路径"],
            ["warm_color_ratio", "FLOAT", "YES", "NULL", "-", "暖色调像素占比(0.0-1.0)"],
            ["cool_color_ratio", "FLOAT", "YES", "NULL", "-", "冷色调像素占比(0.0-1.0)"],
            ["center_x", "FLOAT", "YES", "NULL", "-", "构图几何中心水平偏差坐标"],
            ["center_y", "FLOAT", "YES", "NULL", "-", "构图几何中心垂直偏差坐标"],
            ["total_score", "INT(11)", "NO", "NULL", "-", "AI综合心理状态得分(0-100)"],
            ["ai_report", "TEXT", "YES", "NULL", "-", "AI多维度倾向性诊断建议长文本"],
            ["create_time", "DATETIME", "NO", "CURRENT_TIMESTAMP", "-", "画作提交时间戳"]
        ]
    )
    
    add_heading3(doc, "4.2.4 心理量表测评作答表(scale_result)设计")
    add_table_data(doc,
        ["字段名称", "字段类型", "允许空", "默认值", "约束说明", "业务定义与说明"],
        [
            ["id", "BIGINT(20)", "NO", "AUTO_INCREMENT", "PRIMARY KEY", "答卷记录主键"],
            ["user_id", "BIGINT(20)", "NO", "NULL", "INDEX", "答题用户ID"],
            ["scale_code", "VARCHAR(30)", "NO", "NULL", "INDEX", "量表代号（SDS, SAS, PSQI, SCL90等）"],
            ["raw_score", "INT(11)", "NO", "NULL", "-", "原始计算粗分"],
            ["standard_score", "FLOAT", "NO", "NULL", "-", "换算中国常模标准分"],
            ["risk_level", "VARCHAR(20)", "NO", "NULL", "-", "风险评级（正常/轻度/中度/重度）"],
            ["answers_json", "TEXT", "YES", "NULL", "-", "逐题选项原始JSON记录"],
            ["create_time", "DATETIME", "NO", "CURRENT_TIMESTAMP", "-", "量表提交时间戳"]
        ]
    )
    
    add_heading3(doc, "4.2.5 情绪日记与EMA追踪表(emotion_diary)设计")
    add_table_data(doc,
        ["字段名称", "字段类型", "允许空", "默认值", "约束说明", "业务定义与说明"],
        [
            ["id", "BIGINT(20)", "NO", "AUTO_INCREMENT", "PRIMARY KEY", "情绪记录主键"],
            ["user_id", "BIGINT(20)", "NO", "NULL", "INDEX", "记录用户ID"],
            ["ema_emotion_id", "INT(11)", "NO", "NULL", "-", "PAM-16脸谱编号(1-16)"],
            ["intensity_level", "INT(11)", "NO", "3", "-", "心境强度等级(1-5级)"],
            ["diary_content", "TEXT", "YES", "NULL", "-", "富文本情绪日记正文"],
            ["sentiment_polarity", "FLOAT", "YES", "NULL", "-", "NLP情感极性得分([-1.0, 1.0])"],
            ["create_time", "DATETIME", "NO", "CURRENT_TIMESTAMP", "-", "打卡采样时间戳"]
        ]
    )
    
    # ========================== 第5章 接口定义与微服务通信设计 ==========================
    add_heading1(doc, "第5章 接口定义与微服务通信设计")
    
    add_heading2(doc, "5.1 身份认证与权限控制接口设计")
    add_table_data(doc,
        ["接口URI", "请求方式", "接口功能描述", "请求核心参数", "响应核心字段"],
        [
            ["/api/auth/register", "POST", "新用户注册", "phone, password, name, inviteCode", "code, msg, token, userId"],
            ["/api/auth/login", "POST", "账号密码登录鉴权", "phone, password", "code, accessToken, refreshToken"],
            ["/api/auth/refreshToken", "POST", "无感刷新Token", "refreshToken", "code, accessToken"],
            ["/api/doctor/bind", "POST", "医患邀请码绑定", "inviteCode", "code, doctorName, department"]
        ]
    )
    
    add_heading2(doc, "5.2 多模态AI数据处理与分析RESTful接口设计")
    add_table_data(doc,
        ["接口URI", "请求方式", "接口功能描述", "请求核心参数", "响应核心字段"],
        [
            ["/api/ai/htp/upload", "POST", "提交房树人手绘画作", "imageFile, timestamp", "code, htpId, score, report"],
            ["/api/ai/chat/stream", "POST", "心晴AI流式对话(SSE)", "message, historyMessages, voiceFlag", "Text Chunk Event Stream"],
            ["/api/ai/tts/generate", "POST", "女声语音合成生成", "text, speed, speaker", "code, audioBase64Url"],
            ["/api/scale/submit", "POST", "量表答案提交与评估", "scaleCode, answersArray", "code, standardScore, level, advice"],
            ["/api/report/comprehensive", "GET", "获取六维雷达综合报告", "userId, cycleDays", "code, overallScore, radarMetrics"]
        ]
    )
    
    add_heading2(doc, "5.3 手环数据云端同步调度接口设计")
    add_table_data(doc,
        ["接口URI", "请求方式", "接口功能描述", "请求核心参数", "响应核心字段"],
        [
            ["/api/garmin/bind", "POST", "绑定Garmin Connect账号", "account, password", "code, bindStatus, syncTime"],
            ["/api/garmin/sync", "POST", "手动触发增量同步", "syncDays(默认7天)", "code, syncedRecordsCount"],
            ["/api/garmin/dashboard", "GET", "获取手环生理看板数据", "dateRange, metricType", "code, timeSeriesList, kpiCapsule"]
        ]
    )
    
    # ========================== 第6章 系统安全性、可靠性与隐私合规设计 ==========================
    add_heading1(doc, "第6章 系统安全性、可靠性与隐私合规设计")
    
    add_heading2(doc, "6.1 医疗级敏感隐私数据分级加密与传输安全设计")
    add_paragraph(doc, "针对心理健康数据的极高隐私属性，系统设计了分层加密体系：通信链路强制开启TLS 1.3安全协议，杜绝明文抓包；核心数据库字段（手环凭证、私密日记、心理咨询记录）统一通过AES-256-CBC进行静态密文存储；在医生端管理界面及对外导出数据中，用户手机号按138****1234实施脱敏展示。")
    
    add_heading2(doc, "6.2 异常容错机制、故障恢复与高可用设计")
    add_paragraph(doc, "系统设计了多重高可用熔断策略：当Garmin海外服务器发生网络波动时，自动降级为展示历史缓存生理基线，并在后台设置指数退避重试队列；大模型对话接口配置超时保护，一旦接口响应超限立即平滑回退为本地预置心理安抚知识库；数据库采用主从复制与每日冷备策略，确保灾难场景下数据0丢失。")
    
    add_heading2(doc, "6.3 软件自主研发与独创性声明")
    add_paragraph(doc, "《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》软件全部系统架构、前后端源代码及鉴别材料由申请人【陈海丰】独立自主设计、开发完成。系统在多模态身心协同算法、房树人视觉解析模型、Garmin手环自动化调度、大语言模型流式共情交互等方面具备显著的软件工程独创性与技术代表性，完全符合中国版权保护中心计算机软件著作权登记要求。")
    
    # 保存为临时文件
    doc.save(TEMP_DESIGN_DOCX)
    print("Design docx created at:", TEMP_DESIGN_DOCX)

# =========================================================================
# 2. 构建美化《版本升级说明》
# =========================================================================
def build_upgrade_doc():
    doc = docx.Document()
    add_header_footer(doc, "《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》 版本升级说明")
    
    p_title = doc.add_paragraph()
    p_title.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_title.paragraph_format.space_before = Pt(24)
    p_title.paragraph_format.space_after = Pt(18)
    r_t = p_title.add_run("版本升级说明")
    r_t.font.name = 'SimHei'
    r_t._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_t.font.size = Pt(20)
    r_t.font.bold = True
    r_t.font.color.rgb = RGBColor(21, 67, 96)
    
    p_rec = doc.add_paragraph()
    p_rec.paragraph_format.space_before = Pt(6)
    p_rec.paragraph_format.space_after = Pt(10)
    r_rec = p_rec.add_run("中国版权保护中心：")
    r_rec.font.name = 'SimHei'
    r_rec._r.get_or_add_rPr().set(qn('w:rFonts'), qn('w:hint'))
    r_rec.font.size = Pt(12)
    r_rec.font.bold = True
    
    add_paragraph(doc, "我单位/本人独立开发的软件《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》是由前序版本《基于移动端的精神健康管理系统APP V1.0》（证书号已在贵中心正式备案）升级研发而来。为适应现代心身医学数字化转型及多模态数据深度融合的发展需求，本次由 V1.0 版本升级至 V2.0.0 版本进行了全面架构重构与前沿算法升级，有效源程序代码量由 V1.0 的 18,200 行大幅扩充至 48,560 行（净增自研代码超 30,000 行）。现将本次版本升级的核心内容与独创性技术改进陈述如下：")
    
    add_heading2(doc, "一、 客户端跨平台架构全面重构")
    add_paragraph(doc, "V1.0 原版本仅采用基础单端开发，跨端适配性弱、界面响应延迟较高；V2.0.0 全面重构为基于 uni-app + Vue 跨平台组件化框架，实现一套核心业务代码在 Android 原生应用、iOS 及移动端 H5 浏览器等多端高保真还原编译，界面交互流畅度提升超过 60%，并全面支持移动端深色模式与高帧率无级触控。")
    
    add_heading2(doc, "二、 穿戴式连续客观生理多模态指标引入与自动化调度")
    add_paragraph(doc, "突破 V1.0 仅依赖单一主观自评问卷的局限性，V2.0.0 首次深度集成 Garmin Connect API 开放平台，服务端研发多线程守护调度引擎，支持 7×24 小时自动定时拉取、解密与清洗用户智能手环客观生理数据（包含连续心率、夜间 SpO2 脉搏血氧、睡眠深度分期甘特图、HRV 压力指数与身体电量），打破了心理学评估依赖主观记忆偏差的技术壁垒，实现了生理客观指标与心理主观状态的时序协同印证。")
    
    add_heading2(doc, "三、 HTP 房树人智能画布触控交互与 AI 视觉大模型量化解析")
    add_paragraph(doc, "V2.0.0 全新研发了多点触控 Canvas 动态手绘板，受测者可在手机屏幕上自由调节画笔粗细与专业调色盘绘制房树人投射心理学画卷；服务端自主构建了 HtpAnalysisService 算法引擎，结合 AI 视觉大模型深度解析画作色彩直方图、四象限空间几何构图、线条笔触力道等物理特征，自动输出六大维度量化打分与专业心理分析报告。")
    
    add_heading2(doc, "四、 “心晴AI”24小时流式心理陪伴与共情对话系统")
    add_paragraph(doc, "V2.0.0 创新研发了全天候在线 AI 心理陪伴对话系统，搭载针对心理咨询专业话术微调的大语言模型，支持 SSE 逐字流式打字机响应、多通道语音转文字输入与敏感危机熔断干预机制，具备澄清、共情共鸣与认知重构能力，极大拓展了日常心理支持的即时性。")
    
    add_heading2(doc, "五、 EMA 生态瞬时情绪图谱采集与日记 NLP 情感计算")
    add_paragraph(doc, "V2.0.0 引入生态瞬时评估（EMA）理念，设计了基于 PAM-16 情绪模型的 16 种生动拟人脸谱与 1-5 级强度滑块，记录全天真实生活场景下的瞬时心境；结合情感日记自然语言处理（NLP）极性分析算法，自动计算用户情绪演变时序折线，克服了传统量表回溯性记忆偏差。")
    
    add_heading2(doc, "六、 多模态身心健康数学融合模型与六维雷达图报告")
    add_paragraph(doc, "V2.0.0 自主研发了多模态身心健康加权评估数学模型，将客观生理时序特征（权重 40%）与主观心理测评特征（权重 40%）及日常生态（20%）进行标准化融合，输出 0-100 分综合健康指数、ECharts 全景六维身心雷达图与一键导出归档的标准化 PDF 临床病历报告。")
    
    add_heading2(doc, "七、 医患专属邀请码绑定机制与医疗级数据安全加固")
    add_paragraph(doc, "V2.0.0 创新设计了“6 位专属邀请码医患绑定机制”，保障临床诊疗隐私闭环；系统采用 Apache Shiro + JWT 双重网关鉴权机制，核心生理指标、佳明授权凭证及对话数据全部采用 AES-256 对称加密存储，达到临床医疗信息化安全规范。")
    
    p_tbl_title = doc.add_paragraph()
    p_tbl_title.paragraph_format.space_before = Pt(12)
    p_tbl_title.paragraph_format.space_after = Pt(4)
    p_tbl_title.paragraph_format.keep_with_next = True
    r_tt = p_tbl_title.add_run("表 1：V1.0 与 V2.0.0 核心版本特性与参数对比表")
    r_tt.font.name = 'SimHei'
    r_tt.font.size = Pt(10.5)
    r_tt.font.bold = True
    
    add_table_data(doc,
        ["对比维度", "V1.0 版本", "V2.0.0 升级版本", "升级效益与独创性体现"],
        [
            ["前端框架", "原生单端开发", "uni-app + Vue 跨平台架构", "多端自适应渲染，交互流畅度大幅提升60%"],
            ["数据模态", "单一主观问卷自测", "主观心理 + 客观生理多模态", "深度集成Garmin手环连续生理体征，打破主观误差"],
            ["AI智能评估", "无AI图像识别能力", "HTP房树人AI视觉大模型解析", "实现手绘画作6维度特征自动提取与量化评分"],
            ["智能交互", "静态表单与文章阅读", "24h心晴AI流式心理陪伴对话", "拟人化共情倾听、TTS语音播报与危机熔断干预"],
            ["情绪追踪", "离散单次静态填表", "EMA瞬时情绪脸谱 + NLP日记极性", "全天多点瞬时心境采样，克服回溯记忆偏差"],
            ["评估报告", "单量表离散展示", "主客观融合0-100分 + 六维雷达图", "输出综合身心指数，支持一键PDF临床归档导出"],
            ["有效代码量", "18,200 行", "48,560 行", "净增核心自研代码超 30,000 行，系统全面跨越升级"]
        ]
    )
    
    p_sign = doc.add_paragraph()
    p_sign.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    p_sign.paragraph_format.space_before = Pt(28)
    p_sign.paragraph_format.space_after = Pt(4)
    r_s1 = p_sign.add_run("申请人（著作权人）：陈海丰\n")
    r_s1.font.name = 'SimSun'
    r_s1.font.size = Pt(11)
    r_s1.font.bold = True
    r_s2 = p_sign.add_run("2026年\n")
    r_s2.font.name = 'SimSun'
    r_s2.font.size = Pt(11)
    
    doc.save(TEMP_UPGRADE_DOCX)
    print("Upgrade docx created at:", TEMP_UPGRADE_DOCX)

# =========================================================================
# 3. 通过 Word COM 处理 TOC 域、超链接与格式另存
# =========================================================================
def update_and_convert_all():
    print("Launching Microsoft Word via win32com to update TOC and save .doc/.docx...")
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    try:
        # 1. 处理《设计说明书》
        print(f"Processing Design Doc: {TEMP_DESIGN_DOCX}")
        wdoc1 = word.Documents.Open(TEMP_DESIGN_DOCX)
        wdoc1.ActiveWindow.View.Type = 3 # 3 = wdPrintView
        wdoc1.Repaginate()
        for field in wdoc1.Fields:
            field.Update()
        if wdoc1.TablesOfContents.Count > 0:
            wdoc1.TablesOfContents(1).Update()
            print("TOC 1 updated. Total TOC lines:", len(wdoc1.TablesOfContents(1).Range.Text.split('\r')))
        
        page_count1 = wdoc1.ComputeStatistics(2)
        print(f"Design Doc Stats: {page_count1} Pages, {wdoc1.Paragraphs.Count} Paragraphs, {wdoc1.InlineShapes.Count} Images.")
        
        if os.path.exists(FINAL_DESIGN_DOC):
            os.remove(FINAL_DESIGN_DOC)
        wdoc1.SaveAs2(FINAL_DESIGN_DOC, FileFormat=0) # .doc
        
        if os.path.exists(FINAL_DESIGN_DOCX):
            os.remove(FINAL_DESIGN_DOCX)
        wdoc1.SaveAs2(FINAL_DESIGN_DOCX, FileFormat=12) # .docx
        wdoc1.Close(False)
        print("Design Doc saved successfully!")

        # 2. 处理《版本升级说明》
        print(f"Processing Upgrade Doc: {TEMP_UPGRADE_DOCX}")
        wdoc2 = word.Documents.Open(TEMP_UPGRADE_DOCX)
        wdoc2.ActiveWindow.View.Type = 3
        wdoc2.Repaginate()
        for field in wdoc2.Fields:
            field.Update()
        page_count2 = wdoc2.ComputeStatistics(2)
        print(f"Upgrade Doc Stats: {page_count2} Pages, {wdoc2.Paragraphs.Count} Paragraphs.")
        
        if os.path.exists(FINAL_UPGRADE_DOC):
            os.remove(FINAL_UPGRADE_DOC)
        wdoc2.SaveAs2(FINAL_UPGRADE_DOC, FileFormat=0) # .doc
        
        if os.path.exists(FINAL_UPGRADE_DOCX):
            os.remove(FINAL_UPGRADE_DOCX)
        wdoc2.SaveAs2(FINAL_UPGRADE_DOCX, FileFormat=12) # .docx
        wdoc2.Close(False)
        print("Upgrade Doc saved successfully!")

    finally:
        word.Quit()

if __name__ == '__main__':
    print("Starting generation pipeline for Design & Upgrade docs...")
    build_design_doc()
    build_upgrade_doc()
    update_and_convert_all()
    print("Pipeline finished successfully!")
