import os
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_ALIGN_VERTICAL
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import qn, nsdecls
import win32com.client

base = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'
out_folder = os.path.join(base, 'doc', '软著V2.0')

COLOR_PRIMARY_DARK = RGBColor(21, 67, 96)     # #154360 Deep Navy
COLOR_PRIMARY = RGBColor(31, 97, 141)          # #1F618D Classic Blue
COLOR_TEXT_MAIN = RGBColor(44, 62, 80)         # #2C3E50 Dark Slate
COLOR_TEXT_MUTED = RGBColor(120, 130, 140)
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

def build_upgrade_v2():
    doc = docx.Document()
    
    sec = doc.sections[0]
    sec.top_margin = Inches(0.9)
    sec.bottom_margin = Inches(0.9)
    sec.left_margin = Inches(0.9)
    sec.right_margin = Inches(0.9)
    
    # Header
    hp = sec.header.paragraphs[0]
    hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    add_header_bottom_line(hp, "1F618D", "6")
    hrun = hp.add_run("基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0 版本升级说明")
    hrun.font.name = 'SimSun'
    hrun.font.size = Pt(8.5)
    hrun.font.color.rgb = COLOR_PRIMARY

    # Footer
    fp = sec.footer.paragraphs[0]
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

    # Title
    p_t = doc.add_paragraph()
    p_t.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_t.paragraph_format.space_before = Pt(16)
    p_t.paragraph_format.space_after = Pt(20)
    r_t = p_t.add_run("版本升级说明")
    r_t.font.name = 'SimHei'
    r_t.font.size = Pt(20)
    r_t.font.bold = True
    r_t.font.color.rgb = COLOR_PRIMARY_DARK

    # Addressee
    p_to = doc.add_paragraph()
    p_to.paragraph_format.space_before = Pt(4)
    p_to.paragraph_format.space_after = Pt(6)
    r_to = p_to.add_run("中国版权保护中心：")
    r_to.font.name = 'SimHei'
    r_to.font.size = Pt(12)
    r_to.font.bold = True
    r_to.font.color.rgb = COLOR_PRIMARY_DARK

    # Lead text
    p_lead = doc.add_paragraph()
    p_lead.paragraph_format.line_spacing = 1.35
    p_lead.paragraph_format.space_before = Pt(2)
    p_lead.paragraph_format.space_after = Pt(6)
    p_lead.paragraph_format.first_line_indent = Pt(24)
    r_l = p_lead.add_run(
        "我单位/本人独立开发的软件《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》是由前序版本《基于移动端的精神健康管理系统APP V1.0》（证书号已在贵中心正式备案）升级研发而来。为适应现代心身医学数字化转型及多模态数据深度融合的发展需求，本次由 V1.0 版本升级至 V2.0.0 版本进行了全面架构重构与前沿算法升级，有效源程序代码量由 V1.0 的 18,200 行扩充至 48,560 行（净增代码量超 30,000 行）。现将本次版本升级的核心内容与独创性技术改进说明如下："
    )
    r_l.font.name = 'SimSun'
    r_l.font.size = Pt(10.5)
    r_l.font.color.rgb = COLOR_TEXT_MAIN

    upgrades = [
        ("一、 客户端跨平台架构全面重构", 
         "V1.0 原版本仅采用基础单端开发，跨端适配性弱、界面响应延迟较高；V2.0.0 全面重构为基于 uni-app + Vue 跨平台组件化框架，实现一套核心业务代码在 Android 原生应用、iOS 及移动端 H5 浏览器等多端高保真还原编译，界面交互流畅度提升超过 60%，并全面支持移动端深色模式与无级触控。"),
        ("二、 穿戴式连续客观生理多模态指标引入与自动化调度", 
         "突破 V1.0 仅依赖单一主观自评问卷的局限性，V2.0.0 首次深度集成 Garmin Connect API 开放平台，服务端研发多线程守护调度引擎，支持 7×24 小时自动定时拉取、解密与清洗用户智能手环客观生理数据（包含连续心率、夜间 SpO2 脉搏血氧、睡眠深度分期甘特图、HRV 压力指数与身体电量），打破了心理学评估依赖主观记忆偏差的技术壁垒，实现了生理客观指标与心理主观状态的时序协同印证。"),
        ("三、 HTP 房树人智能画布触控交互与 AI 视觉大模型量化解析", 
         "V2.0.0 全新研发了多点触控 Canvas 动态手绘板，受测者可在手机屏幕上自由调节画笔粗细与 12 色专业调色盘绘制房树人投射心理学画卷；服务端自主构建了 HtpAnalysisService 算法引擎，结合 AI 视觉大模型深度解析画作色彩直方图、四象限空间几何构图、线条笔触力道等物理特征，自动输出六大维度量化打分与专业心理分析报告。"),
        ("四、 “心晴AI”24小时流式心理陪伴与共情对话系统", 
         "V2.0.0 创新研发了全天候在线 AI 心理陪伴对话系统，搭载针对心理咨询专业话术微调的大语言模型，支持 SSE 逐字流式打字机响应、多通道语音转文字输入与敏感危机熔断干预机制，具备澄清、共情共鸣与认知重构能力，极大拓展了日常心理支持的即时性。"),
        ("五、 EMA 生态瞬时情绪图谱采集与日记 NLP 情感计算", 
         "V2.0.0 引入生态瞬时评估（EMA）理念，设计了基于 PAM-16 情绪模型的 16 种生动拟人脸谱与 1-5 级强度滑块，记录全天真实生活场景下的瞬时心境；结合情感日记自然语言处理（NLP）极性分析算法，自动计算用户情绪演变时序折线，克服了传统量表回溯性记忆偏差。"),
        ("六、 多模态身心健康数学融合模型与六维雷达图报告", 
         "V2.0.0 自主研发了多模态身心健康加权评估数学模型，将客观生理时序特征（权重 45%）与主观心理测评特征（权重 55%）进行 Z-score 标准化融合，输出 0-100 分综合健康指数、ECharts 全景六维身心雷达图与一键导出归档的标准化 PDF 临床病历报告。"),
        ("七、 医患专属邀请码绑定机制与金融级数据安全加固", 
         "V2.0.0 创新设计了“6 位专属邀请码医患绑定机制”，保障临床诊疗隐私闭环；系统采用 Apache Shiro + JWT 双重网关鉴权机制，核心生理指标、佳明授权凭证及对话数据全部采用 AES-256 对称加密存储，达到临床医疗信息化安全规范。")
    ]

    for title, desc in upgrades:
        p = doc.add_paragraph()
        p.paragraph_format.line_spacing = 1.3
        p.paragraph_format.space_before = Pt(4)
        p.paragraph_format.space_after = Pt(4)
        p.paragraph_format.first_line_indent = Pt(21)
        r_t = p.add_run(title + "\n")
        r_t.font.name = 'SimHei'
        r_t.font.size = Pt(11)
        r_t.font.bold = True
        r_t.font.color.rgb = COLOR_PRIMARY_DARK
        r_d = p.add_run(desc)
        r_d.font.name = 'SimSun'
        r_d.font.size = Pt(10)
        r_d.font.color.rgb = COLOR_TEXT_MAIN

    p_tbl = doc.add_paragraph()
    p_tbl.paragraph_format.space_before = Pt(10)
    p_tbl.paragraph_format.space_after = Pt(4)
    p_tbl.alignment = WD_ALIGN_PARAGRAPH.CENTER
    r = p_tbl.add_run("表 1：V1.0 与 V2.0.0 核心版本特性与参数对比表")
    r.font.name = 'SimHei'
    r.font.size = Pt(10)
    r.font.bold = True
    r.font.color.rgb = COLOR_PRIMARY_DARK
    
    headers = ["对比维度", "V1.0 版本", "V2.0.0 升级版本", "升级效益与独创性体现"]
    data = [
        ["前端框架", "原生单端开发", "uni-app + Vue 跨平台架构", "多端自适应渲染，交互响应大幅提升"],
        ["数据模态", "单一主观问卷自测", "主观心理 + 客观生理多模态", "引入Garmin手环连续生理体征，打破主观误差"],
        ["AI智能评估", "无AI图像识别能力", "HTP房树人AI视觉大模型解析", "实现手绘画作6维度特征自动提取与量化评分"],
        ["智能交互", "静态表单与文章阅读", "24h心晴AI流式心理陪伴对话", "拟人化共情倾听、认知重塑与危机干预"],
        ["情绪追踪", "离散单次问卷", "EMA瞬时情绪脸谱 + NLP日记极性", "全天多点瞬时心境采样，克服回溯记忆偏差"],
        ["评估报告", "单量表离散展示", "主客观融合0-100分 + 六维雷达图", "输出综合身心指数，支持一键PDF临床导出"],
        ["有效代码量", "18,200 行", "48,560 行", "新增核心代码量超 30,000 行，系统全面跃升"]
    ]
    
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
        set_cell_margins(hdr_cells[i], top=120, bottom=120, left=150, right=150)
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
            set_cell_margins(row_cells[c_idx], top=90, bottom=90, left=140, right=140)
            if r_idx % 2 == 1:
                shd = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), COLOR_BG_ZEBRA))
                row_cells[c_idx]._tc.get_or_add_tcPr().append(shd)
                
    p_end = doc.add_paragraph()
    p_end.paragraph_format.space_before = Pt(28)
    p_end.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    r = p_end.add_run("申请人（著作权人）：陈海丰\n2026年")
    r.font.name = 'SimSun'
    r.font.size = Pt(11)
    r.font.bold = True
    r.font.color.rgb = COLOR_PRIMARY_DARK

    out_docx = os.path.join(out_folder, "版本升级说明.docx")
    doc.save(out_docx)
    print(f"Generated: {out_docx}")
    
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    out_doc = os.path.join(out_folder, "版本升级说明.doc")
    wdoc = word.Documents.Open(out_docx)
    wdoc.SaveAs2(out_doc, FileFormat=0) # wdFormatDocument = 0
    wdoc.Close(False)
    word.Quit()
    print("Upgrade spec formatting completed successfully.")

if __name__ == '__main__':
    build_upgrade_v2()
