<template>
	<view class="container">
		<!-- 更新按钮区域 -->
		<view class="update-section">
			<button class="garmin-btn" :class="{ 'is-bound': isGarminBound }" @click="openBindModal">
				<text class="garmin-icon">{{ isGarminBound ? '🔗' : '📱' }}</text>
				<text class="garmin-text">{{ isGarminBound ? ($t('bracelet.boundAccount') || '已绑定账号') : ($t('bracelet.bindAccount') || '绑定账号') }}</text>
			</button>
			<button class="update-btn" @click="handleUpdate" :loading="isUpdating">
				<text class="update-icon">🔄</text>
				<text class="update-text">{{ isUpdating ? $t('bracelet.updating') : $t('bracelet.updateData') }}</text>
			</button>
			<button class="report-btn" @click="openHistoryModal">
				<text class="report-icon">📈</text>
				<text class="report-text">{{ $t('bracelet.historyData') || '历史数据' }}</text>
			</button>
		</view>

		<!-- 6项生理数据卡片横向排列容器 -->
		<view class="card-row">
			<!-- 昨日心率卡片 -->
			<view class="heart-rate-card" @click="openHistoryWithMetric('heartrate')">
				<view class="label-row">
					<image class="icon-heart" src="/static/images/bracelet/xinlv.png" mode="aspectFit" />
					<text class="data-label">{{ $t('bracelet.yesterdayHeartRate') }}</text>
				</view>
				<div class="data-items">
					<text class="data-value">{{ $t('bracelet.maxHeartRate') }} <span class="space"></span> 
						<text class="value-number">{{ maxHeartRate }}</text>
						<span class="space"></span> 
						<text v-if="maxHeartRate !== '暂无数据' && maxHeartRate !== 'No Data' && maxHeartRate !== '--'"> {{ $t('bracelet.bpmUnit') }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.minHeartRate') }} <span class="space"></span> 
						<text class="value-number">{{ minHeartRate }}</text>
						<span class="space"></span> 
						<text v-if="minHeartRate !== '暂无数据' && minHeartRate !== 'No Data' && minHeartRate !== '--'"> {{ $t('bracelet.bpmUnit') }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.restingHeartRate') }} <span class="space"></span> 
						<text class="value-number">{{ restingHeartRate }}</text>
						<span class="space"></span> 
						<text v-if="restingHeartRate !== '暂无数据' && restingHeartRate !== 'No Data' && restingHeartRate !== '--'"> {{ $t('bracelet.bpmUnit') }}</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} {{ $t('bracelet.dataSuffix') }}</text>
			</view>

			<!-- 昨日睡眠卡片 -->
			<view class="sleep-card" style="margin-left: 4%" @click="openHistoryWithMetric('sleep')">
				<view class="label-row">
					<image class="icon-sleep" src="/static/images/bracelet/shuimian.png" mode="aspectFit" />
					<text class="data-label">{{ $t('bracelet.yesterdaySleep') }}</text>
				</view>
				<div class="data-items">
					<text class="data-value">{{ $t('bracelet.sleepScore') }} <span class="space"></span> 
						<text class="value-number">{{ sleep_score_overall }}</text>
						<span class="space"></span> 
						<text v-if="sleep_score_overall !== '暂无数据' && sleep_score_overall !== 'No Data' && sleep_score_overall !== '--'"> {{ $t('bracelet.scoreUnit') }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.sleepDuration') }} <span class="space"></span> 
						<text class="value-number">{{ sleepTimeSeconds !== null && sleepTimeSeconds !== undefined ? sleepTimeSeconds : ($t('bracelet.noData')) }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.awakeDuration') }} <span class="space"></span> 
						<text class="value-number">{{ awakeSleepSeconds !== null && awakeSleepSeconds !== undefined ? awakeSleepSeconds : ($t('bracelet.noData')) }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.sleepStress') }} <span class="space"></span> 
						<text class="value-number">{{ avgSleepStress !== null && avgSleepStress !== undefined ? avgSleepStress : ($t('bracelet.noData')) }}</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} {{ $t('bracelet.dataSuffix') }}</text>
			</view>

			<!-- 昨日步数卡片 -->
			<view class="steps-card" @click="openHistoryWithMetric('steps')">
				<view class="label-row">
					<image class="icon-steps" src="/static/images/bracelet/bushu.png" mode="aspectFit" />
					<text class="data-label">{{ $t('bracelet.yesterdayExercise') }}</text>
				</view>
				<div class="data-items">
					<text class="data-value">{{ $t('bracelet.stepsLabel') }} <span class="space"></span> 
						<text class="value-number">{{ totalSteps }}</text>
						<span class="space"></span> 
						<text v-if="totalSteps !== '暂无数据' && totalSteps !== 'No Data' && totalSteps !== '--'"> {{ $t('bracelet.stepsUnit') }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.distanceLabel') }} <span class="space"></span> 
						<text class="value-number">{{ formattedDistance }}</text>
						<span class="space"></span> 
						<text v-if="totalDistance !== '暂无数据' && totalDistance !== 'No Data' && totalDistance !== '--'"> {{ $t('bracelet.kmUnit') }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.stepGoalLabel') }} <span class="space"></span> 
						<text class="value-number">{{ stepGoal }}</text>
						<span class="space"></span> 
						<text v-if="stepGoal !== '暂无数据' && stepGoal !== 'No Data' && stepGoal !== '--'"> {{ $t('bracelet.stepsUnit') }}</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} {{ $t('bracelet.dataSuffix') }}</text>
			</view>

			<!-- 昨日身体电量卡片 -->
			<view class="body-energy-card" @click="openHistoryWithMetric('bodybattery')">
				<view class="label-row">
					<image class="icon-energy" src="/static/images/bracelet/shentidianliang.png" mode="aspectFit" />
					<text class="data-label">{{ $t('bracelet.yesterdayBodyBattery') }}</text>
				</view>
				<view class="data-items">
					<!-- 充能项 -->
					<view class="energy-item">
						<text class="data-value">{{ $t('bracelet.chargeLabel') }} <span class="space"></span> 
							<text class="value-number">{{ (charged !== null && charged !== undefined && charged !== '--' && charged !== '暂无数据') ? ('+ ' + charged) : (charged || $t('bracelet.noData')) }}</text>
						</text>
						<text class="energy-note">{{ $t('bracelet.chargeDesc') }}</text>
					</view>

					<!-- 耗能项 -->
					<view class="energy-item">
						<text class="data-value">{{ $t('bracelet.drainedLabel') }} <span class="space"></span> 
							<text class="value-number">{{ (drained !== null && drained !== undefined && drained !== '--' && drained !== '暂无数据') ? ('- ' + drained) : (drained || $t('bracelet.noData')) }}</text>
						</text>
						<text class="energy-note">{{ $t('bracelet.drainedDesc') }}</text>
					</view>
				</view>
				<text class="update-date">{{ date }} {{ $t('bracelet.dataSuffix') }}</text>
			</view>

			<!-- 昨日压力卡片 -->
			<view class="stress-card" @click="openHistoryWithMetric('stress')">
				<view class="label-row">
					<image class="icon-stress" src="/static/images/bracelet/yali.png" mode="aspectFit" />
					<text class="data-label">{{ $t('bracelet.yesterdayStress') }}</text>
				</view>
				<div class="data-items">
					<text class="data-value">{{ $t('bracelet.maxStress') }} <span class="space"></span> 
						<text class="value-number">{{ maxStressLevel !== null && maxStressLevel !== undefined ? maxStressLevel : ($t('bracelet.noData')) }}</text>
					</text>
					<text class="data-value">{{ $t('bracelet.avgStressLabel') }} <span class="space"></span> 
						<text class="value-number">{{ avgStressLevel !== null && avgStressLevel !== undefined ? avgStressLevel : ($t('bracelet.noData')) }}</text>
					</text>
					<text class="tips-text">{{ $i18n && $i18n.currentLang === 'en' ? 'Stay relaxed: stress is temporary, tranquility is forever ^^' : '放松心情，压力是暂时的，放松是永恒的^^' }}</text>
				</div>
				<text class="update-date">{{ calendarDate }} {{ $t('bracelet.dataSuffix') }}</text>
			</view>

			<!-- 昨日血氧卡片 -->
			<view class="spo2-card" @click="openHistoryWithMetric('spo2')">
				<view class="label-row">
					<image class="icon-spo2" src="/static/images/bracelet/xueyang.png" mode="aspectFit" />
					<text class="data-label">{{ $t('bracelet.yesterdaySpO2') }}</text>
				</view>
				<div class="data-items">
					<text class="data-value">{{ $t('bracelet.avgSpo2Short') }} <span class="space"></span> 
						<text class="value-number">{{ averageSpO2 }}</text>
						<span class="space"></span> 
						<text v-if="averageSpO2 !== '暂无数据' && averageSpO2 !== 'No Data' && averageSpO2 !== '--'"> %</text>
					</text>
					<text class="data-value">{{ $t('bracelet.minSpo2Short') }} <span class="space"></span> 
						<text class="value-number">{{ lowestSpO2 }}</text>
						<span class="space"></span> 
						<text v-if="lowestSpO2 !== '暂无数据' && lowestSpO2 !== 'No Data' && lowestSpO2 !== '--'"> %</text>
					</text>
					<text class="data-value">{{ $t('bracelet.sleepSpO2') }} <span class="space"></span> 
						<text class="value-number">{{ avgSleepSpO2 }}</text>
						<span class="space"></span> 
						<text v-if="avgSleepSpO2 !== '暂无数据' && avgSleepSpO2 !== 'No Data' && avgSleepSpO2 !== '--'"> %</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} {{ $t('bracelet.dataSuffix') }}</text>
			</view>
		</view>

		<!-- 绑定账号弹窗 -->
		<view v-if="showBindModal" class="bind-modal-mask" @click.self="closeBindModal">
			<view class="bind-modal-dialog">
				<view class="bind-modal-header">
					<view class="bind-header-title-row">
						<text class="bind-header-icon">🔗</text>
						<text class="bind-header-title">绑定 Garmin 账号</text>
					</view>
					<view class="bind-close-btn" @click="closeBindModal">
						<text class="bind-close-icon">✕</text>
					</view>
				</view>

				<!-- 状态胶囊 -->
				<view class="bind-status-banner" :class="isGarminBound ? 'status-bound' : 'status-unbound'">
					<text class="status-dot"></text>
					<text class="status-text">{{ isGarminBound ? ('当前已绑定：' + (maskedEmail || garminEmail)) : '当前尚未绑定 Garmin 账号' }}</text>
				</view>

				<!-- 表单输入区域 -->
				<view class="bind-form">
					<view class="form-item">
						<text class="form-label">Garmin 账号邮箱</text>
						<view class="input-wrap">
							<input class="form-input" v-model="garminEmail" placeholder="请输入 Garmin Connect 账号邮箱" type="text" />
							<text v-if="garminEmail" class="clear-icon" @click="garminEmail = ''">✕</text>
						</view>
					</view>

					<view class="form-item">
						<text class="form-label">Garmin 账号密码</text>
						<view class="input-wrap">
							<input class="form-input" :password="!showPasswordText" v-model="garminPassword" placeholder="请输入 Garmin Connect 账号密码" />
							<text class="eye-icon" @click="showPasswordText = !showPasswordText">{{ showPasswordText ? '👁️' : '🔒' }}</text>
						</view>
					</view>

					<view class="bind-notice-box">
						<text class="notice-icon">🛡️</text>
						<text class="notice-text">账号密码将加密存储于您的专属数据库，仅用于自动同步 Garmin Connect 中国区手环健康数据（心率、步数、睡眠、身体电量、压力与血氧）。</text>
					</view>
				</view>

				<!-- 弹窗底部操作按钮 -->
				<view class="bind-actions">
					<button class="btn-bind-submit" :loading="isSubmittingBind" @click="handleBindGarmin">
						{{ isGarminBound ? '完成更新绑定' : '完成绑定' }}
					</button>
					<button v-if="isGarminBound" class="btn-bind-cancel" @click="handleUnbindGarmin">
						取消绑定
					</button>
					<button class="btn-bind-close" @click="closeBindModal">
						关闭
					</button>
				</view>
			</view>
		</view>

		<!-- 历史数据可视化弹窗 -->
		<view v-if="showHistoryModal" class="history-modal-mask" @click.self="closeHistoryModal">
			<view class="history-modal-dialog">
				<!-- 弹窗头部 -->
				<view class="history-modal-header">
					<view class="history-header-left">
						<text class="history-header-icon">📈</text>
						<view class="history-title-wrap">
							<text class="history-modal-title">{{ $t('bracelet.historyData') || '历史数据' }}</text>
							<text class="history-modal-sub">多维手环健康生理指标趋势与以往记录</text>
						</view>
					</view>
					<view class="history-close-btn" @click="closeHistoryModal">
						<text class="history-close-icon">✕</text>
					</view>
				</view>

				<!-- 时间范围切换 Tab -->
				<view class="period-tabs-bar">
					<view class="period-tab" :class="{ active: historyPeriod === 7 }" @click="switchPeriod(7)">
						近 7 天
					</view>
					<view class="period-tab" :class="{ active: historyPeriod === 14 }" @click="switchPeriod(14)">
						近 14 天
					</view>
					<view class="period-tab" :class="{ active: historyPeriod === 30 }" @click="switchPeriod(30)">
						近 30 天
					</view>
				</view>

				<!-- 指标分类横向切换 Tab -->
				<scroll-view scroll-x class="metric-tabs-scroll" :show-scrollbar="false">
					<view class="metric-tabs-track">
						<view class="metric-tab" :class="{ active: activeMetricTab === 'steps' }" @click="switchMetricTab('steps')">
							<text class="metric-tab-icon">🏃</text>
							<text class="metric-tab-title">步数运动</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'heartrate' }" @click="switchMetricTab('heartrate')">
							<text class="metric-tab-icon">❤️</text>
							<text class="metric-tab-title">心率</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'sleep' }" @click="switchMetricTab('sleep')">
							<text class="metric-tab-icon">🌙</text>
							<text class="metric-tab-title">睡眠</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'bodybattery' }" @click="switchMetricTab('bodybattery')">
							<text class="metric-tab-icon">⚡</text>
							<text class="metric-tab-title">身体电量</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'stress' }" @click="switchMetricTab('stress')">
							<text class="metric-tab-icon">🧘</text>
							<text class="metric-tab-title">压力</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'spo2' }" @click="switchMetricTab('spo2')">
							<text class="metric-tab-icon">🩸</text>
							<text class="metric-tab-title">血氧</text>
						</view>
					</view>
				</scroll-view>

				<!-- 弹窗可滚动展示区域 -->
				<scroll-view scroll-y class="history-scroll-content">
					<!-- KPI 汇总卡片 -->
					<view class="kpi-summary-card">
						<view class="kpi-item">
							<text class="kpi-label">{{ currentMetricSummary.kpi1Label }}</text>
							<view class="kpi-val-row">
								<text class="kpi-value" :style="{ color: currentMetricSummary.themeColor }">{{ currentMetricSummary.kpi1Val }}</text>
								<text class="kpi-unit">{{ currentMetricSummary.kpi1Unit }}</text>
							</view>
						</view>
						<view class="kpi-divider"></view>
						<view class="kpi-item">
							<text class="kpi-label">{{ currentMetricSummary.kpi2Label }}</text>
							<view class="kpi-val-row">
								<text class="kpi-value" :style="{ color: currentMetricSummary.themeColor }">{{ currentMetricSummary.kpi2Val }}</text>
								<text class="kpi-unit">{{ currentMetricSummary.kpi2Unit }}</text>
							</view>
						</view>
						<view class="kpi-divider"></view>
						<view class="kpi-item">
							<text class="kpi-label">{{ currentMetricSummary.kpi3Label }}</text>
							<view class="kpi-val-row">
								<text class="kpi-value" :style="{ color: currentMetricSummary.themeColor }">{{ currentMetricSummary.kpi3Val }}</text>
								<text class="kpi-unit">{{ currentMetricSummary.kpi3Unit }}</text>
							</view>
						</view>
					</view>

					<!-- 可视化趋势柱状图 -->
					<view class="chart-visual-card">
						<view class="chart-card-header">
							<view class="chart-header-left">
								<text class="chart-header-dot" :style="{ backgroundColor: currentMetricSummary.themeColor }"></text>
								<text class="chart-header-title">{{ currentMetricSummary.chartTitle }}</text>
							</view>
							<text class="chart-header-subtitle">单位: {{ currentMetricSummary.unit }}</text>
						</view>

						<!-- 柱状图主图 -->
						<view class="bar-chart-container" v-if="chartBars.length > 0">
							<view class="bars-flex-wrap">
								<view 
									v-for="(bar, index) in chartBars" 
									:key="index"
									class="bar-column-item"
									:class="{ active: selectedBarIndex === index }"
									@click="selectBar(index)"
								>
									<!-- 柱顶数值 -->
									<text class="bar-top-value">{{ bar.valueText }}</text>
									<!-- 柱体轨道与填充 -->
									<view class="bar-track">
										<view 
											class="bar-fill" 
											:style="{ 
												height: bar.heightPercent + '%', 
												background: currentMetricSummary.barGradient,
												boxShadow: bar.isPeak ? ('0 0 12rpx ' + currentMetricSummary.themeColor) : 'none'
											}"
										>
											<view v-if="bar.isPeak" class="peak-dot"></view>
										</view>
									</view>
									<!-- 底部日期标签 -->
									<text class="bar-date-label">{{ bar.dateLabel }}</text>
								</view>
							</view>
						</view>
						<view v-else class="chart-empty-placeholder">
							<text class="chart-empty-icon">📊</text>
							<text class="chart-empty-text">近 {{ historyPeriod }} 天暂未查询到该项走势数据</text>
						</view>
					</view>

					<!-- 历史详细记录列表 -->
					<view class="history-list-section">
						<view class="list-section-header">
							<text class="list-section-title">以往数据记录明细</text>
							<text class="list-section-count">共 {{ currentHistoryRecords.length }} 条记录</text>
						</view>

						<view v-if="currentHistoryRecords.length > 0" class="history-record-cards">
							<view 
								v-for="(rec, idx) in currentHistoryRecords" 
								:key="idx"
								class="history-rec-card"
							>
								<view class="rec-card-top">
									<view class="rec-date-pill">
										<text class="rec-cal-icon">📅</text>
										<text class="rec-date-text">{{ rec.dateStr }}</text>
									</view>
									<view :class="['rec-status-badge', rec.statusBadge.cls]">
										{{ rec.statusBadge.text }}
									</view>
								</view>

								<view class="rec-grid-metrics">
									<view v-for="(metric, mIdx) in rec.metrics" :key="mIdx" class="rec-metric-cell">
										<text class="cell-label">{{ metric.label }}</text>
										<view class="cell-val-row">
											<text class="cell-val" :style="{ color: metric.color || '#333' }">{{ metric.value }}</text>
											<text class="cell-unit">{{ metric.unit }}</text>
										</view>
									</view>
								</view>
							</view>
						</view>

						<view v-else class="history-empty-card">
							<text class="empty-icon">📂</text>
							<text class="empty-title">暂无以往历史记录</text>
							<text class="empty-desc">点击下方按钮可实时拉取当前绑定账号在 Garmin Connect 平台的手环健康数据！</text>
							<button class="empty-sync-btn" @click="handleUpdateFromHistory">立即同步数据</button>
						</view>
					</view>

					<view class="history-footer-note">
						<text class="footer-note-text">数据来源：Garmin Connect 智能手环实时健康指标库</text>
					</view>
				</scroll-view>
			</view>
		</view>
	</view>
</template>

<script>
	import { router } from '@/nxTemp/router/index.js';
	import http from '@/nxTemp/config/requestConfig';
	import config from '@/nxTemp/config/index.config.js';

	export default {
		data() {
			return {
				// 心率数据
				maxHeartRate: '--',
				minHeartRate: '--',
				restingHeartRate: '--',
				calendarDate: '--',
				// 睡眠数据
				sleep_score_overall: '--',
				sleepTimeSeconds: '--',
				awakeSleepSeconds: '--',
				avgSleepStress: '--',
				// 运动数据
				totalSteps: '--',
				totalDistance: '--',
				stepGoal: '--',
				// 身体电量数据
				charged: '--',
				drained: '--',
				date: '--',
				// 压力数据
				maxStressLevel: '--',
				avgStressLevel: '--',
				// 血氧数据
				averageSpO2: '--',
				lowestSpO2: '--',
				avgSleepSpO2: '--',

				// 更新状态
				isUpdating: false,

				// Garmin 绑定相关
				isGarminBound: false,
				boundEmail: '',
				garminEmail: '',
				garminPassword: '',
				showPasswordText: false,
				isSubmittingBind: false,
				showBindModal: false,

				// 历史数据可视化弹窗
				showHistoryModal: false,
				historyPeriod: 7, // 7, 14, 30
				activeMetricTab: 'steps', // 'steps' | 'heartrate' | 'sleep' | 'bodybattery' | 'stress' | 'spo2'
				selectedBarIndex: null,
				isLoadingHistory: false,

				// 历史数据存储
				stepsHistoryList: [],
				heartRateHistoryList: [],
				sleepHistoryList: [],
				bodyBatteryHistoryList: [],
				stressHistoryList: [],
				spo2HistoryList: []
			};
		},

		computed: {
			// 格式化距离（米转公里）
			formattedDistance() {
				if (this.totalDistance === '--' || this.totalDistance === '暂无数据' || this.totalDistance === null || this.totalDistance === undefined) {
					return this.totalDistance || '--';
				}
				const d = parseFloat(this.totalDistance);
				if (isNaN(d)) return this.totalDistance;
				return (d / 1000).toFixed(1);
			},

			// 脱敏显示的 Garmin 邮箱
			maskedEmail() {
				const email = this.boundEmail || this.garminEmail;
				if (!email || !email.includes('@')) return email || '';
				const parts = email.split('@');
				const name = parts[0];
				const domain = parts[1];
				if (name.length <= 2) {
					return name + '***@' + domain;
				}
				return name.slice(0, 2) + '***' + name.slice(-2) + '@' + domain;
			},

			// 当前指标的概览与 KPI 卡片数据
			currentMetricSummary() {
				const tab = this.activeMetricTab;
				if (tab === 'steps') {
					const list = this.stepsHistoryList.slice(0, this.historyPeriod);
					let maxS = 0;
					let sumS = 0;
					let count = 0;
					list.forEach(item => {
						const val = parseInt(item.totalSteps);
						if (!isNaN(val) && val > 0) {
							if (val > maxS) maxS = val;
							sumS += val;
							count++;
						}
					});
					const avgS = count > 0 ? Math.round(sumS / count) : 0;
					return {
						title: '步数运动',
						unit: '步',
						themeColor: '#ff7a00',
						barGradient: 'linear-gradient(180deg, #ffb347 0%, #ff7a00 100%)',
						chartTitle: '每日运动步数趋势',
						kpi1Label: '最高步数',
						kpi1Val: maxS || '--',
						kpi1Unit: '步',
						kpi2Label: '平均步数',
						kpi2Val: avgS || '--',
						kpi2Unit: '步',
						kpi3Label: '有效记录',
						kpi3Val: count,
						kpi3Unit: '天'
					};
				} else if (tab === 'heartrate') {
					const list = this.heartRateHistoryList.slice(0, this.historyPeriod);
					let sumRest = 0;
					let countRest = 0;
					let minVal = 999;
					let maxVal = 0;
					list.forEach(item => {
						const r = parseInt(item.restingHeartRate);
						const mn = parseInt(item.minHeartRate);
						const mx = parseInt(item.maxHeartRate);
						if (!isNaN(r) && r > 0) { sumRest += r; countRest++; }
						if (!isNaN(mn) && mn > 0 && mn < minVal) minVal = mn;
						if (!isNaN(mx) && mx > maxVal) maxVal = mx;
					});
					const avgRest = countRest > 0 ? Math.round(sumRest / countRest) : 0;
					return {
						title: '心率',
						unit: 'bpm',
						themeColor: '#a18cd1',
						barGradient: 'linear-gradient(180deg, #c7a7ea 0%, #a18cd1 100%)',
						chartTitle: '每日静息心率走势',
						kpi1Label: '平均静息',
						kpi1Val: avgRest || '--',
						kpi1Unit: 'bpm',
						kpi2Label: '最低心率',
						kpi2Val: minVal !== 999 ? minVal : '--',
						kpi2Unit: 'bpm',
						kpi3Label: '最高峰值',
						kpi3Val: maxVal || '--',
						kpi3Unit: 'bpm'
					};
				} else if (tab === 'sleep') {
					const list = this.sleepHistoryList.slice(0, this.historyPeriod);
					let sumScore = 0;
					let maxScore = 0;
					let count = 0;
					list.forEach(item => {
						const sc = parseInt(item.sleep_score_overall);
						if (!isNaN(sc) && sc > 0) {
							sumScore += sc;
							if (sc > maxScore) maxScore = sc;
							count++;
						}
					});
					const avgScore = count > 0 ? Math.round(sumScore / count) : 0;
					return {
						title: '睡眠',
						unit: '分',
						themeColor: '#1976d2',
						barGradient: 'linear-gradient(180deg, #64b5f6 0%, #1976d2 100%)',
						chartTitle: '睡眠质量综合评分趋势',
						kpi1Label: '平均得分',
						kpi1Val: avgScore || '--',
						kpi1Unit: '分',
						kpi2Label: '最高得分',
						kpi2Val: maxScore || '--',
						kpi2Unit: '分',
						kpi3Label: '监测天数',
						kpi3Val: count,
						kpi3Unit: '天'
					};
				} else if (tab === 'bodybattery') {
					const list = this.bodyBatteryHistoryList.slice(0, this.historyPeriod);
					let sumC = 0;
					let sumD = 0;
					let count = 0;
					list.forEach(item => {
						const c = parseInt(item.charged);
						const d = parseInt(item.drained);
						if (!isNaN(c)) sumC += c;
						if (!isNaN(d)) sumD += d;
						if (!isNaN(c) || !isNaN(d)) count++;
					});
					const avgC = count > 0 ? Math.round(sumC / count) : 0;
					const avgD = count > 0 ? Math.round(sumD / count) : 0;
					const balance = sumC - sumD;
					return {
						title: '身体电量',
						unit: '点',
						themeColor: '#388e3c',
						barGradient: 'linear-gradient(180deg, #81c784 0%, #388e3c 100%)',
						chartTitle: '身体电量恢复充能走势',
						kpi1Label: '日均充能',
						kpi1Val: avgC || '--',
						kpi1Unit: '点',
						kpi2Label: '日均耗能',
						kpi2Val: avgD || '--',
						kpi2Unit: '点',
						kpi3Label: '电量盈余',
						kpi3Val: (balance >= 0 ? '+' : '') + balance,
						kpi3Unit: '点'
					};
				} else if (tab === 'stress') {
					const list = this.stressHistoryList.slice(0, this.historyPeriod);
					let sumAvg = 0;
					let maxSt = 0;
					let count = 0;
					list.forEach(item => {
						const a = parseInt(item.avgStressLevel);
						const m = parseInt(item.maxStressLevel);
						if (!isNaN(a) && a > 0) { sumAvg += a; count++; }
						if (!isNaN(m) && m > maxSt) maxSt = m;
					});
					const avgSt = count > 0 ? Math.round(sumAvg / count) : 0;
					let statusText = '暂无';
					if (avgSt > 0) {
						if (avgSt < 26) statusText = '放松平静';
						else if (avgSt < 51) statusText = '低压力';
						else if (avgSt < 76) statusText = '中度压力';
						else statusText = '高压力';
					}
					return {
						title: '压力',
						unit: '分',
						themeColor: '#d4a017',
						barGradient: 'linear-gradient(180deg, #ffd54f 0%, #d4a017 100%)',
						chartTitle: '每日平均压力等级趋势',
						kpi1Label: '平均压力',
						kpi1Val: avgSt || '--',
						kpi1Unit: '分',
						kpi2Label: '峰值压力',
						kpi2Val: maxSt || '--',
						kpi2Unit: '分',
						kpi3Label: '状态评估',
						kpi3Val: statusText,
						kpi3Unit: ''
					};
				} else {
					// spo2
					const list = this.spo2HistoryList.slice(0, this.historyPeriod);
					let sumSp = 0;
					let minSp = 100;
					let sumSleepSp = 0;
					let count = 0;
					let countSleep = 0;
					list.forEach(item => {
						const a = parseFloat(item.averageSpO2);
						const mn = parseFloat(item.lowestSpO2);
						const sl = parseFloat(item.avgSleepSpO2);
						if (!isNaN(a) && a > 0) { sumSp += a; count++; }
						if (!isNaN(mn) && mn > 0 && mn < minSp) minSp = mn;
						if (!isNaN(sl) && sl > 0) { sumSleepSp += sl; countSleep++; }
					});
					const avgSp = count > 0 ? (sumSp / count).toFixed(1) : 0;
					const avgSleepSp = countSleep > 0 ? (sumSleepSp / countSleep).toFixed(1) : 0;
					return {
						title: '血氧',
						unit: '%',
						themeColor: '#ff5277',
						barGradient: 'linear-gradient(180deg, #ff8da1 0%, #ff5277 100%)',
						chartTitle: '每日平均血氧饱和度趋势',
						kpi1Label: '平均血氧',
						kpi1Val: avgSp ? (avgSp + '%') : '--',
						kpi1Unit: '',
						kpi2Label: '最低血氧',
						kpi2Val: minSp !== 100 ? (minSp + '%') : '--',
						kpi2Unit: '',
						kpi3Label: '睡眠血氧',
						kpi3Val: avgSleepSp ? (avgSleepSp + '%') : '--',
						kpi3Unit: ''
					};
				}
			},

			// 走势柱状图数据（按时间先后从左至右排序）
			chartBars() {
				const tab = this.activeMetricTab;
				let rawList = [];
				if (tab === 'steps') rawList = this.stepsHistoryList;
				else if (tab === 'heartrate') rawList = this.heartRateHistoryList;
				else if (tab === 'sleep') rawList = this.sleepHistoryList;
				else if (tab === 'bodybattery') rawList = this.bodyBatteryHistoryList;
				else if (tab === 'stress') rawList = this.stressHistoryList;
				else if (tab === 'spo2') rawList = this.spo2HistoryList;

				if (!rawList || rawList.length === 0) return [];

				// 取最近 N 天
				const sliceList = rawList.slice(0, this.historyPeriod);
				// 翻转为升序显示在柱状图上
				const sorted = [...sliceList].reverse();

				let maxVal = 0;
				const items = sorted.map(item => {
					let val = 0;
					let dStr = item.calendarDate || item.date || '';
					if (tab === 'steps') val = parseInt(item.totalSteps) || 0;
					else if (tab === 'heartrate') val = parseInt(item.restingHeartRate) || parseInt(item.maxHeartRate) || 0;
					else if (tab === 'sleep') val = parseInt(item.sleep_score_overall) || 0;
					else if (tab === 'bodybattery') val = parseInt(item.charged) || 0;
					else if (tab === 'stress') val = parseInt(item.avgStressLevel) || 0;
					else if (tab === 'spo2') val = parseFloat(item.averageSpO2) || 0;

					if (val > maxVal) maxVal = val;

					// 格式化日期标签
					let dateLabel = '--';
					if (dStr) {
						const parts = dStr.split(' ')[0].split('-');
						if (parts.length >= 3) {
							dateLabel = `${parts[1]}/${parts[2]}`;
						} else {
							dateLabel = dStr.slice(-5);
						}
					}

					return {
						dateLabel,
						val,
						valueText: val > 0 ? (tab === 'spo2' ? val.toFixed(0) + '%' : String(val)) : '--'
					};
				});

				if (maxVal === 0) maxVal = 100;

				return items.map(item => {
					const heightPercent = item.val > 0 ? Math.max(Math.round((item.val / maxVal) * 85), 12) : 6;
					const isPeak = item.val > 0 && item.val === maxVal;
					return {
						...item,
						heightPercent,
						isPeak
					};
				});
			},

			// 历史详细记录列表明细（按时间降序从新到旧展示）
			currentHistoryRecords() {
				const tab = this.activeMetricTab;
				let rawList = [];
				if (tab === 'steps') rawList = this.stepsHistoryList;
				else if (tab === 'heartrate') rawList = this.heartRateHistoryList;
				else if (tab === 'sleep') rawList = this.sleepHistoryList;
				else if (tab === 'bodybattery') rawList = this.bodyBatteryHistoryList;
				else if (tab === 'stress') rawList = this.stressHistoryList;
				else if (tab === 'spo2') rawList = this.spo2HistoryList;

				if (!rawList || rawList.length === 0) return [];

				const sliceList = rawList.slice(0, this.historyPeriod);
				return sliceList.map(item => {
					const dateStr = this.formatFullDate(item.calendarDate || item.date);
					let statusBadge = { text: '正常', cls: 'badge-green' };
					let metrics = [];

					if (tab === 'steps') {
						const s = parseInt(item.totalSteps) || 0;
						const goal = parseInt(item.stepGoal) || 7000;
						const dist = item.totalDistance ? (parseFloat(item.totalDistance) / 1000).toFixed(1) : '--';
						if (s >= goal) statusBadge = { text: '达标', cls: 'badge-green' };
						else if (s >= goal * 0.7) statusBadge = { text: '接近', cls: 'badge-blue' };
						else statusBadge = { text: '不足', cls: 'badge-yellow' };
						metrics = [
							{ label: '运动步数', value: s, unit: '步', color: '#ff7a00' },
							{ label: '步行距离', value: dist, unit: '公里', color: '#333' },
							{ label: '目标步数', value: goal, unit: '步', color: '#888' }
						];
					} else if (tab === 'heartrate') {
						const r = parseInt(item.restingHeartRate) || '--';
						const mn = parseInt(item.minHeartRate) || '--';
						const mx = parseInt(item.maxHeartRate) || '--';
						if (r !== '--') {
							if (r < 60) statusBadge = { text: '偏慢', cls: 'badge-blue' };
							else if (r <= 80) statusBadge = { text: '良好', cls: 'badge-green' };
							else if (r <= 100) statusBadge = { text: '偏快', cls: 'badge-yellow' };
							else statusBadge = { text: '过快', cls: 'badge-red' };
						}
						metrics = [
							{ label: '静息心率', value: r, unit: 'bpm', color: '#a18cd1' },
							{ label: '最低心率', value: mn, unit: 'bpm', color: '#333' },
							{ label: '最高心率', value: mx, unit: 'bpm', color: '#333' }
						];
					} else if (tab === 'sleep') {
						const sc = parseInt(item.sleep_score_overall) || '--';
						if (sc !== '--') {
							if (sc >= 80) statusBadge = { text: '优质', cls: 'badge-green' };
							else if (sc >= 60) statusBadge = { text: '良好', cls: 'badge-blue' };
							else statusBadge = { text: '较差', cls: 'badge-yellow' };
						}
						metrics = [
							{ label: '睡眠得分', value: sc, unit: '分', color: '#1976d2' },
							{ label: '睡眠时长', value: item.sleepTimeSeconds || '--', unit: '', color: '#333' },
							{ label: '睡眠压力', value: item.avgSleepStress || '--', unit: '', color: '#888' }
						];
					} else if (tab === 'bodybattery') {
						const c = parseInt(item.charged) || 0;
						const d = parseInt(item.drained) || 0;
						const bal = c - d;
						if (bal >= 10) statusBadge = { text: '充盈', cls: 'badge-green' };
						else if (bal >= -10) statusBadge = { text: '均衡', cls: 'badge-blue' };
						else statusBadge = { text: '亏损', cls: 'badge-yellow' };
						metrics = [
							{ label: '充能值', value: '+' + c, unit: '', color: '#388e3c' },
							{ label: '耗能值', value: '-' + d, unit: '', color: '#d32f2f' },
							{ label: '净储能', value: (bal >= 0 ? '+' : '') + bal, unit: '', color: '#333' }
						];
					} else if (tab === 'stress') {
						const avg = parseInt(item.avgStressLevel) || '--';
						const mx = parseInt(item.maxStressLevel) || '--';
						if (avg !== '--') {
							if (avg < 26) statusBadge = { text: '平静', cls: 'badge-green' };
							else if (avg < 51) statusBadge = { text: '低压', cls: 'badge-blue' };
							else if (avg < 76) statusBadge = { text: '中压', cls: 'badge-yellow' };
							else statusBadge = { text: '高压', cls: 'badge-red' };
						}
						metrics = [
							{ label: '平均压力', value: avg, unit: '分', color: '#d4a017' },
							{ label: '峰值压力', value: mx, unit: '分', color: '#333' },
							{ label: '等级', value: statusBadge.text, unit: '', color: '#888' }
						];
					} else {
						// spo2
						const a = item.averageSpO2 ? (parseFloat(item.averageSpO2).toFixed(1) + '%') : '--';
						const mn = item.lowestSpO2 ? (parseFloat(item.lowestSpO2).toFixed(1) + '%') : '--';
						const sl = item.avgSleepSpO2 ? (parseFloat(item.avgSleepSpO2).toFixed(1) + '%') : '--';
						if (item.averageSpO2) {
							const val = parseFloat(item.averageSpO2);
							if (val >= 97) statusBadge = { text: '优秀', cls: 'badge-green' };
							else if (val >= 95) statusBadge = { text: '正常', cls: 'badge-blue' };
							else statusBadge = { text: '偏低', cls: 'badge-yellow' };
						}
						metrics = [
							{ label: '平均血氧', value: a, unit: '', color: '#ff5277' },
							{ label: '最低血氧', value: mn, unit: '', color: '#333' },
							{ label: '睡眠血氧', value: sl, unit: '', color: '#888' }
						];
					}

					return {
						dateStr,
						statusBadge,
						metrics
					};
				});
			}
		},

		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('bracelet.navTitle') || '手环数据'
			});
		},

		onLoad() {
			this.fetchGarminBinding();
			this.fetchHeartRateData();
			this.fetchSleepData();
			this.fetchStepsData();
			this.fetchBodyEnergyData();
			this.fetchStressData();
			this.fetchSpO2Data();
		},

		methods: {
			// 查询当前 Garmin 绑定信息
			fetchGarminBinding() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/garminDataProcess/getBinding`, {
					header: { Authorization: token }
				}).then((res) => {
					if (res && res.code === 200 && res.result) {
						this.isGarminBound = !!res.result.isBound;
						this.boundEmail = res.result.email || '';
						if (this.isGarminBound && !this.garminEmail) {
							this.garminEmail = this.boundEmail;
						}
					}
				}).catch((err) => {
					console.error('获取Garmin绑定状态失败:', err);
				});
			},

			// 打开绑定弹窗
			openBindModal() {
				this.fetchGarminBinding();
				if (this.isGarminBound) {
					this.garminEmail = this.boundEmail;
					this.garminPassword = '';
				}
				this.showBindModal = true;
			},

			// 关闭绑定弹窗
			closeBindModal() {
				this.showBindModal = false;
			},

			// 提交绑定
			handleBindGarmin() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({ title: '请先登录', icon: 'none' });
					return;
				}
				if (!this.garminEmail || !this.garminEmail.trim()) {
					uni.showToast({ title: '请输入 Garmin 账号邮箱', icon: 'none' });
					return;
				}
				if (!this.garminPassword || !this.garminPassword.trim()) {
					uni.showToast({ title: '请输入 Garmin 账号密码', icon: 'none' });
					return;
				}

				this.isSubmittingBind = true;
				http.post(`${config.baseUrl}/garminDataProcess/bindGarmin`, {
					email: this.garminEmail.trim(),
					password: this.garminPassword.trim()
				}, {
					header: { Authorization: token }
				}).then((res) => {
					if (res && (res.code === 200 || res.success)) {
						uni.showToast({ title: '绑定成功！', icon: 'success' });
						this.isGarminBound = true;
						this.boundEmail = this.garminEmail.trim();
						this.garminPassword = '';
						this.showBindModal = false;
						// 提示用户是否立即更新数据
						setTimeout(() => {
							uni.showModal({
								title: '绑定成功',
								content: '已成功对接到数据库！是否立即同步拉取当前 Garmin 账号的健康生理数据？',
								confirmText: '立即同步',
								cancelText: '稍后再说',
								success: (modalRes) => {
									if (modalRes.confirm) {
										this.handleUpdate();
									}
								}
							});
						}, 600);
					} else {
						uni.showToast({ title: (res && res.message) || '绑定失败，请重试', icon: 'none' });
					}
				}).catch((err) => {
					console.error('绑定请求异常:', err);
					uni.showToast({ title: '网络异常，绑定失败', icon: 'none' });
				}).finally(() => {
					this.isSubmittingBind = false;
				});
			},

			// 解除绑定
			handleUnbindGarmin() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				uni.showModal({
					title: '确认解除绑定',
					content: '解绑后将无法自动同步该 Garmin 账号的手环健康数据，确定要解除绑定吗？',
					confirmText: '确定解绑',
					confirmColor: '#e53935',
					cancelText: '取消',
					success: (modalRes) => {
						if (modalRes.confirm) {
							http.post(`${config.baseUrl}/garminDataProcess/unbindGarmin`, {}, {
								header: { Authorization: token }
							}).then((res) => {
								if (res && (res.code === 200 || res.success)) {
									uni.showToast({ title: '已成功解除绑定', icon: 'success' });
									this.isGarminBound = false;
									this.boundEmail = '';
									this.garminEmail = '';
									this.garminPassword = '';
									this.showBindModal = false;
								} else {
									uni.showToast({ title: (res && res.message) || '解绑失败', icon: 'none' });
								}
							}).catch((err) => {
								uni.showToast({ title: '请求失败', icon: 'none' });
							});
						}
					}
				});
			},

			// 点击更新数据按钮
			handleUpdate() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({ title: '请先登录', icon: 'none' });
					uni.navigateTo({ url: '/pages/login/login' });
					return;
				}

				this.isUpdating = true;
				uni.showLoading({ title: '正在拉取Garmin数据...', mask: true });

				http.post(`${config.baseUrl}/garminDataProcess/updateByUserName`, {}, {
					header: { Authorization: token }
				}).then((res) => {
					uni.hideLoading();
					let data = res.data || res;
					let isSuccess = data.success !== undefined ? data.success : (data.code === 200);
					let message = data.message || '操作完成';

					if (isSuccess) {
						uni.showToast({ title: '数据同步成功！', icon: 'success' });
						// 刷新所有 6 项生理数据
						this.fetchHeartRateData();
						this.fetchSleepData();
						this.fetchStepsData();
						this.fetchBodyEnergyData();
						this.fetchStressData();
						this.fetchSpO2Data();
						if (this.showHistoryModal) {
							this.fetchAllHistoryData();
						}
					} else {
						uni.showToast({ title: message || '同步失败，请检查账号', icon: 'none', duration: 2500 });
					}
				}).catch((err) => {
					uni.hideLoading();
					console.error('更新失败:', err);
					uni.showToast({ title: '更新失败，请稍后重试', icon: 'none' });
				}).finally(() => {
					this.isUpdating = false;
				});
			},

			// 从历史弹窗空状态直接触发更新
			handleUpdateFromHistory() {
				this.closeHistoryModal();
				this.handleUpdate();
			},

			// 打开历史数据弹窗
			openHistoryModal() {
				this.showHistoryModal = true;
				this.selectedBarIndex = null;
				this.fetchAllHistoryData();
			},

			// 带有特定指标直接打开历史数据
			openHistoryWithMetric(metricTab) {
				this.activeMetricTab = metricTab;
				this.openHistoryModal();
			},

			// 关闭历史数据弹窗
			closeHistoryModal() {
				this.showHistoryModal = false;
			},

			// 切换周期
			switchPeriod(period) {
				this.historyPeriod = period;
				this.selectedBarIndex = null;
			},

			// 切换指标
			switchMetricTab(tab) {
				this.activeMetricTab = tab;
				this.selectedBarIndex = null;
			},

			// 选中某个柱体
			selectBar(index) {
				this.selectedBarIndex = index;
			},

			// 获取全部 6 项历史数据
			fetchAllHistoryData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				this.isLoadingHistory = true;
				const header = { Authorization: token };

				// 并发请求 6 个历史数据接口（拉取 30 天周期以备灵活切换）
				Promise.all([
					http.get(`${config.baseUrl}/healthInfo/getStepsHistory?period=30`, { header }),
					http.get(`${config.baseUrl}/healthInfo/getHeartrateHistory?period=30`, { header }),
					http.get(`${config.baseUrl}/healthInfo/getSleepHistory?period=30`, { header }),
					http.get(`${config.baseUrl}/healthInfo/getBodyBatteryHistory?period=30`, { header }),
					http.get(`${config.baseUrl}/healthInfo/getStressHistory?period=30`, { header }),
					http.get(`${config.baseUrl}/healthInfo/getSpO2History?period=30`, { header })
				]).then(([stepsRes, hrRes, sleepRes, bbRes, stressRes, spo2Res]) => {
					if (stepsRes && stepsRes.code === 200 && Array.isArray(stepsRes.result)) {
						this.stepsHistoryList = stepsRes.result;
					}
					if (hrRes && hrRes.code === 200 && Array.isArray(hrRes.result)) {
						this.heartRateHistoryList = hrRes.result;
					}
					if (sleepRes && sleepRes.code === 200 && Array.isArray(sleepRes.result)) {
						this.sleepHistoryList = sleepRes.result;
					}
					if (bbRes && bbRes.code === 200 && Array.isArray(bbRes.result)) {
						this.bodyBatteryHistoryList = bbRes.result;
					}
					if (stressRes && stressRes.code === 200 && Array.isArray(stressRes.result)) {
						this.stressHistoryList = stressRes.result;
					}
					if (spo2Res && spo2Res.code === 200 && Array.isArray(spo2Res.result)) {
						this.spo2HistoryList = spo2Res.result;
					}
				}).catch((err) => {
					console.error('拉取历史数据失败:', err);
				}).finally(() => {
					this.isLoadingHistory = false;
				});
			},

			// 获取心率数据
			fetchHeartRateData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayHeartrate`, {
					headers: { Authorization: token }
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result !== null) {
						this.maxHeartRate = res.result.maxHeartRate || '--';
						this.minHeartRate = res.result.minHeartRate || '--';
						this.restingHeartRate = res.result.restingHeartRate || '--';
						this.calendarDate = this.formatDate(res.result.calendarDate);
					} else {
						this.maxHeartRate = this.minHeartRate = this.restingHeartRate = '暂无数据';
						this.calendarDate = '--';
					}
				}).catch((err) => {
					console.error('请求心率失败:', err);
				});
			},

			// 获取睡眠数据
			fetchSleepData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySleep`, {
					headers: { Authorization: token }
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result !== null) {
						this.sleep_score_overall = res.result.sleep_score_overall || '--';
						this.sleepTimeSeconds = res.result.sleepTimeSeconds || '--';
						this.awakeSleepSeconds = res.result.awakeSleepSeconds || '--';
						this.avgSleepStress = res.result.avgSleepStress || '--';
					} else {
						this.sleep_score_overall = this.sleepTimeSeconds = this.awakeSleepSeconds = this.avgSleepStress = '暂无数据';
					}
				}).catch((err) => {
					console.error('请求睡眠数据失败:', err);
				});
			},

			// 获取运动数据
			fetchStepsData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySteps`, {
					headers: { Authorization: token }
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result !== null) {
						this.totalSteps = res.result.totalSteps || '--';
						this.totalDistance = res.result.totalDistance || '--';
						this.stepGoal = res.result.stepGoal || '--';
					} else {
						this.totalSteps = this.totalDistance = this.stepGoal = '暂无数据';
					}
				}).catch((err) => {
					console.error('请求运动数据失败:', err);
				});
			},

			// 获取身体电量数据
			fetchBodyEnergyData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayBodyBattery`, {
					headers: { Authorization: token }
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result !== null) {
						this.charged = res.result.charged || '--';
						this.drained = res.result.drained || '--';
						this.date = this.formatDate(res.result.date);
					} else {
						this.charged = this.drained = '暂无数据';
						this.date = this.formatDate(new Date());
					}
				}).catch((err) => {
					console.error('请求身体电量失败:', err);
				});
			},

			// 获取压力数据
			fetchStressData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayStress`, {
					headers: { Authorization: token }
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result !== null) {
						this.maxStressLevel = res.result.maxStressLevel || '--';
						this.avgStressLevel = res.result.avgStressLevel || '--';
					} else {
						this.maxStressLevel = this.avgStressLevel = '暂无数据';
					}
				}).catch((err) => {
					console.error('请求压力失败:', err);
				});
			},

			// 获取血氧数据
			fetchSpO2Data() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySpO2`, {
					headers: { Authorization: token }
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result !== null) {
						this.averageSpO2 = res.result.averageSpO2 || '--';
						this.lowestSpO2 = res.result.lowestSpO2 || '--';
						this.avgSleepSpO2 = res.result.avgSleepSpO2 || '--';
					} else {
						this.averageSpO2 = this.lowestSpO2 = this.avgSleepSpO2 = '暂无数据';
					}
				}).catch((err) => {
					console.error('请求血氧失败:', err);
				});
			},

			// 格式化日期：10月10日
			formatDate(dateStr) {
				if (!dateStr || dateStr === '--') return '--';
				try {
					const date = new Date(dateStr);
					if (isNaN(date.getTime())) return dateStr;
					return `${date.getMonth() + 1}月${date.getDate()}日`;
				} catch (e) {
					return dateStr;
				}
			},

			// 格式化完整日期：2026年10月10日
			formatFullDate(dateStr) {
				if (!dateStr || dateStr === '--') return '--';
				try {
					const date = new Date(dateStr);
					if (isNaN(date.getTime())) return dateStr;
					return `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日`;
				} catch (e) {
					return dateStr;
				}
			}
		}
	}
</script>

<style>
	.container {
		padding: 20rpx;
	}

	.card-row {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}

	/* 更新按钮区域 */
	.update-section {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 24rpx;
		width: 100%;
		gap: 16rpx;
	}

	/* 绑定账号按钮 */
	.garmin-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		background: linear-gradient(135deg, #0078D7 0%, #00BCF2 100%);
		color: #ffffff;
		padding: 14rpx 24rpx;
		border-radius: 30rpx;
		font-size: 26rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 12rpx rgba(0, 120, 215, 0.35);
		transition: all 0.2s ease;
		margin: 0;
	}

	.garmin-btn.is-bound {
		background: linear-gradient(135deg, #0288d1 0%, #26c6da 100%);
	}

	.garmin-btn:active {
		transform: scale(0.96);
		opacity: 0.9;
	}

	.garmin-icon {
		margin-right: 8rpx;
		font-size: 28rpx;
	}

	.garmin-text {
		font-size: 26rpx;
	}

	/* 更新数据按钮 */
	.update-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #90e6dc;
		color: #263238;
		padding: 14rpx 26rpx;
		border-radius: 30rpx;
		font-size: 26rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 10rpx rgba(0, 0, 0, 0.15);
		transition: all 0.2s ease;
		margin: 0;
	}

	.update-btn:active {
		transform: scale(0.96);
		opacity: 0.9;
	}

	.update-icon {
		margin-right: 8rpx;
		font-size: 28rpx;
	}

	.update-text {
		font-size: 26rpx;
	}

	/* 历史数据按钮 */
	.report-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
		color: #ffffff;
		padding: 14rpx 26rpx;
		border-radius: 30rpx;
		font-size: 26rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 12rpx rgba(17, 153, 142, 0.35);
		transition: all 0.2s ease;
		margin: 0;
	}

	.report-btn:active {
		transform: scale(0.96);
		opacity: 0.9;
	}

	.report-icon {
		margin-right: 8rpx;
		font-size: 28rpx;
	}

	.report-text {
		font-size: 26rpx;
	}

	/* 统一卡片基础样式 */
	.heart-rate-card,
	.sleep-card,
	.steps-card,
	.body-energy-card,
	.stress-card,
	.spo2-card {
		width: 48%;
		height: 380rpx;
		border-radius: 20rpx;
		margin-bottom: 22rpx;
		padding: 24rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		transition: transform 0.2s ease;
	}

	.heart-rate-card:active,
	.sleep-card:active,
	.steps-card:active,
	.body-energy-card:active,
	.stress-card:active,
	.spo2-card:active {
		transform: scale(0.98);
	}

	/* 昨日心率卡片 */
	.heart-rate-card {
		background-color: #faf2fe;
		border: 1rpx solid #e1bee7;
		box-shadow: 0 4rpx 12rpx rgba(161, 140, 209, 0.15);
	}

	.heart-rate-card .data-label {
		font-size: 34rpx;
		font-weight: bold;
		color: #a18cd1;
	}

	.heart-rate-card .value-number {
		color: #a18cd1;
		font-weight: bold;
	}

	/* 睡眠卡片 */
	.sleep-card {
		background-color: #f0f7ff;
		border: 1rpx solid #bed6ff;
		box-shadow: 0 4rpx 12rpx rgba(41, 128, 255, 0.15);
	}

	.sleep-card .data-label {
		font-size: 34rpx;
		font-weight: bold;
		color: #1976d2;
	}

	.sleep-card .value-number {
		color: #2980b9;
		font-weight: bold;
	}

	/* 运动卡片 */
	.steps-card {
		background-color: #fff8f0;
		border: 1rpx solid #ffd9b3;
		box-shadow: 0 4rpx 12rpx rgba(255, 123, 0, 0.15);
	}

	.steps-card .data-label {
		font-size: 34rpx;
		font-weight: bold;
		color: #ff7a00;
	}

	.steps-card .value-number {
		color: #ff7a00;
		font-weight: bold;
	}

	/* 身体电量卡片 */
	.body-energy-card {
		background-color: #e8f5e9;
		border: 1rpx solid #a5d6a7;
		box-shadow: 0 4rpx 12rpx rgba(102, 187, 106, 0.15);
	}

	.body-energy-card .data-label {
		font-size: 34rpx;
		font-weight: bold;
		color: #388e3c;
	}

	.body-energy-card .value-number {
		color: #388e3c;
		font-weight: bold;
	}

	.energy-item {
		display: flex;
		flex-direction: column;
		gap: 2rpx;
	}

	.energy-note {
		font-size: 22rpx;
		color: #757575;
		line-height: 1.2;
	}

	/* 压力卡片 */
	.stress-card {
		background-color: #f9f0d1;
		border: 1rpx solid #e6c872;
		box-shadow: 0 4rpx 12rpx rgba(230, 200, 114, 0.15);
	}

	.stress-card .data-label {
		font-size: 34rpx;
		font-weight: bold;
		color: #d4a017;
	}

	.stress-card .value-number {
		color: #d4a017;
		font-weight: bold;
	}

	.tips-text {
		font-size: 22rpx;
		color: #9e9e9e;
		margin-top: 4rpx;
		line-height: 1.3;
	}

	/* 血氧卡片 */
	.spo2-card {
		background-color: #fff5f7;
		border: 1rpx solid #ffccd5;
		box-shadow: 0 4rpx 12rpx rgba(255, 102, 130, 0.15);
	}

	.spo2-card .data-label {
		font-size: 34rpx;
		font-weight: bold;
		color: #ff6682;
	}

	.spo2-card .value-number {
		color: #ff5277;
		font-weight: bold;
	}

	/* 统一标题行与数据项 */
	.label-row {
		display: flex;
		align-items: center;
		margin-bottom: 20rpx;
		height: 52rpx;
	}

	.icon-heart, .icon-sleep, .icon-steps, .icon-energy, .icon-stress, .icon-spo2 {
		width: 48rpx;
		height: 48rpx;
		margin-right: 14rpx;
	}

	.data-items {
		display: flex;
		flex-direction: column;
		gap: 12rpx;
		width: 100%;
	}

	.data-value {
		font-size: 28rpx;
		color: #263238;
		font-weight: 500;
		line-height: 38rpx;
	}

	.space {
		display: inline-block;
		width: 8rpx;
	}

	.update-date {
		font-size: 26rpx;
		color: #999;
		margin-top: auto;
		line-height: 30rpx;
	}

	/* ===== 绑定账号弹窗 ===== */
	.bind-modal-mask {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.6);
		z-index: 9999;
		display: flex;
		align-items: center;
		justify-content: center;
		backdrop-filter: blur(4px);
	}

	.bind-modal-dialog {
		background: #ffffff;
		border-radius: 32rpx;
		width: 88vw;
		padding: 40rpx 36rpx;
		box-sizing: border-box;
		box-shadow: 0 20rpx 60rpx rgba(0, 0, 0, 0.3);
		animation: modalFadeIn 0.25s ease-out;
	}

	@keyframes modalFadeIn {
		from { opacity: 0; transform: scale(0.92); }
		to { opacity: 1; transform: scale(1); }
	}

	.bind-modal-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 28rpx;
	}

	.bind-header-title-row {
		display: flex;
		align-items: center;
		gap: 12rpx;
	}

	.bind-header-icon {
		font-size: 38rpx;
	}

	.bind-header-title {
		font-size: 36rpx;
		font-weight: bold;
		color: #1a202c;
	}

	.bind-close-btn {
		width: 52rpx;
		height: 52rpx;
		background: #f1f5f9;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.bind-close-icon {
		font-size: 26rpx;
		color: #64748b;
	}

	.bind-status-banner {
		display: flex;
		align-items: center;
		padding: 16rpx 22rpx;
		border-radius: 16rpx;
		margin-bottom: 30rpx;
	}

	.status-bound {
		background: #ecfdf5;
		border: 1rpx solid #a7f3d0;
	}

	.status-unbound {
		background: #fff7ed;
		border: 1rpx solid #fed7aa;
	}

	.status-dot {
		width: 16rpx;
		height: 16rpx;
		border-radius: 50%;
		margin-right: 14rpx;
	}

	.status-bound .status-dot { background: #10b981; }
	.status-unbound .status-dot { background: #f97316; }

	.status-text {
		font-size: 26rpx;
		color: #334155;
		font-weight: 500;
	}

	.bind-form {
		display: flex;
		flex-direction: column;
		gap: 24rpx;
		margin-bottom: 36rpx;
	}

	.form-item {
		display: flex;
		flex-direction: column;
		gap: 10rpx;
	}

	.form-label {
		font-size: 28rpx;
		font-weight: 600;
		color: #334155;
	}

	.input-wrap {
		position: relative;
		display: flex;
		align-items: center;
		background: #f8fafc;
		border: 1.5rpx solid #cbd5e1;
		border-radius: 18rpx;
		padding: 0 24rpx;
		height: 84rpx;
	}

	.form-input {
		flex: 1;
		font-size: 28rpx;
		color: #1e293b;
	}

	.clear-icon, .eye-icon {
		font-size: 30rpx;
		color: #94a3b8;
		padding: 10rpx;
	}

	.bind-notice-box {
		display: flex;
		align-items: flex-start;
		gap: 12rpx;
		background: #f0fdfa;
		border: 1rpx solid #ccfbf1;
		border-radius: 16rpx;
		padding: 16rpx 20rpx;
	}

	.notice-icon {
		font-size: 30rpx;
		line-height: 1.3;
	}

	.notice-text {
		font-size: 22rpx;
		color: #0f766e;
		line-height: 1.5;
		flex: 1;
	}

	.bind-actions {
		display: flex;
		flex-direction: column;
		gap: 16rpx;
	}

	.btn-bind-submit {
		background: linear-gradient(135deg, #0078D7 0%, #00BCF2 100%);
		color: #ffffff;
		border-radius: 24rpx;
		font-size: 30rpx;
		font-weight: bold;
		height: 84rpx;
		line-height: 84rpx;
		box-shadow: 0 8rpx 20rpx rgba(0, 120, 215, 0.35);
	}

	.btn-bind-cancel {
		background: #fee2e2;
		color: #dc2626;
		border-radius: 24rpx;
		font-size: 28rpx;
		font-weight: 600;
		height: 76rpx;
		line-height: 76rpx;
	}

	.btn-bind-close {
		background: #f1f5f9;
		color: #475569;
		border-radius: 24rpx;
		font-size: 28rpx;
		font-weight: 500;
		height: 76rpx;
		line-height: 76rpx;
	}

	/* ===== 历史数据可视化弹窗 ===== */
	.history-modal-mask {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.65);
		z-index: 9999;
		display: flex;
		align-items: center;
		justify-content: center;
		backdrop-filter: blur(5px);
	}

	.history-modal-dialog {
		background: #f8fafc;
		border-radius: 36rpx;
		width: 94vw;
		height: 88vh;
		display: flex;
		flex-direction: column;
		overflow: hidden;
		box-shadow: 0 24rpx 64rpx rgba(0, 0, 0, 0.3);
		animation: modalFadeIn 0.25s ease-out;
	}

	.history-modal-header {
		background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
		padding: 30rpx 36rpx 24rpx;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.history-header-left {
		display: flex;
		align-items: center;
		gap: 16rpx;
	}

	.history-header-icon {
		font-size: 42rpx;
	}

	.history-title-wrap {
		display: flex;
		flex-direction: column;
	}

	.history-modal-title {
		color: #ffffff;
		font-size: 38rpx;
		font-weight: bold;
		letter-spacing: 1rpx;
	}

	.history-modal-sub {
		color: rgba(255, 255, 255, 0.85);
		font-size: 22rpx;
		margin-top: 4rpx;
	}

	.history-close-btn {
		width: 56rpx;
		height: 56rpx;
		background: rgba(255, 255, 255, 0.25);
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.history-close-icon {
		color: #ffffff;
		font-size: 28rpx;
	}

	/* 周期切换 Tab */
	.period-tabs-bar {
		display: flex;
		justify-content: center;
		background: #ffffff;
		padding: 16rpx 20rpx;
		gap: 20rpx;
		border-bottom: 1rpx solid #e2e8f0;
	}

	.period-tab {
		flex: 1;
		max-width: 220rpx;
		text-align: center;
		padding: 12rpx 0;
		border-radius: 20rpx;
		font-size: 26rpx;
		color: #64748b;
		background: #f1f5f9;
		font-weight: 500;
		transition: all 0.2s ease;
	}

	.period-tab.active {
		background: #11998e;
		color: #ffffff;
		font-weight: bold;
		box-shadow: 0 4rpx 12rpx rgba(17, 153, 142, 0.3);
	}

	/* 指标横向滚动栏 */
	.metric-tabs-scroll {
		background: #ffffff;
		white-space: nowrap;
		border-bottom: 1rpx solid #e2e8f0;
		padding: 14rpx 0;
	}

	.metric-tabs-track {
		display: inline-flex;
		padding: 0 20rpx;
		gap: 16rpx;
	}

	.metric-tab {
		display: inline-flex;
		align-items: center;
		gap: 8rpx;
		padding: 12rpx 24rpx;
		border-radius: 24rpx;
		background: #f8fafc;
		border: 1.5rpx solid #e2e8f0;
		transition: all 0.2s ease;
	}

	.metric-tab.active {
		background: #e6fcf5;
		border-color: #11998e;
		box-shadow: 0 2rpx 8rpx rgba(17, 153, 142, 0.2);
	}

	.metric-tab-icon {
		font-size: 28rpx;
	}

	.metric-tab-title {
		font-size: 26rpx;
		color: #475569;
		font-weight: 500;
	}

	.metric-tab.active .metric-tab-title {
		color: #0f766e;
		font-weight: bold;
	}

	/* 历史滚动内容区 */
	.history-scroll-content {
		flex: 1;
		height: 0;
		padding: 24rpx 24rpx 36rpx;
		box-sizing: border-box;
	}

	/* KPI 卡片 */
	.kpi-summary-card {
		background: #ffffff;
		border-radius: 24rpx;
		padding: 28rpx 20rpx;
		display: flex;
		justify-content: space-around;
		align-items: center;
		margin-bottom: 24rpx;
		box-shadow: 0 4rpx 16rpx rgba(0, 0, 0, 0.05);
	}

	.kpi-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		flex: 1;
		gap: 6rpx;
	}

	.kpi-label {
		font-size: 24rpx;
		color: #64748b;
	}

	.kpi-val-row {
		display: flex;
		align-items: baseline;
		gap: 4rpx;
	}

	.kpi-value {
		font-size: 38rpx;
		font-weight: bold;
		line-height: 1.1;
	}

	.kpi-unit {
		font-size: 22rpx;
		color: #94a3b8;
	}

	.kpi-divider {
		width: 1rpx;
		height: 50rpx;
		background: #e2e8f0;
	}

	/* 柱状走势图卡片 */
	.chart-visual-card {
		background: #ffffff;
		border-radius: 24rpx;
		padding: 26rpx 24rpx 20rpx;
		margin-bottom: 24rpx;
		box-shadow: 0 4rpx 16rpx rgba(0, 0, 0, 0.05);
	}

	.chart-card-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 24rpx;
	}

	.chart-header-left {
		display: flex;
		align-items: center;
		gap: 12rpx;
	}

	.chart-header-dot {
		width: 16rpx;
		height: 16rpx;
		border-radius: 50%;
	}

	.chart-header-title {
		font-size: 30rpx;
		font-weight: bold;
		color: #1e293b;
	}

	.chart-header-subtitle {
		font-size: 22rpx;
		color: #94a3b8;
	}

	.bar-chart-container {
		height: 260rpx;
		width: 100%;
		display: flex;
		align-items: flex-end;
		padding-top: 20rpx;
	}

	.bars-flex-wrap {
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: space-around;
		align-items: flex-end;
	}

	.bar-column-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		height: 100%;
		flex: 1;
		cursor: pointer;
	}

	.bar-top-value {
		font-size: 20rpx;
		color: #64748b;
		margin-bottom: 8rpx;
		white-space: nowrap;
	}

	.bar-track {
		flex: 1;
		width: 22rpx;
		background: #f1f5f9;
		border-radius: 12rpx;
		display: flex;
		align-items: flex-end;
		overflow: hidden;
	}

	.bar-fill {
		width: 100%;
		border-radius: 12rpx;
		transition: height 0.4s ease;
		position: relative;
	}

	.peak-dot {
		position: absolute;
		top: 4rpx;
		left: 50%;
		transform: translateX(-50%);
		width: 8rpx;
		height: 8rpx;
		border-radius: 50%;
		background: #ffffff;
	}

	.bar-date-label {
		font-size: 20rpx;
		color: #94a3b8;
		margin-top: 10rpx;
		white-space: nowrap;
	}

	.bar-column-item.active .bar-date-label {
		color: #11998e;
		font-weight: bold;
	}

	.chart-empty-placeholder {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 40rpx 0;
		gap: 12rpx;
	}

	.chart-empty-icon {
		font-size: 48rpx;
	}

	.chart-empty-text {
		font-size: 26rpx;
		color: #94a3b8;
	}

	/* 历史明细记录 */
	.history-list-section {
		display: flex;
		flex-direction: column;
		gap: 18rpx;
	}

	.list-section-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 4rpx;
	}

	.list-section-title {
		font-size: 30rpx;
		font-weight: bold;
		color: #1e293b;
	}

	.list-section-count {
		font-size: 24rpx;
		color: #94a3b8;
	}

	.history-record-cards {
		display: flex;
		flex-direction: column;
		gap: 16rpx;
	}

	.history-rec-card {
		background: #ffffff;
		border-radius: 20rpx;
		padding: 22rpx 24rpx;
		box-shadow: 0 2rpx 10rpx rgba(0, 0, 0, 0.04);
		border: 1rpx solid #edf2f7;
	}

	.rec-card-top {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 16rpx;
	}

	.rec-date-pill {
		display: flex;
		align-items: center;
		gap: 8rpx;
	}

	.rec-cal-icon {
		font-size: 26rpx;
	}

	.rec-date-text {
		font-size: 28rpx;
		font-weight: 600;
		color: #334155;
	}

	.rec-status-badge {
		padding: 4rpx 16rpx;
		border-radius: 16rpx;
		font-size: 22rpx;
		font-weight: bold;
	}

	.badge-green { background: #dcfce7; color: #15803d; }
	.badge-blue { background: #e0f2fe; color: #0369a1; }
	.badge-yellow { background: #fef9c3; color: #a16207; }
	.badge-red { background: #fee2e2; color: #b91c1c; }

	.rec-grid-metrics {
		display: flex;
		justify-content: space-between;
		background: #f8fafc;
		border-radius: 14rpx;
		padding: 14rpx 18rpx;
	}

	.rec-metric-cell {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 4rpx;
		flex: 1;
	}

	.cell-label {
		font-size: 22rpx;
		color: #64748b;
	}

	.cell-val-row {
		display: flex;
		align-items: baseline;
		gap: 2rpx;
	}

	.cell-val {
		font-size: 28rpx;
		font-weight: bold;
	}

	.cell-unit {
		font-size: 20rpx;
		color: #94a3b8;
	}

	.history-empty-card {
		background: #ffffff;
		border-radius: 24rpx;
		padding: 48rpx 32rpx;
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center;
		gap: 14rpx;
	}

	.empty-icon {
		font-size: 64rpx;
	}

	.empty-title {
		font-size: 32rpx;
		font-weight: bold;
		color: #334155;
	}

	.empty-desc {
		font-size: 24rpx;
		color: #94a3b8;
		line-height: 1.5;
		margin-bottom: 12rpx;
	}

	.empty-sync-btn {
		background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
		color: #ffffff;
		border-radius: 24rpx;
		font-size: 28rpx;
		font-weight: bold;
		padding: 10rpx 40rpx;
	}

	.history-footer-note {
		margin-top: 24rpx;
		text-align: center;
	}

	.footer-note-text {
		font-size: 22rpx;
		color: #94a3b8;
	}
</style>
