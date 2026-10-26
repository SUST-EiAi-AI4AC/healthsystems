# -*- coding: utf-8 -*-
"""
设计说明书排版优化转换脚本
- 标题1: 宋体 三号(16pt) 加粗 黑色, 段前6磅, 段后0.5行, keepNext/keepLines, 大纲1级, 章前分页
- 标题2: Calibri 小三(15pt) 加粗 黑色, 同上间距, 大纲2级
- 标题3: Calibri 四号(14pt) 加粗 黑色, 同上间距, 大纲3级
- 清除标题段落直接格式(蓝色2874A6/34495E、黑体、直接缩进/间距)
- 目录: 补全缺失条目(3.5.5/4.2.5), 修复6.3条目样式, updateFields自动刷新
"""
import re, zipfile, shutil, os

SRC = 'E:/Code/AI/Start/Web/Mindapp/healthsystems/doc/软著V2.0/基于多模态AI的心理健康管理APP V2.0-设计说明书.docx'
DST = 'E:/Code/AI/Start/Web/Mindapp/healthsystems/doc/软著V2.0/基于多模态AI的心理健康管理APP V2.0-设计说明书-排版优化版.docx'
WORK = 'E:/Code/AI/Start/Web/Mindapp/healthsystems/scratch/design_docx_x'

def read(p):
    with open(os.path.join(WORK, p), encoding='utf-8') as f:
        return f.read()

def write(p, s):
    with open(os.path.join(WORK, p), 'w', encoding='utf-8') as f:
        f.write(s)

# ============ 1. styles.xml ============
styles = read('word/styles.xml')

def replace_style_block(xml, style_id, new_inner_tail):
    """Replace the pPr/rPr (or just rPr for char styles) inside the style block."""
    pat = re.compile(r'(<w:style\b[^>]*w:styleId="' + re.escape(style_id) + r'"[^>]*>)(.*?)(</w:style>)', re.S)
    m = pat.search(xml)
    assert m, f'style {style_id} not found'
    body = m.group(2)
    # remove existing pPr and rPr (keep name/basedOn/next/link/uiPriority/etc.)
    body2 = re.sub(r'<w:pPr>.*?</w:pPr>', '', body, flags=re.S)
    body2 = re.sub(r'<w:rPr>.*?</w:rPr>', '', body2, flags=re.S)
    # insert new pPr/rPr right before </w:style> -> i.e., append to body (schema: pPr, rPr last)
    body2 = body2 + new_inner_tail
    return xml[:m.start()] + m.group(1) + body2 + m.group(3) + xml[m.end():]

H1_PPR = ('<w:pPr><w:keepNext/><w:keepLines/><w:pageBreakBefore/>'
          '<w:spacing w:before="120" w:after="120" w:afterLineUnits="120"/>'
          '<w:ind w:firstLineChars="0" w:firstLine="0"/><w:outlineLvl w:val="0"/></w:pPr>'
          '<w:rPr><w:rFonts w:ascii="宋体" w:eastAsia="宋体" w:hAnsi="宋体"/><w:b/><w:bCs/>'
          '<w:color w:val="000000"/><w:sz w:val="32"/><w:szCs w:val="32"/><w:lang w:eastAsia="zh-CN"/></w:rPr>')
H2_PPR = ('<w:pPr><w:keepNext/><w:keepLines/>'
          '<w:spacing w:before="120" w:after="120" w:afterLineUnits="120"/>'
          '<w:ind w:firstLineChars="0" w:firstLine="0"/><w:outlineLvl w:val="1"/></w:pPr>'
          '<w:rPr><w:rFonts w:ascii="Calibri" w:eastAsia="宋体" w:hAnsi="Calibri"/><w:b/><w:bCs/>'
          '<w:color w:val="000000"/><w:sz w:val="30"/><w:szCs w:val="30"/><w:lang w:eastAsia="zh-CN"/></w:rPr>')
H3_PPR = ('<w:pPr><w:keepNext/><w:keepLines/>'
          '<w:spacing w:before="120" w:after="120" w:afterLineUnits="120"/>'
          '<w:ind w:firstLineChars="0" w:firstLine="0"/><w:outlineLvl w:val="2"/></w:pPr>'
          '<w:rPr><w:rFonts w:ascii="Calibri" w:eastAsia="宋体" w:hAnsi="Calibri"/><w:b/><w:bCs/>'
          '<w:color w:val="000000"/><w:sz w:val="28"/><w:szCs w:val="28"/><w:lang w:eastAsia="zh-CN"/></w:rPr>')
C1 = ('<w:rPr><w:rFonts w:ascii="宋体" w:eastAsia="宋体" w:hAnsi="宋体"/><w:b/><w:bCs/>'
      '<w:color w:val="000000"/><w:sz w:val="32"/><w:szCs w:val="32"/></w:rPr>')
C2 = ('<w:rPr><w:rFonts w:ascii="Calibri" w:eastAsia="宋体" w:hAnsi="Calibri"/><w:b/><w:bCs/>'
      '<w:color w:val="000000"/><w:sz w:val="30"/><w:szCs w:val="30"/></w:rPr>')
C3 = ('<w:rPr><w:rFonts w:ascii="Calibri" w:eastAsia="宋体" w:hAnsi="Calibri"/><w:b/><w:bCs/>'
      '<w:color w:val="000000"/><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr>')

styles = replace_style_block(styles, '1', H1_PPR)   # heading 1
styles = replace_style_block(styles, '21', H2_PPR)  # heading 2
styles = replace_style_block(styles, '31', H3_PPR)  # heading 3
styles = replace_style_block(styles, '10', C1)      # 标题1字符
styles = replace_style_block(styles, '22', C2)      # 标题2字符
styles = replace_style_block(styles, '32', C3)      # 标题3字符
write('word/styles.xml', styles)
print('[1] styles.xml: heading 1/2/3 + linked char styles updated')

# ============ 2. document.xml ============
doc = read('word/document.xml')

# 2a. normalize heading paragraphs: pPr -> pStyle only; strip run rPr; drop manual page break in H1
def fix_heading(m):
    p = m.group(0)
    sm = re.search(r'<w:pStyle w:val="(1|21|31)"/>', p)
    if not sm:
        return p  # not a heading paragraph, leave untouched
    sid = sm.group(1)
    p = re.sub(r'<w:pPr>.*?</w:pPr>', '', p, flags=re.S)                 # drop direct pPr
    p = re.sub(r'(<w:r\b[^>]*>)<w:rPr>.*?</w:rPr>', r'\1', p, flags=re.S) # strip run rPr
    if sid == '1':                                                         # H1: remove manual page-break run
        p = re.sub(r'<w:r\b[^>]*>(?:<w:rPr>.*?</w:rPr>)?<w:br w:type="page"/></w:r>', '', p, flags=re.S)
    p = re.sub(r'(<w:p\b[^>]*>)', r'\1<w:pPr><w:pStyle w:val="' + sid + '"/></w:pPr>', p, count=1)
    return p

doc, n_head = re.subn(r'<w:p\b.*?</w:p>', fix_heading, doc, flags=re.S)
print(f'[2a] document.xml: {n_head} paragraphs scanned, heading paragraphs normalized')

# 2b. 目录 title color 154360 -> 000000 (pure black)
before = doc.count('w:val="154360"')
doc = doc.replace('<w:color w:val="154360"/>', '<w:color w:val="000000"/>')
print(f'[2b] document.xml: 目录标题颜色 154360->000000 ({before}处)')

# 2c. fix TOC entry 6.3 (para with anchor _Toc242881410): add TOC2 style + tabs
old_ppr = ('<w:pPr><w:ind w:left="480" w:firstLineChars="0" w:firstLine="0"/>'
           '<w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/></w:rPr></w:pPr>')
new_ppr = ('<w:pPr><w:pStyle w:val="TOC2"/><w:tabs><w:tab w:val="right" w:leader="dot" w:pos="9638"/></w:tabs>'
           '<w:ind w:left="480" w:firstLine="480"/>'
           '<w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:kern w:val="2"/><w:sz w:val="21"/>'
           '<w:lang w:eastAsia="zh-CN"/></w:rPr></w:pPr>')
assert doc.count(old_ppr) == 1, 'TOC 6.3 pPr not unique'
doc = doc.replace(old_ppr, new_ppr)
print('[2c] document.xml: 目录条目 6.3 补齐 TOC2 样式')

# 2d. insert missing TOC entries (3.5.5, 4.2.5) inside TOC field result
def make_toc3(anchor, text, page):
    return ('<w:p><w:pPr><w:pStyle w:val="TOC3"/><w:tabs><w:tab w:val="right" w:leader="dot" w:pos="9638"/></w:tabs>'
            '<w:ind w:left="960" w:firstLine="480"/>'
            '<w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:kern w:val="2"/><w:sz w:val="21"/>'
            '<w:lang w:eastAsia="zh-CN"/></w:rPr></w:pPr>'
            '<w:hyperlink w:anchor="' + anchor + '" w:history="1">'
            '<w:r><w:rPr><w:rStyle w:val="aff9"/><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/></w:rPr>'
            '<w:t xml:space="preserve">' + text + ' </w:t></w:r>'
            '<w:r><w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:webHidden/></w:rPr><w:tab/></w:r>'
            '<w:r><w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:webHidden/></w:rPr>'
            '<w:fldChar w:fldCharType="begin"/></w:r>'
            '<w:r><w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:webHidden/></w:rPr>'
            '<w:instrText xml:space="preserve"> PAGEREF ' + anchor + ' \\h </w:instrText></w:r>'
            '<w:r><w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:webHidden/></w:rPr>'
            '<w:fldChar w:fldCharType="separate"/></w:r>'
            '<w:r><w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:webHidden/></w:rPr>'
            '<w:t>' + page + '</w:t></w:r>'
            '<w:r><w:rPr><w:rFonts w:ascii="宋体" w:hAnsi="宋体"/><w:noProof/><w:webHidden/></w:rPr>'
            '<w:fldChar w:fldCharType="end"/></w:r></w:hyperlink></w:p>')

def insert_after_anchor(xml, anchor, new_para):
    # find the paragraph containing the hyperlink anchor, insert new paragraph after it
    idx = xml.find('w:anchor="' + anchor + '"')
    assert idx > 0, f'anchor {anchor} not found'
    end = xml.find('</w:p>', idx)
    assert end > 0
    end += len('</w:p>')
    return xml[:end] + new_para + xml[end:]

doc = insert_after_anchor(doc, '_Toc242881384', make_toc3('_Toc242881385', '3.5.5 注意力减压互动与引导式正念冥想设计', '13'))
doc = insert_after_anchor(doc, '_Toc242881401', make_toc3('_Toc242881402', '4.2.5 情绪日记与EMA追踪表(emotion_diary)设计', '18'))
print('[2d] document.xml: 目录补录 3.5.5 / 4.2.5 两个缺失条目')
write('word/document.xml', doc)

# ============ 3. settings.xml: updateFields ============
settings = read('word/settings.xml')
if '<w:updateFields' not in settings:
    assert '<w:hdrShapeDefaults>' in settings
    settings = settings.replace('<w:hdrShapeDefaults>', '<w:updateFields w:true="true"/><w:hdrShapeDefaults>', 1)
    write('word/settings.xml', settings)
    print('[3] settings.xml: updateFields=true (打开时自动刷新目录页码)')

# ============ 4. rezip ============
if os.path.exists(DST):
    os.remove(DST)
src_zip = zipfile.ZipFile(SRC, 'r')
with zipfile.ZipFile(DST, 'w', zipfile.ZIP_DEFLATED) as z:
    for item in src_zip.infolist():
        if item.filename == 'word/document.xml':
            z.writestr(item, doc)
        elif item.filename == 'word/styles.xml':
            z.writestr(item, styles)
        elif item.filename == 'word/settings.xml':
            z.writestr(item, settings)
        else:
            z.writestr(item, src_zip.read(item.filename))
src_zip.close()
print('[4] 新文档已生成:', DST, os.path.getsize(DST), 'bytes')
