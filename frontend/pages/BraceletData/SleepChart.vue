<template>
	<view class="total">
		<!-- 睡眠分数图表 -->
		<div class="title">
			最近{{this.period}}天的睡眠分数
		</div>
		<div class="chart-wrapper">
			<l-echart class="sleep-chart" ref="sleepScoreChart" @finished="initDrawSleepScore"></l-echart>
		</div>
		<!-- <b>：是一个加粗标签，用于将包裹的文字加粗显示 -->
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">睡眠分数</b>反映了你的<b>睡眠质量</b>，<b style="color: rgb(85, 156, 255)">分数越高</b>表示<b>睡眠质量越好</b>。
		</p>

		<!-- 睡眠压力图表 -->
		<div class="title">
			最近{{this.period}}天的睡眠压力
		</div>
		<div class="chart-wrapper">
			<l-echart class="sleep-chart" ref="sleepStressChart" @finished="initDrawSleepStress"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">睡眠压力</b>反映了你在睡眠过程中的<b>压力水平</b>，<b style="color: rgb(85, 156, 255)">数值越低</b>表示<b>睡眠压力越小</b>。
		</p>

		<!-- 深睡时长图表 -->
		<div class="title">
			最近{{this.period}}天的深睡时长
		</div>
		<div class="chart-wrapper">
			<l-echart class="sleep-chart" ref="deepSleepChart" @finished="initDrawDeepSleep"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">深睡时长</b>是睡眠中深度睡眠的时间，<b>深度睡眠</b>对<b style="color: rgb(85, 156, 255)">身体恢复</b>非常重要。
		</p>

		<!-- 浅睡时长图表 -->
		<div class="title">
			最近{{this.period}}天的浅睡时长
		</div>
		<div class="chart-wrapper">
			<l-echart class="sleep-chart" ref="lightSleepChart" @finished="initDrawLightSleep"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">浅睡时长</b>是睡眠中浅度睡眠的时间，<b>浅度睡眠</b>对<b style="color: rgb(85, 156, 255)">大脑恢复</b>非常重要。
		</p>

		<!-- 快速眼动时长图表 -->
		<div class="title">
			最近{{this.period}}天的快速眼动时长
		</div>
		<div class="chart-wrapper">
			<l-echart class="sleep-chart" ref="remSleepChart" @finished="initDrawRemSleep"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">快速眼动时长</b>是睡眠中快速眼动睡眠的时间，<b>快速眼动睡眠</b>对<b style="color: rgb(85, 156, 255)">记忆和学习</b>非常重要。
		</p>

		<!-- 清醒时长图表 -->
		<div class="title">
			最近{{this.period}}天的清醒时长
		</div>
		<div class="chart-wrapper">
			<l-echart class="sleep-chart" ref="awakeSleepChart" @finished="initDrawAwakeSleep"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">清醒时长</b>是睡眠中清醒的时间，<b style="color: rgb(85, 156, 255)">过长的清醒时长</b>可能会影响<b>睡眠质量</b>。
		</p>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";
	import * as echarts from '@/uni_modules/lime-echart/static/echarts.min'

	export default {
		data() {
			return {
				dataGeted: false,
				period: 7,
				sleepData: [], // 睡眠原始数据
				dateList: [], // 日期列表

				// 睡眠数据数组
				sleep_score_overallData: [], // 睡眠分数
				avgSleepStressData: [], // 睡眠压力
				deepSleepSecondsData: [], // 深睡时长
				lightSleepSecondsData: [], // 浅睡时长
				remSleepSecondsData: [], // 快速眼动时长
				awakeSleepSecondsData: [], // 清醒时长

				// 异常数据标记
				extremSleepScore: [],
				extremSleepStress: [],
				extremDeepSleep: [],
				extremLightSleep: [],
				extremRemSleep: [],
				extremAwakeSleep: []
			}
		},
		onLoad() {
			this.getSleepHistory();
		},
		methods: {
			// 获取睡眠历史数据
			getSleepHistory() {
				let _this = this;
				if (this.dataGeted) return;

				http.get("/healthInfo/getSleepHistory?period=" + _this.period).then(response => {
					this.sleepData = response.result;
					console.log("睡眠历史数据:", this.sleepData);

					// 按日期排序（升序）
					this.sleepData.sort((a, b) => Date.parse(a.calendarDate) - Date.parse(b.calendarDate));

					// 处理数据
					this.processSleepData();
					this.dataGeted = true;
				}, err => {
					console.error("获取睡眠数据失败：", err);
				});
			},

			// 处理睡眠数据
			processSleepData() {
				// 清空数据
				this.dateList = [];
				this.sleep_score_overallData = [];
				this.avgSleepStressData = [];
				this.deepSleepSecondsData = [];
				this.lightSleepSecondsData = [];
				this.remSleepSecondsData = [];
				this.awakeSleepSecondsData = [];

				this.extremSleepScore = [];
				this.extremSleepStress = [];
				this.extremDeepSleep = [];
				this.extremLightSleep = [];
				this.extremRemSleep = [];
				this.extremAwakeSleep = [];

				for (let i = 0; i < this.sleepData.length; i++) {
					const item = this.sleepData[i];
					const date = this.formatDate(item.calendarDate);
					this.dateList.push(date);

					// 处理睡眠分数
					if (item.sleep_score_overall !== undefined && item.sleep_score_overall !== null && item.sleep_score_overall !== '暂无数据') {
						this.sleep_score_overallData.push(Number(item.sleep_score_overall));
					} else {
						this.sleep_score_overallData.push(-0.01);
						this.extremSleepScore.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理睡眠压力
					if (item.avgSleepStress !== undefined && item.avgSleepStress !== null && item.avgSleepStress !==
						'暂无数据') {
						this.avgSleepStressData.push(Number(item.avgSleepStress));
					} else {
						this.avgSleepStressData.push(-0.01);
						this.extremSleepStress.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理深睡时长（转换为小时数，保留两位小数）
					const deepSleepSeconds = this.parseDuration(item.deepSleepSeconds);
					if (deepSleepSeconds >= 0) {
						this.deepSleepSecondsData.push(parseFloat((deepSleepSeconds / 3600).toFixed(2)));
					} else {
						this.deepSleepSecondsData.push(-0.01);
						this.extremDeepSleep.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理浅睡时长（转换为小时数，保留两位小数）
					const lightSleepSeconds = this.parseDuration(item.lightSleepSeconds);
					if (lightSleepSeconds >= 0) {
						this.lightSleepSecondsData.push(parseFloat((lightSleepSeconds / 3600).toFixed(2)));
					} else {
						this.lightSleepSecondsData.push(-0.01);
						this.extremLightSleep.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理快速眼动时长（转换为小时数，保留两位小数）
					const remSleepSeconds = this.parseDuration(item.remSleepSeconds);
					if (remSleepSeconds >= 0) {
						this.remSleepSecondsData.push(parseFloat((remSleepSeconds / 3600).toFixed(2)));
					} else {
						this.remSleepSecondsData.push(-0.01);
						this.extremRemSleep.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理清醒时长（转换为小时数，保留两位小数）
					const awakeSleepSeconds = this.parseDuration(item.awakeSleepSeconds);
					if (awakeSleepSeconds >= 0) {
						this.awakeSleepSecondsData.push(parseFloat((awakeSleepSeconds / 3600).toFixed(2)));
					} else {
						this.awakeSleepSecondsData.push(-0.01);
						this.extremAwakeSleep.push({
							xAxis: date,
							yAxis: -0.01
						});
					}
				}

				console.log("处理后的数据:", {
					dateList: this.dateList,
					sleep_score_overallData: this.sleep_score_overallData,
					avgSleepStressData: this.avgSleepStressData,
					deepSleepSecondsData: this.deepSleepSecondsData,
					lightSleepSecondsData: this.lightSleepSecondsData,
					remSleepSecondsData: this.remSleepSecondsData,
					awakeSleepSecondsData: this.awakeSleepSecondsData
				});
			},

			// 将秒数转换为"1h55min"格式
			formatDuration(seconds) {
				const hours = Math.floor(seconds / 3600);
				const minutes = Math.floor((seconds % 3600) / 60);

				let result = '';
				if (hours > 0) {
					result += hours + 'h';
				}
				if (minutes > 0) {
					result += minutes + 'min';
				}

				return result;
			},

			// 解析时长字符串（如"1h31min"）为秒数
			parseDuration(durationStr) {
				if (!durationStr || durationStr === '0min' || durationStr === '0h0min') {
					return 0;
				}

				const hoursMatch = durationStr.match(/(\d+)h/);
				const minutesMatch = durationStr.match(/(\d+)min/);

				let hours = 0;
				let minutes = 0;

				if (hoursMatch) {
					hours = parseInt(hoursMatch[1]);
				}

				if (minutesMatch) {
					minutes = parseInt(minutesMatch[1]);
				}

				return hours * 3600 + minutes * 60;
			},
			// 格式化日期为 MM-DD 格式
			formatDate(dateStr) {
				const date = new Date(dateStr);
				const month = date.getMonth() + 1;
				const day = date.getDate();
				return `${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;
			},

			// 睡眠分数图表初始化
			async initDrawSleepScore() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawSleepScore, 500);
				} else {
					const charts = await this.$refs.sleepScoreChart.init(echarts);
					this.drawSleepChart(charts, '睡眠分数', this.sleep_score_overallData, this.extremSleepScore, 0, 100, '分');
				}
			},

			// 睡眠压力图表初始化
			async initDrawSleepStress() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawSleepStress, 500);
				} else {
					const charts = await this.$refs.sleepStressChart.init(echarts);
					this.drawSleepChart(charts, '睡眠压力', this.avgSleepStressData, this.extremSleepStress, 0, 10, '');
				}
			},

			// 深睡时长图表初始化
			async initDrawDeepSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawDeepSleep, 500);
				} else {
					const charts = await this.$refs.deepSleepChart.init(echarts);
					this.drawSleepChart(charts, '深睡时长', this.deepSleepSecondsData, this.extremDeepSleep, 0, 4, '小时');
				}
			},

			// 浅睡时长图表初始化
			async initDrawLightSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawLightSleep, 500);
				} else {
					const charts = await this.$refs.lightSleepChart.init(echarts);
					this.drawSleepChart(charts, '浅睡时长', this.lightSleepSecondsData, this.extremLightSleep, 0, 6, '小时');
				}
			},

			// 快速眼动时长图表初始化
			async initDrawRemSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawRemSleep, 500);
				} else {
					const charts = await this.$refs.remSleepChart.init(echarts);
					this.drawSleepChart(charts, '快速眼动时长', this.remSleepSecondsData, this.extremRemSleep, 0, 2, '小时');
				}
			},

			// 清醒时长图表初始化
			async initDrawAwakeSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawAwakeSleep, 500);
				} else {
					const charts = await this.$refs.awakeSleepChart.init(echarts);
					this.drawSleepChart(charts, '清醒时长', this.awakeSleepSecondsData, this.extremAwakeSleep, 0, 2, '小时');
				}
			},

			// 绘制睡眠图表通用方法
			drawSleepChart(charts, title, data, extremData, unit, chartType = 'line') {
				charts.setOption({
					title: {
						text: title,
						textStyle: {
							color: "white",
						}
					},
					color: ["#ffffff"],
					tooltip: {
						trigger: chartType === 'line' ? 'axis' : 'item',
						axisPointer: chartType === 'line' ? {
							type: "line"
						} : {
							type: "shadow"
						},
						formatter: (param) => {
							if (Array.isArray(param)) {
								param = param[0];
							}
							if (param.value === -0.01) {
								return [
									'日期:' + param.name + '\n',
									"无数据"
								].join('');
							} else {
								return [
									'日期:' + param.name + '\n',
									title + ':' + param.value + ' ' + unit
								].join('');
							}
						}
					},
					grid: {
						left: '3%',
						right: '4%',
						bottom: '3%',
						containLabel: true
					},
					legend: {
						left: 'right',
						data: [title],
						textStyle: {
							color: "white",
						},
						selectedMode: false
					},
					xAxis: {
						name: "日期",
						data: this.dateList,
						axisLabel: {
							interval: 0,
							rotate: -60,
							color: "white",
						},
						axisTick: {
							alignWithLabel: true,
						},
						axisLine: {
							lineStyle: {
								color: "white",
							}
						}
					},
					yAxis: {
						name: unit,
						type: 'value',
						min: 0,
						axisLabel: {
							color: "white",
							formatter: '{value}'
						},
						axisLine: {
							lineStyle: {
								color: "white",
							}
						},
						splitLine: {
							show: true,
							lineStyle: {
								color: 'rgba(255, 255, 255, 0.2)'
							}
						}
					},
					series: [{
						name: title,
						type: chartType,
						smooth: chartType === 'line',
						barWidth: chartType === 'bar' ? '40%' : undefined,
						data: data,
						markPoint: {
							symbol: 'triangle',
							symbolSize: 15,
							itemStyle: {
								color: 'rgb(234, 129, 87)',
								borderWidth: 0,
							},
							label: {
								formatter: "无数据",
								fontSize: 10,
								color: 'white',
								textBorderWidth: 2
							},
							data: extremData
						}
					}]
				})
			},
			// 睡眠分数图表初始化
			async initDrawSleepScore() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawSleepScore, 500);
				} else {
					const charts = await this.$refs.sleepScoreChart.init(echarts);
					this.drawSleepChart(charts, '睡眠分数', this.sleep_score_overallData, this.extremSleepScore, '分', 'line');
				}
			},

			// 睡眠压力图表初始化
			async initDrawSleepStress() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawSleepStress, 500);
				} else {
					const charts = await this.$refs.sleepStressChart.init(echarts);
					this.drawSleepChart(charts, '睡眠压力', this.avgSleepStressData, this.extremSleepStress, '', 'line');
				}
			},

			// 深睡时长图表初始化
			async initDrawDeepSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawDeepSleep, 500);
				} else {
					const charts = await this.$refs.deepSleepChart.init(echarts);
					this.drawSleepChart(charts, '深睡时长', this.deepSleepSecondsData, this.extremDeepSleep, '小时');
				}
			},

			// 浅睡时长图表初始化
			async initDrawLightSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawLightSleep, 500);
				} else {
					const charts = await this.$refs.lightSleepChart.init(echarts);
					this.drawSleepChart(charts, '浅睡时长', this.lightSleepSecondsData, this.extremLightSleep, '小时');
				}
			},

			// 快速眼动时长图表初始化
			async initDrawRemSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawRemSleep, 500);
				} else {
					const charts = await this.$refs.remSleepChart.init(echarts);
					this.drawSleepChart(charts, '快速眼动时长', this.remSleepSecondsData, this.extremRemSleep, '小时');
				}
			},

			// 清醒时长图表初始化
			async initDrawAwakeSleep() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawAwakeSleep, 500);
				} else {
					const charts = await this.$refs.awakeSleepChart.init(echarts);
					this.drawSleepChart(charts, '清醒时长', this.awakeSleepSecondsData, this.extremAwakeSleep, '小时');
				}
			}
		}
	}
</script>

<style lang="scss" scoped>
	.total {
		width: 100%;
		height: 100%;
		padding-bottom: 10px;
	}

	.title {
		font-size: 1.2em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px;
		margin: 10px auto;
		border-left: 8px solid #2196F3;
		/* 睡眠用蓝色系标识 */
	}

	.chart-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		border-radius: 10px;
		background: #6bb3ff;
		/* 睡眠图表用蓝色背景 */
		margin-left: 10rpx;
		margin-right: 10rpx;
		padding-bottom: 20px;
	}

	.sleep-chart {
		width: 96%;
		height: 260px;
		margin: 0 auto;
	}

	.note {
		margin-top: 5px;
		margin-left: 5px;
		font-size: 1em;
		color: rgb(100, 100, 100);
	}
</style>