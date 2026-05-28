<template>
	<view class="container">
		<!-- 更新按钮区域 -->
		<view class="update-section">
			<button class="garmin-btn" @click="openGarminApp">
				<text class="garmin-icon">📱</text>
				<text class="garmin-text">打开Garmin</text>
			</button>
			<button class="update-btn" @click="handleUpdate" :loading="isUpdating">
				<text class="update-icon">🔄</text>
				<text class="update-text">{{ isUpdating ? '更新中...' : '更新数据' }}</text>
			</button>
			<button class="report-btn" @click="openReport">
				<text class="report-icon">📊</text>
				<text class="report-text">数据报告</text>
			</button>
		</view>

		<!-- 心率与睡眠卡片的横向排列容器 -->
		<view class="card-row">
			<!-- 昨日心率卡片 -->
			<view class="heart-rate-card" @click="goToHeartrateHistory">
				<view class="label-row">
					<image class="icon-heart" src="/static/images/bracelet/xinlv.png" mode="aspectFit" />
					<text class="data-label">昨日心率</text>
				</view>
				<div class="data-items">
					<text class="data-value">最大心率 <span class="space"></span> <text class="value-number">
							{{ maxHeartRate }}
						</text>
						<span class="space"></span> <text v-if="maxHeartRate !== '暂无数据'"> 次/分钟</text>
					</text>
					<text class="data-value">最小心率 <span class="space"></span> <text
							class="value-number">{{ minHeartRate }}</text>
						<span class="space"></span> <text v-if="minHeartRate !== '暂无数据'"> 次/分钟</text>
					</text>
					<text class="data-value">静息心率 <span class="space"></span> <text
							class="value-number">{{ restingHeartRate }}</text>
						<span class="space"></span> <text v-if="restingHeartRate !== '暂无数据'"> 次/分钟</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} 数据</text>
			</view>
			<!-- 昨日睡眠卡片 -->
			<view class="sleep-card" style="margin-left: 4%" @click="goToSleepHistory">
				<view class="label-row">
					<image class="icon-sleep" src="/static/images/bracelet/shuimian.png" mode="aspectFit" />
					<text class="data-label">昨日睡眠</text>
				</view>
				<div class="data-items">
					<text class="data-value">睡眠得分 <span class="space"></span> <text
							class="value-number">{{ sleep_score_overall }}</text>
						<span class="space"></span> <text v-if="sleep_score_overall !== '暂无数据'"> 分</text></text>
					<text class="data-value">持续时间 <span class="space"></span> <text
							class="value-number">{{ sleepTimeSeconds !== null && sleepTimeSeconds !== undefined ? sleepTimeSeconds : '暂无数据' }}
						</text></text>
					<text class="data-value">清醒时间 <span class="space"></span> <text
							class="value-number">{{ awakeSleepSeconds !== null && awakeSleepSeconds !== undefined ? awakeSleepSeconds : '暂无数据' }}
						</text></text>
					<text class="data-value">睡眠压力 <span class="space"></span> <text
							class="value-number">{{ avgSleepStress !== null && avgSleepStress !== undefined ? avgSleepStress : '暂无数据' }}
						</text></text>
				</div>
				<text class="update-date">{{ calendarDate }} 数据</text>
			</view>
			<!-- 昨日步数卡片 -->
			<view class="steps-card" @click="goToStepsHistory">
				<view class="label-row">
					<image class="icon-steps" src="/static/images/bracelet/bushu.png" mode="aspectFit" />
					<text class="data-label">昨日运动</text>
				</view>
				<div class="data-items">
					<text class="data-value">运动步数 <span class="space"></span> <text
							class="value-number">{{ totalSteps }}</text>
						<span class="space"></span> <text v-if="totalSteps !== '暂无数据'"> 步</text>
					</text>
					<text class="data-value">行走距离 <span class="space"></span> <text
							class="value-number">{{ formattedDistance }}</text>
						<span class="space"></span> <text v-if="totalDistance !== '暂无数据'"> 公里</text>
					</text>
					<text class="data-value">目标步数 <span class="space"></span> <text
							class="value-number">{{ stepGoal }}</text>
						<span class="space"></span> <text v-if="stepGoal !== '暂无数据'"> 步</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} 数据</text>
			</view>
			<!-- 昨日身体电量卡片 -->
			<view class="body-energy-card" @click="goToBodyBatteryHistory">
				<view class="label-row">
					<image class="icon-energy" src="/static/images/bracelet/shentidianliang.png" mode="aspectFit" />
					<text class="data-label">昨日身体电量</text>
				</view>
				<view class="data-items">
					<!-- 充能项 -->
					<view class="energy-item">
						<text class="data-value">充能 <span class="space"></span> <text class="value-number"><template
									v-if="charged !== null && charged !== undefined">+ {{ charged }}</template>
								<template v-else>暂无数据</template></text></text>
						<text class="energy-note">身体恢复的能量值</text>
					</view>

					<!-- 耗能项 -->
					<view class="energy-item">
						<text class="data-value">耗能 <span class="space"></span> <text class="value-number"><template
									v-if="drained !== null && drained !== undefined">- {{ drained }}</template>
								<template v-else>暂无数据</template></text></text>
						<text class="energy-note">身体消耗的能量值</text>
					</view>
				</view>
				<text class="update-date">{{ date }} 数据</text>
			</view>
			<!-- 昨日压力卡片 -->
			<view class="stress-card" @click="goToStressHistory">
				<view class="label-row">
					<image class="icon-stress" src="/static/images/bracelet/yali.png" mode="aspectFit" />
					<text class="data-label">昨日压力</text>
				</view>
				<div class="data-items">
					<text class="data-value">最大压力 <span class="space"></span> <text
							class="value-number">{{ maxStressLevel !== null && maxStressLevel !== undefined ? maxStressLevel : '暂无数据' }}
						</text></text>
					<text class="data-value">平均压力 <span class="space"></span> <text
							class="value-number">{{ avgStressLevel !== null && avgStressLevel !== undefined ? avgStressLevel : '暂无数据' }}
						</text></text>
					<text class="tips-text">放松心情，压力是暂时的，放松是永恒的^^</text>
				</div>
				<text class="update-date">{{ calendarDate }} 数据</text>
			</view>
			<!-- 昨日血氧卡片 -->
			<view class="spo2-card" @click="goToSpO2History">
				<view class="label-row">
					<image class="icon-spo2" src="/static/images/bracelet/xueyang.png" mode="aspectFit" />
					<text class="data-label">昨日血氧</text>
				</view>
				<div class="data-items">
					<text class="data-value">平均SpO2 <span class="space"></span> <text
							class="value-number">{{ averageSpO2 }}
						</text>
						<span class="space"></span> <text v-if="averageSpO2 !== '暂无数据'"> %</text>
					</text>
					<text class="data-value">最低SpO2 <span class="space"></span> <text
							class="value-number">{{ lowestSpO2 }}</text>
						<span class="space"></span> <text v-if="lowestSpO2 !== '暂无数据'"> %</text>
					</text>
					<text class="data-value">睡眠期间 <span class="space"></span> <text
							class="value-number">{{ avgSleepSpO2 }}</text>
						<span class="space"></span> <text v-if="avgSleepSpO2 !== '暂无数据'"> %</text>
					</text>
				</div>
				<text class="update-date">{{ calendarDate }} 数据</text>
			</view>
		</view>

		<!-- 健康数据报告弹窗 -->
		<view v-if="showReport" class="report-mask" @click.self="closeReport">
			<view class="report-modal">
				<!-- 弹窗头部 -->
				<view class="report-header">
					<text class="report-title">昨日健康报告</text>
					<text class="report-subtitle">{{ calendarDate }}</text>
					<view class="close-btn" @click="closeReport">
						<text class="close-icon">✕</text>
					</view>
				</view>

				<!-- 滚动内容区域 -->
				<scroll-view scroll-y class="report-scroll">

					<!-- 心率卡片 -->
					<view class="rpt-card rpt-heart">
						<view class="rpt-card-header">
							<text class="rpt-card-icon">❤️</text>
							<text class="rpt-card-title">心率</text>
							<view :class="['rpt-status-tag', heartRateStatus.cls]">{{ heartRateStatus.label }}</view>
						</view>
						<view class="rpt-metrics">
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#a18cd1">{{ maxHeartRate }}</text>
								<text class="rpt-metric-label">最大心率</text>
								<text class="rpt-metric-unit">次/分</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#a18cd1">{{ minHeartRate }}</text>
								<text class="rpt-metric-label">最小心率</text>
								<text class="rpt-metric-unit">次/分</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#a18cd1">{{ restingHeartRate }}</text>
								<text class="rpt-metric-label">静息心率</text>
								<text class="rpt-metric-unit">次/分</text>
							</view>
						</view>
						<!-- 心率区间进度条 -->
						<view class="rpt-bar-wrap" v-if="restingHeartRate !== '--' && restingHeartRate !== '暂无数据'">
							<text class="rpt-bar-label">静息心率区间（40~100 次/分）</text>
							<view class="rpt-bar-track">
								<view class="rpt-bar-fill rpt-bar-purple" :style="{ width: heartRateBarWidth }"></view>
							</view>
						</view>
						<view class="rpt-advice" v-if="heartRateAdvice">
							<text class="rpt-advice-icon">💡</text>
							<text class="rpt-advice-text">{{ heartRateAdvice }}</text>
						</view>
					</view>

					<!-- 睡眠卡片 -->
					<view class="rpt-card rpt-sleep">
						<view class="rpt-card-header">
							<text class="rpt-card-icon">🌙</text>
							<text class="rpt-card-title">睡眠</text>
							<view :class="['rpt-status-tag', sleepStatus.cls]">{{ sleepStatus.label }}</view>
						</view>
						<view class="rpt-metrics">
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#1976d2">{{ sleep_score_overall }}</text>
								<text class="rpt-metric-label">睡眠得分</text>
								<text class="rpt-metric-unit">分</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#1976d2">{{ sleepTimeSeconds }}</text>
								<text class="rpt-metric-label">持续时间</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#1976d2">{{ awakeSleepSeconds }}</text>
								<text class="rpt-metric-label">清醒时间</text>
							</view>
						</view>
						<!-- 睡眠得分进度条 -->
						<view class="rpt-bar-wrap" v-if="sleep_score_overall !== '--' && sleep_score_overall !== '暂无数据'">
							<text class="rpt-bar-label">睡眠得分（满分100）</text>
							<view class="rpt-bar-track">
								<view class="rpt-bar-fill rpt-bar-blue" :style="{ width: sleepScoreBarWidth }"></view>
							</view>
							<view class="rpt-bar-ends">
								<text>0</text><text>100</text>
							</view>
						</view>
						<view class="rpt-advice" v-if="sleepAdvice">
							<text class="rpt-advice-icon">💡</text>
							<text class="rpt-advice-text">{{ sleepAdvice }}</text>
						</view>
					</view>

					<!-- 运动卡片 -->
					<view class="rpt-card rpt-steps">
						<view class="rpt-card-header">
							<text class="rpt-card-icon">🏃</text>
							<text class="rpt-card-title">运动</text>
							<view :class="['rpt-status-tag', stepsStatus.cls]">{{ stepsStatus.label }}</view>
						</view>
						<view class="rpt-metrics">
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#ff7a00">{{ totalSteps }}</text>
								<text class="rpt-metric-label">总步数</text>
								<text class="rpt-metric-unit">步</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#ff7a00">{{ formattedDistance }}</text>
								<text class="rpt-metric-label">行走距离</text>
								<text class="rpt-metric-unit">公里</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#ff7a00">{{ stepGoal }}</text>
								<text class="rpt-metric-label">目标步数</text>
								<text class="rpt-metric-unit">步</text>
							</view>
						</view>
						<!-- 步数目标进度条 -->
						<view class="rpt-bar-wrap" v-if="totalSteps !== '--' && totalSteps !== '暂无数据' && stepGoal !== '--' && stepGoal !== '暂无数据'">
							<text class="rpt-bar-label">目标达成率（{{ stepsGoalPercent }}%）</text>
							<view class="rpt-bar-track">
								<view class="rpt-bar-fill rpt-bar-orange" :style="{ width: stepsGoalBarWidth }"></view>
							</view>
							<view class="rpt-bar-ends">
								<text>0</text><text>{{ stepGoal }}步</text>
							</view>
						</view>
						<view class="rpt-advice" v-if="stepsAdvice">
							<text class="rpt-advice-icon">💡</text>
							<text class="rpt-advice-text">{{ stepsAdvice }}</text>
						</view>
					</view>

					<!-- 身体电量卡片 -->
					<view class="rpt-card rpt-energy">
						<view class="rpt-card-header">
							<text class="rpt-card-icon">⚡</text>
							<text class="rpt-card-title">身体电量</text>
						</view>
						<view class="rpt-metrics">
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#388e3c">+{{ charged !== '--' && charged !== '暂无数据' ? charged : '--' }}</text>
								<text class="rpt-metric-label">充能值</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#e53935">-{{ drained !== '--' && drained !== '暂无数据' ? drained : '--' }}</text>
								<text class="rpt-metric-label">耗能值</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" :style="{ color: energyBalance >= 0 ? '#388e3c' : '#e53935' }">
									{{ energyBalance >= 0 ? '+' : '' }}{{ energyBalance }}
								</text>
								<text class="rpt-metric-label">净盈余</text>
							</view>
						</view>
						<view class="rpt-advice" v-if="energyAdvice">
							<text class="rpt-advice-icon">💡</text>
							<text class="rpt-advice-text">{{ energyAdvice }}</text>
						</view>
					</view>

					<!-- 压力卡片 -->
					<view class="rpt-card rpt-stress">
						<view class="rpt-card-header">
							<text class="rpt-card-icon">🧘</text>
							<text class="rpt-card-title">压力</text>
							<view :class="['rpt-status-tag', stressStatus.cls]">{{ stressStatus.label }}</view>
						</view>
						<view class="rpt-metrics">
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#d4a017">{{ maxStressLevel !== null && maxStressLevel !== undefined ? maxStressLevel : '--' }}</text>
								<text class="rpt-metric-label">最大压力</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#d4a017">{{ avgStressLevel !== null && avgStressLevel !== undefined ? avgStressLevel : '--' }}</text>
								<text class="rpt-metric-label">平均压力</text>
							</view>
						</view>
						<!-- 压力进度条 -->
						<view class="rpt-bar-wrap" v-if="avgStressLevel !== '--' && avgStressLevel !== '暂无数据'">
							<text class="rpt-bar-label">平均压力水平（0~100）</text>
							<view class="rpt-bar-track">
								<view :class="['rpt-bar-fill', stressBarCls]" :style="{ width: stressBarWidth }"></view>
							</view>
							<view class="rpt-bar-ends">
								<text>低</text><text>高</text>
							</view>
						</view>
						<view class="rpt-advice" v-if="stressAdvice">
							<text class="rpt-advice-icon">💡</text>
							<text class="rpt-advice-text">{{ stressAdvice }}</text>
						</view>
					</view>

					<!-- 血氧卡片 -->
					<view class="rpt-card rpt-spo2">
						<view class="rpt-card-header">
							<text class="rpt-card-icon">🩸</text>
							<text class="rpt-card-title">血氧</text>
							<view :class="['rpt-status-tag', spo2Status.cls]">{{ spo2Status.label }}</view>
						</view>
						<view class="rpt-metrics">
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#ff5277">{{ averageSpO2 !== '--' ? averageSpO2 : '--' }}</text>
								<text class="rpt-metric-label">平均血氧</text>
								<text class="rpt-metric-unit">%</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#ff5277">{{ lowestSpO2 !== '--' ? lowestSpO2 : '--' }}</text>
								<text class="rpt-metric-label">最低血氧</text>
								<text class="rpt-metric-unit">%</text>
							</view>
							<view class="rpt-metric-item">
								<text class="rpt-metric-val" style="color:#ff5277">{{ avgSleepSpO2 !== '--' ? avgSleepSpO2 : '--' }}</text>
								<text class="rpt-metric-label">睡眠血氧</text>
								<text class="rpt-metric-unit">%</text>
							</view>
						</view>
						<!-- 血氧进度条 -->
						<view class="rpt-bar-wrap" v-if="averageSpO2 !== '--' && averageSpO2 !== '暂无数据'">
							<text class="rpt-bar-label">平均血氧饱和度（正常 ≥ 95%）</text>
							<view class="rpt-bar-track">
								<view :class="['rpt-bar-fill', spo2BarCls]" :style="{ width: spo2BarWidth }"></view>
							</view>
							<view class="rpt-bar-ends">
								<text>80%</text><text>100%</text>
							</view>
						</view>
						<view class="rpt-advice" v-if="spo2Advice">
							<text class="rpt-advice-icon">💡</text>
							<text class="rpt-advice-text">{{ spo2Advice }}</text>
						</view>
					</view>

					<!-- 底部注意事项 -->
					<view class="rpt-footer">
						<text class="rpt-footer-text">注意：以上数据仅供参考，不能替代专业医疗建议。如有异常，请及时咨询医生。</text>
					</view>

				</scroll-view>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js';
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
				// 新增睡眠数据
				sleep_score_overall: '--', // 睡眠得分
				sleepTimeSeconds: '--', // 持续时间  
				awakeSleepSeconds: '--', // 清醒时间
				avgSleepStress: '--', // 睡眠压力
				// 新增运动数据
				totalSteps: '--', // 运动步数
				totalDistance: '--', // 行走距离（米）
				stepGoal: '--', // 目标步数
				// 新增身体电量数据
				charged: '--', // 充能值
				drained: '--', // 耗能值
				date: '--', //日期
				// 压力数据
				maxStressLevel: '--',
				avgStressLevel: '--',
				// 新增血氧数据
				averageSpO2: '--',
				lowestSpO2: '--',
				avgSleepSpO2: '--',
				// 更新数据
				isUpdating: false,
				// 报告弹窗
				showReport: false

			};
		},
		onLoad() {
			this.fetchHeartRateData(); // 不再依赖 userId，获取心率数据
			this.fetchSleepData(); // 添加睡眠数据获取方法
			this.fetchStepsData(); // 新增运动数据获取
			this.fetchBodyEnergyData(); // 获取身体电量数据
			this.fetchStressData(); // 获取压力
			this.fetchSpO2Data(); // 添加血氧数据获取方法

		},
		computed: {
			// 格式化距离（米转公里）
			formattedDistance() {
				if (this.totalDistance === '--' || this.totalDistance === '暂无数据') {
					return this.totalDistance;
				}
				// 转换为公里并保留一位小数
				return (this.totalDistance / 1000).toFixed(1);
			},
			// 心率状态评估
			heartRateStatus() {
				const r = parseFloat(this.restingHeartRate);
				if (isNaN(r)) return { label: '暂无', cls: 'tag-gray' };
				if (r < 60) return { label: '偏低', cls: 'tag-blue' };
				if (r <= 80) return { label: '正常', cls: 'tag-green' };
				if (r <= 100) return { label: '偏高', cls: 'tag-yellow' };
				return { label: '过高', cls: 'tag-red' };
			},
			heartRateAdvice() {
				const r = parseFloat(this.restingHeartRate);
				if (isNaN(r)) return '';
				if (r < 60) return '静息心率偏低，若无症状属正常，建议保持规律锻炼。';
				if (r <= 80) return '心率状态良好，继续保持健康的生活习惯。';
				if (r <= 100) return '心率偏高，建议减少咖啡因摄入，注意休息和放松。';
				return '静息心率过高，建议尽快就医检查，排除心脏问题。';
			},
			heartRateBarWidth() {
				const r = parseFloat(this.restingHeartRate);
				if (isNaN(r)) return '0%';
				const pct = Math.min(Math.max((r - 40) / 60 * 100, 0), 100);
				return pct.toFixed(1) + '%';
			},
			// 睡眠状态评估
			sleepStatus() {
				const s = parseFloat(this.sleep_score_overall);
				if (isNaN(s)) return { label: '暂无', cls: 'tag-gray' };
				if (s >= 80) return { label: '优质', cls: 'tag-green' };
				if (s >= 60) return { label: '良好', cls: 'tag-blue' };
				if (s >= 40) return { label: '一般', cls: 'tag-yellow' };
				return { label: '较差', cls: 'tag-red' };
			},
			sleepAdvice() {
				const s = parseFloat(this.sleep_score_overall);
				if (isNaN(s)) return '';
				if (s >= 80) return '睡眠质量优秀，继续保持规律作息。';
				if (s >= 60) return '睡眠状况良好，建议保持固定入睡时间。';
				if (s >= 40) return '睡眠质量一般，尝试睡前避免使用手机，营造安静环境。';
				return '睡眠质量较差，建议睡前做冥想或深呼吸放松，避免睡前剧烈运动，必要时可咨询医生。';
			},
			sleepScoreBarWidth() {
				const s = parseFloat(this.sleep_score_overall);
				if (isNaN(s)) return '0%';
				return Math.min(s, 100).toFixed(1) + '%';
			},
			// 步数状态评估
			stepsStatus() {
				const steps = parseFloat(this.totalSteps);
				const goal = parseFloat(this.stepGoal);
				if (isNaN(steps) || isNaN(goal) || goal <= 0) return { label: '暂无', cls: 'tag-gray' };
				const pct = steps / goal;
				if (pct >= 1) return { label: '达标', cls: 'tag-green' };
				if (pct >= 0.7) return { label: '接近', cls: 'tag-blue' };
				if (pct >= 0.4) return { label: '一般', cls: 'tag-yellow' };
				return { label: '不足', cls: 'tag-red' };
			},
			stepsAdvice() {
				const steps = parseFloat(this.totalSteps);
				const goal = parseFloat(this.stepGoal);
				if (isNaN(steps) || isNaN(goal) || goal <= 0) return '';
				const pct = steps / goal;
				if (pct >= 1) return '太棒了！昨日步数已达标，坚持每天规律运动有助心血管健康。';
				if (pct >= 0.7) return '距目标很近了，今天可以多走走，争取完成步数目标。';
				if (pct >= 0.4) return '运动量偏少，建议利用碎片化时间多步行，如步行上下班、饭后散步等。';
				return '运动量明显不足，建议每天至少达到6000步，适当增加户外活动。';
			},
			stepsGoalPercent() {
				const steps = parseFloat(this.totalSteps);
				const goal = parseFloat(this.stepGoal);
				if (isNaN(steps) || isNaN(goal) || goal <= 0) return 0;
				return Math.min((steps / goal * 100).toFixed(0), 100);
			},
			stepsGoalBarWidth() {
				return this.stepsGoalPercent + '%';
			},
			// 身体电量净盈余
			energyBalance() {
				const c = parseFloat(this.charged);
				const d = parseFloat(this.drained);
				if (isNaN(c) || isNaN(d)) return '--';
				return c - d;
			},
			energyAdvice() {
				const balance = this.energyBalance;
				if (balance === '--') return '';
				if (balance >= 20) return '身体能量恢复良好，充能大于耗能，保持良好作息。';
				if (balance >= 0) return '身体电量基本平衡，注意劳逸结合。';
				if (balance >= -20) return '身体电量略有亏损，昨日活动较多，今天适当休息。';
				return '身体电量亏损较多，建议保证充足睡眠，避免过度疲劳。';
			},
			// 压力状态评估
			stressStatus() {
				const s = parseFloat(this.avgStressLevel);
				if (isNaN(s)) return { label: '暂无', cls: 'tag-gray' };
				if (s < 26) return { label: '平静', cls: 'tag-green' };
				if (s < 51) return { label: '低压', cls: 'tag-blue' };
				if (s < 76) return { label: '中压', cls: 'tag-yellow' };
				return { label: '高压', cls: 'tag-red' };
			},
			stressAdvice() {
				const s = parseFloat(this.avgStressLevel);
				if (isNaN(s)) return '';
				if (s < 26) return '压力水平很低，状态良好，继续保持轻松愉快的心情。';
				if (s < 51) return '压力处于低水平，保持规律作息和适当运动有助于维持。';
				if (s < 76) return '压力中等，建议尝试冥想、深呼吸或散步等放松方式缓解压力。';
				return '压力较高，建议减少工作负荷，进行腹式呼吸、渐进性肌肉放松等减压训练，必要时寻求心理支持。';
			},
			stressBarWidth() {
				const s = parseFloat(this.avgStressLevel);
				if (isNaN(s)) return '0%';
				return Math.min(s, 100).toFixed(1) + '%';
			},
			stressBarCls() {
				const s = parseFloat(this.avgStressLevel);
				if (isNaN(s)) return 'rpt-bar-yellow';
				if (s < 26) return 'rpt-bar-green';
				if (s < 51) return 'rpt-bar-blue';
				if (s < 76) return 'rpt-bar-yellow';
				return 'rpt-bar-red';
			},
			// 血氧状态评估
			spo2Status() {
				const v = parseFloat(this.averageSpO2);
				if (isNaN(v)) return { label: '暂无', cls: 'tag-gray' };
				if (v >= 97) return { label: '优秀', cls: 'tag-green' };
				if (v >= 95) return { label: '正常', cls: 'tag-blue' };
				if (v >= 90) return { label: '偏低', cls: 'tag-yellow' };
				return { label: '异常', cls: 'tag-red' };
			},
			spo2Advice() {
				const v = parseFloat(this.averageSpO2);
				if (isNaN(v)) return '';
				if (v >= 97) return '血氧饱和度优秀，肺部供氧状态极佳。';
				if (v >= 95) return '血氧正常，保持良好的呼吸习惯和适当有氧运动。';
				if (v >= 90) return '血氧偏低，注意保持通风环境，避免剧烈运动，建议多次测量确认。';
				return '血氧异常偏低，请及时就医检查，排除呼吸系统或心血管疾病。';
			},
			spo2BarWidth() {
				const v = parseFloat(this.averageSpO2);
				if (isNaN(v)) return '0%';
				const pct = Math.min(Math.max((v - 80) / 20 * 100, 0), 100);
				return pct.toFixed(1) + '%';
			},
			spo2BarCls() {
				const v = parseFloat(this.averageSpO2);
				if (isNaN(v)) return 'rpt-bar-red';
				if (v >= 95) return 'rpt-bar-pink';
				if (v >= 90) return 'rpt-bar-yellow';
				return 'rpt-bar-red';
			}
		},
		methods: {
			handleUpdate() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}

				this.isUpdating = true;
				console.log('即将发送请求，token：', token); // 发送前日志
				http.post(`${config.baseUrl}/garminDataProcess/updateByUserName`, {}, {
						header: {
							Authorization: token
						}
					})
					.then((res) => {
						console.log("更新结果：", res);

					// 	// 后端返回的数据（无弹窗）
					// 	let data = res.data || {};
					// 	let isSuccess = data.success !== undefined ? data.success : true;

					// 	if (isSuccess) {
					// 		console.log("更新成功，准备刷新心率数据");
					// 		this.fetchHeartRateData();
					// 	} else {
					// 		console.warn("更新失败：", data.message || "未知原因");
					// 	}
					// })
					// .catch((err) => {
					// 	console.error('更新请求异常:', err);
					// })
					
					// 后端返回的数据（成功有弹窗，失败没有弹窗）
					let data = res.data || {};
					let isSuccess = data.success !== undefined ? data.success : true;
					let message = data.message || '操作完成';
					
					// 仅在成功时显示提示
					if (isSuccess) {
					  uni.showToast({
					    title: '更新成功',
					    icon: 'none'
					  });
					  this.fetchHeartRateData();
					} else {
					  // 失败时不显示弹窗，仅在控制台输出
					  console.error('更新失败:', message);
					}
					})
					.catch((err) => {
					  // 捕获异常时不显示弹窗，仅在控制台输出错误
					  console.error('更新失败:', err);
					})

					// 	// 后端返回的数据（有弹窗）
					// 	let data = res.data || {};
					// 	let isSuccess = data.success !== undefined ? data.success : true;
					// 	let message = data.message || '操作完成';

					// 	uni.showToast({
					// 		title: isSuccess ? '更新成功' : `更新失败：${message}`,
					// 		icon: 'none'
					// 	});

					// 	if (isSuccess) {
					// 		this.fetchHeartRateData();
					// 	}
					// })
					// .catch((err) => {
					// 	console.error('更新失败:', err);
					// 	uni.showToast({
					// 		title: '更新失败，请稍后重试',
					// 		icon: 'none'
					// 	});
					// })

					// 	// 兼容后端可能的不同返回格式
					// 	let message = res.message || res.data || '更新成功' || '最新';
					// 	let isSuccess = res.success !== undefined ? res.success : true;

					// 	// 如果后端用statusCode判断状态
					// 	if (res.statusCode !== undefined) {
					// 		isSuccess = res.statusCode === 200 || res.statusCode === 0;
					// 	}

					// 	// uni.showToast({
					// 	// 	title: '更新成功', // 固定为更新成功
					// 	// 	icon: 'none'
					// 	// });

					// 	if (isSuccess) {
					// 		this.fetchHeartRateData();
					// 	}
					// })

					// .catch((err) => {
					// 	console.error('更新失败:', err);

					// 	// uni.showToast({
					// 	// 	title: '更新失败，请稍后重试',
					// 	// 	icon: 'none'
					// 	// });
					// })

					.finally(() => {
						this.isUpdating = false;
					});
			},
			// 修改fetchHeartRateData方法，传递user_name而非userId，获取心率数据
			fetchHeartRateData() {
				// 从本地存储获取token（user_name）
				const token = uni.getStorageSync('token');

				// 如果没有token，跳转到登录页
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}

				// 传递user_name而非userId
				http.get(`${config.baseUrl}/healthInfo/getCurrentDayHeartrate`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					console.log("心率结果：", res)
					if (res.code === 200 && typeof res.result === 'object') {
						this.maxHeartRate = res.result.maxHeartRate || '--'
						this.minHeartRate = res.result.minHeartRate || '--'
						this.restingHeartRate = res.result.restingHeartRate || '--'
						this.calendarDate = this.formatDate(res.result.calendarDate)
					} else {
						this.maxHeartRate = this.minHeartRate = this.restingHeartRate = '暂无数据'
						this.calendarDate = '--'
					}
				}).catch((err) => {
					console.error('请求失败:', err)
					uni.showToast({
						title: '加载失败',
						icon: 'none'
					})
				})
			},
			// 获取睡眠数据
			fetchSleepData() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySleep`, {
						headers: {
							Authorization: token
						}
					})
					.then((res) => {
						console.log("睡眠结果：", res);
						if (res.code === 200 && typeof res.result === 'object') {
							this.sleep_score_overall = res.result.sleep_score_overall || '--';
							this.sleepTimeSeconds = res.result.sleepTimeSeconds || '--';
							this.awakeSleepSeconds = res.result.awakeSleepSeconds || '--';
							this.avgSleepStress = res.result.avgSleepStress || '--';
						} else {
							this.sleep_score_overall = this.sleepTimeSeconds = this.awakeSleepSeconds = this
								.avgSleepStress = '暂无数据';
						}
					})
					.catch((err) => {
						console.error('请求睡眠数据失败:', err);
						uni.showToast({
							title: '加载失败',
							icon: 'none'
						});
					});
			},
			// 获取运动数据
			fetchStepsData() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySteps`, {
						params: {
							userName: token
						}
					})
					.then((res) => {
						console.log("运动结果：", res);
						if (res.code === 200 && typeof res.result === 'object') {
							this.totalSteps = res.result.totalSteps || '--';
							this.totalDistance = res.result.totalDistance || '--';
							this.stepGoal = res.result.stepGoal || '--';
						} else {
							this.totalSteps = this.totalDistance = this.stepGoal = '暂无数据';
						}
					})
					.catch((err) => {
						console.error('请求运动数据失败:', err);
						uni.showToast({
							title: '运动数据加载失败',
							icon: 'none'
						});
					});
			},
			// 获取身体电量数据
			fetchBodyEnergyData() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}
				http.get(`${config.baseUrl}/healthInfo/getCurrentDayBodyBattery`, {
						params: {
							userName: token
						}
					})
					.then((res) => {
						if (res.code === 200 && typeof res.result === 'object') {
							this.charged = res.result.charged || '--';
							this.drained = res.result.drained || '--';
							this.date = this.formatDate(res.result.date);
						} else {
							this.charged = this.drained = '暂无数据';
							this.date = this.formatDate(new Date());
						}
					})
					.catch((err) => {
						console.error('请求身体电量数据失败:', err);
						uni.showToast({
							title: '加载失败',
							icon: 'none'
						});
					});
			},
			// 获取压力数据
			fetchStressData() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayStress`, {
						params: {
							userName: token
						}
					})
					.then((res) => {
						console.log("压力结果：", res);
						if (res.code === 200 && typeof res.result === 'object') {
							this.maxStressLevel = res.result.maxStressLevel || '--';
							this.avgStressLevel = res.result.avgStressLevel || '--';
						} else {
							this.maxStressLevel = this.avgStressLevel = '暂无数据';
						}
					})
					.catch((err) => {
						console.error('请求压力数据失败:', err);
						uni.showToast({
							title: '加载失败',
							icon: 'none'
						});
					});
			},
			// 获取血氧数据
			fetchSpO2Data() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({
						title: '请先登录',
						icon: 'none'
					});
					uni.navigateTo({
						url: '/pages/login/login'
					});
					return;
				}

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySpO2`, {
						params: {
							userName: token
						}
					})
					.then((res) => {
						console.log("血氧结果：", res);
						if (res.code === 200 && typeof res.result === 'object') {
							this.averageSpO2 = res.result.averageSpO2 || '--';
							this.lowestSpO2 = res.result.lowestSpO2 || '--';
							this.avgSleepSpO2 = res.result.avgSleepSpO2 || '--';
						} else {
							this.averageSpO2 = this.lowestSpO2 = this.avgSleepSpO2 = '暂无数据';
						}
					})
					.catch((err) => {
						console.error('请求血氧数据失败:', err);
						uni.showToast({
							title: '加载失败',
							icon: 'none'
						});
					});
			},

			// 格式化日期
			formatDate(dateStr) {
				if (!dateStr) return '--';
				const date = new Date(dateStr);
				return `${date.getMonth() + 1}月${date.getDate()}日`;
			},

			//格式化睡眠时间（秒转小时:分钟）
			formatSleepTime(seconds) {
				if (seconds === '--' || !seconds) return '--';

				const hours = Math.floor(seconds / 3600);
				const minutes = Math.floor((seconds % 3600) / 60);

				return `${hours}小时${minutes}分钟`;
			},

			goToHeartrateHistory() {
				uni.navigateTo({
					url: '/pages/BraceletData/HeartRateChart' // 请确保路径正确并已创建该页面
				});
			},
			// 跳转到睡眠历史页面
			goToSleepHistory() {
				uni.navigateTo({
					url: '/pages/BraceletData/SleepChart' // 请确保路径正确并已创建该页面
				});
			},
			// 跳转到运动历史页面
			goToStepsHistory() {
				uni.navigateTo({
					url: '/pages/BraceletData/DailyStepsChart' // 请确保页面路径正确
				});
			},
			// 跳转到身体电量历史页面
			goToBodyBatteryHistory() {
				uni.navigateTo({
					url: '/pages/BraceletData/BodyEnergyChart'
				});
			},
			// 跳转到压力历史页面
			goToStressHistory() {
				uni.navigateTo({
					url: '/pages/BraceletData/StressChart'
				});
			},
			// 跳转到血氧历史页面
			goToSpO2History() {
				uni.navigateTo({
					url: '/pages/BraceletData/Sp02Chart' // 请确保路径正确并已创建该页面
				});
			},
			// 打开报告弹窗
			openReport() {
				this.showReport = true;
			},
			// 关闭报告弹窗
			closeReport() {
				this.showReport = false;
			},
			// 打开 Garmin Connect 应用（H5版本）
			openGarminApp() {
				// #ifdef H5
				// H5版本：直接弹出提示对话框
				uni.showModal({
					title: '提示',
					content: '请打开Garmin App 手环到首页的界面，准备同步数据...',
					showCancel: false,
					confirmText: '确定'
				});
				// #endif
				
				// #ifdef APP-PLUS
				// App环境：使用原生API
				const platform = uni.getSystemInfoSync().platform;
				if (platform === 'android') {
					plus.runtime.launchApplication(
						{ pname: 'com.garmin.android.apps.connectmobile' },
						function(e) {
							console.log('打开Garmin成功');
						},
						function(e) {
							uni.showModal({
								title: '提示',
								content: '未检测到 Garmin Connect 应用，是否前往下载？',
								success: (res) => {
									if (res.confirm) {
										plus.runtime.openURL('market://details?id=com.garmin.android.apps.connectmobile');
									}
								}
							});
						}
					);
				} else {
					// iOS
					plus.runtime.openURL('gcm-ciq://', function(res) {
						console.log('打开Garmin成功');
					}, function(e) {
						uni.showModal({
							title: '提示',
							content: '未检测到 Garmin Connect 应用，是否前往 App Store 下载？',
							success: (res) => {
								if (res.confirm) {
									plus.runtime.openURL('https://apps.apple.com/app/garmin-connect/id583440408');
								}
							}
						});
					});
				}
				// #endif
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
		/* 防止小屏幕溢出 */
	}

	/* 更新按钮样式 */
	.update-section {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 20rpx;
		width: 100%;
	}

	.update-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #90e6dc;
		/* 按钮背景色 */
		color: #263238;
		/* 按钮文字颜色 */
		padding: 15rpx 30rpx;
		border-radius: 30rpx;
		/* 圆角 */
		font-size: 28rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 8rpx rgba(0, 0, 0, 0.2);
		/* 阴影效果 */
	}

	.update-icon {
		margin-right: 10rpx;
		font-size: 32rpx;
	}

	.update-text {
		font-size: 28rpx;
	}

	/* 禁用状态样式 */
	.update-btn[disabled] {
		background-color: #cccccc;
		color: #666666;
	}

	/* 点击动画效果 */
	.update-btn:active {
		transform: scale(0.95);
		/* 点击时缩小 */
		opacity: 0.8;
		/* 点击时透明度降低 */
	}

	/* 适配不同屏幕 */
	@media screen and (max-width: 375px) {
		.update-btn {
			padding: 12rpx 24rpx;
			font-size: 24rpx;
		}

		.update-icon {
			font-size: 28rpx;
		}

		.update-text {
			font-size: 24rpx;
		}
	}

	/* 统一卡片基础样式 */
	.heart-rate-card,
	.sleep-card {
		width: 48%;
		height: 370rpx;
		border-radius: 15rpx;
		margin-bottom: 20rpx;
		padding: 25rpx;
		/* 统一内边距 */
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		/* 确保padding不影响总高度 */
	}

	/* 昨日心率卡片样式 */
	.heart-rate-card {
		background-color: #faf2fe;
		border: 1rpx solid #ccc;
		box-shadow: 0 2rpx 10rpx rgba(0, 85, 255, 0.1);
	}

	/* 睡眠卡片样式 */
	.sleep-card {
		background-color: #f0f7ff;
		border: 1rpx solid #bed6ff;
		box-shadow: 0 4rpx 12rpx rgba(41, 128, 255, 0.15);
		transition: all 0.3s ease;
	}

	/* 统一标题行样式 */
	.heart-rate-card .label-row,
	.sleep-card .label-row {
		display: flex;
		align-items: center;
		margin-bottom: 30rpx;
		/* 统一标题与内容间距 */
		height: 52rpx;
		/* 统一标题行高度 */
	}

	/* 图标样式统一 */
	.heart-rate-card .icon-heart,
	.sleep-card .icon-sleep {
		width: 52rpx;
		height: 52rpx;
		margin-right: 15rpx;
		/* 统一图标右侧间距 */
	}

	/* 标题文本样式 */
	.heart-rate-card .data-label {
		font-size: 35rpx;
		font-weight: bold;
		color: #a18cd1;
	}

	.sleep-card .data-label {
		font-size: 35rpx;
		font-weight: bold;
		color: #1976d2;
	}

	/* 数据项容器 - 关键对齐设置 */
	.data-items {
		display: flex;
		flex-direction: column;
		gap: 15rpx;
		/* 统一数据项之间的间距 */
		width: 100%;
	}

	/* 统一数据值样式 */
	.heart-rate-card .data-value,
	.sleep-card .data-value {
		font-size: 30rpx;
		color: #263238;
		font-weight: 500;
		height: 30rpx;
		/* 固定每行高度确保对齐 */
		line-height: 40rpx;
		/* 垂直居中 */
	}

	/* 数值样式 */
	.heart-rate-card .value-number {
		color: #a18cd1;
		font-weight: bold;
	}

	.sleep-card .value-number {
		color: #2980b9;
		font-weight: bold;
	}

	/* 统一空格样式 */
	.heart-rate-card .space,
	.sleep-card .space {
		display: inline-block;
		width: 10rpx;
	}

	/* 日期样式 - 固定在底部 */
	.heart-rate-card .update-date,
	.sleep-card .update-date {
		font-size: 28rpx;
		color: #999;
		margin-top: auto;
		/* 推到容器底部 */
		margin-top: auto;
		height: 30rpx;
		line-height: 30rpx;
	}

	/* 点击进入历史记录的效果 */
	.heart-rate-card:active {
		background-color: #f3f1eb;
	}

	.sleep-card:active {
		background-color: #e3f2fd;
		transform: translateY(2rpx);
		box-shadow: 0 2rpx 8rpx rgba(41, 128, 255, 0.1);
	}

	/* 昨日运动卡片样式 */
	.steps-card {
		width: 48%;
		height: 370rpx;
		border-radius: 15rpx;
		margin-bottom: 20rpx;
		padding: 25rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		background-color: #fff8f0;
		border: 1rpx solid #ffd9b3;
		box-shadow: 0 2rpx 10rpx rgba(255, 123, 0, 0.1);
	}

	/* 运动卡片标题行样式 */
	.steps-card .label-row {
		display: flex;
		align-items: center;
		margin-bottom: 30rpx;
		height: 52rpx;
	}

	/* 运动图标样式 */
	.steps-card .icon-steps {
		width: 52rpx;
		height: 52rpx;
		margin-right: 15rpx;
	}

	/* 运动标题文本样式 */
	.steps-card .data-label {
		font-size: 35rpx;
		font-weight: bold;
		color: #ff7a00;
	}

	/* 运动数据项样式 */
	.steps-card .data-value {
		font-size: 30rpx;
		color: #263238;
		font-weight: 500;
		height: 40rpx;
		line-height: 40rpx;
	}

	/* 运动数值样式 */
	.steps-card .value-number {
		color: #ff7a00;
		font-weight: bold;
	}

	/* 运动卡片空格样式 */
	.steps-card .space {
		display: inline-block;
		width: 10rpx;
	}

	/* 运动卡片日期样式 */
	.steps-card .update-date {
		font-size: 28rpx;
		color: #999;
		margin-top: auto;
		height: 30rpx;
		line-height: 30rpx;
	}

	/* 运动卡片点击效果 */
	.steps-card:active {
		background-color: #fff3e0;
		transform: translateY(2rpx);
		box-shadow: 0 2rpx 8rpx rgba(255, 123, 0, 0.1);
	}

	/* 昨日身体电量卡片样式 */
	.body-energy-card {
		width: 48%;
		height: 370rpx;
		border-radius: 15rpx;
		margin-bottom: 20rpx;
		padding: 25rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		background-color: #e8f5e9;
		border: 1rpx solid #a5d6a7;
		box-shadow: 0 2rpx 10rpx rgba(102, 187, 106, 0.1);
	}

	/* 标题行样式 */
	.label-row {
		display: flex;
		align-items: center;
		margin-bottom: 15rpx;
		/* 控制标题与内容的距离 */
	}

	.body-energy-card .icon-energy {
		width: 52rpx;
		height: 52rpx;
		margin-right: 15rpx;
	}

	.body-energy-card .data-label {
		font-size: 35rpx;
		font-weight: bold;
		color: #388e3c;
	}

	/* 数据项容器 */
	.data-items {
		display: flex;
		flex-direction: column;
		gap: 20rpx;
		/* 增加充能和耗能两大项之间的距离 */
	}

	/* 每个能量项的容器 */
	.energy-item {
		display: flex;
		flex-direction: column;
		gap: 3rpx;
		/* 控制"充能"与下方灰色小字的距离 */
	}

	.body-energy-card .data-value {
		font-size: 30rpx;
		color: #263238;
		font-weight: 500;
		height: 40rpx;
		line-height: 40rpx;
		margin-top: 18rpx;
		/* 新增：让充能字样下移 */
	}

	.body-energy-card .value-number {
		color: #388e3c;
		font-weight: bold;
	}

	.body-energy-card .space {
		display: inline-block;
		width: 10rpx;
	}

	.body-energy-card .energy-note {
		font-size: 24rpx;
		color: #757575;
		line-height: 1.2;
		/* 确保小字行高合适 */
		margin-bottom: 0.1rpx;
		/* 新增：增加与下方耗能的距离 */
	}

	.body-energy-card .update-date {
		font-size: 28rpx;
		color: #999;
		margin-top: auto;
		/* 自动推到最底部 */
		height: 30rpx;
		line-height: 30rpx;
	}

	/* 点击效果 */
	.body-energy-card:active {
		background-color: #dcedc8;
		transform: translateY(2rpx);
		box-shadow: 0 2rpx 8rpx rgba(102, 187, 106, 0.1);
	}

	/* 昨日压力卡片样式 */
	.stress-card {
		width: 48%;
		height: 370rpx;
		border-radius: 15rpx;
		margin-bottom: 20rpx;
		padding: 25rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		/* 暗黄色背景 */
		background-color: #f9f0d1;
		/* 暗黄色边框 */
		border: 1rpx solid #e6c872;
		box-shadow: 0 2rpx 10rpx rgba(230, 200, 114, 0.1);
	}

	/* 昨日压力卡片图标样式 */
	.stress-card .icon-stress {
		width: 52rpx;
		height: 52rpx;
		margin-right: 15rpx;
	}

	/* 昨日压力卡片标题文本样式 */
	.stress-card .data-label {
		font-size: 35rpx;
		font-weight: bold;
		/* 暗黄色文字 */
		color: #d4a017;
	}

	/* 昨日压力卡片数据值样式 */
	.stress-card .data-value {
		font-size: 30rpx;
		color: #263238;
		font-weight: 500;
		height: 40rpx;
		line-height: 40rpx;
		margin-top: 10rpx;
	}

	/* 昨日压力卡片数值样式 */
	.stress-card .value-number {
		/* 暗黄色数值 */
		color: #d4a017;
		font-weight: bold;
	}

	/* 昨日压力卡片空格样式 */
	.stress-card .space {
		display: inline-block;
		width: 10rpx;
	}

	/* 昨日压力卡片提示文本样式 */
	.stress-card .tips-text {
		font-size: 24rpx;
		color: #9e9e9e;
		margin-top: 5rpx;
		line-height: 1.2;
	}

	/* 昨日压力卡片日期样式 */
	.stress-card .update-date {
		font-size: 28rpx;
		color: #9e9e9e;
		margin-top: auto;
		height: 30rpx;
		line-height: 30rpx;
	}

	/* 昨日压力卡片点击效果 */
	.stress-card:active {
		/* 点击时的暗黄色背景 */
		background-color: #f0e0a0;
	}

	/* 血氧卡片样式 */
	.spo2-card {
		width: 48%;
		height: 370rpx;
		border-radius: 15rpx;
		margin-bottom: 20rpx;
		padding: 25rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		background-color: #fff5f7;
		border: 1rpx solid #ffccd5;
		box-shadow: 0 2rpx 10rpx rgba(255, 102, 130, 0.1);
	}

	/* 血氧图标样式 */
	.spo2-card .icon-spo2 {
		width: 52rpx;
		height: 52rpx;
		margin-right: 15rpx;
	}

	/* 血氧标题文本样式 */
	.spo2-card .data-label {
		font-size: 35rpx;
		font-weight: bold;
		color: #ff6682;
	}

	/* 血氧数据值样式 */
	.spo2-card .data-value {
		font-size: 30rpx;
		color: #263238;
		font-weight: 500;
		height: 40rpx;
		line-height: 40rpx;
		margin-top: 10rpx;
	}

	/* 血氧数值样式 */
	.spo2-card .value-number {
		color: #ff5277;
		font-weight: bold;
	}

	/* 血氧空格样式 */
	.spo2-card .space {
		display: inline-block;
		width: 10rpx;
	}

	/* 血氧日期样式 */
	.spo2-card .update-date {
		font-size: 28rpx;
		color: #9e9e9e;
		margin-top: auto;
		height: 30rpx;
		line-height: 30rpx;
	}

	/* 血氧卡片点击效果 */
	.spo2-card:active {
		background-color: #ffeef0;
	}

	/* ===== 更新按钮区域扩展 ===== */
	.update-section {
		gap: 20rpx;
		flex-wrap: wrap;
	}

	/* Garmin按钮样式 */
	.garmin-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		background: linear-gradient(135deg, #0078D7 0%, #00BCF2 100%);
		color: #ffffff;
		padding: 12rpx 18rpx;
		border-radius: 30rpx;
		font-size: 22rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 12rpx rgba(0, 120, 215, 0.4);
	}

	.garmin-btn:active {
		transform: scale(0.95);
		opacity: 0.85;
	}

	.garmin-icon {
		margin-right: 6rpx;
		font-size: 24rpx;
	}

	.garmin-text {
		font-size: 22rpx;
	}

	/* 数据报告按钮 */
	.report-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
		color: #ffffff;
		padding: 15rpx 30rpx;
		border-radius: 30rpx;
		font-size: 28rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 12rpx rgba(102, 126, 234, 0.4);
	}

	.report-btn:active {
		transform: scale(0.95);
		opacity: 0.85;
	}

	.report-icon {
		margin-right: 10rpx;
		font-size: 32rpx;
	}

	.report-text {
		font-size: 28rpx;
	}

	/* ===== 报告弹窗遮罩 ===== */
	.report-mask {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(0, 0, 0, 0.55);
		z-index: 9999;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	/* 弹窗主体 */
	.report-modal {
		background: #f7f8fc;
		border-radius: 28rpx;
		width: 92vw;
		height: 85vh;
		display: flex;
		flex-direction: column;
		box-shadow: 0 16rpx 48rpx rgba(0, 0, 0, 0.25);
		overflow: hidden;
	}

	/* 弹窗头部 */
	.report-header {
		background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
		padding: 32rpx 40rpx 24rpx;
		position: relative;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.report-title {
		color: #ffffff;
		font-size: 40rpx;
		font-weight: bold;
		letter-spacing: 2rpx;
	}

	.report-subtitle {
		color: rgba(255, 255, 255, 0.8);
		font-size: 26rpx;
		margin-top: 8rpx;
	}

	.close-btn {
		position: absolute;
		top: 24rpx;
		right: 28rpx;
		width: 56rpx;
		height: 56rpx;
		background: rgba(255, 255, 255, 0.25);
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.close-icon {
		color: #ffffff;
		font-size: 28rpx;
		line-height: 1;
	}

	/* 滚动内容区 */
	.report-scroll {
		flex: 1;
		height: 0;
		padding: 20rpx 24rpx 30rpx;
		box-sizing: border-box;
	}

	/* ===== 报告卡片通用样式 ===== */
	.rpt-card {
		border-radius: 20rpx;
		padding: 28rpx 28rpx 20rpx;
		margin-bottom: 20rpx;
		box-shadow: 0 4rpx 16rpx rgba(0, 0, 0, 0.07);
	}

	.rpt-heart  { background: #faf2fe; border: 1rpx solid #ddc5f7; }
	.rpt-sleep  { background: #f0f7ff; border: 1rpx solid #bed6ff; }
	.rpt-steps  { background: #fff8f0; border: 1rpx solid #ffd9b3; }
	.rpt-energy { background: #e8f5e9; border: 1rpx solid #a5d6a7; }
	.rpt-stress { background: #fdf8e4; border: 1rpx solid #e6c872; }
	.rpt-spo2   { background: #fff5f7; border: 1rpx solid #ffccd5; }

	/* 卡片头部行 */
	.rpt-card-header {
		display: flex;
		align-items: center;
		margin-bottom: 22rpx;
	}

	.rpt-card-icon {
		font-size: 38rpx;
		margin-right: 14rpx;
	}

	.rpt-card-title {
		font-size: 34rpx;
		font-weight: bold;
		color: #263238;
		flex: 1;
	}

	/* 状态标签 */
	.rpt-status-tag {
		padding: 4rpx 18rpx;
		border-radius: 20rpx;
		font-size: 24rpx;
		font-weight: bold;
	}

	.tag-green  { background: #e8f5e9; color: #2e7d32; }
	.tag-blue   { background: #e3f2fd; color: #1565c0; }
	.tag-yellow { background: #fff8e1; color: #f57f17; }
	.tag-red    { background: #ffebee; color: #c62828; }
	.tag-gray   { background: #f5f5f5; color: #9e9e9e; }

	/* 指标数据区 */
	.rpt-metrics {
		display: flex;
		justify-content: space-around;
		margin-bottom: 18rpx;
	}

	.rpt-metric-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 4rpx;
		flex: 1;
	}

	.rpt-metric-val {
		font-size: 38rpx;
		font-weight: bold;
		line-height: 1.2;
	}

	.rpt-metric-label {
		font-size: 22rpx;
		color: #757575;
		margin-top: 2rpx;
	}

	.rpt-metric-unit {
		font-size: 20rpx;
		color: #bdbdbd;
	}

	/* 进度条 */
	.rpt-bar-wrap {
		margin-bottom: 14rpx;
	}

	.rpt-bar-label {
		font-size: 22rpx;
		color: #757575;
		display: block;
		margin-bottom: 8rpx;
	}

	.rpt-bar-track {
		width: 100%;
		height: 16rpx;
		background: rgba(0,0,0,0.08);
		border-radius: 8rpx;
		overflow: hidden;
	}

	.rpt-bar-fill {
		height: 100%;
		border-radius: 8rpx;
		transition: width 0.6s ease;
	}

	.rpt-bar-purple { background: linear-gradient(90deg, #c084fc, #a855f7); }
	.rpt-bar-blue   { background: linear-gradient(90deg, #60a5fa, #2563eb); }
	.rpt-bar-orange { background: linear-gradient(90deg, #fbbf24, #f97316); }
	.rpt-bar-green  { background: linear-gradient(90deg, #4ade80, #16a34a); }
	.rpt-bar-yellow { background: linear-gradient(90deg, #fde047, #eab308); }
	.rpt-bar-red    { background: linear-gradient(90deg, #f87171, #dc2626); }
	.rpt-bar-pink   { background: linear-gradient(90deg, #fb7185, #e11d48); }

	.rpt-bar-ends {
		display: flex;
		justify-content: space-between;
		font-size: 20rpx;
		color: #bdbdbd;
		margin-top: 4rpx;
	}

	/* 建议区域 */
	.rpt-advice {
		background: rgba(255, 255, 255, 0.7);
		border-radius: 12rpx;
		padding: 14rpx 18rpx;
		display: flex;
		align-items: flex-start;
		gap: 10rpx;
		margin-top: 6rpx;
	}

	.rpt-advice-icon {
		font-size: 28rpx;
		line-height: 1.4;
	}

	.rpt-advice-text {
		font-size: 24rpx;
		color: #546e7a;
		line-height: 1.6;
		flex: 1;
	}

	/* 底部注意事项 */
	.rpt-footer {
		padding: 16rpx 10rpx 10rpx;
		border-top: 1rpx solid #e0e0e0;
		margin-top: 4rpx;
	}

	.rpt-footer-text {
		font-size: 22rpx;
		color: #9e9e9e;
		line-height: 1.6;
		text-align: center;
		display: block;
	}

	/* 适配小屏 */
	@media screen and (max-width: 375px) {
		.report-btn {
			padding: 12rpx 24rpx;
			font-size: 24rpx;
		}
		.rpt-metric-val { font-size: 32rpx; }
	}
</style>