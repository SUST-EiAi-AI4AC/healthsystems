-- ============================================
-- 新增功能数据库表检查脚本
-- 用于验证AI聊天分析、日记分析、健康报告模块所需的表是否存在
-- ============================================

-- 1. 检查 ai_chat_session 表是否存在
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'ai_chat_session 表存在 ✓'
        ELSE 'ai_chat_session 表不存在 ✗'
    END AS status
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
AND table_name = 'ai_chat_session';

-- 2. 检查 ai_chat_message 表是否存在
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'ai_chat_message 表存在 ✓'
        ELSE 'ai_chat_message 表不存在 ✗'
    END AS status
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
AND table_name = 'ai_chat_message';

-- 3. 检查 heal_diary 表是否存在
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'heal_diary 表存在 ✓'
        ELSE 'heal_diary 表不存在 ✗'
    END AS status
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
AND table_name = 'heal_diary';

-- 4. 检查 user_health_info 表是否存在
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'user_health_info 表存在 ✓'
        ELSE 'user_health_info 表不存在 ✗'
    END AS status
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
AND table_name = 'user_health_info';

-- 5. 检查 user_info 表是否存在
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'user_info 表存在 ✓'
        ELSE 'user_info 表不存在 ✗'
    END AS status
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
AND table_name = 'user_info';

-- ============================================
-- 数据统计查询
-- ============================================

-- 查看AI聊天会话数量
SELECT 
    'AI聊天会话总数' AS item,
    COUNT(*) AS count
FROM ai_chat_session;

-- 查看AI聊天消息数量
SELECT 
    'AI聊天消息总数' AS item,
    COUNT(*) AS count
FROM ai_chat_message;

-- 查看日记数量
SELECT 
    '日记总数' AS item,
    COUNT(*) AS count
FROM heal_diary;

-- 查看用户健康信息数量
SELECT 
    '用户健康信息总数' AS item,
    COUNT(*) AS count
FROM user_health_info;

-- ============================================
-- 风险等级统计
-- ============================================

-- AI聊天情感分析统计（基于关键词）
SELECT 
    '高风险用户' AS risk_level,
    COUNT(DISTINCT user_id) AS user_count
FROM ai_chat_message 
WHERE role = 'user' 
AND (content LIKE '%抑郁%' OR content LIKE '%难过%' OR content LIKE '%痛苦%' OR content LIKE '%绝望%')

UNION ALL

SELECT 
    '中度风险用户' AS risk_level,
    COUNT(DISTINCT user_id) AS user_count
FROM ai_chat_message 
WHERE role = 'user' 
AND (content LIKE '%焦虑%' OR content LIKE '%担心%' OR content LIKE '%紧张%')

UNION ALL

SELECT 
    '轻度风险用户' AS risk_level,
    COUNT(DISTINCT user_id) AS user_count
FROM ai_chat_message 
WHERE role = 'user' 
AND (content LIKE '%不开心%' OR content LIKE '%烦躁%' OR content LIKE '%疲惫%');

-- 日记情绪评分统计
SELECT 
    CASE 
        WHEN mood_score >= 8 THEN '正常 (8-10分)'
        WHEN mood_score >= 6 THEN '轻度风险 (6-7分)'
        WHEN mood_score >= 4 THEN '中度风险 (4-5分)'
        ELSE '重度风险 (1-3分)'
    END AS risk_level,
    COUNT(*) AS diary_count
FROM heal_diary
GROUP BY 
    CASE 
        WHEN mood_score >= 8 THEN '正常 (8-10分)'
        WHEN mood_score >= 6 THEN '轻度风险 (6-7分)'
        WHEN mood_score >= 4 THEN '中度风险 (4-5分)'
        ELSE '重度风险 (1-3分)'
    END
ORDER BY 
    CASE 
        WHEN mood_score >= 8 THEN 1
        WHEN mood_score >= 6 THEN 2
        WHEN mood_score >= 4 THEN 3
        ELSE 4
    END;

-- 健康报告抑郁程度统计
SELECT 
    CASE 
        WHEN depressed = '正常' OR depressed = '待标注' OR depressed = '' THEN '正常'
        WHEN depressed = '轻度' THEN '轻度风险'
        WHEN depressed = '中度' THEN '中度风险'
        WHEN depressed = '重度' OR depressed = '高危' THEN '重度风险'
        ELSE '其他'
    END AS risk_level,
    COUNT(*) AS user_count
FROM user_health_info
GROUP BY 
    CASE 
        WHEN depressed = '正常' OR depressed = '待标注' OR depressed = '' THEN '正常'
        WHEN depressed = '轻度' THEN '轻度风险'
        WHEN depressed = '中度' THEN '中度风险'
        WHEN depressed = '重度' OR depressed = '高危' THEN '重度风险'
        ELSE '其他'
    END
ORDER BY 
    CASE 
        WHEN depressed = '正常' OR depressed = '待标注' OR depressed = '' THEN 1
        WHEN depressed = '轻度' THEN 2
        WHEN depressed = '中度' THEN 3
        WHEN depressed = '重度' OR depressed = '高危' THEN 4
        ELSE 5
    END;

-- ============================================
-- 用户活跃度统计
-- ============================================

-- 查看用户的日记和聊天活跃度
SELECT 
    u.user_id,
    u.real_name,
    u.user_name,
    COALESCE(d.diary_count, 0) AS diary_count,
    COALESCE(c.chat_count, 0) AS chat_count,
    COALESCE(d.diary_count, 0) + COALESCE(c.chat_count, 0) AS total_activity
FROM user_info u
LEFT JOIN (
    SELECT user_id, COUNT(*) AS diary_count
    FROM heal_diary
    GROUP BY user_id
) d ON u.user_id = d.user_id
LEFT JOIN (
    SELECT user_id, COUNT(*) AS chat_count
    FROM ai_chat_session
    GROUP BY user_id
) c ON u.user_id = c.user_id
WHERE u.role = 'user'
ORDER BY total_activity DESC
LIMIT 20;

-- ============================================
-- 测试查询示例
-- ============================================

-- 查看最近的AI聊天会话
SELECT 
    s.id,
    s.user_id,
    u.real_name,
    u.user_name,
    s.title,
    s.created_at,
    s.updated_at,
    (SELECT COUNT(*) FROM ai_chat_message WHERE session_id = s.id) AS message_count
FROM ai_chat_session s
LEFT JOIN user_info u ON s.user_id = u.user_id
ORDER BY s.updated_at DESC
LIMIT 10;

-- 查看最近的日记记录
SELECT 
    d.id,
    d.user_id,
    u.real_name,
    u.user_name,
    d.mood_label,
    d.mood_score,
    LEFT(d.content, 50) AS content_preview,
    d.add_timestamp_mils
FROM heal_diary d
LEFT JOIN user_info u ON d.user_id = u.user_id
ORDER BY d.add_timestamp_mils DESC
LIMIT 10;

-- 查看用户健康报告
SELECT 
    h.id,
    h.user_id,
    u.real_name,
    u.user_name,
    h.sex,
    h.height,
    h.weight,
    h.depressed,
    h.remark,
    h.mod_timestamp_mils
FROM user_health_info h
LEFT JOIN user_info u ON h.user_id = u.user_id
ORDER BY h.mod_timestamp_mils DESC
LIMIT 10;
