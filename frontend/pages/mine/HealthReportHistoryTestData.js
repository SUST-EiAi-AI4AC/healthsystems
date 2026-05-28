/**
 * 健康报告历史记录测试数据生成脚本
 * 
 * 使用方法：
 * 在浏览器控制台或 uni-app 环境中运行此脚本，生成测试用的历史报告数据
 */

// 生成随机日期（过去 N 天内）
function randomDate(days) {
  const date = new Date();
  date.setDate(date.getDate() - Math.floor(Math.random() * days));
  return date;
}

// 格式化日期为中文格式
function formatDateCN(date) {
  const pad = n => String(n).padStart(2, '0');
  return `${date.getFullYear()}年${pad(date.getMonth() + 1)}月${pad(date.getDate())}日`;
}

// 生成随机评分
function randomScore(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// 根据评分生成等级
function getLevel(score) {
  if (score >= 85) return { level: '优秀', color: '#27ae60' };
  if (score >= 70) return { level: '良好', color: '#2980b9' };
  if (score >= 55) return { level: '一般', color: '#f39c12' };
  return { level: '需关注', color: '#e74c3c' };
}

// 生成测试数据
function generateTestReports(count = 30) {
  const reports = [];
  
  for (let i = 0; i < count; i++) {
    const date = randomDate(90); // 过去 90 天内
    const overallScore = randomScore(45, 95);
    const levelInfo = getLevel(overallScore);
    
    const report = {
      date: date.toISOString(),
      reportDate: formatDateCN(date),
      overallScore: overallScore,
      overallLevel: levelInfo.level,
      overallTip: generateTip(overallScore),
      scaleData: {
        sds: randomScore(25, 80).toString(),
        sdsLevel: getRandomLevel(),
        pss: randomScore(10, 45).toString(),
        pssLevel: getRandomLevel(),
        sas: randomScore(25, 75).toString(),
        sasLevel: getRandomLevel()
      },
      braceletData: {
        heartRate: randomScore(50, 100).toString(),
        sleep: randomScore(40, 95).toString(),
        steps: randomScore(3000, 15000).toString(),
        spo2: randomScore(92, 100).toString(),
        stress: randomScore(20, 80).toString(),
        battery: randomScore(30, 100).toString()
      },
      advice: generateAdvice(overallScore),
      dataSources: ['HTP 画画', '自助量表', '医评量表', '智能手环'].slice(0, randomScore(2, 4))
    };
    
    reports.push(report);
  }
  
  // 按日期倒序排序
  reports.sort((a, b) => new Date(b.date) - new Date(a.date));
  
  return reports;
}

// 生成建议
function generateAdvice(score) {
  const advices = [
    '保持良好的作息习惯，每天保证 7-8 小时睡眠。',
    '适当增加户外运动，每周至少 150 分钟中等强度运动。',
    '学习冥想放松技巧，减轻心理压力。',
    '保持均衡饮食，多摄入蔬菜水果。',
    '减少咖啡因和糖分摄入，避免影响睡眠。',
    '定期进行心理测评，关注心理健康状态。',
    '培养兴趣爱好，丰富精神生活。',
    '保持社交活动，与家人朋友多交流。'
  ];
  
  // 根据评分返回不同数量的建议
  const count = score >= 85 ? 2 : score >= 70 ? 3 : 4;
  const shuffled = advices.sort(() => 0.5 - Math.random());
  return shuffled.slice(0, count);
}

// 随机生成量表等级
function getRandomLevel() {
  const levels = ['正常', '轻度', '中度', '偏重', '重度'];
  const weights = [0.5, 0.25, 0.15, 0.07, 0.03]; // 权重
  
  const rand = Math.random();
  let sum = 0;
  for (let i = 0; i < weights.length; i++) {
    sum += weights[i];
    if (rand <= sum) return levels[i];
  }
  return levels[0];
}

// 根据评分生成提示
function generateTip(score) {
  if (score >= 85) {
    return '您的心理健康状况非常不错，请继续保持良好的生活习惯。';
  } else if (score >= 70) {
    return '整体状态还不错，可适当关注一些小细节，让自己过得更舒服。';
  } else if (score >= 55) {
    return '最近可能有些疲惫，不妨慢下来好好休息，关注一下自己的心理状态。';
  } else {
    return '最近内心可能有些负担，记得给自己一些关爱，必要时可以找人倾诉心里话。';
  }
}

// 保存数据到 localStorage
function saveToLocalStorage() {
  const testReports = generateTestReports(30);
  
  try {
    // 检查是否已有数据
    const existing = uni.getStorageSync('health_report_history') || [];
    
    if (existing.length > 0) {
      console.log('已存在历史数据，是否覆盖？(y/n)');
      // 实际使用时可以通过弹窗确认
      // uni.showModal({
      //   title: '提示',
      //   content: `已存在 ${existing.length} 条历史记录，是否覆盖？`,
      //   success: function(res) {
      //     if (res.confirm) {
      //       uni.setStorageSync('health_report_history', testReports);
      //       console.log('测试数据已保存:', testReports.length, '条');
      //     }
      //   }
      // });
      return;
    }
    
    uni.setStorageSync('health_report_history', testReports);
    console.log('✅ 测试数据已生成并保存:', testReports.length, '条');
    console.log('请在健康报告页面点击"历史记录"按钮查看');
    
  } catch (e) {
    console.error('保存测试数据失败:', e);
  }
}

// 清空测试数据
function clearTestData() {
  try {
    uni.removeStorageSync('health_report_history');
    console.log('✅ 测试数据已清空');
  } catch (e) {
    console.error('清空数据失败:', e);
  }
}

// 查看当前数据
function viewCurrentData() {
  try {
    const data = uni.getStorageSync('health_report_history') || [];
    console.log(`当前共有 ${data.length} 条历史记录`);
    if (data.length > 0) {
      console.log('最新记录:', data[0]);
      console.log('最早记录:', data[data.length - 1]);
    }
  } catch (e) {
    console.error('读取数据失败:', e);
  }
}

// 导出函数供外部使用
export default {
  generateTestReports,
  saveToLocalStorage,
  clearTestData,
  viewCurrentData
};

// 如果在浏览器环境，自动执行
if (typeof window !== 'undefined') {
  console.log('📋 健康报告测试数据生成脚本已加载');
  console.log('使用方法：');
  console.log('  1. 生成测试数据：saveToLocalStorage()');
  console.log('  2. 查看当前数据：viewCurrentData()');
  console.log('  3. 清空测试数据：clearTestData()');
}
