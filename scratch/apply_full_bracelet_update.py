# -*- coding: utf-8 -*-
import os

file_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystems\frontend\pages\BraceletData\BraceletData.vue"

with open(file_path, "r", encoding="utf-8") as f:
    text = f.read()

# Fix extra </view>
text = text.replace("</view>\n	</view>\n</template>", "</view>\n</template>")
text = text.replace("</view>\r\n	</view>\r\n</template>", "</view>\r\n</template>")

# Find <script>
script_idx = text.find("<script>")
if script_idx == -1:
    print("Error: <script> not found")
    exit(1)

# Find <style>
style_idx = text.find("<style>")
if style_idx == -1:
    print("Error: <style> not found")
    exit(1)

template_part = text[:script_idx]

script_code = """<script>
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

				// 绑定账号相关
				showBindModal: false,
				isGarminBound: false,
				garminEmail: '',
				garminPassword: '',
				showPasswordText: false,
				isSubmittingBind: false,

				// 历史数据可视化相关
				showHistoryModal: false,
				historyPeriod: 7, // 7, 14, 30
				activeMetricTab: 'steps', // steps, heartrate, sleep, bodybattery, stress, spo2
				historyStepsList: [],
				historyHeartrateList: [],
				historySleepList: [],
				historyBodyBatteryList: [],
				historyStressList: [],
				historySpO2List: [],
				isLoadingHistory: false,
				selectedBarIndex: null
			};
		},
		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('bracelet.navTitle') || '手环数据'
			});
			this.fetchBindingStatus();
		},
		onLoad() {
			this.fetchBindingStatus();
			this.fetchAllMetrics();
		},
		computed: {
			maskedEmail() {
				if (!this.garminEmail) return '';
				return this.garminEmail.replace(/(.{2}).+(@.+)/, '$1***$2');
			},
			formattedDistance() {
				if (this.totalDistance === '--' || this.totalDistance === '暂无数据' || !this.totalDistance) {
					return this.totalDistance;
				}
				const dist = Number(this.totalDistance);
				if (isNaN(dist)) return this.totalDistance;
				return (dist / 1000).toFixed(1);
			},
			currentMetricSummary() {
				switch (this.activeMetricTab) {
					case 'steps': {
						const list = this.historyStepsList || [];
						const validVals = list.map(item => Number(item.totalSteps)).filter(v => !isNaN(v) && v > 0);
						const max = validVals.length > 0 ? Math.max(...validVals) : (this.totalSteps !== '--' && !isNaN(Number(this.totalSteps)) ? Number(this.totalSteps) : '--');
						const sum = validVals.reduce((a, b) => a + b, 0);
						const avg = validVals.length > 0 ? Math.round(sum / validVals.length) : (this.totalSteps !== '--' && !isNaN(Number(this.totalSteps)) ? Number(this.totalSteps) : '--');
						const goals = validVals.filter(v => v >= 7000).length;
						return {
							themeColor: '#ff7a00',
							barGradient: 'linear-gradient(180deg, #ff9e40 0%, #ff6d00 100%)',
							chartTitle: '每日步数走势',
							unit: '步',
							kpi1Label: '最高步数', kpi1Val: max, kpi1Unit: '步',
							kpi2Label: '平均步数', kpi2Val: avg, kpi2Unit: '步',
							kpi3Label: '达标天数', kpi3Val: goals, kpi3Unit: '天'
						};
					}
					case 'heartrate': {
						const list = this.historyHeartrateList || [];
						const restVals = list.map(item => Number(item.restingHeartRate)).filter(v => !isNaN(v) && v > 0);
						const maxVals = list.map(item => Number(item.maxHeartRate)).filter(v => !isNaN(v) && v > 0);
						const minRest = restVals.length > 0 ? Math.min(...restVals) : (this.restingHeartRate !== '--' ? this.restingHeartRate : '--');
						const sum = restVals.reduce((a, b) => a + b, 0);
						const avgRest = restVals.length > 0 ? Math.round(sum / restVals.length) : (this.restingHeartRate !== '--' ? this.restingHeartRate : '--');
						const peakHR = maxVals.length > 0 ? Math.max(...maxVals) : (this.maxHeartRate !== '--' ? this.maxHeartRate : '--');
						return {
							themeColor: '#9c27b0',
							barGradient: 'linear-gradient(180deg, #ba68c8 0%, #8e24aa 100%)',
							chartTitle: '静息心率趋势',
							unit: '次/分',
							kpi1Label: '最低静息', kpi1Val: minRest, kpi1Unit: 'bpm',
							kpi2Label: '平均静息', kpi2Val: avgRest, kpi2Unit: 'bpm',
							kpi3Label: '最高心率', kpi3Val: peakHR, kpi3Unit: 'bpm'
						};
					}
					case 'sleep': {
						const list = this.historySleepList || [];
						const scoreVals = list.map(item => Number(item.sleep_score_overall)).filter(v => !isNaN(v) && v > 0);
						const maxScore = scoreVals.length > 0 ? Math.max(...scoreVals) : (this.sleep_score_overall !== '--' ? this.sleep_score_overall : '--');
						const sum = scoreVals.reduce((a, b) => a + b, 0);
						const avgScore = scoreVals.length > 0 ? Math.round(sum / scoreVals.length) : (this.sleep_score_overall !== '--' ? this.sleep_score_overall : '--');
						const goodDays = scoreVals.filter(v => v >= 80).length;
						return {
							themeColor: '#5c6bc0',
							barGradient: 'linear-gradient(180deg, #7986cb 0%, #3949ab 100%)',
							chartTitle: '睡眠得分分析',
							unit: '分',
							kpi1Label: '最高得分', kpi1Val: maxScore, kpi1Unit: '分',
							kpi2Label: '平均得分', kpi2Val: avgScore, kpi2Unit: '分',
							kpi3Label: '优质睡眠', kpi3Val: goodDays, kpi3Unit: '天'
						};
					}
					case 'bodybattery': {
						const list = this.historyBodyBatteryList || [];
						const chargeVals = list.map(item => Number(item.charged)).filter(v => !isNaN(v) && v > 0);
						const drainVals = list.map(item => Number(item.drained)).filter(v => !isNaN(v) && v > 0);
						const maxCharge = chargeVals.length > 0 ? Math.max(...chargeVals) : (this.charged !== '--' ? this.charged : '--');
						const sumCharge = chargeVals.reduce((a, b) => a + b, 0);
						const avgCharge = chargeVals.length > 0 ? Math.round(sumCharge / chargeVals.length) : (this.charged !== '--' ? this.charged : '--');
						const sumDrain = drainVals.reduce((a, b) => a + b, 0);
						const avgDrain = drainVals.length > 0 ? Math.round(sumDrain / drainVals.length) : (this.drained !== '--' ? this.drained : '--');
						return {
							themeColor: '#2e7d32',
							barGradient: 'linear-gradient(180deg, #66bb6a 0%, #2e7d32 100%)',
							chartTitle: '身体充能恢复',
							unit: '点',
							kpi1Label: '最高充能', kpi1Val: maxCharge, kpi1Unit: '点',
							kpi2Label: '平均充能', kpi2Val: avgCharge, kpi2Unit: '点',
							kpi3Label: '平均耗能', kpi3Val: avgDrain, kpi3Unit: '点'
						};
					}
					case 'stress': {
						const list = this.historyStressList || [];
						const avgStressVals = list.map(item => Number(item.avgStressLevel)).filter(v => !isNaN(v) && v >= 0);
						const maxStressVals = list.map(item => Number(item.maxStressLevel)).filter(v => !isNaN(v) && v >= 0);
						const peakStress = maxStressVals.length > 0 ? Math.max(...maxStressVals) : (this.maxStressLevel !== '--' ? this.maxStressLevel : '--');
						const sum = avgStressVals.reduce((a, b) => a + b, 0);
						const avgStress = avgStressVals.length > 0 ? Math.round(sum / avgStressVals.length) : (this.avgStressLevel !== '--' ? this.avgStressLevel : '--');
						const calmDays = avgStressVals.filter(v => v <= 35).length;
						return {
							themeColor: '#fb8c00',
							barGradient: 'linear-gradient(180deg, #ffb74d 0%, #f57c00 100%)',
							chartTitle: '平均压力走势',
							unit: '点',
							kpi1Label: '最大压力', kpi1Val: peakStress, kpi1Unit: '点',
							kpi2Label: '平均压力', kpi2Val: avgStress, kpi2Unit: '点',
							kpi3Label: '平静天数', kpi3Val: calmDays, kpi3Unit: '天'
						};
					}
					case 'spo2': {
						const list = this.historySpO2List || [];
						const avgVals = list.map(item => Number(item.averageSpO2)).filter(v => !isNaN(v) && v > 0);
						const lowVals = list.map(item => Number(item.lowestSpO2)).filter(v => !isNaN(v) && v > 0);
						const peakSpo2 = avgVals.length > 0 ? Math.max(...avgVals) : (this.averageSpO2 !== '--' ? this.averageSpO2 : '--');
						const sum = avgVals.reduce((a, b) => a + b, 0);
						const avgSpo2 = avgVals.length > 0 ? Math.round(sum / avgVals.length) : (this.averageSpO2 !== '--' ? this.averageSpO2 : '--');
						const minSpo2 = lowVals.length > 0 ? Math.min(...lowVals) : (this.lowestSpO2 !== '--' ? this.lowestSpO2 : '--');
						return {
							themeColor: '#e91e63',
							barGradient: 'linear-gradient(180deg, #f48fb1 0%, #d81b60 100%)',
							chartTitle: '平均血氧饱和度',
							unit: '%',
							kpi1Label: '最高血氧', kpi1Val: peakSpo2, kpi1Unit: '%',
							kpi2Label: '平均血氧', kpi2Val: avgSpo2, kpi2Unit: '%',
							kpi3Label: '最低血氧', kpi3Val: minSpo2, kpi3Unit: '%'
						};
					}
					default:
						return {};
				}
			},
			chartBars() {
				let rawList = [];
				let extractVal = null;
				let maxLimit = 100;

				switch (this.activeMetricTab) {
					case 'steps':
						rawList = this.historyStepsList || [];
						extractVal = item => Number(item.totalSteps);
						maxLimit = 12000;
						break;
					case 'heartrate':
						rawList = this.historyHeartrateList || [];
						extractVal = item => Number(item.restingHeartRate || item.maxHeartRate);
						maxLimit = 120;
						break;
					case 'sleep':
						rawList = this.historySleepList || [];
						extractVal = item => Number(item.sleep_score_overall);
						maxLimit = 100;
						break;
					case 'bodybattery':
						rawList = this.historyBodyBatteryList || [];
						extractVal = item => Number(item.charged);
						maxLimit = 100;
						break;
					case 'stress':
						rawList = this.historyStressList || [];
						extractVal = item => Number(item.avgStressLevel);
						maxLimit = 100;
						break;
					case 'spo2':
						rawList = this.historySpO2List || [];
						extractVal = item => Number(item.averageSpO2);
						maxLimit = 100;
						break;
				}

				const validList = rawList.filter(item => {
					const v = extractVal(item);
					return !isNaN(v) && v > 0;
				});

				if (validList.length === 0) {
					let curVal = null;
					if (this.activeMetricTab === 'steps' && this.totalSteps !== '--') curVal = Number(this.totalSteps);
					else if (this.activeMetricTab === 'heartrate' && this.restingHeartRate !== '--') curVal = Number(this.restingHeartRate);
					else if (this.activeMetricTab === 'sleep' && this.sleep_score_overall !== '--') curVal = Number(this.sleep_score_overall);
					else if (this.activeMetricTab === 'bodybattery' && this.charged !== '--') curVal = Number(this.charged);
					else if (this.activeMetricTab === 'stress' && this.avgStressLevel !== '--') curVal = Number(this.avgStressLevel);
					else if (this.activeMetricTab === 'spo2' && this.averageSpO2 !== '--') curVal = Number(this.averageSpO2);

					if (curVal && !isNaN(curVal)) {
						const pct = Math.min(Math.max(Math.round((curVal / maxLimit) * 100), 20), 95);
						return [{
							dateLabel: '最新',
							valueText: curVal + (this.activeMetricTab === 'spo2' ? '%' : ''),
							heightPercent: pct,
							isPeak: true
						}];
					}
					return [];
				}

				const values = validList.map(extractVal);
				const peakVal = Math.max(...values, maxLimit * 0.7);

				return validList.slice(-7).map(item => {
					const val = extractVal(item);
					const d = item.calendarDate || item.date;
					let dateLabel = '--';
					if (d) {
						const dt = new Date(d);
						dateLabel = `${dt.getMonth() + 1}/${dt.getDate()}`;
					}
					const pct = Math.min(Math.max(Math.round((val / peakVal) * 92), 18), 95);
					return {
						dateLabel,
						valueText: val + (this.activeMetricTab === 'spo2' ? '%' : ''),
						heightPercent: pct,
						isPeak: val === Math.max(...values)
					};
				});
			},
			currentHistoryRecords() {
				let rawList = [];
				switch (this.activeMetricTab) {
					case 'steps':
						rawList = this.historyStepsList || [];
						if (rawList.length === 0 && this.totalSteps !== '--') {
							rawList = [{ calendarDate: new Date(), totalSteps: this.totalSteps, totalDistance: this.totalDistance, stepGoal: this.stepGoal }];
						}
						return rawList.map(item => {
							const steps = Number(item.totalSteps) || 0;
							const dist = item.totalDistance ? (Number(item.totalDistance) / 1000).toFixed(1) : '--';
							const goal = item.stepGoal || '7420';
							const isDone = steps >= Number(goal);
							return {
								dateStr: this.formatDate(item.calendarDate),
								statusBadge: { text: isDone ? '目标达成' : '日常运动', cls: isDone ? 'tag-green' : 'tag-orange' },
								metrics: [
									{ label: '运动步数', value: steps, unit: '步', color: '#ff7a00' },
									{ label: '行走距离', value: dist, unit: '公里' },
									{ label: '目标步数', value: goal, unit: '步' }
								]
							};
						});
					case 'heartrate':
						rawList = this.historyHeartrateList || [];
						if (rawList.length === 0 && this.restingHeartRate !== '--') {
							rawList = [{ calendarDate: new Date(), restingHeartRate: this.restingHeartRate, maxHeartRate: this.maxHeartRate, minHeartRate: this.minHeartRate }];
						}
						return rawList.map(item => {
							const resting = item.restingHeartRate || '--';
							const max = item.maxHeartRate || '--';
							const min = item.minHeartRate || '--';
							const rNum = Number(resting);
							let badge = { text: '正常', cls: 'tag-green' };
							if (!isNaN(rNum)) {
								if (rNum < 60) badge = { text: '偏缓', cls: 'tag-blue' };
								else if (rNum > 80) badge = { text: '偏快', cls: 'tag-yellow' };
							}
							return {
								dateStr: this.formatDate(item.calendarDate),
								statusBadge: badge,
								metrics: [
									{ label: '静息心率', value: resting, unit: '次/分', color: '#9c27b0' },
									{ label: '最高心率', value: max, unit: '次/分' },
									{ label: '最低心率', value: min, unit: '次/分' }
								]
							};
						});
					case 'sleep':
						rawList = this.historySleepList || [];
						if (rawList.length === 0 && this.sleep_score_overall !== '--') {
							rawList = [{ calendarDate: new Date(), sleep_score_overall: this.sleep_score_overall, sleepTimeSeconds: this.sleepTimeSeconds, awakeSleepSeconds: this.awakeSleepSeconds, avgSleepStress: this.avgSleepStress }];
						}
						return rawList.map(item => {
							const score = item.sleep_score_overall || '--';
							const duration = item.sleepTimeSeconds || '--';
							const stress = item.avgSleepStress || '--';
							const sNum = Number(score);
							let badge = { text: '良好', cls: 'tag-blue' };
							if (sNum >= 80) badge = { text: '优质', cls: 'tag-green' };
							else if (sNum < 60) badge = { text: '一般', cls: 'tag-yellow' };
							return {
								dateStr: this.formatDate(item.calendarDate),
								statusBadge: badge,
								metrics: [
									{ label: '睡眠得分', value: score, unit: '分', color: '#5c6bc0' },
									{ label: '总睡眠时长', value: duration, unit: '' },
									{ label: '睡眠压力', value: stress, unit: '点' }
								]
							};
						});
					case 'bodybattery':
						rawList = this.historyBodyBatteryList || [];
						if (rawList.length === 0 && this.charged !== '--') {
							rawList = [{ date: new Date(), charged: this.charged, drained: this.drained }];
						}
						return rawList.map(item => {
							const charged = item.charged || '--';
							const drained = item.drained || '--';
							const cNum = Number(charged);
							const dNum = Number(drained);
							const net = (!isNaN(cNum) && !isNaN(dNum)) ? (cNum - dNum) : '--';
							return {
								dateStr: this.formatDate(item.date || item.calendarDate),
								statusBadge: { text: net >= 0 ? '能量盈余' : '轻度赤字', cls: net >= 0 ? 'tag-green' : 'tag-yellow' },
								metrics: [
									{ label: '充能值', value: '+' + charged, unit: '点', color: '#2e7d32' },
									{ label: '耗能值', value: '-' + drained, unit: '点', color: '#d32f2f' },
									{ label: '净恢复', value: (net >= 0 ? '+' : '') + net, unit: '点' }
								]
							};
						});
					case 'stress':
						rawList = this.historyStressList || [];
						if (rawList.length === 0 && this.avgStressLevel !== '--') {
							rawList = [{ calendarDate: new Date(), avgStressLevel: this.avgStressLevel, maxStressLevel: this.maxStressLevel }];
						}
						return rawList.map(item => {
							const avg = item.avgStressLevel || '--';
							const max = item.maxStressLevel || '--';
							const aNum = Number(avg);
							let badge = { text: '平静', cls: 'tag-green' };
							if (aNum > 50) badge = { text: '中高压', cls: 'tag-yellow' };
							else if (aNum > 25) badge = { text: '低压', cls: 'tag-blue' };
							return {
								dateStr: this.formatDate(item.calendarDate),
								statusBadge: badge,
								metrics: [
									{ label: '平均压力', value: avg, unit: '点', color: '#fb8c00' },
									{ label: '最大压力', value: max, unit: '点' }
								]
							};
						});
					case 'spo2':
						rawList = this.historySpO2List || [];
						if (rawList.length === 0 && this.averageSpO2 !== '--') {
							rawList = [{ calendarDate: new Date(), averageSpO2: this.averageSpO2, lowestSpO2: this.lowestSpO2, avgSleepSpO2: this.avgSleepSpO2 }];
						}
						return rawList.map(item => {
							const avg = item.averageSpO2 || '--';
							const lowest = item.lowestSpO2 || '--';
							const sleep = item.avgSleepSpO2 || '--';
							const aNum = Number(avg);
							let badge = { text: '优秀', cls: 'tag-green' };
							if (aNum < 95) badge = { text: '轻度偏低', cls: 'tag-yellow' };
							return {
								dateStr: this.formatDate(item.calendarDate || item.date),
								statusBadge: badge,
								metrics: [
									{ label: '平均血氧', value: avg, unit: '%', color: '#e91e63' },
									{ label: '最低血氧', value: lowest, unit: '%' },
									{ label: '睡眠血氧', value: sleep, unit: '%' }
								]
							};
						});
					default:
						return [];
				}
			}
		},
		methods: {
			fetchBindingStatus() {
				const token = uni.getStorageSync('token');
				if (!token) return;
				http.get(`${config.baseUrl}/garminDataProcess/getBinding`, {
					headers: {
						Authorization: token
					}
				}).then(res => {
					if (res.code === 200 && res.result) {
						this.isGarminBound = !!res.result.isBound;
						this.garminEmail = res.result.email || '';
					}
				}).catch(err => {
					console.error('获取绑定状态异常:', err);
				});
			},
			openBindModal() {
				this.showBindModal = true;
				this.fetchBindingStatus();
			},
			closeBindModal() {
				this.showBindModal = false;
			},
			handleBindGarmin() {
				const token = uni.getStorageSync('token');
				if (!token) {
					uni.showToast({ title: '请先登录', icon: 'none' });
					return;
				}
				if (!this.garminEmail || !this.garminEmail.trim()) {
					uni.showToast({ title: '请输入Garmin账号邮箱', icon: 'none' });
					return;
				}
				if (!this.garminPassword || !this.garminPassword.trim()) {
					uni.showToast({ title: '请输入Garmin账号密码', icon: 'none' });
					return;
				}
				this.isSubmittingBind = true;
				http.post(`${config.baseUrl}/garminDataProcess/bindGarmin`, {
					email: this.garminEmail.trim(),
					password: this.garminPassword.trim()
				}, {
					header: {
						Authorization: token
					}
				}).then(res => {
					if (res.code === 200) {
						this.isGarminBound = true;
						uni.showToast({ title: 'Garmin账号绑定成功！', icon: 'success' });
						this.showBindModal = false;
						this.handleUpdate();
					} else {
						uni.showToast({ title: res.message || '绑定失败', icon: 'none' });
					}
				}).catch(err => {
					uni.showToast({ title: '请求失败，请稍后重试', icon: 'none' });
				}).finally(() => {
					this.isSubmittingBind = false;
				});
			},
			handleUnbindGarmin() {
				uni.showModal({
					title: '解绑确认',
					content: '确定要取消绑定当前 Garmin 账号吗？',
					confirmText: '确定解绑',
					cancelText: '取消',
					success: (modalRes) => {
						if (modalRes.confirm) {
							const token = uni.getStorageSync('token');
							if (!token) return;
							http.post(`${config.baseUrl}/garminDataProcess/unbindGarmin`, {}, {
								header: {
									Authorization: token
								}
							}).then(res => {
								if (res.code === 200) {
									this.isGarminBound = false;
									this.garminEmail = '';
									this.garminPassword = '';
									uni.showToast({ title: '已取消绑定', icon: 'none' });
									this.showBindModal = false;
								} else {
									uni.showToast({ title: res.message || '解绑失败', icon: 'none' });
								}
							});
						}
					}
				});
			},
			openHistoryModal() {
				this.showHistoryModal = true;
				this.loadHistoryData();
			},
			closeHistoryModal() {
				this.showHistoryModal = false;
			},
			switchPeriod(p) {
				this.historyPeriod = p;
				this.loadHistoryData();
			},
			switchMetricTab(tab) {
				this.activeMetricTab = tab;
				this.selectedBarIndex = null;
			},
			selectBar(idx) {
				this.selectedBarIndex = idx;
			},
			handleUpdateFromHistory() {
				this.handleUpdate();
			},
			loadHistoryData() {
				const token = uni.getStorageSync('token');
				if (!token) return;
				this.isLoadingHistory = true;

				const h = { headers: { Authorization: token } };
				const pSteps = http.get(`${config.baseUrl}/healthInfo/getStepsHistory?period=${this.historyPeriod}`, h);
				const pHR = http.get(`${config.baseUrl}/healthInfo/getHeartrateHistory?period=${this.historyPeriod}`, h);
				const pSleep = http.get(`${config.baseUrl}/healthInfo/getSleepHistory?period=${this.historyPeriod}`, h);
				const pBB = http.get(`${config.baseUrl}/healthInfo/getBodyBatteryHistory?period=${this.historyPeriod}`, h);
				const pStress = http.get(`${config.baseUrl}/healthInfo/getStressHistory?period=${this.historyPeriod}`, h);
				const pSpO2 = http.get(`${config.baseUrl}/healthInfo/getSpO2History?period=${this.historyPeriod}`, h);

				Promise.all([pSteps, pHR, pSleep, pBB, pStress, pSpO2]).then(([rSteps, rHR, rSleep, rBB, rStress, rSpO2]) => {
					if (rSteps && rSteps.code === 200 && Array.isArray(rSteps.result)) {
						this.historyStepsList = rSteps.result.filter(i => i && (i.totalSteps !== null && i.totalSteps !== undefined));
					}
					if (rHR && rHR.code === 200 && Array.isArray(rHR.result)) {
						this.historyHeartrateList = rHR.result.filter(i => i && (i.maxHeartRate || i.restingHeartRate));
					}
					if (rSleep && rSleep.code === 200 && Array.isArray(rSleep.result)) {
						this.historySleepList = rSleep.result.filter(i => i && (i.sleep_score_overall || i.sleepTimeSeconds));
					}
					if (rBB && rBB.code === 200 && Array.isArray(rBB.result)) {
						this.historyBodyBatteryList = rBB.result.filter(i => i && (i.charged || i.drained));
					}
					if (rStress && rStress.code === 200 && Array.isArray(rStress.result)) {
						this.historyStressList = rStress.result.filter(i => i && (i.maxStressLevel || i.avgStressLevel));
					}
					if (rSpO2 && rSpO2.code === 200 && Array.isArray(rSpO2.result)) {
						this.historySpO2List = rSpO2.result.filter(i => i && (i.averageSpO2 || i.lowestSpO2));
					}
				}).catch(err => {
					console.error('加载历史数据出错:', err);
				}).finally(() => {
					this.isLoadingHistory = false;
				});
			},
			fetchAllMetrics() {
				this.fetchHeartRateData();
				this.fetchSleepData();
				this.fetchStepsData();
				this.fetchBodyEnergyData();
				this.fetchStressData();
				this.fetchSpO2Data();
			},
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
				uni.showLoading({
					title: '正在同步Garmin数据...'
				});

				http.post(`${config.baseUrl}/garminDataProcess/updateByUserName`, {}, {
					header: {
						Authorization: token
					}
				})
				.then((res) => {
					console.log("更新结果：", res);
					let data = res.data || {};
					let isSuccess = data.success !== undefined ? data.success : (res.code === 200);
					let message = data.message || res.message || '更新完成';

					if (isSuccess) {
						uni.showToast({
							title: '数据同步完成',
							icon: 'success'
						});
					} else {
						if (message.includes('绑定') || message.includes('bind')) {
							uni.showToast({
								title: '请先绑定 Garmin 账号',
								icon: 'none'
							});
							this.openBindModal();
						} else {
							uni.showToast({
								title: message,
								icon: 'none'
							});
						}
					}
				})
				.catch((err) => {
					console.error('更新请求异常:', err);
					uni.showToast({
						title: '同步请求完成，正在刷新数据',
						icon: 'none'
					});
				})
				.finally(() => {
					uni.hideLoading();
					this.isUpdating = false;
					this.fetchAllMetrics();
					if (this.showHistoryModal) {
						this.loadHistoryData();
					}
				});
			},
			fetchHeartRateData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayHeartrate`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result) {
						this.maxHeartRate = res.result.maxHeartRate || '--';
						this.minHeartRate = res.result.minHeartRate || '--';
						this.restingHeartRate = res.result.restingHeartRate || '--';
						this.calendarDate = this.formatDate(res.result.calendarDate);
					} else {
						this.maxHeartRate = this.minHeartRate = this.restingHeartRate = '暂无数据';
						this.calendarDate = '--';
					}
				}).catch((err) => {
					console.error('心率请求失败:', err);
				});
			},
			fetchSleepData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySleep`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result) {
						this.sleep_score_overall = res.result.sleep_score_overall || res.result.sleepScoreOverall || '--';
						this.sleepTimeSeconds = res.result.sleepTimeSeconds || '--';
						this.awakeSleepSeconds = res.result.awakeSleepSeconds || '--';
						this.avgSleepStress = res.result.avgSleepStress || '--';
					} else {
						this.sleep_score_overall = this.sleepTimeSeconds = this.awakeSleepSeconds = this.avgSleepStress = '暂无数据';
					}
				}).catch((err) => {
					console.error('睡眠请求失败:', err);
				});
			},
			fetchStepsData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySteps`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result) {
						this.totalSteps = res.result.totalSteps !== undefined && res.result.totalSteps !== null ? res.result.totalSteps : '--';
						this.totalDistance = res.result.totalDistance !== undefined && res.result.totalDistance !== null ? res.result.totalDistance : '--';
						this.stepGoal = res.result.stepGoal || '7420';
					} else {
						this.totalSteps = this.totalDistance = this.stepGoal = '暂无数据';
					}
				}).catch((err) => {
					console.error('步数请求失败:', err);
				});
			},
			fetchBodyEnergyData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayBodyBattery`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result) {
						this.charged = res.result.charged || '--';
						this.drained = res.result.drained || '--';
						this.date = this.formatDate(res.result.date || res.result.calendarDate);
					} else {
						this.charged = this.drained = '暂无数据';
						this.date = this.formatDate(new Date());
					}
				}).catch((err) => {
					console.error('电量请求失败:', err);
				});
			},
			fetchStressData() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDayStress`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result) {
						this.maxStressLevel = res.result.maxStressLevel || '--';
						this.avgStressLevel = res.result.avgStressLevel || '--';
					} else {
						this.maxStressLevel = this.avgStressLevel = '暂无数据';
					}
				}).catch((err) => {
					console.error('压力请求失败:', err);
				});
			},
			fetchSpO2Data() {
				const token = uni.getStorageSync('token');
				if (!token) return;

				http.get(`${config.baseUrl}/healthInfo/getCurrentDaySpO2`, {
					headers: {
						Authorization: token
					}
				}).then((res) => {
					if (res.code === 200 && typeof res.result === 'object' && res.result) {
						this.averageSpO2 = res.result.averageSpO2 || '--';
						this.lowestSpO2 = res.result.lowestSpO2 || '--';
						this.avgSleepSpO2 = res.result.avgSleepSpO2 || '--';
					} else {
						this.averageSpO2 = this.lowestSpO2 = this.avgSleepSpO2 = '暂无数据';
					}
				}).catch((err) => {
					console.error('血氧请求失败:', err);
				});
			},
			formatDate(dateStr) {
				if (!dateStr) return '--';
				const date = new Date(dateStr);
				if (isNaN(date.getTime())) return String(dateStr);
				return `${date.getMonth() + 1}月${date.getDate()}日`;
			},
			formatSleepTime(seconds) {
				if (seconds === '--' || !seconds) return '--';
				const s = Number(seconds);
				if (isNaN(s)) return String(seconds);
				const hours = Math.floor(s / 3600);
				const minutes = Math.floor((s % 3600) / 60);
				return `${hours}小时${minutes}分钟`;
			},
			goToHeartrateHistory() {
				this.openHistoryModal();
				this.switchMetricTab('heartrate');
			},
			goToSleepHistory() {
				this.openHistoryModal();
				this.switchMetricTab('sleep');
			},
			goToStepsHistory() {
				this.openHistoryModal();
				this.switchMetricTab('steps');
			},
			goToBodyBatteryHistory() {
				this.openHistoryModal();
				this.switchMetricTab('bodybattery');
			},
			goToStressHistory() {
				this.openHistoryModal();
				this.switchMetricTab('stress');
			},
			goToSpO2History() {
				this.openHistoryModal();
				this.switchMetricTab('spo2');
			},
			openGarminApp() {
				this.openBindModal();
			}
		}
	};
</script>
"""

style_code = """<style>
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
		justify-content: space-between;
		align-items: center;
		margin-bottom: 24rpx;
		width: 100%;
		gap: 16rpx;
	}

	.garmin-btn,
	.update-btn,
	.report-btn {
		flex: 1;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 16rpx 12rpx;
		border-radius: 24rpx;
		font-size: 26rpx;
		font-weight: bold;
		box-shadow: 0 4rpx 12rpx rgba(0, 0, 0, 0.08);
		border: none;
		outline: none;
		transition: all 0.2s ease;
	}

	.garmin-btn {
		background: linear-gradient(135deg, #007aff 0%, #00b4d8 100%);
		color: #ffffff;
	}
	.garmin-btn.is-bound {
		background: linear-gradient(135deg, #10b981 0%, #059669 100%);
		color: #ffffff;
	}

	.update-btn {
		background: linear-gradient(135deg, #90e6dc 0%, #48cae4 100%);
		color: #1a365d;
	}

	.report-btn {
		background: linear-gradient(135deg, #6ee7b7 0%, #3b82f6 100%);
		color: #ffffff;
	}

	.garmin-icon,
	.update-icon,
	.report-icon {
		margin-right: 8rpx;
		font-size: 28rpx;
	}

	.garmin-text,
	.update-text,
	.report-text {
		font-size: 26rpx;
		white-space: nowrap;
	}

	.garmin-btn:active,
	.update-btn:active,
	.report-btn:active {
		transform: scale(0.96);
		opacity: 0.9;
	}

	/* 统一卡片基础样式 */
	.heart-rate-card,
	.sleep-card,
	.steps-card,
	.body-energy-card,
	.stress-card,
	.spo2-card {
		width: 48%;
		background-color: #ffffff;
		border-radius: 24rpx;
		padding: 24rpx;
		margin-bottom: 24rpx;
		box-sizing: border-box;
		box-shadow: 0 6rpx 16rpx rgba(0, 0, 0, 0.05);
		transition: transform 0.2s ease, box-shadow 0.2s ease;
	}

	.heart-rate-card:active,
	.sleep-card:active,
	.steps-card:active,
	.body-energy-card:active,
	.stress-card:active,
	.spo2-card:active {
		transform: translateY(2rpx);
		box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.08);
	}

	.heart-rate-card {
		background: linear-gradient(135deg, #fbf7ff 0%, #f3e8ff 100%);
		border: 1px solid #ebd4ff;
	}
	.sleep-card {
		background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
		border: 1px solid #c7d2fe;
	}
	.steps-card {
		background: linear-gradient(135deg, #fffbf0 0%, #ffedd5 100%);
		border: 1px solid #fed7aa;
	}
	.body-energy-card {
		background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
		border: 1px solid #bbf7d0;
	}
	.stress-card {
		background: linear-gradient(135deg, #fffcf0 0%, #fef3c7 100%);
		border: 1px solid #fde68a;
	}
	.spo2-card {
		background: linear-gradient(135deg, #fff1f2 0%, #ffe4e6 100%);
		border: 1px solid #fecdd3;
	}

	.label-row {
		display: flex;
		align-items: center;
		margin-bottom: 20rpx;
	}

	.icon-heart,
	.icon-sleep,
	.icon-steps,
	.icon-energy,
	.icon-stress,
	.icon-spo2 {
		width: 44rpx;
		height: 44rpx;
		margin-right: 12rpx;
	}

	.data-label {
		font-size: 28rpx;
		font-weight: bold;
		color: #1f2937;
	}

	.data-items {
		display: flex;
		flex-direction: column;
		gap: 12rpx;
		margin-bottom: 20rpx;
	}

	.data-value {
		font-size: 24rpx;
		color: #4b5563;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	.value-number {
		font-size: 30rpx;
		font-weight: bold;
		color: #111827;
	}

	.update-date {
		display: block;
		font-size: 20rpx;
		color: #9ca3af;
		text-align: right;
		border-top: 1px dashed rgba(0, 0, 0, 0.08);
		padding-top: 10rpx;
	}

	.space {
		flex: 1;
	}

	.energy-item {
		margin-bottom: 12rpx;
	}
	.energy-note {
		display: block;
		font-size: 20rpx;
		color: #6b7280;
		margin-top: 4rpx;
	}
	.tips-text {
		font-size: 20rpx;
		color: #92400e;
		margin-top: 6rpx;
		line-height: 1.4;
	}

	/* ========================================================== */
	/* 绑定账号弹窗样式                                          */
	/* ========================================================== */
	.bind-modal-mask {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(15, 23, 42, 0.65);
		backdrop-filter: blur(8px);
		z-index: 999;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 30rpx;
	}

	.bind-modal-dialog {
		width: 100%;
		max-width: 620rpx;
		background: #ffffff;
		border-radius: 36rpx;
		padding: 40rpx;
		box-sizing: border-box;
		box-shadow: 0 20rpx 48rpx rgba(0, 0, 0, 0.15);
		animation: modalFadeIn 0.25s ease-out;
	}

	@keyframes modalFadeIn {
		from { opacity: 0; transform: scale(0.92) translateY(20rpx); }
		to { opacity: 1; transform: scale(1) translateY(0); }
	}

	.bind-modal-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 24rpx;
	}

	.bind-header-title-row {
		display: flex;
		align-items: center;
		gap: 12rpx;
	}

	.bind-header-icon {
		font-size: 36rpx;
	}

	.bind-header-title {
		font-size: 34rpx;
		font-weight: 800;
		color: #0f172a;
	}

	.bind-close-btn {
		width: 56rpx;
		height: 56rpx;
		border-radius: 50%;
		background: #f1f5f9;
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
		padding: 16rpx 20rpx;
		border-radius: 20rpx;
		margin-bottom: 30rpx;
		font-size: 24rpx;
	}

	.status-bound {
		background: #ecfdf5;
		color: #065f46;
		border: 1px solid #a7f3d0;
	}
	.status-unbound {
		background: #fef2f2;
		color: #991b1b;
		border: 1px solid #fecaca;
	}

	.status-dot {
		width: 14rpx;
		height: 14rpx;
		border-radius: 50%;
		margin-right: 14rpx;
	}
	.status-bound .status-dot { background: #10b981; }
	.status-unbound .status-dot { background: #ef4444; }

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
		font-size: 26rpx;
		font-weight: 600;
		color: #334155;
	}

	.input-wrap {
		display: flex;
		align-items: center;
		background: #f8fafc;
		border: 1.5px solid #e2e8f0;
		border-radius: 20rpx;
		padding: 0 24rpx;
		height: 88rpx;
		transition: border-color 0.2s;
	}
	.input-wrap:focus-within {
		border-color: #3b82f6;
		background: #ffffff;
	}

	.form-input {
		flex: 1;
		height: 100%;
		font-size: 28rpx;
		color: #0f172a;
	}

	.clear-icon, .eye-icon {
		font-size: 32rpx;
		color: #94a3b8;
		padding: 10rpx;
	}

	.bind-notice-box {
		display: flex;
		align-items: flex-start;
		background: #f0fdfa;
		border: 1px solid #ccfbf1;
		border-radius: 18rpx;
		padding: 16rpx 20rpx;
		gap: 12rpx;
	}
	.notice-icon {
		font-size: 28rpx;
		margin-top: 2rpx;
	}
	.notice-text {
		font-size: 22rpx;
		color: #0f766e;
		line-height: 1.45;
	}

	.bind-actions {
		display: flex;
		flex-direction: column;
		gap: 16rpx;
	}

	.btn-bind-submit {
		width: 100%;
		height: 88rpx;
		background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
		color: #ffffff;
		border-radius: 24rpx;
		font-size: 30rpx;
		font-weight: bold;
		display: flex;
		align-items: center;
		justify-content: center;
		border: none;
		box-shadow: 0 6rpx 16rpx rgba(37, 99, 235, 0.3);
	}
	.btn-bind-submit:active { transform: scale(0.98); }

	.btn-bind-cancel {
		width: 100%;
		height: 80rpx;
		background: #fff1f2;
		color: #e11d48;
		border: 1px solid #fecdd3;
		border-radius: 24rpx;
		font-size: 28rpx;
		font-weight: 600;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.btn-bind-close {
		width: 100%;
		height: 80rpx;
		background: #f1f5f9;
		color: #64748b;
		border-radius: 24rpx;
		font-size: 28rpx;
		display: flex;
		align-items: center;
		justify-content: center;
		border: none;
	}

	/* ========================================================== */
	/* 历史数据可视化弹窗样式                                      */
	/* ========================================================== */
	.history-modal-mask {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(15, 23, 42, 0.7);
		backdrop-filter: blur(10px);
		z-index: 1000;
		display: flex;
		justify-content: center;
		align-items: flex-end;
	}

	.history-modal-dialog {
		width: 100%;
		height: 88vh;
		background: #f8fafc;
		border-top-left-radius: 40rpx;
		border-top-right-radius: 40rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		box-shadow: 0 -10rpx 40rpx rgba(0, 0, 0, 0.15);
		animation: slideUp 0.3s ease-out;
	}

	@keyframes slideUp {
		from { transform: translateY(100%); }
		to { transform: translateY(0); }
	}

	.history-modal-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 30rpx 36rpx 20rpx 36rpx;
		background: #ffffff;
		border-top-left-radius: 40rpx;
		border-top-right-radius: 40rpx;
		border-bottom: 1px solid #f1f5f9;
	}

	.history-header-left {
		display: flex;
		align-items: center;
		gap: 16rpx;
	}

	.history-header-icon {
		font-size: 40rpx;
	}

	.history-title-wrap {
		display: flex;
		flex-direction: column;
	}

	.history-modal-title {
		font-size: 34rpx;
		font-weight: 800;
		color: #0f172a;
	}

	.history-modal-sub {
		font-size: 22rpx;
		color: #64748b;
		margin-top: 4rpx;
	}

	.history-close-btn {
		width: 60rpx;
		height: 60rpx;
		border-radius: 50%;
		background: #f1f5f9;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.history-close-icon {
		font-size: 28rpx;
		color: #64748b;
	}

	/* 时间范围切换条 */
	.period-tabs-bar {
		display: flex;
		background: #ffffff;
		padding: 10rpx 36rpx 16rpx 36rpx;
		gap: 16rpx;
	}

	.period-tab {
		flex: 1;
		height: 64rpx;
		display: flex;
		align-items: center;
		justify-content: center;
		background: #f1f5f9;
		border-radius: 32rpx;
		font-size: 24rpx;
		font-weight: 600;
		color: #64748b;
		transition: all 0.2s ease;
	}
	.period-tab.active {
		background: #0ea5e9;
		color: #ffffff;
		box-shadow: 0 4rpx 12rpx rgba(14, 165, 233, 0.3);
	}

	/* 指标横向滑动 Tab */
	.metric-tabs-scroll {
		background: #ffffff;
		padding: 0 0 16rpx 0;
		border-bottom: 1px solid #e2e8f0;
		white-space: nowrap;
	}

	.metric-tabs-track {
		display: inline-flex;
		padding: 0 30rpx;
		gap: 16rpx;
	}

	.metric-tab {
		display: inline-flex;
		align-items: center;
		padding: 12rpx 24rpx;
		border-radius: 30rpx;
		background: #f8fafc;
		border: 1px solid #e2e8f0;
		gap: 8rpx;
		transition: all 0.2s;
	}

	.metric-tab.active {
		background: #0f172a;
		border-color: #0f172a;
	}

	.metric-tab-icon {
		font-size: 26rpx;
	}

	.metric-tab-title {
		font-size: 24rpx;
		font-weight: 600;
		color: #475569;
	}

	.metric-tab.active .metric-tab-title {
		color: #ffffff;
	}

	.history-scroll-content {
		flex: 1;
		padding: 24rpx 30rpx 50rpx 30rpx;
		box-sizing: border-box;
	}

	/* KPI 卡片 */
	.kpi-summary-card {
		display: flex;
		align-items: center;
		background: #ffffff;
		border-radius: 28rpx;
		padding: 24rpx 20rpx;
		margin-bottom: 24rpx;
		box-shadow: 0 4rpx 16rpx rgba(0, 0, 0, 0.04);
	}

	.kpi-item {
		flex: 1;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 6rpx;
	}

	.kpi-label {
		font-size: 22rpx;
		color: #64748b;
	}

	.kpi-val-row {
		display: flex;
		align-items: baseline;
		gap: 4rpx;
	}

	.kpi-value {
		font-size: 34rpx;
		font-weight: 800;
	}

	.kpi-unit {
		font-size: 20rpx;
		color: #94a3b8;
	}

	.kpi-divider {
		width: 1px;
		height: 48rpx;
		background: #e2e8f0;
	}

	/* 图表卡片 */
	.chart-visual-card {
		background: #ffffff;
		border-radius: 28rpx;
		padding: 28rpx;
		margin-bottom: 24rpx;
		box-shadow: 0 4rpx 16rpx rgba(0, 0, 0, 0.04);
	}

	.chart-card-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 28rpx;
	}

	.chart-header-left {
		display: flex;
		align-items: center;
		gap: 12rpx;
	}

	.chart-header-dot {
		width: 14rpx;
		height: 14rpx;
		border-radius: 50%;
	}

	.chart-header-title {
		font-size: 28rpx;
		font-weight: 700;
		color: #1e293b;
	}

	.chart-header-subtitle {
		font-size: 22rpx;
		color: #94a3b8;
	}

	.bar-chart-container {
		width: 100%;
		padding-top: 20rpx;
	}

	.bars-flex-wrap {
		display: flex;
		justify-content: space-around;
		align-items: flex-end;
		height: 280rpx;
		padding-bottom: 40rpx;
		position: relative;
		border-bottom: 1.5px dashed #e2e8f0;
	}

	.bar-column-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		height: 100%;
		justify-content: flex-end;
		position: relative;
		cursor: pointer;
		min-width: 60rpx;
	}

	.bar-top-value {
		font-size: 18rpx;
		font-weight: bold;
		color: #64748b;
		margin-bottom: 10rpx;
		white-space: nowrap;
	}

	.bar-column-item.active .bar-top-value {
		color: #0f172a;
		transform: scale(1.1);
	}

	.bar-track {
		width: 32rpx;
		height: 180rpx;
		background: #f1f5f9;
		border-radius: 16rpx;
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
		overflow: hidden;
	}

	.bar-fill {
		width: 100%;
		border-radius: 16rpx;
		transition: height 0.4s ease;
		position: relative;
	}

	.peak-dot {
		position: absolute;
		top: 6rpx;
		left: 50%;
		transform: translateX(-50%);
		width: 8rpx;
		height: 8rpx;
		border-radius: 50%;
		background: #ffffff;
	}

	.bar-date-label {
		position: absolute;
		bottom: -36rpx;
		font-size: 20rpx;
		color: #94a3b8;
		white-space: nowrap;
	}

	.bar-column-item.active .bar-date-label {
		color: #0f172a;
		font-weight: bold;
	}

	.chart-empty-placeholder {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 50rpx 0;
		gap: 16rpx;
	}
	.chart-empty-icon { font-size: 48rpx; }
	.chart-empty-text { font-size: 24rpx; color: #94a3b8; }

	/* 历史明细记录列表 */
	.history-list-section {
		display: flex;
		flex-direction: column;
		gap: 16rpx;
	}

	.list-section-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 4rpx;
	}

	.list-section-title {
		font-size: 28rpx;
		font-weight: 700;
		color: #1e293b;
	}

	.list-section-count {
		font-size: 22rpx;
		color: #94a3b8;
	}

	.history-record-cards {
		display: flex;
		flex-direction: column;
		gap: 16rpx;
	}

	.history-rec-card {
		background: #ffffff;
		border-radius: 24rpx;
		padding: 24rpx;
		box-shadow: 0 4rpx 14rpx rgba(0, 0, 0, 0.03);
		border: 1px solid #f1f5f9;
	}

	.rec-card-top {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 20rpx;
		padding-bottom: 14rpx;
		border-bottom: 1px solid #f8fafc;
	}

	.rec-date-pill {
		display: flex;
		align-items: center;
		gap: 8rpx;
	}

	.rec-cal-icon {
		font-size: 24rpx;
	}

	.rec-date-text {
		font-size: 26rpx;
		font-weight: 700;
		color: #0f172a;
	}

	.rec-status-badge {
		font-size: 20rpx;
		font-weight: 600;
		padding: 6rpx 16rpx;
		border-radius: 20rpx;
	}

	.tag-green { background: #ecfdf5; color: #059669; }
	.tag-blue { background: #eff6ff; color: #2563eb; }
	.tag-yellow { background: #fefce8; color: #ca8a04; }
	.tag-orange { background: #fff7ed; color: #ea580c; }
	.tag-purple { background: #faf5ff; color: #9333ea; }
	.tag-gray { background: #f3f4f6; color: #6b7280; }

	.rec-grid-metrics {
		display: flex;
		justify-content: space-between;
	}

	.rec-metric-cell {
		display: flex;
		flex-direction: column;
		gap: 4rpx;
	}

	.cell-label {
		font-size: 22rpx;
		color: #64748b;
	}

	.cell-val-row {
		display: flex;
		align-items: baseline;
		gap: 4rpx;
	}

	.cell-val {
		font-size: 28rpx;
		font-weight: 800;
	}

	.cell-unit {
		font-size: 20rpx;
		color: #94a3b8;
	}

	.history-empty-card {
		background: #ffffff;
		border-radius: 28rpx;
		padding: 60rpx 40rpx;
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center;
		gap: 16rpx;
		border: 1px dashed #cbd5e1;
	}

	.empty-icon { font-size: 64rpx; }
	.empty-title { font-size: 30rpx; font-weight: 700; color: #334155; }
	.empty-desc { font-size: 24rpx; color: #64748b; line-height: 1.5; }

	.empty-sync-btn {
		margin-top: 16rpx;
		background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%);
		color: #ffffff;
		font-size: 26rpx;
		font-weight: bold;
		padding: 16rpx 40rpx;
		border-radius: 30rpx;
		border: none;
	}

	.history-footer-note {
		margin-top: 30rpx;
		text-align: center;
	}

	.footer-note-text {
		font-size: 20rpx;
		color: #94a3b8;
	}
</style>
"""

new_full_text = template_part + script_code + "\n" + style_code

with open(file_path, "w", encoding="utf-8") as f:
    f.write(new_full_text)

print("Successfully updated BraceletData.vue with new script and styles!")
