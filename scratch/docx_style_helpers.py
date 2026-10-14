import os
import docx
from docx.shared import Pt, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_ALIGN_VERTICAL
from docx.oxml import OxmlElement, parse_xml
from docx.oxml.ns import qn, nsdecls

# Palette
COLOR_PRIMARY_DARK = RGBColor(21, 67, 96)     # #154360 Deep Navy
COLOR_PRIMARY = RGBColor(31, 97, 141)          # #1F618D Classic Blue
COLOR_ACCENT = RGBColor(41, 128, 185)          # #2980B9 Cerulean
COLOR_TEXT_MAIN = RGBColor(44, 62, 80)         # #2C3E50 Dark Slate Text
COLOR_TEXT_MUTED = RGBColor(127, 140, 141)     # #7F8C8D Gray
COLOR_BORDER = 'BDC3C7'
COLOR_BG_HEADER = '1F618D'
COLOR_BG_ZEBRA = 'F4F6F7'
COLOR_CALLOUT_BG = 'EBF5FB'

def set_cell_margins(cell, top=100, bottom=100, left=150, right=150):
    """Set inner cell padding in twips (1 pt = 20 twips)."""
    tcPr = cell._tc.get_or_add_tcPr()
    tcMar = parse_xml(r'''
        <w:tcMar {} >
            <w:top w:w="{}" w:type="dxa"/>
            <w:bottom w:w="{}" w:type="dxa"/>
            <w:left w:w="{}" w:type="dxa"/>
            <w:right w:w="{}" w:type="dxa"/>
        </w:tcMar>'''.format(nsdecls('w'), top, bottom, left, right))
    tcPr.append(tcMar)

def set_cell_shading(cell, color_hex):
    """Set background color of a table cell."""
    tcPr = cell._tc.get_or_add_tcPr()
    shd = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), color_hex))
    tcPr.append(shd)

def set_table_borders(table):
    """Set professional light-gray horizontal borders and subtle outer box."""
    tblPr = table._tbl.tblPr
    borders = parse_xml(r'''
        <w:tblBorders {} >
            <w:top w:val="single" w:sz="6" w:space="0" w:color="{}"/>
            <w:left w:val="none"/>
            <w:bottom w:val="single" w:sz="6" w:space="0" w:color="{}"/>
            <w:right w:val="none"/>
            <w:insideH w:val="single" w:sz="4" w:space="0" w:color="{}"/>
            <w:insideV w:val="none"/>
        </w:tblBorders>'''.format(nsdecls('w'), COLOR_BG_HEADER, COLOR_BG_HEADER, COLOR_BORDER))
    tblPr.append(borders)

def add_header_bottom_line(paragraph, color_hex="BDC3C7", size="4"):
    """Add a bottom dividing line to the header paragraph."""
    pPr = paragraph._p.get_or_add_pPr()
    pBdr = parse_xml(r'''
        <w:pBdr {} >
            <w:bottom w:val="single" w:sz="{}" w:space="4" w:color="{}"/>
        </w:pBdr>'''.format(nsdecls('w'), size, color_hex))
    pPr.append(pBdr)

def add_callout_box(doc, text, bold_title="【重要提示与注意事项】"):
    """Add an elegant callout box with a thick left blue border."""
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.25
    p.paragraph_format.space_before = Pt(8)
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
    shd_xml = parse_xml(r'<w:shd {} w:fill="{}"/>'.format(nsdecls('w'), COLOR_CALLOUT_BG))
    pPr.append(callout_xml)
    pPr.append(shd_xml)
    
    r_title = p.add_run(bold_title + "\n")
    r_title.font.name = 'SimHei'
    r_title.font.size = Pt(10)
    r_title.font.bold = True
    r_title.font.color.rgb = COLOR_PRIMARY_DARK
    
    r_txt = p.add_run(text)
    r_txt.font.name = 'SimSun'
    r_txt.font.size = Pt(9.5)
    r_txt.font.color.rgb = COLOR_TEXT_MAIN

print("Style helper module ready.")
