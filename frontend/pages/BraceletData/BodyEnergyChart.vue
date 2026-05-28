<template>
	<view class="total">
		<div class="title">
			最近{{ this.period }}天的充能变化
		</div>
		<div class="sportshour-wrapper">
			<l-echart class="sportshour" ref="charged" @finished="initDrawCharged"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">充能</b>是身体恢复的能量值，反映身体在一天中<b>恢复</b>的能量情况，对<b
				style="color: rgb(85, 156, 255)">身体的恢复和健康维持</b>具有重要意义。
		</p>

		<div class="title">
			最近{{ this.period }}天的耗能变化
		</div>
		<div class="sportshour-wrapper">
			<l-echart class="sportshour" ref="drained" @finished="initDrawDrained"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">耗能</b>是身体消耗的能量值，代表身体在一天中<b>消耗</b>的能量，与<b
				style="color: rgb(85, 156, 255)">日常活动和身体代谢</b>密切相关。
		</p>

		<div class="title">
			最近{{ this.period }}天的充能耗能差值
		</div>
		<div class="sportshour-wrapper">
			<l-echart class="sportshour" ref="difference" @finished="initDrawDifference"></l-echart>
		</div>
		<p class="note">
			<b>注：</b>
			<b style="color: rgb(80, 187, 61)">充能耗能差值</b>是充能与耗能的差值，可用于评估身体在一天中的<b>能量平衡</b>情况，差值为<b>正</b>表示<b
				style="color: rgb(85, 156, 255)">能量有积累</b>，储备充足、身体状态较好，利于应对<b>日常活动或突发压力</b>，但若<b>长期持续偏高</b>可能会提示<b
				style="color: rgb(85, 156, 255)">活动量不足</b>、<b style="color: rgb(85, 156, 255)">代谢相对缓慢</b>；差值为<b>负</b>表示<b
				style="color: rgb(85, 156, 255)">能量有消耗</b>，身体处于积极状态、<b>促进新陈代谢或完成了一定量的活动</b>，但若<b>持续为负且绝对值较大</b>，可能导致<b
				style="color: rgb(85, 156, 255)">能量透支</b>、<b style="color: rgb(85, 156, 255)">身体疲劳</b>，影响后续状态。
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
				bodyBatteryData: [], // 身体电量原始数据
				dateList: [], // 日期列表

				// 身体电量数据数组
				chargedData: [],
				drainedData: [],
				differenceData: [],

				// 异常数据标记
				extremCharged: [],
				extremDrained: [],
				extremDifference: []
			}
		},
		onLoad() {
			this.getBodyBatteryHistory();
		},
		methods: {
			// 获取身体电量历史数据
			getBodyBatteryHistory() {
				let _this = this;
				if (this.dataGeted) return;

				http.get("/healthInfo/getBodyBatteryHistory?period=" + _this.period).then(response => {
					this.bodyBatteryData = response.result;
					console.log("身体电量历史数据:", this.bodyBatteryData);

					// 按日期排序（升序）
					this.bodyBatteryData.sort((a, b) => Date.parse(a.date) - Date.parse(b.date));

					// 处理数据
					this.processBodyBatteryData();
					this.dataGeted = true;
				}, err => {
					console.error("获取身体电量数据失败：", err);
				});
			},

			// 处理身体电量数据
			processBodyBatteryData() {
				// 清空数据
				this.dateList = [];
				this.chargedData = [];
				this.drainedData = [];
				this.differenceData = [];
				this.extremCharged = [];
				this.extremDrained = [];
				this.extremDifference = [];

				for (let i = 0; i < this.bodyBatteryData.length; i++) {
					const item = this.bodyBatteryData[i];
					// 关键修改：使用date字段而不是calendarDate
					const date = this.formatDate(item.date);
					this.dateList.push(date);

					// 处理充能数据
					if (item.charged !== undefined && item.charged !== null && item.charged > 0) {
						this.chargedData.push(item.charged);
					} else {
						this.chargedData.push(-0.01);
						this.extremCharged.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理耗能数据
					if (item.drained !== undefined && item.drained !== null && item.drained > 0) {
						this.drainedData.push(item.drained);
					} else {
						this.drainedData.push(-0.01);
						this.extremDrained.push({
							xAxis: date,
							yAxis: -0.01
						});
					}

					// 处理充能耗能差值数据
					let difference = 0;
					if (item.charged !== undefined && item.charged !== null && item.charged > 0 &&
						item.drained !== undefined && item.drained !== null && item.drained > 0) {
						difference = item.charged - item.drained;
					} else {
						difference = -0.01;
					}
					this.differenceData.push(difference);
					if (difference === -0.01) {
						this.extremDifference.push({
							xAxis: date,
							yAxis: -0.01
						});
					}
				}
			},

			// 格式化日期为 MM-DD 格式
			formatDate(dateStr) {
				// 处理可能的日期格式差异
				const date = new Date(dateStr);
				const month = date.getMonth() + 1;
				const day = date.getDate();
				return `${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;
			},

			// 充能图表初始化
			async initDrawCharged() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawCharged, 500);
				} else {
					const charts = await this.$refs.charged.init(echarts);
					this.drawBodyBatteryChart(charts, '充能变化', this.chargedData, this.extremCharged, 0, 100);
				}
			},

			// 耗能图表初始化
			async initDrawDrained() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawDrained, 500);
				} else {
					const charts = await this.$refs.drained.init(echarts);
					this.drawBodyBatteryChart(charts, '耗能变化', this.drainedData, this.extremDrained, 0, 100);
				}
			},

			// 充能耗能差值图表初始化
			async initDrawDifference() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawDifference, 500);
				} else {
					const charts = await this.$refs.difference.init(echarts);
					this.drawBodyBatteryChart(charts, '充能耗能差值', this.differenceData, this.extremDifference, -100, 100);
				}
			},

			// 绘制身体电量图表通用方法
			drawBodyBatteryChart(charts, title, data, extremData, minY, maxY) {
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
									title + ':' + param.value
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
						name: title === '充能耗能差值' ? '差值' : '数值',
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
		border-left: 8px solid rgb(76, 175, 80);
		/* 身体电量用绿色系标识 */
	}

	.sportshour-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		/* 固定图表高度 */
		border-radius: 10px;
		background: rgb(76, 175, 80);
		/* 身体电量图表用绿色背景 */
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