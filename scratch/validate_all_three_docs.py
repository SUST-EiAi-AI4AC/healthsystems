# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
import win32com.client
import os

files_to_check = [
    ("基于多模态AI的心理健康管理APP V2.0-设计说明书.doc", 1),
    ("版本升级说明.doc", 0),
    ("软件操作说明书1.doc", 8)
]

base_dir = r'e:\Code\AI\Start\Web\Mindapp\healthsystems\doc\软著V2.0'
word = win32com.client.Dispatch('Word.Application')
word.Visible = False

try:
    for fname, expected_imgs in files_to_check:
        fpath = os.path.join(base_dir, fname)
        doc = word.Documents.Open(fpath)
        doc.ActiveWindow.View.Type = 3
        doc.Repaginate()
        pages = doc.ComputeStatistics(2)
        paras = doc.Paragraphs.Count
        shapes = doc.InlineShapes.Count
        tocs = doc.TablesOfContents.Count
        hyperlinks = doc.Hyperlinks.Count
        
        print(f"==================================================")
        print(f"文件名称: {fname}")
        print(f"文件大小: {os.path.getsize(fpath)} bytes")
        print(f"实际页数: {pages} 页")
        print(f"段落总数: {paras}")
        print(f"内嵌图片: {shapes} (期望: {expected_imgs})")
        print(f"目录TOC数: {tocs}")
        print(f"超链接数: {hyperlinks}")
        
        if tocs > 0:
            toc = doc.TablesOfContents(1)
            toc_lines = [l.strip() for l in toc.Range.Text.split('\r') if l.strip()]
            print(f"目录项数量: {len(toc_lines)}")
            print("目录前5项抽样:")
            for l in toc_lines[:5]:
                print("  ", l)
            print("目录后3项抽样:")
            for l in toc_lines[-3:]:
                print("  ", l)
                
        # 敏感词扫描
        text = doc.Content.Text
        sensitive = ['wyxcode', '陕西科技大学', '情感计算实验室']
        for s in sensitive:
            c = text.count(s)
            if c > 0:
                print(f"  [WARNING] 敏感词 '{s}' 发现 {c} 次!")
        print(f"  著作权人‘陈海丰’出现次数: {text.count('陈海丰')}")
        print(f"  软件全称与多模态核心词出现次数: {text.count('多模态')}")
        doc.Close(False)
finally:
    word.Quit()
print("All validations completed!")
