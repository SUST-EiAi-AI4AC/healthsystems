import docx
from docx.oxml import parse_xml
from docx.oxml.ns import nsdecls
import win32com.client
import os

doc = docx.Document()
p_toc_title = doc.add_paragraph('目  录')

# 添加 TOC 域
p_toc = doc.add_paragraph()
r = p_toc.add_run()
fldChar1 = parse_xml(r'<w:fldChar %s w:fldCharType="begin"/>' % nsdecls('w'))
instrText = parse_xml(r'<w:instrText %s xml:space="preserve"> TOC \o "1-3" \h \z \u </w:instrText>' % nsdecls('w'))
fldChar2 = parse_xml(r'<w:fldChar %s w:fldCharType="separate"/>' % nsdecls('w'))
fldChar3 = parse_xml(r'<w:fldChar %s w:fldCharType="end"/>' % nsdecls('w'))
r._r.append(fldChar1)
r._r.append(instrText)
r._r.append(fldChar2)
r._r.append(fldChar3)

doc.add_page_break()

doc.add_paragraph('第1章 系统概述', style='Heading 1')
doc.add_paragraph('1.1 研发背景', style='Heading 2')
doc.add_paragraph('1.1.1 需求分析', style='Heading 3')
doc.add_paragraph('正文内容...')

test_docx = r'e:\Code\AI\Start\Web\Mindapp\healthsystems\scratch\test_toc_field.docx'
doc.save(test_docx)

word = win32com.client.Dispatch('Word.Application')
word.Visible = False
try:
    wdoc = word.Documents.Open(test_docx)
    print('Initial TOC count:', wdoc.TablesOfContents.Count)
    print('Initial Fields count:', wdoc.Fields.Count)
    for f in wdoc.Fields:
        f.Update()
    print('After update Fields count:', wdoc.Fields.Count)
    print('After update TOC count:', wdoc.TablesOfContents.Count)
    if wdoc.TablesOfContents.Count > 0:
        toc_text = wdoc.TablesOfContents(1).Range.Text
        print('TOC Content:\n', toc_text)
    
    out_doc = r'e:\Code\AI\Start\Web\Mindapp\healthsystems\scratch\test_toc_field_out.doc'
    wdoc.SaveAs2(out_doc, FileFormat=0) # 0 = wdFormatDocument (.doc)
    wdoc.Close(False)
    print('Saved to .doc successfully!')
finally:
    word.Quit()
