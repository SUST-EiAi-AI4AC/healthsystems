import os
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import qn, nsdecls
import win32com.client

base = r'e:\Code\AI\Start\Web\Mindapp\healthsystems'
out_folder = os.path.join(base, 'doc', '软著V2.0')

def add_table_data(doc, headers, data):
    t = doc.add_table(rows=len(data) + 1, cols=len(headers))
    t.alignment = WD_TABLE_ALIGNMENT.CENTER
    t.autofit = True
    
    # Header row
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
        shading = parse_xml(r'<w:shd {} w:fill="2874A6"/>'.format(nsdecls('w')))
        hdr_cells[i]._tc.get_or_add_tcPr().append(shading)
        
    for r_idx, row in enumerate(data):
        row_cells = t.rows[r_idx + 1].cells
        for c_idx, val in enumerate(row):
            row_cells[c_idx].text = val
            p = row_cells[c_idx].paragraphs[0]
            p.alignment = WD_ALIGN_PARAGRAPH.LEFT if c_idx > 1 else WD_ALIGN_PARAGRAPH.CENTER
            for r in p.runs:
                r.font.name = 'SimSun'
                r.font.size = Pt(9)
            if r_idx % 2 == 1:
                shading = parse_xml(r'<w:shd {} w:fill="F2F4F4"/>'.format(nsdecls('w')))
                row_cells[c_idx]._tc.get_or_add_tcPr().append(shading)
    doc.add_paragraph().paragraph_format.space_after = Pt(6)

def generate_upgrade_spec():
    doc = docx.Document()
    for s in doc.sections:
        s.top_margin = Inches(1.0)
        s.bottom_margin = Inches(1.0)
        s.left_margin = Inches(1.0)
        s.right_margin = Inches(1.0)
        
    p_t = doc.add_paragraph()
    p_t.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_t.paragraph_format.space_before = Pt(12)
    p_t.paragraph_format.space_after = Pt(18)
    r = p_t.add_run("版本升级说明")
    r.font.name = 'SimHei'
    r.font.size = Pt(18)
    r.font.bold = True
    r.font.color.rgb = RGBColor(21, 67, 96)
    
    p_intro = doc.add_paragraph()
    p_intro.paragraph_format.line_spacing = 1.25
    r = p_intro.add_run("中国版权保护中心：\n    我公司/本人独立开发的软件《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》是由前序版本《基于移动端的精神健康管理系统APP V1.0》（证书号及软著登记历史已备案）升级研发而来。根据实际科研与临床医疗信息化需求，本次由 V1.0 版本升级到 V2.0.0 版本进行了底层架构全面重构、核心算法垂直赋能与多模态业务深度扩展，源程序有效代码量由 V1.0 的 18,200 行扩充至 48,560 行。具体升级改进要点如下：")
    r.font.name = 'SimSun'
    r.font.size = Pt(10.5)

    upgrades = [
        ("1. 客户端跨平台架构全面重构", 
         "V1.0 仅采用基础单端前端开发，适配性与交互响应受限；V2.0 全面重构为基于 uni-app + Vue 跨平台组件化架构，实现 Android 原生应用、iOS 及移动端 H5 浏览器的高性能编译与界面高保真还原，大幅提升了操作流畅度与界面审美体验。"),
        ("2. 穿戴式连续客观生理多模态指标引入与自动化同步", 
         "突破 V1.0 仅依赖单一主观自评问卷的局限性，V2.0 首次集成 Garmin Connect API 开放平台，服务端构建多线程守护调度引擎，支持 7×24 小时自动定时拉取、解密与清洗用户智能手环客观生理数据（连续心率、夜间 SpO2 脉搏血氧、睡眠结构深度分期、HRV 压力指数与身体电量），实现了主客观多模态数据的协同印证。"),
        ("3. HTP 房树人智能画布触控交互与 AI 视觉大模型量化解析", 
         "V2.0 全新研发了多点触控 Canvas 手绘白板，支持受测者在手机端自由调节画笔粗细与调色盘进行房树人投射心理学绘图；服务端引入多模态 AI 视觉大模型，深度解析画作色彩直方图、四象限空间几何构图、线条笔触力道等物理特征，自动输出六大维度量化打分与专业心理分析报告。"),
        ("4. “心晴AI”24小时流式心理陪伴与共情对话系统", 
         "V2.0 新增了全天候在线 AI 心理陪伴对话功能，搭载针对心理咨询话术微调的大模型引擎，支持 SSE 逐字流式打字机响应、多通道语音转文字输入与敏感危机熔断干预机制，具备澄清、共情共鸣与认知重塑能力，极大拓展了日常心理支持的即时性。"),
        ("5. EMA 生态瞬时情绪图谱采集与日记 NLP 情感计算", 
         "V2.0 引入生态瞬时评估（EMA）理念，设计了基于 PAM-16 情绪模型的 16 种生动拟人脸谱与 1-5 级强度滑块，记录全天真实情境下的瞬时心境；结合情感日记自然语言处理（NLP）极性分析算法，自动计算情绪演变时序折线，克服了传统量表回溯性记忆偏差。"),
        ("6. 多模态身心健康数学融合模型与六维雷达图报告", 
         "V2.0 自主研发了多模态身心健康加权评估数学模型，将客观生理时序特征（权重 45%）与主观心理测评特征（权重 55%）进行 Z-score 标准化融合，输出 0-100 分综合健康指数、ECharts 全景六维身心雷达图与一键导出归档的标准化 PDF 临床病历报告。"),
        ("7. 医患专属邀请码绑定机制与金融级数据安全加固", 
         "V2.0 创新设计了“6 位专属邀请码医患绑定机制”，保障临床诊疗隐私闭环；系统采用 Apache Shiro + JWT 双重网关鉴权机制，核心生理指标、佳明授权凭证及对话数据全部采用 AES-256 对称加密存储，达到临床医疗信息化安全规范。")
    ]

    for title, desc in upgrades:
        p = doc.add_paragraph()
        p.paragraph_format.line_spacing = 1.25
        p.paragraph_format.space_before = Pt(4)
        p.paragraph_format.space_after = Pt(4)
        r_t = p.add_run(f"    {title}\n")
        r_t.font.name = 'SimSun'
        r_t.font.size = Pt(10.5)
        r_t.font.bold = True
        r_t.font.color.rgb = RGBColor(26, 82, 118)
        r_d = p.add_run(f"    {desc}")
        r_d.font.name = 'SimSun'
        r_d.font.size = Pt(10)

    p_tbl = doc.add_paragraph()
    p_tbl.paragraph_format.space_before = Pt(8)
    r = p_tbl.add_run("附表：V1.0 与 V2.0.0 核心版本特性与参数对比")
    r.font.name = 'SimHei'
    r.font.size = Pt(10)
    r.font.bold = True
    
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
    add_table_data(doc, headers, data)
    
    p_end = doc.add_paragraph()
    p_end.paragraph_format.space_before = Pt(16)
    p_end.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    r = p_end.add_run("申请人（著作权人）：陈海丰\n2026年")
    r.font.name = 'SimSun'
    r.font.size = Pt(10.5)

    out_docx = os.path.join(out_folder, "版本升级说明.docx")
    doc.save(out_docx)
    print(f"Generated: {out_docx}")
    
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    out_doc = os.path.join(out_folder, "版本升级说明.doc")
    wdoc = word.Documents.Open(out_docx)
    wdoc.SaveAs2(out_doc, FileFormat=0)
    wdoc.Close(False)
    word.Quit()
    print(f"Generated legacy: {out_doc}")

def generate_rectify_letter():
    doc = docx.Document()
    for s in doc.sections:
        s.top_margin = Inches(1.0)
        s.bottom_margin = Inches(1.0)
        s.left_margin = Inches(1.0)
        s.right_margin = Inches(1.0)
        
    p_t = doc.add_paragraph()
    p_t.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_t.paragraph_format.space_before = Pt(12)
    p_t.paragraph_format.space_after = Pt(18)
    r = p_t.add_run("计算机软件著作权登记补正说明函")
    r.font.name = 'SimHei'
    r.font.size = Pt(18)
    r.font.bold = True
    r.font.color.rgb = RGBColor(21, 67, 96)

    p_body = doc.add_paragraph()
    p_body.paragraph_format.line_spacing = 1.3
    r = p_body.add_run(
        "中国版权保护中心 审查员老师：\n"
        "    您好！\n"
        "    申请人 陈海丰 申请的计算机软件著作权登记项目《基于多模态AI的心理健康管理APP[简称：心晴AI]V2.0.0》（流水号：2026R11L2566015，代理机构：北京鼎泰正和知识产权代理有限公司），于日前收到贵中心下发的《软件登记补正通知书》，审查意见为：“提交的文档和源程序鉴别材料模板化程度较高，请提交具有独创性、代表性的文档和源程序鉴别材料。”\n"
        "    申请人高度重视审查员指出的问题，立即组织专业技术力量对前期申报材料进行了深入排查与彻底重构。本次补正材料已针对审查意见完成了全面的实质性修正，现将具体补正情况汇报如下：\n\n"
        "一、 源程序鉴别材料（源代码）的全面重构与独创性说明：\n"
        "    1. 彻底剔除第三方通用开源代码：前期材料由于提取失误，混入了 WebRTC adapter 等前端开源工具垫片代码，导致出现模板化特征。本次提交的全新《源代码》已彻底清除所有第三方开源库与工具代码，所选取的全部代码 100% 为申请人独立自主研发的业务核心算法。\n"
        "    2. 全面提取体现“多模态AI”与“心理健康管理”的代表性代码：本次严格按照 CPCC 规范提取了标准的 60 页（共计 3000 行，每页 50 行，前 30 页与后 30 页连续完整），涵盖：\n"
        "       - 客户端多模态前端交互：App主架构生命周期(App.vue)、HTP房树人智能画布触控交互(aiassess.vue)、心晴AI心理陪伴流式对话交互(heal.vue)、Garmin手环多生理指标看板(BraceletData.vue)、EMA瞬时情绪图谱(EMA.vue)；\n"
        "       - 服务端多模态AI与生理算法模型：AI大模型心理咨询Prompt工程服务(AiChatAnalysisService.java)、HTP房树人6维图像特征量化解析引擎(HtpAnalysisService.java)、Garmin手环客观生理数据调度清洗模型(GarminAnalysisService.java)、夜间SpO2血氧多模态分析(SpO2Service.java)、专业量表计分引擎(ScaleAnalysisService.java)、情绪日记NLP极性分析(DiaryAnalysisService.java)、多模态身心健康综合评估雷达图服务(HealthReportService.java)。\n"
        "    代码结构严密、注释详实、算法独创，具备高度的代表性与软件工程严肃性。\n\n"
        "二、 文档鉴别材料（软件操作说明书）的扩充升华与独创性说明：\n"
        "    1. 深度扩充篇幅与实操细节：针对此前说明书篇幅单薄的问题，全新编制的《软件操作说明书》全面扩充至 36 页、逾 10,300 词，结构严谨，涵盖 11 个完整业务章节。\n"
        "    2. 丰富真实界面与操作指引：文档内插入了 14 张高清实操流程图，重点针对“HTP房树人手绘板操作与AI量化报告”、“Garmin手环连续生理时序看板”、“心晴AI流式共情陪伴”、“EMA瞬时情绪打卡”、“专业量表评估”与“六维健康雷达图报告”等核心独创功能进行了详细的分步拆解与临床参数解读。\n"
        "    3. 规范版权信息与主体一致性：清理了任何可能引起争议的外部信息与无意义套话，全篇统一为申请人 陈海丰 独立研发体系，体现严谨的软件操作规范。\n\n"
        "三、 配套材料协同修正：\n"
        "    同步重新修订了《版本升级说明》，详细对照了 V1.0 至 V2.0.0 的技术架构跃升与 30,000 余行新增代码分布，确立了扎实的软件著作权独创性证据链。\n\n"
        "    综上所述，本次补正材料完全符合《计算机软件著作权登记办法》的各项规定，特此提请贵中心依法予以复审并颁发软件著作权登记证书。万分感谢审查员老师的辛勤审查！\n"
    )
    r.font.name = 'SimSun'
    r.font.size = Pt(10.5)

    p_end = doc.add_paragraph()
    p_end.paragraph_format.space_before = Pt(20)
    p_end.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    r = p_end.add_run(
        "申请人：陈海丰\n"
        "代理人：北京鼎泰正和知识产权代理有限公司\n"
        "日期：2026年\n"
    )
    r.font.name = 'SimSun'
    r.font.size = Pt(10.5)

    out_docx = os.path.join(out_folder, "计算机软件著作权登记补正说明函.docx")
    doc.save(out_docx)
    print(f"Generated: {out_docx}")
    
    word = win32com.client.Dispatch('Word.Application')
    word.Visible = False
    out_doc = os.path.join(out_folder, "计算机软件著作权登记补正说明函.doc")
    wdoc = word.Documents.Open(out_docx)
    wdoc.SaveAs2(out_doc, FileFormat=0)
    wdoc.Close(False)
    word.Quit()
    print(f"Generated legacy: {out_doc}")

if __name__ == '__main__':
    generate_upgrade_spec()
    generate_rectify_letter()
