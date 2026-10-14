import docx
from docx.oxml import parse_xml
from docx.oxml.ns import nsdecls

doc = docx.Document()

# 1. Add Bookmark to a paragraph
def add_bookmark(paragraph, bookmark_id, bookmark_name):
    p = paragraph._p
    tag_start = parse_xml(r'<w:bookmarkStart {} w:id="{}" w:name="{}"/>'.format(nsdecls('w'), bookmark_id, bookmark_name))
    tag_end = parse_xml(r'<w:bookmarkEnd {} w:id="{}"/>'.format(nsdecls('w'), bookmark_id))
    p.append(tag_start)
    p.append(tag_end)

# 2. Add Hyperlink to bookmark
def add_hyperlink_to_bookmark(paragraph, bookmark_name, text):
    hyperlink = parse_xml(r'<w:hyperlink {} w:anchor="{}"><w:r><w:rPr><w:color w:val="1F618D"/><w:u w:val="single"/><w:rFonts w:ascii="SimSun" w:eastAsia="SimSun"/><w:sz w:val="21"/></w:rPr><w:t>{}</w:t></w:r></w:hyperlink>'.format(nsdecls('w'), bookmark_name, text))
    paragraph._p.append(hyperlink)

# Test in doc
p_toc = doc.add_paragraph('目录: ')
add_hyperlink_to_bookmark(p_toc, 'module_1', '跳转到模块1')

doc.add_page_break()

p_m1 = doc.add_paragraph('// ========== 模块1代码开始 ==========')
add_bookmark(p_m1, '1', 'module_1')

doc.save(r'e:\Code\AI\Start\Web\Mindapp\healthsystems\scratch\test_bookmark.docx')
print('Bookmark test saved successfully.')
