# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
import docx
from docx.shared import Pt, Inches, RGBColor

template_path = r'e:\Code\AI\Start\Web\Mindapp\healthsystems\doc\软著V2.0\用户说明书模板.docx'
doc = docx.Document(template_path)

print('=== 1. 页面设置 ===')
for i, s in enumerate(doc.sections):
    print(f'Section {i}: Top={s.top_margin.pt}pt, Bottom={s.bottom_margin.pt}pt, Left={s.left_margin.pt}pt, Right={s.right_margin.pt}pt, Width={s.page_width.pt}pt, Height={s.page_height.pt}pt')
    if s.header:
        for p in s.header.paragraphs:
            if p.text.strip():
                print(f'  Header: {p.text.strip()}')
    if s.footer:
        for p in s.footer.paragraphs:
            if p.text.strip():
                print(f'  Footer: {p.text.strip()}')

print('\n=== 2. 段落样式与格式抽样 ===')
print('Total paragraphs in template:', len(doc.paragraphs))
for i in range(min(50, len(doc.paragraphs))):
    p = doc.paragraphs[i]
    txt = p.text.strip()
    style_name = p.style.name if p.style else 'None'
    runs_info = []
    for r in p.runs:
        fn = r.font.name or (p.style.font.name if p.style else None)
        fs = r.font.size.pt if r.font.size else (p.style.font.size.pt if p.style and p.style.font.size else None)
        bold = r.font.bold
        color = str(r.font.color.rgb) if r.font.color and r.font.color.rgb else 'Default'
        runs_info.append(f'({fn},{fs}pt,b={bold},c={color})')
    p_format = f'sb={p.paragraph_format.space_before.pt if p.paragraph_format.space_before else 0}pt, sa={p.paragraph_format.space_after.pt if p.paragraph_format.space_after else 0}pt, ls={p.paragraph_format.line_spacing}'
    if txt or len(p.runs) > 0:
        run_str = ' '.join(runs_info[:3])
        print(f'P{i:02d} [{style_name} | {p_format}]: {txt[:50]} | Runs: {run_str}')

print('\n=== 3. 表格设置 ===')
print('Total tables in template:', len(doc.tables))
for i, t in enumerate(doc.tables):
    print(f'Table {i}: rows={len(t.rows)}, cols={len(t.columns)}')
    for r_idx, row in enumerate(t.rows[:4]):
        row_txt = [c.text.strip().replace('\n', ' ') for c in row.cells]
        print(f'  Row {r_idx}: {row_txt[:4]}')
