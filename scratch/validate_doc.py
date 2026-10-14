# -*- coding: utf-8 -*-
import sys
sys.stdout.reconfigure(encoding='utf-8')
import win32com.client

word = win32com.client.Dispatch('Word.Application')
word.Visible = False
try:
    doc = word.Documents.Open(r'e:\Code\AI\Start\Web\Mindapp\healthsystems\doc\软著V2.0\软件操作说明书1.doc')
    print('=== 1. 基本信息核验 ===')
    print('文档总页数:', doc.ComputeStatistics(2))
    print('总段落数:', doc.Paragraphs.Count)
    print('图片数 (InlineShapes):', doc.InlineShapes.Count)
    print('表格数:', doc.Tables.Count)
    print('超链接数 (Hyperlinks):', doc.Hyperlinks.Count)
    print('目录对象数 (TOC):', doc.TablesOfContents.Count)
    
    print('\n=== 2. 目录项抽检 ===')
    if doc.TablesOfContents.Count > 0:
        toc_text = doc.TablesOfContents(1).Range.Text
        lines = [line.strip() for line in toc_text.split('\r') if line.strip()]
        print(f'目录总条目数: {len(lines)}')
        for idx, line in enumerate(lines[:12]):
            print(f'  [{idx+1:02d}] {line}')
        print('  ...')
        for idx, line in enumerate(lines[-6:]):
            print(f'  [{len(lines)-5+idx:02d}] {line}')
            
    print('\n=== 3. 敏感词扫描 ===')
    full_text = doc.Content.Text
    sensitive_words = ['wyxcode', '陕西科技大学', '情感计算实验室', '免责声明']
    for word_item in sensitive_words:
        count = full_text.count(word_item)
        print(f'敏感词/冗余词 "{word_item}" 出现次数: {count}')
        
    print('\n=== 4. 关键著作权与多模态独创性词汇频次 ===')
    core_keywords = ['陈海丰', '多模态', '心晴AI', '房树人', 'HTP', 'Garmin', '佳明', '心率变异性', 'EMA', '雷达图', 'MiniMax', '医生端']
    for kw in core_keywords:
        print(f'独创性核心词 "{kw}" 出现次数: {full_text.count(kw)}')
        
    print('\n=== 5. 图片图题核验 ===')
    for i in range(1, doc.Paragraphs.Count + 1):
        p = doc.Paragraphs(i)
        if p.Range.InlineShapes.Count > 0:
            next_p = doc.Paragraphs(i+1) if i < doc.Paragraphs.Count else None
            cap = next_p.Range.Text.strip() if next_p else '无'
            print(f'图片在 P{i:03d} -> 图注: {cap}')
            
    doc.Close(False)
finally:
    word.Quit()
