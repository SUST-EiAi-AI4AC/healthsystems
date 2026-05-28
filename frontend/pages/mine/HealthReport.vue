<template>
	<scroll-view scroll-y class="page-wrap">
		<!-- 顶部 Banner -->
		<view class="banner">
			<view class="banner-inner">
				<view class="banner-title-row">
					<view class="banner-title">综合健康报告</view>
					<view class="history-btn" @click="showHistory = true">
						<text class="history-icon">📅</text>
						<text class="history-text">历史记录</text>
					</view>
				</view>
				<view class="banner-sub">{{ reportDate }}</view>
				<view class="banner-user">{{ userName }} 的健康档案</view>
			</view>
		</view>

		<!-- 加载状态 -->
		<view v-if="loading" class="loading-box">
			<view class="loading-spinner"></view>
			<view class="loading-text">正在汇总健康数据...</view>
		</view>

		<view v-else>
			<!-- 总体健康评分 -->
			<view class="section-card">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#11998e,#38ef7d)">
						<text class="section-icon-text">综</text>
					</view>
					<text class="section-title">总体健康评分</text>
				</view>
				<view class="score-row">
					<view class="score-circle" :style="{ background: overallScoreGradient }">
						<view class="score-num">{{ overallScore }}</view>
						<view class="score-label">/ 100</view>
					</view>
					<view class="score-desc-box">
						<view class="score-level" :style="{ color: overallLevelColor }">{{ overallLevel }}</view>
						<view class="score-tip">{{ overallTip }}</view>
					</view>
				</view>
			</view>

			<!-- 雷达图（保持不变） -->
			<view class="section-card">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#4facfe,#00f2fe)">
						<text class="section-icon-text">雷</text>
					</view>
					<text class="section-title">6维度健康雷达图</text>
				</view>
				<view class="radar-wrap">
					<l-echart ref="radarChart" class="radar-chart" @finished="initRadar"></l-echart>
				</view>
				<view class="radar-legend">
					<view v-for="(item, idx) in radarDims" :key="idx" class="legend-item">
						<view class="legend-dot" :style="{ background: item.color }"></view>
						<view class="legend-name">{{ item.name }}</view>
						<view class="legend-val">{{ item.value }}</view>
					</view>
				</view>
			</view>

			<!-- ============ AI评估画画模块 ============ -->
			<view class="section-card module-htp">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#f7971e,#ffd200)">
						<text class="section-icon-text">画</text>
					</view>
					<text class="section-title">AI评估画画</text>
					<text class="section-badge badge-htp">HTP 房树人</text>
				</view>
				<view v-if="htpHasData">
					<view class="htp-score-row">
						<view class="htp-score-circle" :style="{ background: htpLatest.scoreGradient || 'linear-gradient(135deg,#f7971e,#ffd200)' }">
							<text class="htp-score-num">{{ htpLatest.score }}</text>
							<text class="htp-score-unit">分</text>
						</view>
						<view class="htp-score-info">
							<text class="htp-level">{{ htpLatest.level }}</text>
							<text class="htp-date">{{ htpLatest.date }}</text>
							<view class="htp-tags-row">
								<view v-for="(tag, ti) in (htpLatest.tags || []).slice(0, 3)" :key="ti" class="htp-mini-tag">{{ tag }}</view>
							</view>
						</view>
					</view>
					<view class="dims-wrap" v-if="htpLatest.dims && htpLatest.dims.length">
						<view v-for="(dim, di) in htpLatest.dims" :key="di" class="dim-row">
							<text class="dim-name">{{ dim.name }}</text>
							<view class="dim-bar-bg">
								<view class="dim-bar-fill" :style="{ width: dim.score + '%', background: dim.color || '#f7971e' }"></view>
							</view>
							<text class="dim-score-text">{{ dim.score }}</text>
						</view>
					</view>
					<view class="module-summary" v-if="htpLatest.summary">
						<text class="summary-text">{{ htpLatest.summary }}</text>
					</view>
				</view>
				<view v-else class="module-empty">
					<text class="empty-icon">🎨</text>
					<text class="empty-text">尚未完成 HTP 绘画测验</text>
					<text class="empty-hint">前往 AI评估 → 画画 完成测验后可查看分析</text>
				</view>
			</view>

			<!-- ============ 自助测评模块 ============ -->
			<view class="section-card module-self">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#667eea,#764ba2)">
						<text class="section-icon-text">自</text>
					</view>
					<text class="section-title">自助测评</text>
					<text class="section-badge badge-self">7项量表</text>
				</view>
				<view v-if="selfHasData">
					<view class="scale-grid">
						<view v-for="(item, si) in selfScales" :key="si" class="scale-mini-card" :style="{ borderLeftColor: item.color }">
							<view class="scale-mini-header">
								<text class="scale-mini-name">{{ item.name }}</text>
								<view class="scale-mini-tag" :style="{ background: item.color + '22', color: item.color }">{{ item.level || '暂无' }}</view>
							</view>
							<text class="scale-mini-fullname">{{ item.fullName }}</text>
							<text class="scale-mini-val" :style="{ color: item.color }">{{ item.scoreText || '--' }}</text>
						</view>
					</view>
					<view class="module-summary" v-if="selfSummary">
						<text class="summary-label">综合小结</text>
						<text class="summary-text">{{ selfSummary }}</text>
					</view>
				</view>
				<view v-else class="module-empty">
					<text class="empty-icon">📋</text>
					<text class="empty-text">尚未完成自助量表测评</text>
					<text class="empty-hint">完成 SCL-90、IPAQ、PARS-3、MAIA-2、CD-RISC、OCEAN、PSQI 后可查看</text>
				</view>
			</view>

			<!-- ============ 健康评估模块 ============ -->
			<view class="section-card module-doctor">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#f093fb,#f5576c)">
						<text class="section-icon-text">医</text>
					</view>
					<text class="section-title">健康评估</text>
					<text class="section-badge badge-doctor">3项量表</text>
				</view>
				<view v-if="doctorHasData">
					<view class="doctor-metrics">
						<view v-for="(item, di) in doctorScales" :key="di" class="doctor-metric-item">
							<view class="doctor-metric-left">
								<view class="doctor-metric-icon" :style="{ background: item.iconBg }">{{ item.emoji }}</view>
								<view class="doctor-metric-info">
									<text class="doctor-metric-name">{{ item.name }}</text>
									<text class="doctor-metric-sub">{{ item.sub }}</text>
								</view>
							</view>
							<view class="doctor-metric-right">
								<text class="doctor-metric-val" :style="{ color: item.color }">{{ item.scoreText || '--' }}</text>
								<view class="doctor-metric-tag" :style="{ background: item.color + '22', color: item.color }">{{ item.level || '暂无' }}</view>
							</view>
						</view>
					</view>
					<view class="module-summary" v-if="doctorSummary">
						<text class="summary-label">综合小结</text>
						<text class="summary-text">{{ doctorSummary }}</text>
					</view>
				</view>
				<view v-else class="module-empty">
					<text class="empty-icon">🏥</text>
					<text class="empty-text">尚未完成健康评估量表</text>
					<text class="empty-hint">完成 SDS（抑郁）、PSS（压力）、SAS（焦虑）后可查看</text>
				</view>
			</view>

			<!-- ============ 智能手环数据模块 ============ -->
			<view class="section-card module-bracelet">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#43e97b,#38f9d7)">
						<text class="section-icon-text">环</text>
					</view>
					<text class="section-title">智能手环数据</text>
					<text class="section-badge badge-bracelet">实时同步</text>
				</view>
				<view v-if="braceletHasData">
					<view class="bracelet-grid">
						<view v-for="(item, bi) in braceletMetrics" :key="bi" class="bracelet-item" :style="{ background: item.bg }">
							<text class="bracelet-item-icon">{{ item.icon }}</text>
							<text class="bracelet-item-val">{{ item.value }}</text>
							<text class="bracelet-item-unit">{{ item.unit }}</text>
							<text class="bracelet-item-label">{{ item.label }}</text>
						</view>
					</view>
					<view class="bracelet-status-row">
						<view class="bracelet-status-dot"></view>
						<text class="bracelet-status-text">数据来源：Garmin 智能手环实时同步</text>
					</view>
				</view>
				<view v-else class="module-empty">
					<text class="empty-icon">⌚</text>
					<text class="empty-text">未检测到手环数据</text>
					<text class="empty-hint">请绑定 Garmin 手环并同步数据后查看</text>
				</view>
			</view>

			<!-- ============ 智能分析与个性化建议 ============ -->
			<view class="section-card module-advice">
				<view class="section-header">
					<view class="section-icon-wrap" style="background: linear-gradient(135deg,#f6d365,#fda085)">
						<text class="section-icon-text">析</text>
					</view>
					<text class="section-title">智能分析与个性化建议</text>
				</view>
				<!-- Tab 切换按钮 -->
				<view class="advice-tab-row">
					<view class="advice-tab-btn" :class="activeAdviceTab === 'htp' ? 'advice-tab-active advice-tab-htp' : ''" @click="activeAdviceTab = 'htp'">
						<text class="advice-tab-dot" style="background:#f7971e"></text>
						<text class="advice-tab-text">HTP画画</text>
						<text class="advice-tab-badge" v-if="adviceMap.htp.length">{{ adviceMap.htp.length }}</text>
					</view>
					<view class="advice-tab-btn" :class="activeAdviceTab === 'self' ? 'advice-tab-active advice-tab-self' : ''" @click="activeAdviceTab = 'self'">
						<text class="advice-tab-dot" style="background:#764ba2"></text>
						<text class="advice-tab-text">自助测评</text>
						<text class="advice-tab-badge" v-if="adviceMap.self.length">{{ adviceMap.self.length }}</text>
					</view>
					<view class="advice-tab-btn" :class="activeAdviceTab === 'doctor' ? 'advice-tab-active advice-tab-doctor' : ''" @click="activeAdviceTab = 'doctor'">
						<text class="advice-tab-dot" style="background:#f5576c"></text>
						<text class="advice-tab-text">健康评估</text>
						<text class="advice-tab-badge" v-if="adviceMap.doctor.length">{{ adviceMap.doctor.length }}</text>
					</view>
					<view class="advice-tab-btn" :class="activeAdviceTab === 'bracelet' ? 'advice-tab-active advice-tab-bracelet' : ''" @click="activeAdviceTab = 'bracelet'">
						<text class="advice-tab-dot" style="background:#43e97b"></text>
						<text class="advice-tab-text">手环</text>
						<text class="advice-tab-badge" v-if="adviceMap.bracelet.length">{{ adviceMap.bracelet.length }}</text>
					</view>
				</view>
				<!-- 建议列表 -->
				<view v-for="(advice, idx) in adviceMap[activeAdviceTab]" :key="idx" class="advice-item">
					<view class="advice-icon-wrap" :style="{ background: advice.iconBg || 'linear-gradient(135deg,#f6d365,#fda085)' }">
						<text class="advice-icon">{{ advice.icon }}</text>
					</view>
					<view class="advice-text-wrap">
						<view class="advice-title">{{ advice.title }}</view>
						<view class="advice-desc">{{ advice.desc }}</view>
						<view class="advice-source-chip">{{ advice.source }}</view>
					</view>
				</view>
				<view v-if="!adviceMap[activeAdviceTab] || adviceMap[activeAdviceTab].length === 0" class="advice-empty">
					<text class="empty-icon">💡</text>
					<text class="empty-text">完成对应测评后将为您生成精准的个性化建议</text>
				</view>
			</view>

			<!-- 数据说明 -->
			<view class="section-card tips-card">
				<view class="tips-title">数据说明</view>
				<view class="tips-text">本报告综合 HTP 绘画测验、10项心理量表、智能手环实时数据生成。</view>
				<view class="tips-text warn-text">量表测试结果不是专业医生的诊断结果，如有疑虑请及时咨询专业医生。</view>
			</view>

			<view class="footer-space"></view>
		</view>

		<!-- 历史记录弹窗 -->
		<view v-if="showHistory" class="history-mask" @click.self="showHistory = false">
			<view class="history-modal">
				<!-- 弹窗头部 -->
				<view class="history-header">
					<text class="history-modal-title">历史健康报告</text>
					<view class="history-close" @click="showHistory = false">
						<text class="close-icon">✕</text>
					</view>
				</view>

				<!-- 时间筛选 -->
				<view class="history-filter">
					<view 
						class="filter-btn" 
						:class="activeFilter === 'all' ? 'filter-active' : ''"
						@click="activeFilter = 'all'; loadHistoryReports()"
					>
						全部
					</view>
					<view 
						class="filter-btn" 
						:class="activeFilter === 'day' ? 'filter-active' : ''"
						@click="activeFilter = 'day'; loadHistoryReports()"
					>
						按日
					</view>
					<view 
						class="filter-btn" 
						:class="activeFilter === 'week' ? 'filter-active' : ''"
						@click="activeFilter = 'week'; loadHistoryReports()"
					>
						按周
					</view>
					<view 
						class="filter-btn" 
						:class="activeFilter === 'month' ? 'filter-active' : ''"
						@click="activeFilter = 'month'; loadHistoryReports()"
					>
						按月
					</view>
				</view>

				<!-- 历史报告列表 -->
				<scroll-view scroll-y class="history-list">
					<view v-if="historyReports.length === 0" class="history-empty">
						<text class="empty-icon">📋</text>
						<text class="empty-text">暂无历史报告记录</text>
						<text class="empty-hint">完成健康评估后将自动生成历史报告</text>
					</view>
					<view 
						v-for="(report, idx) in historyReports" 
						:key="idx" 
						class="history-item"
						@click="viewHistoryDetail(report)"
					>
						<view class="history-item-header">
							<view class="history-date">
								<text class="date-main">{{ report.reportDate }}</text>
								<text class="date-sub">{{ getWeekDay(report.date) }}</text>
							</view>
							<view class="history-score-badge" :style="{ background: getScoreGradient(report.overallScore) }">
								<text class="score-num">{{ report.overallScore }}</text>
								<text class="score-unit">分</text>
							</view>
						</view>
						<view class="history-item-content">
							<view class="history-level" :style="{ color: getLevelColor(report.overallLevel) }">
								{{ report.overallLevel }}
							</view>
							<view class="history-metrics">
								<view class="metric-chip">
									<text class="metric-icon">❤️</text>
									<text class="metric-val">{{ report.braceletData && report.braceletData.heartRate ? report.braceletData.heartRate : '--' }}</text>
								</view>
								<view class="metric-chip">
									<text class="metric-icon">💤</text>
									<text class="metric-val">{{ report.braceletData && report.braceletData.sleep ? report.braceletData.sleep : '--' }}</text>
								</view>
								<view class="metric-chip">
									<text class="metric-icon">🚶</text>
									<text class="metric-val">{{ formatSteps(report.braceletData && report.braceletData.steps ? report.braceletData.steps : null) }}</text>
								</view>
								<view class="metric-chip">
									<text class="metric-icon">🧠</text>
									<text class="metric-val">{{ report.scaleData && report.scaleData.sds ? report.scaleData.sds : '--' }}</text>
								</view>
							</view>
						</view>
						<view class="history-item-footer">
							<text class="data-sources-tag">数据来源：{{ report.dataSources && report.dataSources.length > 0 ? report.dataSources.join('、') : '健康数据' }}</text>
						</view>
					</view>
				</scroll-view>
			</view>
		</view>

		<!-- 历史报告详情弹窗 -->
		<view v-if="showHistoryDetail && currentHistoryReport" class="detail-mask" @click.self="showHistoryDetail = false">
			<view class="detail-modal">
				<!-- 详情头部 -->
				<view class="detail-header">
					<view class="detail-header-left">
						<text class="detail-title">历史报告详情</text>
						<text class="detail-date">{{ currentHistoryReport.reportDate }}</text>
					</view>
					<view class="detail-close" @click="showHistoryDetail = false">
						<text class="close-icon">✕</text>
					</view>
				</view>

				<!-- 详情内容 -->
				<scroll-view scroll-y class="detail-content">
					<!-- 总体评分 -->
					<view class="detail-section">
						<view class="detail-score-circle" :style="{ background: getScoreGradient(currentHistoryReport.overallScore) }">
							<text class="detail-score-num">{{ currentHistoryReport.overallScore }}</text>
							<text class="detail-score-label">/ 100</text>
						</view>
						<view class="detail-level" :style="{ color: getLevelColor(currentHistoryReport.overallLevel) }">
							{{ currentHistoryReport.overallLevel }}
						</view>
						<view class="detail-tip">{{ currentHistoryReport.overallTip || '暂无建议' }}</view>
					</view>

					<!-- 量表数据 -->
					<view class="detail-section" v-if="currentHistoryReport.scaleData">
						<view class="detail-section-title">心理量表评估</view>
						<view class="scale-detail-grid">
							<view class="scale-detail-item">
								<text class="scale-name">SDS（抑郁）</text>
								<text class="scale-value" :style="{ color: getLevelColor(currentHistoryReport.scaleData.sdsLevel) }">
									{{ currentHistoryReport.scaleData.sds || '--' }}
								</text>
								<text class="scale-level">{{ currentHistoryReport.scaleData.sdsLevel || '--' }}</text>
							</view>
							<view class="scale-detail-item">
								<text class="scale-name">PSS（压力）</text>
								<text class="scale-value" :style="{ color: getLevelColor(currentHistoryReport.scaleData.pssLevel) }">
									{{ currentHistoryReport.scaleData.pss || '--' }}
								</text>
								<text class="scale-level">{{ currentHistoryReport.scaleData.pssLevel || '--' }}</text>
							</view>
							<view class="scale-detail-item">
								<text class="scale-name">SAS（焦虑）</text>
								<text class="scale-value" :style="{ color: getLevelColor(currentHistoryReport.scaleData.sasLevel) }">
									{{ currentHistoryReport.scaleData.sas || '--' }}
								</text>
								<text class="scale-level">{{ currentHistoryReport.scaleData.sasLevel || '--' }}</text>
							</view>
						</view>
					</view>

					<!-- 手环数据 -->
					<view class="detail-section" v-if="currentHistoryReport.braceletData">
						<view class="detail-section-title">智能手环数据</view>
						<view class="bracelet-detail-grid">
							<view class="bracelet-detail-item">
								<text class="bracelet-icon">❤️</text>
								<text class="bracelet-label">心率</text>
								<text class="bracelet-value">{{ currentHistoryReport.braceletData.heartRate || '--' }}</text>
								<text class="bracelet-unit">bpm</text>
							</view>
							<view class="bracelet-detail-item">
								<text class="bracelet-icon">💤</text>
								<text class="bracelet-label">睡眠</text>
								<text class="bracelet-value">{{ currentHistoryReport.braceletData.sleep || '--' }}</text>
								<text class="bracelet-unit">分</text>
							</view>
							<view class="bracelet-detail-item">
								<text class="bracelet-icon">🚶</text>
								<text class="bracelet-label">步数</text>
								<text class="bracelet-value">{{ formatSteps(currentHistoryReport.braceletData.steps) }}</text>
								<text class="bracelet-unit">步</text>
							</view>
							<view class="bracelet-detail-item">
								<text class="bracelet-icon">🩸</text>
								<text class="bracelet-label">血氧</text>
								<text class="bracelet-value">{{ currentHistoryReport.braceletData.spo2 || '--' }}</text>
								<text class="bracelet-unit">%</text>
							</view>
							<view class="bracelet-detail-item">
								<text class="bracelet-icon">🧠</text>
								<text class="bracelet-label">压力</text>
								<text class="bracelet-value">{{ currentHistoryReport.braceletData.stress || '--' }}</text>
								<text class="bracelet-unit"></text>
							</view>
							<view class="bracelet-detail-item">
								<text class="bracelet-icon">⚡</text>
								<text class="bracelet-label">能量</text>
								<text class="bracelet-value">{{ currentHistoryReport.braceletData.battery || '--' }}</text>
								<text class="bracelet-unit"></text>
							</view>
						</view>
					</view>

					<!-- 健康建议 -->
					<view class="detail-section" v-if="currentHistoryReport.advice">
						<view class="detail-section-title">个性化健康建议</view>
						<view class="advice-detail-list">
							<view v-for="(item, idx) in currentHistoryReport.advice" :key="idx" class="advice-detail-item">
								<text class="advice-dot">•</text>
								<text class="advice-text">{{ item }}</text>
							</view>
						</view>
					</view>
				</scroll-view>

				<!-- 底部按钮 -->
				<view class="detail-footer">
					<view class="detail-btn primary" @click="exportHistoryReport">
						<text>导出报告</text>
					</view>
					<view class="detail-btn" @click="showHistoryDetail = false">
						<text>关闭</text>
					</view>
				</view>
			</view>
		</view>
	</scroll-view>
</template>

<script>
	import http from '@/nxTemp/config/requestConfig'
	import * as echarts from '@/uni_modules/lime-echart/static/echarts.min'
	import config from '@/nxTemp/config/index.config'

	export default {
		data() {
			return {
				loading: true,
				userName: '',
				reportDate: '',
				// 历史记录相关
				showHistory: false,
				showHistoryDetail: false,
				historyReports: [],
				currentHistoryReport: null,
				activeFilter: 'all',
				// 原有数据
				htpHasData: false,
				htpLatest: null,
				selfHasData: false,
				selfScales: [
					{ key: 'SCL-90',  name: 'SCL-90',  fullName: '症状自评量表',   color: '#667eea', scoreText: '--', level: '--' },
					{ key: 'IPAQ',    name: 'IPAQ',    fullName: '国际体力活动量表', color: '#43e97b', scoreText: '--', level: '--' },
					{ key: 'PARS-3',  name: 'PARS-3',  fullName: '体育活动等级量表', color: '#f7971e', scoreText: '--', level: '--' },
					{ key: 'MAIA-2',  name: 'MAIA-2',  fullName: '内感受意识量表',   color: '#a18cd1', scoreText: '--', level: '--' },
					{ key: 'CD-RISC', name: 'CD-RISC', fullName: '心理弹性量表',     color: '#4facfe', scoreText: '--', level: '--' },
					{ key: 'OCEAN',   name: 'OCEAN',   fullName: '大五人格量表',     color: '#f093fb', scoreText: '--', level: '--' },
					{ key: 'PSQI',    name: 'PSQI',    fullName: '睡眠质量指数',     color: '#38f9d7', scoreText: '--', level: '--' }
				],
				selfSummary: '',
				doctorHasData: false,
				doctorScales: [
					{ key: 'SDS', name: '抑郁自评（SDS）', sub: '抑郁自评量表', emoji: '😔', iconBg: 'linear-gradient(135deg,#fa709a,#fee140)', color: '#fa709a', scoreText: '--', level: '--' },
					{ key: 'PSS', name: '压力感知（PSS）', sub: '感知压力量表',   emoji: '😰', iconBg: 'linear-gradient(135deg,#a18cd1,#fbc2eb)', color: '#a18cd1', scoreText: '--', level: '--' },
					{ key: 'SAS', name: '焦虑自评（SAS）', sub: '焦虑自评量表',   emoji: '😟', iconBg: 'linear-gradient(135deg,#a7b2c1,#dfe1e3)', color: '#f5576c', scoreText: '--', level: '--' }
				],
				doctorSummary: '',
				braceletHasData: false,
				braceletMetrics: [
					{ icon: '❤️', label: '心率',     value: '--', unit: 'bpm', bg: 'linear-gradient(135deg,#ffecd2,#fcb69f)' },
					{ icon: '💤', label: '睡眠得分', value: '--', unit: '分',  bg: 'linear-gradient(135deg,#d4e6ff,#a8c8ff)' },
					{ icon: '🚶', label: '步数',     value: '--', unit: '步',  bg: 'linear-gradient(135deg,#d4fce8,#96e6a1)' },
					{ icon: '🩸', label: '血氧',     value: '--', unit: '%',   bg: 'linear-gradient(135deg,#ffe0cc,#ffb38a)' },
					{ icon: '🧠', label: '压力均值', value: '--', unit: '',    bg: 'linear-gradient(135deg,#f3e7ff,#d4b8ff)' },
					{ icon: '⚡', label: '身体能量', value: '--', unit: '',    bg: 'linear-gradient(135deg,#fffde7,#ffe082)' }
				],
				radarDims: [
					{ name: '情绪状态', value: 0, color: '#fa709a' },
					{ name: '压力管理', value: 0, color: '#a18cd1' },
					{ name: '焦虑水平', value: 0, color: '#84fab0' },
					{ name: '身体活动', value: 0, color: '#4facfe' },
					{ name: '睡眠质量', value: 0, color: '#fda085' },
					{ name: '心理弹性', value: 0, color: '#43e97b' }
				],
				radarReady: false,
				overallScore: 0,
				overallLevel: '--',
				overallLevelColor: '#888',
				overallTip: '',
				overallScoreGradient: 'linear-gradient(135deg, #a8edea, #fed6e3)',
				adviceList: [],
				activeAdviceTab: 'htp',
				adviceMap: {
					htp:     [],
					self:    [],
					doctor:  [],
					bracelet: []
				}
			}
		},

		onLoad() {
			this.init()
		},

		onShow() {
			// 每次页面显示时刷新历史记录
			if (this.showHistory) {
				this.loadHistoryReports()
			}
			// 同步更新量表数据，并重新计算评分（从 AI评估 返回后自动刷新）
			this.loadScaleHistory().then(() => {
				this.computeRadar()
				this.computeOverall()
			})
		},

		methods: {
			async init() {
				this.loading = true
				const userInfo = uni.getStorageSync('userInfo') || {}
				this.userName = userInfo.userName || '用户'
				const now = new Date()
				const pad = n => String(n).padStart(2, '0')
				this.reportDate = `${now.getFullYear()}年${pad(now.getMonth() + 1)}月${pad(now.getDate())}日`
				await Promise.all([
					this.loadHTPData(),
					this.loadScaleHistory(),
					this.loadBraceletData()
				])
				this.computeRadar()
				this.computeOverall()
				this.buildAdvice()
				// 保存当前报告到历史记录
				this.saveCurrentReport()
				this.loading = false
			},

			loadHTPData() {
				return new Promise(resolve => {
					try {
						const history = uni.getStorageSync('htp_history') || []
						if (history.length > 0) { this.htpHasData = true; this.htpLatest = history[0] }
					} catch (e) {}
					resolve()
				})
			},

			loadScaleHistory() {
				return new Promise(resolve => {
					try {
						const list = uni.getStorageSync('scale_history') || []
						const latestMap = {}
						list.forEach(item => { if (!latestMap[item.scale]) latestMap[item.scale] = item })
						let selfCount = 0
						this.selfScales.forEach(s => {
							const d = latestMap[s.key]
							if (d) {
								let scoreText = d.scoreText || String(d.totalScore || '--')
								// 兼容旧版 IPAQ 的 "\u603b MET\u5206 XXXX" 格式，转换为 100 分制
								if (s.key === 'IPAQ' && scoreText.includes('MET')) {
									const metVal = parseInt(scoreText.replace(/[^\d]/g, '')) || 0
									scoreText = Math.min(100, Math.round(metVal / 6000 * 100)) + '\u5206'
								}
								// 统一展示格式：去除中文前缀文字（如“综合得分 ”“PSS得分 ”“SDS换算分 ”等）
								const cleanScore = scoreText.replace(/^[一-龥]+[\w\s]*\s+/, '').trim()
								s.scoreText = cleanScore || scoreText
								s.level = d.level || '--'
								selfCount++
							}
						})
						if (selfCount > 0) {
							this.selfHasData = true
							this.selfSummary = `已完成 ${selfCount}/7 项量表测评，完成度 ${Math.round(selfCount / 7 * 100)}%。`
						}
						let docCount = 0
						this.doctorScales.forEach(s => {
							const d = latestMap[s.key]
							if (d) { s.scoreText = d.scoreText || String(d.totalScore || '--'); s.level = d.level || '--'; s.color = this._getLevelColor(s.level); docCount++ }
						})
						if (docCount > 0) { this.doctorHasData = true; this.doctorSummary = `已完成 ${docCount}/3 项医评量表。` }
					} catch (e) {}
					resolve()
				})
			},

			async loadBraceletData() {
				const token = uni.getStorageSync('token')
				if (!token) return
				try {
					const [hrRes, sleepRes, stepsRes, batteryRes, stressRes, spo2Res] = await Promise.allSettled([
						http.get(`${config.baseUrl}/healthInfo/getCurrentDayHeartrate`, { headers: { Authorization: token } }),
						http.get(`${config.baseUrl}/healthInfo/getCurrentDaySleep`, { headers: { Authorization: token } }),
						http.get(`${config.baseUrl}/healthInfo/getCurrentDaySteps`, { params: { userName: token } }),
						http.get(`${config.baseUrl}/healthInfo/getCurrentDayBodyBattery`, { params: { userName: token } }),
						http.get(`${config.baseUrl}/healthInfo/getCurrentDayStress`, { params: { userName: token } }),
						http.get(`${config.baseUrl}/healthInfo/getCurrentDaySpO2`, { params: { userName: token } })
					])
					let hasAny = false
					const pick = (res, fn) => { if (res.status === 'fulfilled' && res.value && res.value.code === 200) { const v = fn(res.value.result || {}); if (v != null && v !== '--') return v } return null }
					const hr = pick(hrRes, r => r.restingHeartRate); if (hr) { this.braceletMetrics[0].value = hr; hasAny = true }
					const sl = pick(sleepRes, r => r.sleep_score_overall); if (sl) { this.braceletMetrics[1].value = sl; hasAny = true }
					const st = pick(stepsRes, r => r.totalSteps); if (st) { this.braceletMetrics[2].value = Number(st).toLocaleString(); hasAny = true }
					const sp = pick(spo2Res, r => r.averageSpO2); if (sp) { this.braceletMetrics[3].value = sp; hasAny = true }
					const sr = pick(stressRes, r => r.avgStressLevel); if (sr) { this.braceletMetrics[4].value = sr; hasAny = true }
					const bb = pick(batteryRes, r => r.charged); if (bb) { this.braceletMetrics[5].value = bb; hasAny = true }
					if (hasAny) this.braceletHasData = true
				} catch (e) {}
			},

			computeRadar() {
				const sds = this.doctorScales.find(s => s.key === 'SDS')
				this.radarDims[0].value = (sds && sds.scoreText !== '--') ? Math.max(0, Math.round(100 - ((parseFloat(sds.scoreText) - 25) / 75) * 100)) : (this.htpHasData && this.htpLatest ? Math.min(100, Math.round(this.htpLatest.score || 60)) : 60)
				const pss = this.doctorScales.find(s => s.key === 'PSS')
				this.radarDims[1].value = (pss && pss.scoreText !== '--') ? Math.max(0, Math.round(100 - (parseFloat(pss.scoreText) / 56) * 100)) : 60
				const sas = this.doctorScales.find(s => s.key === 'SAS')
				this.radarDims[2].value = (sas && sas.scoreText !== '--') ? Math.max(0, Math.round(100 - ((parseFloat(sas.scoreText) - 25) / 75) * 100)) : 60
				const ipaq = this.selfScales.find(s => s.key === 'IPAQ')
				const pars3 = this.selfScales.find(s => s.key === 'PARS-3')
				this.radarDims[3].value = (ipaq && ipaq.level !== '--') ? (ipaq.level.includes('高') ? 88 : ipaq.level.includes('中') ? 65 : 35) : (pars3 && pars3.level !== '--') ? (pars3.level.includes('高') ? 85 : pars3.level.includes('中') ? 60 : 35) : 60
				const psqi = this.selfScales.find(s => s.key === 'PSQI')
				const slMetric = this.braceletMetrics[1]
				this.radarDims[4].value = (psqi && psqi.scoreText !== '--') ? Math.max(0, Math.round(100 - (parseFloat(psqi.scoreText) / 21) * 100)) : (slMetric.value !== '--' ? Math.min(100, Number(slMetric.value) || 60) : 60)
				const cdrisc = this.selfScales.find(s => s.key === 'CD-RISC')
				this.radarDims[5].value = (cdrisc && cdrisc.scoreText !== '--') ? Math.min(100, Math.round(parseFloat(cdrisc.scoreText))) : 60
			},

			computeOverall() {
				const w = [0.2, 0.2, 0.2, 0.15, 0.15, 0.1]
				this.overallScore = Math.round(this.radarDims.reduce((s, d, i) => s + d.value * w[i], 0))
				const sources = []
				if (this.htpHasData)     sources.push('HTP画画')
				if (this.selfHasData)    sources.push('自助量表')
				if (this.doctorHasData)  sources.push('医评量表')
				if (this.braceletHasData) sources.push('智能手环')
				const srcText = sources.length > 0 ? `已整合 ${sources.join('、')} 等 ${sources.length} 项数据源。` : '完成更多测评可提升评分准确度。'
				if (this.overallScore >= 85) {
					this.overallLevel = '优秀'; this.overallLevelColor = '#27ae60'
					this.overallTip = '您的心理健康状况非常不错，请继续保持良好的生活习惯。'
					this.overallScoreGradient = 'linear-gradient(135deg,#43e97b,#38f9d7)'
				} else if (this.overallScore >= 70) {
					this.overallLevel = '良好'; this.overallLevelColor = '#2980b9'
					this.overallTip = '整体状态还不错，可适当关注一些小细节，让自己过得更舒服。'
					this.overallScoreGradient = 'linear-gradient(135deg,#4facfe,#00f2fe)'
				} else if (this.overallScore >= 55) {
					this.overallLevel = '一般'; this.overallLevelColor = '#f39c12'
					this.overallTip = '最近可能有些疲惫，不妨慢下来好好休息，关注一下自己的心理状态。'
					this.overallScoreGradient = 'linear-gradient(135deg,#fda085,#f6d365)'
				} else {
					this.overallLevel = '需关注'; this.overallLevelColor = '#e74c3c'
					this.overallTip = '最近内心可能有些负担，记得给自己一些关爱，必要时可以找人倾诉心里话。'
					this.overallScoreGradient = 'linear-gradient(135deg,#f093fb,#f5576c)'
				}
			},

			buildAdvice() {
				// HTP 画画建议
				const htpList = []
				if (this.htpHasData && this.htpLatest) {
					const sc = this.htpLatest.score || 0
					if (sc < 50) {
						htpList.push({ icon: '🎨', iconBg: 'linear-gradient(135deg,#f7971e,#ffd200)', title: 'HTP展现潜在心理压力', desc: '画画分析显示心理状态需关注，建议通过绘画、运动来释放情绪，必要时寻求面谈支持。', source: '来源：AI画画分析' })
					} else if (sc >= 80) {
						htpList.push({ icon: '🌟', iconBg: 'linear-gradient(135deg,#f7971e,#ffd200)', title: 'HTP心理状态良好', desc: '画画分析显示心理状态较好，继续活跃创作有助于心理健康。', source: '来源：AI画画分析' })
					} else {
						htpList.push({ icon: '🖌️', iconBg: 'linear-gradient(135deg,#f7971e,#ffd200)', title: 'HTP状态中等', desc: '画画分析显示心理状态尚可，可适当增加创意性活动丰富情感表达。', source: '来源：AI画画分析' })
					}

				} else {
					htpList.push({ icon: '🎨', iconBg: 'linear-gradient(135deg,#e0e0e0,#bdbdbd)', title: '尚未完成HTP测验', desc: '前往「AI评估 → 画画」完成房树人绘画测验，解锁专属心理状态分析。', source: '系统提示' })
				}

				// 自助测评建议
				const selfList = []
				if (this.selfHasData) {
					const scl = this.selfScales.find(s => s.key === 'SCL-90')
					if (scl && scl.level && scl.level.includes('阳性')) selfList.push({ icon: '🧠', iconBg: 'linear-gradient(135deg,#667eea,#764ba2)', title: 'SCL-90出现阳性症状', desc: '心理症状评定量表显示存在阳性症状，建议寻求专业心理评估，不要独自承受压力。', source: '来源：SCL-90量表' })
					else if (scl && scl.level && scl.level.includes('正常')) selfList.push({ icon: '✅', iconBg: 'linear-gradient(135deg,#667eea,#764ba2)', title: 'SCL-90心理症状正常', desc: '心理症状评定结果在正常范围内，继续保持良好的生活方式。', source: '来源：SCL-90量表' })
					const psqi = this.selfScales.find(s => s.key === 'PSQI')
					if (psqi && psqi.scoreText !== '--' && parseFloat(psqi.scoreText) > 7) selfList.push({ icon: '💤', iconBg: 'linear-gradient(135deg,#d4e6ff,#a8c8ff)', title: '睡眠质量需改善', desc: 'PSQI评分偏高，建议固定作息时间、睡前1小时放下手机、睡前可尝试冥想放松。', source: '来源：PSQI量表' })
					const ipaq = this.selfScales.find(s => s.key === 'IPAQ')
					if (ipaq && ipaq.level && ipaq.level.includes('低')) selfList.push({ icon: '🏃', iconBg: 'linear-gradient(135deg,#43e97b,#38f9d7)', title: '体力活动水平偏低', desc: 'IPAQ显示体力活动不足，建议每天30分钟散步、爬楼梯或骑行，循序渐进增加运动量。', source: '来源：IPAQ量表' })
					const cdrisc = this.selfScales.find(s => s.key === 'CD-RISC')
					if (cdrisc && cdrisc.scoreText !== '--' && parseFloat(cdrisc.scoreText) < 65) selfList.push({ icon: '🌱', iconBg: 'linear-gradient(135deg,#43e97b,#38f9d7)', title: '心理弹性有待提升', desc: 'CD-RISC显示心理弹性偏低，建议积极参与社交活动、学习正念认知疗法增强抗压能力。', source: '来源：CD-RISC量表' })
					const maia = this.selfScales.find(s => s.key === 'MAIA-2')
					if (maia && maia.scoreText !== '--') selfList.push({ icon: '🔍', iconBg: 'linear-gradient(135deg,#a18cd1,#fbc2eb)', title: '关注身体内感受', desc: 'MAIA-2评估您对身体信号的觉察能力，定期进行身体扫描冥想有助于提升内感受意识。', source: '来源：MAIA-2量表' })
					if (selfList.length === 0) selfList.push({ icon: '🎯', iconBg: 'linear-gradient(135deg,#667eea,#764ba2)', title: '自助测评结果良好', desc: '各项自助量表结果均在正常范围内，保持现有的生活习惯和心理状态。', source: '来源：自助量表综合' })
				} else {
					selfList.push({ icon: '📋', iconBg: 'linear-gradient(135deg,#e0e0e0,#bdbdbd)', title: '尚未完成自助测评', desc: '前往「AI评估 → 测评」完成SCL-90等7项量表，获取精准的心理健康评估建议。', source: '系统提示' })
				}

				// 健康评估建议
				const doctorList = []
				if (this.doctorHasData) {
					const sas = this.doctorScales.find(s => s.key === 'SAS')
					if (sas && sas.scoreText !== '--') {
						const v = parseFloat(sas.scoreText)
						if (v >= 70) doctorList.push({ icon: '🌊', iconBg: 'linear-gradient(135deg,#f093fb,#f5576c)', title: '重度焦虑，请及时就医', desc: 'SAS显示重度焦虑，建议尽快预约精神科或心理科医生进行专业评估和干预。', source: '来源：SAS量表' })
						else if (v >= 50) doctorList.push({ icon: '😟', iconBg: 'linear-gradient(135deg,#f093fb,#f5576c)', title: '焦虑症状需关注', desc: '建议进行腹式深呼吸练习（4-7-8呼吸法），减少咖啡因和糖分摄入，保持规律作息。', source: '来源：SAS量表' })
						else doctorList.push({ icon: '✅', iconBg: 'linear-gradient(135deg,#f093fb,#f5576c)', title: '焦虑水平正常', desc: 'SAS焦虑评分在正常范围，当前心理状态稳定，继续保持。', source: '来源：SAS量表' })
					}
					const pss = this.doctorScales.find(s => s.key === 'PSS')
					if (pss && pss.scoreText !== '--') {
						const v = parseFloat(pss.scoreText)
						if (v > 26) doctorList.push({ icon: '🧘', iconBg: 'linear-gradient(135deg,#a18cd1,#fbc2eb)', title: '感知压力偏高', desc: '建议通过有氧运动、冥想训练或与信任朋友倾诉来有效释放压力，避免长期积压。', source: '来源：PSS量表' })
						else doctorList.push({ icon: '💆', iconBg: 'linear-gradient(135deg,#a18cd1,#fbc2eb)', title: '压力管理状态良好', desc: 'PSS压力评分处于健康范围，您的压力应对机制运作良好。', source: '来源：PSS量表' })
					}
					const sds = this.doctorScales.find(s => s.key === 'SDS')
					if (sds && sds.scoreText !== '--') {
						const v = parseFloat(sds.scoreText)
						if (v >= 53) doctorList.push({ icon: '😔', iconBg: 'linear-gradient(135deg,#fa709a,#fee140)', title: 'SDS显示抑郁倾向', desc: '建议增加户外活动、社交联系，寻求心理咨询师帮助，避免独自压抑情绪。', source: '来源：SDS量表' })
						else doctorList.push({ icon: '😊', iconBg: 'linear-gradient(135deg,#fa709a,#fee140)', title: '抑郁风险较低', desc: 'SDS结果正常，情绪状态良好，坚持运动和规律作息能维持良好心理状态。', source: '来源：SDS量表' })
					}
				} else {
					doctorList.push({ icon: '🏥', iconBg: 'linear-gradient(135deg,#e0e0e0,#bdbdbd)', title: '尚未完成健康评估量表', desc: '前往「AI评估 → 测评」完成SDS、PSS、SAS三项医评量表，获取专业建议。', source: '系统提示' })
				}

				// 手环建议
				const braceletList = []
				if (this.braceletHasData) {
					const hr = this.braceletMetrics[0].value
					if (hr !== '--') {
						if (Number(hr) > 100) braceletList.push({ icon: '❤️', iconBg: 'linear-gradient(135deg,#ffecd2,#fcb69f)', title: '静息心率偏高', desc: `当前静息心率 ${hr} bpm，偏高。建议增加有氧运动（慢跑、游泳），坚持4-6周可有效降低静息心率。`, source: '来源：Garmin手环' })
						else if (Number(hr) < 50) braceletList.push({ icon: '❤️', iconBg: 'linear-gradient(135deg,#ffecd2,#fcb69f)', title: '静息心率偏低', desc: `当前静息心率 ${hr} bpm，如无规律锻炼习惯建议咨询医生检查。`, source: '来源：Garmin手环' })
						else braceletList.push({ icon: '❤️', iconBg: 'linear-gradient(135deg,#ffecd2,#fcb69f)', title: '心率状态正常', desc: `静息心率 ${hr} bpm，处于健康范围（50-100 bpm），心血管功能良好。`, source: '来源：Garmin手环' })
					}
					const sl = this.braceletMetrics[1].value
					if (sl !== '--') {
						if (Number(sl) < 60) braceletList.push({ icon: '💤', iconBg: 'linear-gradient(135deg,#d4e6ff,#a8c8ff)', title: '睡眠得分偏低', desc: `手环监测睡眠得分 ${sl}，偏低。建议保持固定入睡时间、减少深夜蓝光暴露、睡前进行放松练习。`, source: '来源：Garmin手环' })
						else braceletList.push({ icon: '💤', iconBg: 'linear-gradient(135deg,#d4e6ff,#a8c8ff)', title: '睡眠质量不错', desc: `手环监测睡眠得分 ${sl}，表现良好，继续保持规律作息。`, source: '来源：Garmin手环' })
					}
					const sv = this.braceletMetrics[4].value
					if (sv !== '--' && Number(sv) > 50) braceletList.push({ icon: '🌿', iconBg: 'linear-gradient(135deg,#f3e7ff,#d4b8ff)', title: '手环监测压力偏高', desc: `平均压力值 ${sv}（>50），建议进行5分钟正念呼吸训练、午间短暂户外散步放松身心。`, source: '来源：Garmin手环' })
					const spo2 = this.braceletMetrics[3].value
					if (spo2 !== '--' && Number(spo2) < 95) braceletList.push({ icon: '🩸', iconBg: 'linear-gradient(135deg,#ffe0cc,#ffb38a)', title: '血氧饱和度偏低', desc: `血氧 ${spo2}% 低于正常值（≥95%），建议到通风处活动，如持续偏低请及时就医。`, source: '来源：Garmin手环' })
					const steps = this.braceletMetrics[2].value
					if (steps !== '--') {
						const stepsNum = Number(String(steps).replace(/,/g, ''))
						if (stepsNum < 6000) braceletList.push({ icon: '🚶', iconBg: 'linear-gradient(135deg,#d4fce8,#96e6a1)', title: '今日步数不足', desc: `今日步数 ${steps} 步，建议目标1万步。可利用碎片时间步行、选择爬楼梯替代电梯。`, source: '来源：Garmin手环' })
						else braceletList.push({ icon: '🚶', iconBg: 'linear-gradient(135deg,#d4fce8,#96e6a1)', title: '今日步数达标', desc: `今日步数 ${steps} 步，完成了充足的日常活动量，很棒！`, source: '来源：Garmin手环' })
					}
				} else {
					braceletList.push({ icon: '⌚', iconBg: 'linear-gradient(135deg,#e0e0e0,#bdbdbd)', title: '未检测到手环数据', desc: '请绑定 Garmin 智能手环并同步数据，可实时监测心率、睡眠、步数、血氧等健康指标。', source: '系统提示' })
				}

				this.adviceMap = { htp: htpList, self: selfList, doctor: doctorList, bracelet: braceletList }
				// 兼容旧 adviceList（取所有非空建议合并）
				this.adviceList = [...htpList, ...selfList, ...doctorList, ...braceletList]
			},

			async initRadar() {
				if (!this.radarReady) { setTimeout(this.initRadar, 300); return }
				const chart = await this.$refs.radarChart.init(echarts)
				chart.setOption({
					backgroundColor: 'transparent',
					radar: {
						center: ['50%', '50%'], radius: '65%', nameGap: 8,
						indicator: this.radarDims.map(d => ({ name: d.name, max: 100 })),
						axisName: { color: '#555', fontSize: 11 },
						splitArea: { areaStyle: { color: ['rgba(91,141,238,0.05)','rgba(91,141,238,0.1)','rgba(91,141,238,0.15)','rgba(91,141,238,0.2)','rgba(91,141,238,0.25)'] } },
						splitLine: { lineStyle: { color: 'rgba(91,141,238,0.3)' } },
						axisLine:  { lineStyle: { color: 'rgba(91,141,238,0.3)' } }
					},
					series: [{ type: 'radar', data: [{ value: this.radarDims.map(d => d.value), name: '健康指数', symbol: 'circle', symbolSize: 6,
						areaStyle: { color: { type: 'radial', x: 0.5, y: 0.5, r: 0.5, colorStops: [{ offset: 0, color: 'rgba(91,141,238,0.6)' },{ offset: 1, color: 'rgba(91,141,238,0.1)' }] } },
						lineStyle: { color: '#5b8dee', width: 2 }, itemStyle: { color: '#5b8dee' } }] }]
				})
			},

			_getLevelColor(level) {
				if (!level || level === '--') return '#999'
				if (level.includes('重度') || level.includes('高压') || level.includes('阳性')) return '#e74c3c'
				if (level.includes('中度') || level.includes('中等') || level.includes('轻度')) return '#f39c12'
				if (level.includes('正常') || level.includes('无') || level.includes('低') || level.includes('良好')) return '#27ae60'
				return '#666'
			},

			// ========== 历史记录相关方法 ==========
			
			// 保存当前报告到历史记录
			saveCurrentReport() {
				try {
					const sdsScale = this.doctorScales.find(s => s.key === 'SDS')
					const pssScale = this.doctorScales.find(s => s.key === 'PSS')
					const sasScale = this.doctorScales.find(s => s.key === 'SAS')
					
					const reportData = {
						date: new Date().toISOString(),
						reportDate: this.reportDate,
						overallScore: this.overallScore,
						overallLevel: this.overallLevel,
						overallTip: this.overallTip,
						scaleData: {
							sds: sdsScale ? (sdsScale.scoreText || '--') : '--',
							sdsLevel: sdsScale ? (sdsScale.level || '--') : '--',
							pss: pssScale ? (pssScale.scoreText || '--') : '--',
							pssLevel: pssScale ? (pssScale.level || '--') : '--',
							sas: sasScale ? (sasScale.scoreText || '--') : '--',
							sasLevel: sasScale ? (sasScale.level || '--') : '--'
						},
						braceletData: {
							heartRate: this.braceletMetrics[0].value,
							sleep: this.braceletMetrics[1].value,
							steps: this.braceletMetrics[2].value,
							spo2: this.braceletMetrics[3].value,
							stress: this.braceletMetrics[4].value,
							battery: this.braceletMetrics[5].value
						},
						advice: this.adviceList.map(a => a.desc),
						dataSources: [
							...(this.htpHasData ? ['HTP 画画'] : []),
							...(this.selfHasData ? ['自助量表'] : []),
							...(this.doctorHasData ? ['医评量表'] : []),
							...(this.braceletHasData ? ['智能手环'] : [])
						]
					}
					
					// 获取现有历史记录
					const history = uni.getStorageSync('health_report_history') || []
					
					// 检查是否已存在今日报告，避免重复
					const today = new Date().toDateString()
					const exists = history.some(r => new Date(r.date).toDateString() === today)
					
					if (!exists) {
						// 添加到历史记录（保持最新在前）
						history.unshift(reportData)
						// 只保留最近 90 天的记录
						const ninetyDaysAgo = new Date()
						ninetyDaysAgo.setDate(ninetyDaysAgo.getDate() - 90)
						const filtered = history.filter(r => new Date(r.date) >= ninetyDaysAgo)
						uni.setStorageSync('health_report_history', filtered)
					}
				} catch (e) {
					console.error('保存健康报告失败:', e)
				}
			},

			// 加载历史报告列表
			loadHistoryReports() {
				try {
					const history = uni.getStorageSync('health_report_history') || []
					
					// 根据筛选条件过滤
					let filtered = [...history]
					const now = new Date()
					
					if (this.activeFilter === 'day') {
						// 显示最近 7 天
						const sevenDaysAgo = new Date()
						sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7)
						filtered = history.filter(r => new Date(r.date) >= sevenDaysAgo)
					} else if (this.activeFilter === 'week') {
						// 按周分组（显示最近 4 周）
						const fourWeeksAgo = new Date()
						fourWeeksAgo.setDate(fourWeeksAgo.getDate() - 28)
						filtered = history.filter(r => new Date(r.date) >= fourWeeksAgo)
					} else if (this.activeFilter === 'month') {
						// 按月分组（显示最近 3 个月）
						const threeMonthsAgo = new Date()
						threeMonthsAgo.setMonth(threeMonthsAgo.getMonth() - 3)
						filtered = history.filter(r => new Date(r.date) >= threeMonthsAgo)
					}
					
					this.historyReports = filtered
				} catch (e) {
					console.error('加载历史报告失败:', e)
				}
			},

			// 查看历史详情
			viewHistoryDetail(report) {
				this.currentHistoryReport = report
				this.showHistoryDetail = true
			},

			// 获取星期几
			getWeekDay(dateStr) {
				const date = new Date(dateStr)
				const weekDays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
				return weekDays[date.getDay()]
			},

			// 获取评分渐变色
			getScoreGradient(score) {
				if (score >= 85) return 'linear-gradient(135deg,#43e97b,#38f9d7)'
				if (score >= 70) return 'linear-gradient(135deg,#4facfe,#00f2fe)'
				if (score >= 55) return 'linear-gradient(135deg,#fda085,#f6d365)'
				return 'linear-gradient(135deg,#f093fb,#f5576c)'
			},

			// 格式化步数
			formatSteps(steps) {
				if (!steps || steps === '--') return '--'
				const num = Number(String(steps).replace(/,/g, ''))
				if (num >= 10000) {
					return (num / 10000).toFixed(1) + '万'
				}
				return num.toLocaleString()
			},

			// 导出历史报告
			exportHistoryReport() {
				if (!this.currentHistoryReport) return
				
				const report = this.currentHistoryReport
				const content = `
【综合健康报告】
日期：${report.reportDate}
总体评分：${report.overallScore}分（${report.overallLevel}）

【心理量表评估】
- SDS（抑郁）：${report.scaleData?.sds || '--'} ${report.scaleData?.sdsLevel || ''}
- PSS（压力）：${report.scaleData?.pss || '--'} ${report.scaleData?.pssLevel || ''}
- SAS（焦虑）：${report.scaleData?.sas || '--'} ${report.scaleData?.sasLevel || ''}

【智能手环数据】
- 心率：${report.braceletData?.heartRate || '--'} bpm
- 睡眠得分：${report.braceletData?.sleep || '--'} 分
- 步数：${report.braceletData?.steps || '--'} 步
- 血氧：${report.braceletData?.spo2 || '--'} %
- 压力：${report.braceletData?.stress || '--'}
- 身体能量：${report.braceletData?.battery || '--'}

【健康建议】
${(report.advice || []).map((a, i) => `${i + 1}. ${a}`).join('\n')}

数据来源：${(report.dataSources || []).join('、')}
`.trim()

				// 使用系统分享功能
				uni.share({
					provider: 'weixin',
					scene: 'WXSceneSession',
					type: 1,
					summary: content,
					success: () => {
						uni.showToast({ title: '分享成功', icon: 'success' })
					},
					fail: (err) => {
						// 如果分享失败，复制到剪贴板
						uni.setClipboardData({
							data: content,
							success: () => {
								uni.showToast({ title: '已复制到剪贴板', icon: 'success' })
							}
						})
					}
				})
			}
		},

		watch: {
			loading(newVal) {
				if (!newVal) { this.$nextTick(() => { this.radarReady = true }) }
			}
		}
	}
</script>

<style scoped>
.page-wrap { background: #f4f6fb; min-height: 100vh; }

/* Banner */
.banner { background: linear-gradient(135deg,#11998e 0%,#38ef7d 100%); padding: 40rpx 32rpx 36rpx; position: relative; overflow: hidden; }
.banner::after { content: ''; position: absolute; right: -40rpx; top: -40rpx; width: 240rpx; height: 240rpx; border-radius: 50%; background: rgba(255,255,255,0.08); }
.banner-inner { position: relative; z-index: 1; }
.banner-title-row { display: flex; align-items: center; gap: 16rpx; margin-bottom: 8rpx; }
.banner-title { color: #fff; font-size: 40rpx; font-weight: 700; letter-spacing: 2rpx; }
.history-btn { 
	display: flex; 
	align-items: center; 
	gap: 6rpx; 
	padding: 8rpx 16rpx; 
	background: rgba(255,255,255,0.2);
	border-radius: 20rpx;
	transition: all 0.2s;
}
.history-btn:active { background: rgba(255,255,255,0.3); transform: scale(0.95); }
.history-icon { font-size: 28rpx; }
.history-text { color: #fff; font-size: 22rpx; font-weight: 600; }
.banner-sub   { color: rgba(255,255,255,0.75); font-size: 24rpx; margin-top: 8rpx; }
.banner-user  { color: rgba(255,255,255,0.9); font-size: 26rpx; margin-top: 6rpx; }

/* 加载 */
.loading-box { display: flex; flex-direction: column; align-items: center; padding: 100rpx 0; }
.loading-spinner { width: 64rpx; height: 64rpx; border: 6rpx solid #e0e6f0; border-top-color: #5b8dee; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }
.loading-text { margin-top: 24rpx; font-size: 28rpx; color: #999; }

/* 卡片 */
.section-card { background: #fff; border-radius: 24rpx; margin: 24rpx 24rpx 0; padding: 28rpx 28rpx 24rpx; box-shadow: 0 4rpx 20rpx rgba(91,141,238,0.08); }
.section-header { display: flex; align-items: center; margin-bottom: 20rpx; }
.section-icon-wrap { width: 52rpx; height: 52rpx; border-radius: 14rpx; display: flex; align-items: center; justify-content: center; margin-right: 16rpx; flex-shrink: 0; }
.section-icon-text { color: #fff; font-size: 26rpx; font-weight: 700; }
.section-title  { font-size: 32rpx; font-weight: 700; color: #2d3a4a; flex: 1; }
.section-badge  { font-size: 20rpx; padding: 4rpx 14rpx; border-radius: 20rpx; font-weight: 600; }
.badge-htp      { background: #fff8e1; color: #f7971e; }
.badge-self     { background: #ede7f6; color: #764ba2; }
.badge-doctor   { background: #fce4ec; color: #f5576c; }
.badge-bracelet { background: #e0fdf4; color: #1a9e6e; }

/* 总分 */
.score-row { display: flex; align-items: center; gap: 28rpx; }
.score-circle { width: 130rpx; height: 130rpx; border-radius: 50%; display: flex; flex-direction: column; align-items: center; justify-content: center; flex-shrink: 0; }
.score-num   { color: #fff; font-size: 52rpx; font-weight: 800; line-height: 1; }
.score-label { color: rgba(255,255,255,0.8); font-size: 22rpx; margin-top: 4rpx; }
.score-desc-box { flex: 1; }
.score-level { font-size: 34rpx; font-weight: 700; margin-bottom: 6rpx; }
.score-tip   { font-size: 24rpx; color: #666; line-height: 1.5; margin-bottom: 12rpx; }
.score-data-tags { display: flex; gap: 10rpx; flex-wrap: wrap; }
.data-tag    { padding: 4rpx 14rpx; border-radius: 20rpx; font-size: 20rpx; font-weight: 600; }
.tag-green   { background: #e8f8f0; color: #27ae60; }
.tag-blue    { background: #e8f0ff; color: #5b8dee; }
.tag-purple  { background: #f0e8ff; color: #764ba2; }
.tag-orange  { background: #fff3e0; color: #e8740c; }
.tag-grey    { background: #f0f0f0; color: #bbb; }

/* 雷达图 */
.radar-wrap  { width: 100%; height: 480rpx; margin-bottom: 16rpx; }
.radar-chart { width: 100%; height: 100%; }
.radar-legend { display: flex; flex-wrap: wrap; gap: 14rpx 0; }
.legend-item  { width: 33.33%; display: flex; align-items: center; gap: 4rpx; }
.legend-dot   { width: 16rpx; height: 16rpx; border-radius: 50%; flex-shrink: 0; }
.legend-name  { font-size: 22rpx; color: #555; white-space: nowrap; }
.legend-val   { font-size: 22rpx; color: #333; font-weight: 600; white-space: nowrap; }

/* HTP模块 */
.module-htp { border-top: 4rpx solid #f7971e; }
.htp-score-row { display: flex; align-items: center; gap: 24rpx; margin-bottom: 20rpx; }
.htp-score-circle { width: 110rpx; height: 110rpx; border-radius: 50%; display: flex; flex-direction: column; align-items: center; justify-content: center; flex-shrink: 0; }
.htp-score-num  { color: #fff; font-size: 44rpx; font-weight: 800; line-height: 1; }
.htp-score-unit { color: rgba(255,255,255,0.8); font-size: 22rpx; }
.htp-score-info { flex: 1; }
.htp-level { font-size: 30rpx; font-weight: 700; color: #2d3a4a; display: block; margin-bottom: 4rpx; }
.htp-date  { font-size: 22rpx; color: #999; display: block; margin-bottom: 10rpx; }
.htp-tags-row { display: flex; gap: 8rpx; flex-wrap: wrap; }
.htp-mini-tag { background: #fff8e1; color: #f7971e; padding: 4rpx 12rpx; border-radius: 16rpx; font-size: 20rpx; font-weight: 600; }
.dims-wrap { margin-bottom: 16rpx; }
.dim-row   { display: flex; align-items: center; gap: 12rpx; margin-bottom: 14rpx; }
.dim-name  { font-size: 22rpx; color: #555; width: 90rpx; flex-shrink: 0; }
.dim-bar-bg   { flex: 1; height: 14rpx; background: #f0f0f0; border-radius: 7rpx; overflow: hidden; }
.dim-bar-fill { height: 100%; border-radius: 7rpx; transition: width 0.6s ease; }
.dim-score-text { font-size: 22rpx; color: #333; font-weight: 600; width: 40rpx; text-align: right; }

/* 自助测评 */
.module-self { border-top: 4rpx solid #764ba2; }
.scale-grid  { display: flex; flex-wrap: wrap; gap: 12rpx; margin-bottom: 16rpx; }
.scale-mini-card { width: calc(50% - 6rpx); background: #fafbff; border-radius: 16rpx; padding: 16rpx 14rpx; border-left: 5rpx solid #667eea; box-sizing: border-box; overflow: hidden; }
.scale-mini-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 4rpx; gap: 4rpx; }
.scale-mini-name { font-size: 24rpx; font-weight: 700; color: #2c3e50; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; flex-shrink: 0; }
.scale-mini-fullname { font-size: 19rpx; color: #999; display: block; margin-bottom: 6rpx; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.scale-mini-val  { font-size: 30rpx; font-weight: 800; display: block; margin-bottom: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.scale-mini-tag  { display: inline-block; font-size: 17rpx; padding: 2rpx 8rpx; border-radius: 10rpx; flex-shrink: 0; max-width: 110rpx; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

/* 健康评估 */
.module-doctor { border-top: 4rpx solid #f5576c; }
.doctor-metrics { margin-bottom: 16rpx; }
.doctor-metric-item { display: flex; align-items: center; justify-content: space-between; padding: 16rpx 0; border-bottom: 1rpx solid #f5f5f5; }
.doctor-metric-item:last-child { border-bottom: none; }
.doctor-metric-left  { display: flex; align-items: center; gap: 16rpx; }
.doctor-metric-icon  { width: 56rpx; height: 56rpx; border-radius: 14rpx; display: flex; align-items: center; justify-content: center; font-size: 28rpx; flex-shrink: 0; }
.doctor-metric-name  { font-size: 26rpx; font-weight: 600; color: #2d3a4a; display: block; }
.doctor-metric-sub   { font-size: 20rpx; color: #999; display: block; margin-top: 2rpx; }
.doctor-metric-right { display: flex; flex-direction: column; align-items: flex-end; gap: 6rpx; }
.doctor-metric-val   { font-size: 34rpx; font-weight: 800; }
.doctor-metric-tag   { font-size: 20rpx; padding: 3rpx 12rpx; border-radius: 12rpx; }

/* 手环 */
.module-bracelet { border-top: 4rpx solid #43e97b; }
.bracelet-grid   { display: flex; flex-wrap: wrap; gap: 16rpx; margin-bottom: 16rpx; }
.bracelet-item   { width: calc(33.33% - 11rpx); border-radius: 16rpx; padding: 18rpx 12rpx; display: flex; flex-direction: column; align-items: center; box-sizing: border-box; }
.bracelet-item-icon  { font-size: 36rpx; margin-bottom: 6rpx; }
.bracelet-item-val   { font-size: 34rpx; font-weight: 800; color: #2d3a4a; line-height: 1.2; }
.bracelet-item-unit  { font-size: 20rpx; color: #666; }
.bracelet-item-label { font-size: 20rpx; color: #555; margin-top: 4rpx; }
.bracelet-status-row { display: flex; align-items: center; gap: 10rpx; padding-top: 8rpx; }
.bracelet-status-dot { width: 14rpx; height: 14rpx; border-radius: 50%; background: #43e97b; animation: pulse 1.5s ease-in-out infinite; }
@keyframes pulse { 0%,100% { opacity:1; transform:scale(1); } 50% { opacity:0.5; transform:scale(0.85); } }
.bracelet-status-text { font-size: 22rpx; color: #888; }

/* 建议 */
.module-advice { border-top: 4rpx solid #fda085; }
.advice-tab-row { display: flex; gap: 10rpx; margin-bottom: 24rpx; flex-wrap: nowrap; }
.advice-tab-btn {
	display: flex; align-items: center; gap: 6rpx;
	padding: 8rpx 14rpx; border-radius: 40rpx;
	background: #f4f6fb; border: 2rpx solid #eee;
	font-size: 20rpx; color: #888;
	transition: all 0.2s; flex: 1; justify-content: center;
}
.advice-tab-dot { display: inline-block; width: 12rpx; height: 12rpx; border-radius: 50%; flex-shrink: 0; }
.advice-tab-text { font-size: 20rpx; font-weight: 600; white-space: nowrap; }
.advice-tab-badge {
	background: #fff; border-radius: 20rpx; font-size: 18rpx; font-weight: 700;
	padding: 1rpx 8rpx; min-width: 24rpx; text-align: center; flex-shrink: 0;
}
.advice-tab-active { border-width: 2rpx; border-style: solid; background: #fff; color: #2d3a4a; }
.advice-tab-htp     { border-color: #f7971e; color: #f7971e; background: #fff8e1; }
.advice-tab-htp .advice-tab-badge    { background: #f7971e; color: #fff; }
.advice-tab-self    { border-color: #764ba2; color: #764ba2; background: #f3eaff; }
.advice-tab-self .advice-tab-badge   { background: #764ba2; color: #fff; }
.advice-tab-doctor  { border-color: #f5576c; color: #f5576c; background: #ffeef1; }
.advice-tab-doctor .advice-tab-badge { background: #f5576c; color: #fff; }
.advice-tab-bracelet{ border-color: #1a9e6e; color: #1a9e6e; background: #e0fdf4; }
.advice-tab-bracelet .advice-tab-badge { background: #1a9e6e; color: #fff; }
.advice-item  { display: flex; align-items: flex-start; gap: 20rpx; margin-bottom: 22rpx; padding-bottom: 22rpx; border-bottom: 1rpx solid #f5f5f5; }
.advice-item:last-child { border-bottom: none; margin-bottom: 0; padding-bottom: 0; }
.advice-icon-wrap   { width: 60rpx; height: 60rpx; border-radius: 16rpx; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.advice-icon        { font-size: 30rpx; }
.advice-text-wrap   { flex: 1; }
.advice-title       { font-size: 28rpx; font-weight: 700; color: #2d3a4a; margin-bottom: 6rpx; }
.advice-desc        { font-size: 24rpx; color: #666; line-height: 1.6; margin-bottom: 8rpx; }
.advice-source-chip { display: inline-block; background: #f0f4ff; color: #5b8dee; padding: 3rpx 12rpx; border-radius: 12rpx; font-size: 20rpx; }
.advice-empty       { display: flex; flex-direction: column; align-items: center; padding: 40rpx 0; }

/* 通用 */
.module-summary { background: #f8f9ff; border-radius: 14rpx; padding: 18rpx 20rpx; margin-top: 8rpx; }
.summary-label  { font-size: 22rpx; color: #888; display: block; margin-bottom: 6rpx; }
.summary-text   { font-size: 24rpx; color: #555; line-height: 1.7; }
.module-empty   { display: flex; flex-direction: column; align-items: center; padding: 40rpx 0 20rpx; }
.empty-icon { font-size: 64rpx; margin-bottom: 16rpx; }
.empty-text { font-size: 28rpx; color: #aaa; margin-bottom: 8rpx; text-align: center; }
.empty-hint { font-size: 22rpx; color: #ccc; text-align: center; line-height: 1.6; padding: 0 24rpx; }

/* 数据说明 */
.tips-card  { margin-bottom: 24rpx; }
.tips-title { font-size: 26rpx; font-weight: 700; color: #555; margin-bottom: 10rpx; }
.tips-text  { font-size: 22rpx; color: #888; line-height: 1.7; margin-bottom: 4rpx; }
.warn-text  { color: #e8740c; }
.footer-space { height: 40rpx; }

/* ========== 历史记录弹窗样式 ========== */
.history-mask {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0,0,0,0.5);
	z-index: 1000;
	display: flex;
	align-items: flex-end;
	justify-content: center;
}
.history-modal {
	background: #fff;
	border-radius: 32rpx 32rpx 0 0;
	width: 100%;
	max-height: 80vh;
	display: flex;
	flex-direction: column;
	animation: slideUp 0.3s ease;
}
@keyframes slideUp {
	from { transform: translateY(100%); opacity: 0; }
	to { transform: translateY(0); opacity: 1; }
}
.history-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 28rpx 32rpx;
	border-bottom: 1rpx solid #f0f0f0;
}
.history-modal-title {
	font-size: 34rpx;
	font-weight: 700;
	color: #2d3a4a;
}
.history-close {
	width: 48rpx;
	height: 48rpx;
	border-radius: 50%;
	background: #f4f6fb;
	display: flex;
	align-items: center;
	justify-content: center;
}
.close-icon {
	font-size: 32rpx;
	color: #999;
}
.history-filter {
	display: flex;
	gap: 12rpx;
	padding: 16rpx 32rpx;
	background: #f8f9ff;
}
.filter-btn {
	flex: 1;
	padding: 10rpx 16rpx;
	background: #fff;
	border-radius: 20rpx;
	font-size: 24rpx;
	color: #666;
	text-align: center;
	border: 2rpx solid #eee;
	transition: all 0.2s;
}
.filter-active {
	background: linear-gradient(135deg,#11998e,#38ef7d);
	color: #fff;
	border-color: transparent;
}
.history-list {
	flex: 1;
	overflow-y: auto;
	padding: 0 32rpx 32rpx;
}
.history-empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 80rpx 0;
}
.history-empty .empty-icon {
	font-size: 80rpx;
	margin-bottom: 16rpx;
}
.history-empty .empty-text {
	font-size: 28rpx;
	color: #999;
	margin-bottom: 8rpx;
}
.history-empty .empty-hint {
	font-size: 24rpx;
	color: #ccc;
	text-align: center;
}
.history-item {
	background: #fafbff;
	border-radius: 20rpx;
	padding: 24rpx;
	margin-top: 20rpx;
	transition: all 0.2s;
}
.history-item:active {
	transform: scale(0.98);
	background: #f0f4ff;
}
.history-item-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 16rpx;
}
.history-date {
	display: flex;
	flex-direction: column;
	gap: 4rpx;
}
.date-main {
	font-size: 30rpx;
	font-weight: 700;
	color: #2d3a4a;
}
.date-sub {
	font-size: 22rpx;
	color: #999;
}
.history-score-badge {
	padding: 12rpx 20rpx;
	border-radius: 24rpx;
	display: flex;
	align-items: center;
	gap: 4rpx;
}
.history-score-badge .score-num {
	color: #fff;
	font-size: 32rpx;
	font-weight: 800;
}
.score-unit {
	color: rgba(255,255,255,0.8);
	font-size: 20rpx;
}
.history-item-content {
	display: flex;
	align-items: center;
	gap: 16rpx;
	margin-bottom: 12rpx;
}
.history-level {
	font-size: 28rpx;
	font-weight: 700;
	padding: 6rpx 16rpx;
	border-radius: 16rpx;
	background: #f0f0f0;
}
.history-metrics {
	flex: 1;
	display: flex;
	gap: 12rpx;
	flex-wrap: wrap;
}
.metric-chip {
	display: flex;
	align-items: center;
	gap: 4rpx;
	background: #fff;
	padding: 6rpx 12rpx;
	border-radius: 12rpx;
	font-size: 20rpx;
	color: #555;
}
.metric-icon {
	font-size: 24rpx;
}
.metric-val {
	font-weight: 600;
}
.history-item-footer {
	border-top: 1rpx solid #e8eaed;
	padding-top: 12rpx;
}
.data-sources-tag {
	font-size: 20rpx;
	color: #999;
}

/* ========== 历史详情弹窗样式 ========== */
.detail-mask {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0,0,0,0.5);
	z-index: 1001;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 32rpx;
}
.detail-modal {
	background: #fff;
	border-radius: 32rpx;
	width: 100%;
	max-height: 85vh;
	display: flex;
	flex-direction: column;
	animation: fadeIn 0.3s ease;
}
@keyframes fadeIn {
	from { transform: scale(0.9); opacity: 0; }
	to { transform: scale(1); opacity: 1; }
}
.detail-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 28rpx 32rpx;
	border-bottom: 1rpx solid #f0f0f0;
}
.detail-header-left {
	display: flex;
	flex-direction: column;
	gap: 4rpx;
}
.detail-title {
	font-size: 32rpx;
	font-weight: 700;
	color: #2d3a4a;
}
.detail-date {
	font-size: 22rpx;
	color: #999;
}
.detail-close {
	width: 48rpx;
	height: 48rpx;
	border-radius: 50%;
	background: #f4f6fb;
	display: flex;
	align-items: center;
	justify-content: center;
}
.detail-content {
	flex: 1;
	overflow-y: auto;
	padding: 32rpx;
}
.detail-section {
	margin-bottom: 32rpx;
}
.detail-section:last-child {
	margin-bottom: 0;
}
.detail-section-title {
	font-size: 28rpx;
	font-weight: 700;
	color: #2d3a4a;
	margin-bottom: 20rpx;
	padding-left: 12rpx;
	border-left: 6rpx solid #5b8dee;
}
.detail-score-circle {
	width: 160rpx;
	height: 160rpx;
	border-radius: 50%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20rpx;
}
.detail-score-num {
	color: #fff;
	font-size: 64rpx;
	font-weight: 800;
	line-height: 1;
}
.detail-score-label {
	color: rgba(255,255,255,0.8);
	font-size: 24rpx;
	margin-top: 4rpx;
}
.detail-level {
	text-align: center;
	font-size: 36rpx;
	font-weight: 700;
	margin-bottom: 12rpx;
}
.detail-tip {
	text-align: center;
	font-size: 24rpx;
	color: #666;
	line-height: 1.6;
	padding: 0 32rpx;
}
.scale-detail-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16rpx;
}
.scale-detail-item {
	background: #f8f9ff;
	border-radius: 16rpx;
	padding: 20rpx 12rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8rpx;
}
.scale-name {
	font-size: 22rpx;
	color: #666;
	text-align: center;
}
.scale-value {
	font-size: 36rpx;
	font-weight: 800;
	text-align: center;
}
.scale-level {
	font-size: 20rpx;
	color: #666;
	padding: 4rpx 12rpx;
	border-radius: 12rpx;
	background: #fff;
}
.bracelet-detail-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16rpx;
}
.bracelet-detail-item {
	background: linear-gradient(135deg,#f8f9ff,#eef0ff);
	border-radius: 16rpx;
	padding: 20rpx 12rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 6rpx;
}
.bracelet-icon {
	font-size: 40rpx;
}
.bracelet-label {
	font-size: 20rpx;
	color: #666;
}
.bracelet-value {
	font-size: 32rpx;
	font-weight: 800;
	color: #2d3a4a;
}
.bracelet-unit {
	font-size: 18rpx;
	color: #999;
}
.advice-detail-list {
	display: flex;
	flex-direction: column;
	gap: 16rpx;
}
.advice-detail-item {
	display: flex;
	align-items: flex-start;
	gap: 12rpx;
	background: #fff8e1;
	padding: 16rpx;
	border-radius: 12rpx;
	border-left: 4rpx solid #f7971e;
}
.advice-dot {
	font-size: 28rpx;
	color: #f7971e;
	flex-shrink: 0;
}
.advice-text {
	flex: 1;
	font-size: 24rpx;
	color: #555;
	line-height: 1.6;
}
.detail-footer {
	display: flex;
	gap: 16rpx;
	padding: 24rpx 32rpx;
	border-top: 1rpx solid #f0f0f0;
}
.detail-btn {
	flex: 1;
	padding: 16rpx;
	border-radius: 24rpx;
	background: #f4f6fb;
	text-align: center;
	font-size: 28rpx;
	font-weight: 600;
	color: #555;
	transition: all 0.2s;
}
.detail-btn:active {
	transform: scale(0.98);
}
.detail-btn.primary {
	background: linear-gradient(135deg,#11998e,#38ef7d);
	color: #fff;
}
</style>
