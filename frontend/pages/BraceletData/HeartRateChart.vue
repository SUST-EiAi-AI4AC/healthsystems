<template>
	<view class="total">
		<div class="title">
			最近{{this.period}}天的最大心率
		</div>
		<div class="sportshour-wrapper">
			<l-echart class="sportshour" ref="maxHeartRate" @finished="initDrawMaxHeartRate"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">最大心率</b>是一定时间内心率的<b>最高值</b>，可反映身体在<b
				style="color: rgb(85, 156, 255)">活动时的心脏负荷能力</b>。
		</p>

		<div class="title">
			最近{{this.period}}天的最小心率
		</div>
		<div class="sportshour-wrapper">
			<l-echart class="sportshour" ref="minHeartRate" @finished="initDrawMinHeartrate"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">最小心率</b>通常出现在休息或睡眠时，<b>较低且稳定</b>的数值一般提示<b
				style="color: rgb(85, 156, 255)">心脏功能较好</b>。

		<div class="title">
			最近{{this.period}}天的静息心率
		</div>
		<div class="sportshour-wrapper">
			<l-echart class="sportshour" ref="restingHeartRate" @finished="initDrawRestHeartrate"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">静息心率</b>是清醒且安静状态下的心率，<b>静息心率偏低</b>通常与<b
				style="color: rgb(85, 156, 255)">良好的心血管健康状况</b>相关。
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
				heartrateData: [], // 心率原始数据
				dateList: [], // 日期列表

				// 心率数据数组
				maxHeartRateData: [],
				minHeartRateData: [],
				restingHeartRateData: [],

				// 异常数据标记
				extremMaxHeart: [],
				extremMinHeart: [],
				extremRestHeart: []
			}
		},
		onLoad() {
			this.getHeartrateHistory();
		},
		methods: {
			// 获取心率历史数据
			getHeartrateHistory() {
				let _this = this;
				if (this.dataGeted) return;

				http.get("/healthInfo/getHeartrateHistory?period=" + _this.period).then(response => {
					this.heartrateData = response.result;
					console.log("心率历史数据:", this.heartrateData);

					// 按日期排序（升序）
					this.heartrateData.sort((a, b) => Date.parse(a.calendarDate) - Date.parse(b.calendarDate));

					// 处理数据
					this.processHeartrateData();
					this.dataGeted = true;
				}, err => {
					console.error("获取心率数据失败：", err);
				});
			},

			// 处理心率数据
			processHeartrateData() {
				// 清空数据
				this.dateList = [];
				this.maxHeartRateData = [];
				this.minHeartRateData = [];
				this.restingHeartRateData = [];
				this.extremMaxHeart = [];
				this.extremMinHeart = [];
				this.extremRestHeart = [];

				for (let i = 0; i < this.heartrateData.length; i++) {
					const item = this.heartrateData[i];
					const date = this.formatDate(item.calendarDate);
					this.dateList.push(date);

					// 处理最大心率
					if (item.maxHeartRate && item.maxHeartRate > 0) {
						this.maxHeartRateData.push(item.maxHeartRate);
					} else {
						this.maxHeartRateData.push(-0.01);
						this.extremMaxHeart.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理最小心率
					if (item.minHeartRate && item.minHeartRate > 0) {
						this.minHeartRateData.push(item.minHeartRate);
					} else {
						this.minHeartRateData.push(-0.01);
						this.extremMinHeart.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理静息心率
					if (item.restingHeartRate && item.restingHeartRate > 0) {
						this.restingHeartRateData.push(item.restingHeartRate);
					} else {
						this.restingHeartRateData.push(-0.01);
						this.extremRestHeart.push({
							xAxis: date,
							yAxis: -0.01
						});
					}
				}
			},

			// 格式化日期为 MM-DD 格式
			formatDate(dateStr) {
				const date = new Date(dateStr);
				const month = date.getMonth() + 1;
				const day = date.getDate();
				return `${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;
			},

			// 最大心率图表初始化
			async initDrawMaxHeartRate() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawMaxHeartRate, 500);
				} else {
					const charts = await this.$refs.maxHeartRate.init(echarts);
					this.drawHeartrateChart(charts, '最大心率', this.maxHeartRateData, this.extremMaxHeart, 30, 180);
				}
			},

			// 最小心率图表初始化
			async initDrawMinHeartrate() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawMinHeartrate, 500);
				} else {
					const charts = await this.$refs.minHeartRate.init(echarts);
					this.drawHeartrateChart(charts, '最小心率', this.minHeartRateData, this.extremMinHeart, 30, 120);
				}
			},

			// 静息心率图表初始化
			async initDrawRestHeartrate() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawRestHeartrate, 500);
				} else {
					const charts = await this.$refs.restingHeartRate.init(echarts);
					this.drawHeartrateChart(charts, '静息心率', this.restingHeartRateData, this.extremRestHeart, 30, 100);
				}
			},

			// 绘制心率图表通用方法
			drawHeartrateChart(charts, title, data, extremData, minY, maxY) {
				charts.setOption({
					title: {
						text: title,
						textStyle: {
							color: "white",
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
									title + ':' + param.value + ' 次/分钟'
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
						name: "次/分钟",
						min: minY,
						max: maxY,
						axisLabel: {
							color: "white",
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
						type: 'line',
						smooth: true,
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
	}

	.title {
		font-size: 1.2em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px;
		margin: 10px auto;
		border-left: 8px solid #a18cd1;
		/* 心率用红色系标识 */
	}

	.sportshour-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		/* 固定图表高度 */
		border-radius: 10px;
		background: #a18cd1;
		/* 心率图表用紫色背景 */
		margin-left: 10rpx;
		margin-right: 10rpx;
		padding-bottom: 20px;
	}

	.sportshour {
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