<template>
	<view>
		<div class="title">
			最近5次的抑郁评估测试结果
		</div>

		<div class="dr-wrapper">
			<!--PHQ9 图表-->
			<l-echart class="PHQ9" ref="PHQ9" @finished="initDrawPHQ9"></l-echart>
		</div>

		<p class="note">
			注：
			<b style="color: rgb(110, 210, 100)">绿色</b>标识分数<b>最大值</b>，
			<b style="color: rgb(85, 156, 255)">蓝色</b>标识分数<b>最小值</b>，
			<b>虚线</b>标识分数<b>平均值</b>
		</p>

		<div class="box-card">
			<p>以上测试结果<b>不代表</b>专业医生的诊断结果，且存在一定的误差。如果测试结果不甚良好，您不必惊慌，建议您积极调节心态并及时寻求医生或心理医师的帮助。
			</p>
		</div>

		<div>
			<basic-table :columns="columns" :data="tableData">
			</basic-table>
		</div>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";
	import * as echarts from '@/uni_modules/lime-echart/static/echarts.min'

	let chartsPHQ9 = null;

	export default {
		data() {
			return {
				columns: [{
						fieldName: 'scoreSection',
						fieldDesc: '分数段'
					},
					{
						fieldName: 'explanation',
						fieldDesc: '分数说明'
					},
					{
						fieldName: 'advice',
						fieldDesc: '医生建议'
					}
				],
				dataGeted: false,
				currentPage: 1,
				pageSize: 3,

				//数据类型为数组
				phq9Data: [],
				logDate: [],
				score: [],
				tableData: [{
						scoreSection: '0-4',
						explanation: '无抑郁症状',
						advice: '请继续保持'
					},
					{
						scoreSection: '5-9',
						explanation: '轻微抑郁症状',
						advice: '注意调节心情'
					},
					{
						scoreSection: '10-14',
						explanation: '中度抑郁症状',
						advice: '最好咨询心理医生或心理医学工作者'
					},
					{
						scoreSection: '15-19',
						explanation: '中重度抑郁症状',
						advice: '建议咨询心理医生或精神科医生'
					},
					{
						scoreSection: '20-24',
						explanation: '重度抑郁症状',
						advice: '一定要看心理医生或精神科医生'
					}
				]
			}
		},
		methods: {
			/**
			 *
			 * 向服务器请求数据
			 *
			 */
			getData() {
				http.get("/depressionmedia/getList").then(res => {
					console.log(res)
					//处理get到的数据
					this.phq9Data = res.result

					console.log(this.phq9Data);
					console.log("reverse");
					this.phq9Data.reverse();
					console.log(this.phq9Data);
					
					for (var i = 0, l = this.phq9Data.length; i < l; i++) {
						console.log(this.phq9Data[i].logTime);
						this.logDate.push(this.phq9Data[i].logDate.slice(-5) + ' ' + this.phq9Data[i].logTime
							.slice(0, 5));
						this.score.push(this.phq9Data[i].infer);
					}
					console.log(this.logDate);
					console.log(this.score);
					this.dataGeted = true;
				})
			},
			async initDrawPHQ9() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawPHQ9, 500);
				} else {
					// chart 图表实例不能存在data里
					chartsPHQ9 = await this.$refs.PHQ9.init(echarts);
					this.drawScore();
				}
			},
			drawScore() {
				//绘图
				chartsPHQ9.setOption({
					// 线的颜色，默认是红色
					color: ["white"],

					//提示框部分，就是鼠标放上去能显示数据的透明框
					tooltip: {
						trigger: 'axis',
						triggerOn: 'mousemove', //网页版时，鼠标放上去就会显示，不用点那个数据点，但手机版需要点击

						//坐标轴指示器，坐标轴触发有效
						axisPointer: {
							type: "shadow"
						},

						//提示框需要显示的内容及格式
						formatter: function(param) {
							// console.log(param);
							param = param[0];
							return [
								'日期:' + param.name + '</br>',
								'分数:' + param.value + '分</br>'
							].join('');
						}
					},

					//直角坐标系底板
					grid: {},

					//图例，右上角说明图表中绘制了几个数据的那个东西
					legend: {
						left: 'right',
						data: ['测试得分'],
						textStyle: {
							color: "white"
						},
						selectedMode: false, //点击图例是否改变现在的显示状态
					},

					//直角坐标系 X 轴
					xAxis: {
						name: "日期", //坐标轴单位
						data: this.logDate,

						//坐标轴刻度标签
						axisLabel: {
							interval: 0, //X轴信息全部显示
							rotate: -30, //坐标轴刻度标签倾斜，便于显示所有数据
							color: "white", //刻度标签文字的颜色
						},

						//刻度线
						axisTick: { // 刻度线和标签对齐
							alignWithLabel: true
						},

						//坐标轴
						axisLine: {
							lineStyle: {
								color: "white", // 坐标轴颜色
							}
						},
					},

					//直角坐标系Y轴
					yAxis: {
						name: "分数", //坐标轴单位

						//坐标轴刻度标签
						axisLabel: {
							color: "white"
						},

						//刻度线
						axisTick: {
							alignWithLabel: true
						},

						//坐标轴
						axisLine: {
							lineStyle: {
								color: "white"
							}
						},

						//分隔线
						splitLine: {
							show: false
						}
					},

					//数据及绘图
					series: [{
						name: "测试得分",
						type: 'line', //图表类型，折线图
						smooth: true,
						data: this.score,
						itemStyle: {
							normal: {
								label: {
									show: true
								}
							}
						},

						markPoint: {
							symbol: 'pin', //标记(气泡)的图形
							symbolSize: 40, //标记(气泡)的大小
							itemStyle: {
								color: 'rgb(85, 156, 255)', //图形的颜色。
								borderColor: '#000', //图形的描边颜色。支持的颜色格式同 color，不支持回调函数。
								borderWidth: 0, //描边线宽。为 0 时无描边。
								borderType: 'solid', //柱条的描边类型，默认为实线，支持 ‘solid’, ‘dashed’, ‘dotted’。
							},
							data: [{
									type: 'max',
									name: '最大值',
									label: {
										formatter: '{c}'
									},
									itemStyle: {
										color: "rgb(110, 210, 100)",
									},
								},
								{
									type: 'min',
									name: '最小值',
									label: {
										formatter: '{c}'
									},
									itemStyle: {
										color: "rgb(85, 156, 255)",
									},
								}
							]
						},

						markLine: {
							data: [{
								type: 'average',
								name: '平均值',
								label: {
									formatter: '{c}'
								},
								itemStyle: {
									color: "rgb(255, 255, 255)",
								},
							}]
						}
					}]
				})
			}
		},
		
		onLoad(parms) {
			this.getData();
		}
	}
</script>

<style lang="scss" scoped>
	.title {
		font-size: 1.2em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px; // 文字
		margin: 10px auto;
		border-left: 8px solid rgb(234, 129, 87);
	}

	.dr-wrapper {
		height: 100%;
		border-radius: 10px;
		background: rgb(234, 129, 87);
	}

	.PHQ9 {
		height: 200px;
		width: 100%;
	}

	.note {
		font-size: 0.8em;
		color: rgb(100, 100, 100);
	}

	.box-card {
		width: auto;
		height: 90px;
		background: rgb(246, 246, 246);
		border-radius: 10px;
		p {
			font-size: 0.95em;
			color: rgb(40, 40, 40);
			padding: 6px 10px 0 10px;
		}
	}
</style>