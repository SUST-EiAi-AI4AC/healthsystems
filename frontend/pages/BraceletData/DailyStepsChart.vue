<template>
	<view class="total">
		<div class="title">
			最近{{this.period}}天的运动步数
		</div>
		<div class="steps-wrapper">
			<l-echart class="steps-chart" ref="stepsChart" @finished="initDrawStepsChart"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">运动步数</b>是您在一天内行走的步数总和，<b>步数数据</b>对<b
				style="color: rgb(85, 156, 255)">评估日常活动量和健康状况</b>非常重要。
		</p>

		<div class="title">
			最近{{this.period}}天的行走距离
		</div>
		<div class="steps-wrapper">
			<l-echart class="steps-chart" ref="distanceChart" @finished="initDrawDistanceChart"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">行走距离</b>是您在一天内行走的总距离，<b>距离数据</b>对<b
				style="color: rgb(85, 156, 255)">评估日常活动强度和健康状况</b>非常重要。
		</p>

		<div class="title">
			最近{{this.period}}天的目标步数
		</div>
		<div class="steps-wrapper">
			<l-echart class="steps-chart" ref="goalChart" @finished="initDrawGoalChart"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">目标步数</b>是系统自动设定的每日行走目标，<b>目标数据</b>对<b
				style="color: rgb(85, 156, 255)">激励自己保持活跃和健康</b>非常重要。
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
				stepsData: [], // 步数原始数据
				dateList: [], // 日期列表

				// 步数相关数据数组
				stepsList: [], // 运动步数
				distanceList: [], // 行走距离(公里)
				goalList: [], // 目标步数

				// 异常数据标记
				extremSteps: [],
				extremDistance: [],
				extremGoal: []
			}
		},
		onLoad() {
			this.getStepsHistory();
		},
		methods: {
			// 获取步数历史数据
			getStepsHistory() {
				let _this = this;
				if (this.dataGeted) return;

				http.get(`${config.baseUrl}/healthInfo/getStepsHistory?period=${_this.period}`)
					.then(response => {
						this.stepsData = response.result;
						console.log("步数历史数据:", this.stepsData);

						// 按日期排序（升序）
						this.stepsData.sort((a, b) => Date.parse(a.calendarDate) - Date.parse(b.calendarDate));

						// 处理数据
						this.processStepsData();
						this.dataGeted = true;
					})
					.catch(err => {
						console.error("获取步数数据失败：", err);
						uni.showToast({
							title: '获取数据失败',
							icon: 'none'
						});
					});
			},

			// 处理步数数据
			processStepsData() {
				// 清空数据
				this.dateList = [];
				this.stepsList = [];
				this.distanceList = [];
				this.goalList = [];
				this.extremSteps = [];
				this.extremDistance = [];
				this.extremGoal = [];

				for (let i = 0; i < this.stepsData.length; i++) {
					const item = this.stepsData[i];
					const date = this.formatDate(item.calendarDate);
					this.dateList.push(date);

					// 处理运动步数
					if (item.totalSteps && item.totalSteps >= 0) {
						this.stepsList.push(item.totalSteps);
					} else {
						this.stepsList.push(-0.01);
						this.extremSteps.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理行走距离（米转公里）
					if (item.totalDistance && item.totalDistance >= 0) {
						this.distanceList.push((item.totalDistance / 1000).toFixed(1) * 1);
					} else {
						this.distanceList.push(-0.01);
						this.extremDistance.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理目标步数
					if (item.stepGoal && item.stepGoal >= 0) {
						this.goalList.push(item.stepGoal);
					} else {
						this.goalList.push(-0.01);
						this.extremGoal.push({
							xAxis: date,
							yAxis: -0.01
						});
					}
				}
			},

			// 格式化日期为 MM-DD 格式
			formatDate(dateStr) {
				if (!dateStr) return '';
				const date = new Date(dateStr);
				const month = date.getMonth() + 1;
				const day = date.getDate();
				return `${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;
			},

			// 运动步数图表初始化
			async initDrawStepsChart() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawStepsChart, 500);
				} else {
					const charts = await this.$refs.stepsChart.init(echarts);
					this.drawStepsChart(charts, '运动步数', this.stepsList, this.extremSteps, 0, 20000, '步');
				}
			},

			// 行走距离图表初始化
			async initDrawDistanceChart() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawDistanceChart, 500);
				} else {
					const charts = await this.$refs.distanceChart.init(echarts);
					this.drawStepsChart(charts, '行走距离', this.distanceList, this.extremDistance, 0, 20, '公里');
				}
			},

			// 目标步数图表初始化
			async initDrawGoalChart() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawGoalChart, 500);
				} else {
					const charts = await this.$refs.goalChart.init(echarts);
					this.drawStepsChart(charts, '目标步数', this.goalList, this.extremGoal, 0, 20000, '步');
				}
			},

			// 绘制步数相关图表通用方法
			drawStepsChart(charts, title, data, extremData, minY, maxY, unit) {
				charts.setOption({
					title: {
						text: title,
						textStyle: {
							color: "#ffffff",
						}
					},
					color: ["#ffffff"],
					tooltip: {
						trigger: 'axis',
						axisPointer: {
							type: "line"
						},
						formatter: (param) => {
							param = param[0];
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
							color: "#ffffff",
						},
						selectedMode: false
					},
					xAxis: {
						name: "日期",
						data: this.dateList,
						axisLabel: {
							interval: 0,
							rotate: -60,
							color: "#ffffff",
						},
						axisTick: {
							alignWithLabel: true,
						},
						axisLine: {
							lineStyle: {
								color: "#ffffff",
							}
						}
					},
					yAxis: {
						name: unit,
						min: minY,
						max: maxY,
						axisLabel: {
							color: "#ffffff",
						},
						axisLine: {
							lineStyle: {
								color: "#ffffff",
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
						type: 'line',
						smooth: true,
						markPoint: {
							symbol: 'triangle',
							symbolSize: 15,
							itemStyle: {
								color: '#ff9800',
								borderWidth: 0,
							},
							label: {
								formatter: "无数据",
								fontSize: 10,
								color: 'white',
								textBorderWidth: 2
							},
							data: extremData
						},
						data: data
					}]
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.total {
		width: 100%;
		height: 100%;
		padding-bottom: 10px;
		background-color: #f9f9f9;
	}

	.title {
		font-size: 1.2em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px;
		margin: 10px auto;
		border-left: 8px solid #ff7a00;
		/* 运动用橙色系标识 */
	}

	.steps-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		border-radius: 10px;
		background: #ef8c12;
		/* 运动图表用橙色背景 */
		margin-left: 10rpx;
		margin-right: 10rpx;
		padding-bottom: 20px;
	}

	.steps-chart {
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