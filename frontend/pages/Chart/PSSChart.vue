<template>
	<view>
		<div class="title">
			最近{{this.pageSize}}次的压力量表测试结果
		</div>

		<div class="dr-wrapper">
			<!--  睡眠时间-->
			<l-echart class="PSSscore" ref="PSSscore" @finished="initDrawPSSscore"></l-echart>
		</div>

		<p class="note">
			注：
			<b style="color: rgb(110, 210, 100)">绿色</b>标识分数<b>最大值</b>，
			<b style="color: rgb(234, 129, 87)">橙色</b>标识分数<b>最小值</b>，
			<b>虚线</b>标识分数<b>平均值</b>
		</p>

		<div class="box-card">
			<p>量表测试结果<b>不是</b>专业医生的诊断结果。如果测试结果不甚良好，您<b>不必慌张</b>，我们建议您积极调节心态并及时寻求医生或心理医师的帮助。
			</p>
		</div>

		<basic-table :columns="columns" :data="tableData">
		</basic-table>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";
	import * as echarts from '@/uni_modules/lime-echart/static/echarts.min'

	let chartsPSSscore = null;

	export default {
		data() {
			return {
				dataGeted: false,
				// 分页查询
				currentPage: 1,
				// 每页的数据条目数
				pageSize: 5,
				charts: '',
				opinionData: [],
				PSSdateData: [], // 睡眠日期
				PSSscoreData: [], // 睡眠时长
				columns: [{
						fieldName: 'score',
						fieldDesc: '分数段'
					},
					{
						fieldName: 'exp',
						fieldDesc: '分数说明'
					},
					{
						fieldName: 'text',
						fieldDesc: '医生建议'
					}
				],
				tableData: [{
					score: '0-19分',
					exp: '低压力感知',
					text: '您对自己当前的生活有足够的掌控和控制，请继续保持'
				}, {
					score: '20-39分',
					exp: '中等压力感知',
					text: '您偶尔会有一段时间压力太多，请注意自我调节'
				}, {
					score: '40-56分',
					exp: '高压力感知',
					text: '建议您寻找朋友同学或者心理医生进行进一步沟通'
				}]
			}
		},
		methods: {
			/**
			 *
			 * 向服务器请求数据
			 *
			 */
			getData() {
				http.get("/scale/ps/getlist?currentPage=" + this.currentPage + "&pageSize=" + this.pageSize).then(
					response => {
						// console.log(response.data);
						// 获得数据
						this.opinionData = response.result.data;
						console.log(this.opinionData);

						// 数据库为了返回最近15天的数据，采用了降序排列，
						// 但前端画图需要用最远的日期做index 0，
						// 所以这里重新排成正序（升序）
						this.opinionData.sort(function(a, b) {
							return Date.parse(a.logDate) - Date.parse(b.logDate); // 时间正序
						});

						for (var i = 0, l = this.opinionData.length; i < l; i++) {

							// 日期的形式是 2020-10-01，slice(-5)切出 10-01
							// this.PSSdateData.push(this.opinionData[i].logDate.slice(-5));
							this.PSSdateData.push(this.opinionData[i].logDate.slice(-10));
							this.PSSscoreData.push(this.opinionData[i].score);
						}

						console.log(this.PSSdateData);
						console.log(this.PSSscoreData);

						this.dataGeted = true;
					}, response => {
						console.log("error");
					});
			},
			async initDrawPSSscore() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawPSSscore, 500);
				} else {
					// chart 图表实例不能存在data里
					chartsPSSscore = await this.$refs.PSSscore.init(echarts);
					this.drawScore();
				}
			},
			drawScore() {
				// 绘制图表
				// 配置项option的文档：https://echarts.apache.org/zh/option.html#title
				chartsPSSscore.setOption({
					// 线的颜色，默认是红色
					color: ["white"],

					// 提示框组件
					tooltip: {
						trigger: 'axis',

						axisPointer: {
							// 坐标轴指示器，坐标轴触发有效
							type: "shadow", // 默认为直线，可选为：'line' | 'shadow'
						},

						formatter: function(param) {
							// 打印一下看看param有什么，才能知道可以用哪些东西
							// console.log(param[0])
							param = param[0];
							return [
								'日期:' + param.name + '\n',
								'分数:' + param.value + '分',
							].join('');
						}
					},
					toolbox: {
						show: false, //工具箱显示
						feature: {
							mark: {
								show: true
							}, //辅助线开关
							dataView: {
								show: true,
								readOnly: false,
								optionToContent: function(opt) {
									let axisData = opt.xAxis[0].data; //坐标数据
									let series = opt.series; //折线图数据
									let tdHeads = '<td  style="padding: 0 10px">时间</td>'; //表头
									let tdBodys = ''; //数据
									series.forEach(function(item) {
										//组装表头
										tdHeads += `<td style="padding: 0 10px">${item.name}</td>`;
									});
									let table =
										`<table border="1" style="margin-left:20px;border-collapse:collapse;font-size:14px;text-align:center"><tbody><tr>${tdHeads} </tr>`;
									for (let i = 0, l = axisData.length; i < l; i++) {
										for (let j = 0; j < series.length; j++) {
											//组装表数据
											tdBodys += `<td>${series[j].data[i]}</td>`;
										}
										table +=
											`<tr><td style="padding: 0 10px">${axisData[i]}</td>${tdBodys}</tr>`;
										tdBodys = '';
									}
									table += '</tbody></table>';
									return table;
								}
							}, //刷新数据
							//magicType : {show: true, type: ['line', 'bar']},//切换图
							//restore : {show: true}, //还原
							saveAsImage: {
								show: true
							} //保存图片
						}
					},

					// 直角坐标系底板
					grid: {
						// left: '1%',
						// right: '1%',
						// bottom: '3%',
						// containLabel: true
					},

					// 图例
					// legend的data 与 series的name 两者必须同时存在，且数量和文字内容必须一致。
					legend: {
						// bottom: 10,
						//left: 'right',
						data: ['测试得分'],
						textStyle: {
							color: "white",
						},
						selectedMode: false, // 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
					},

					// 直角坐标系 X 轴
					xAxis: {
						name: "日期", //  坐标轴的单位
						data: this.PSSdateData,
						axisLabel: {
							interval: 0, //X轴信息全部显示
							rotate: -30, //坐标轴刻度标签倾斜，便于显示所有数据
							color: "white", //刻度标签文字的颜色
						},

						axisTick: { // 刻度线和标签对齐
							alignWithLabel: true,
						},

						axisLine: {
							lineStyle: {
								color: "white", // 坐标轴颜色
							}
						},
					},

					// 直角坐标系 Y 轴
					yAxis: {
						name: "分数", //  坐标轴的单位
						min: 10,
						max: 60,
						axisLabel: {
							color: "white", // 刻度标签文字的颜色
						},

						axisTick: { // 刻度线和标签对齐
							alignWithLabel: true,
						},

						axisLine: {
							lineStyle: {
								color: "white", // 坐标轴颜色
							}
						},

						// 是否显示分隔线
						splitLine: {
							show: false,
						},
					},

					// 一组数值以及他们映射成的图
					series: [{
						name: "测试得分",
						type: 'line', // 图表类型，折线图还是柱状图还是饼图
						smooth: true,
						// barWidth: "50%",
						data: this.PSSscoreData, // 列表得分
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
										color: "rgb(234, 129, 87)",
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
		border-left: 8px solid rgb(0, 80, 255);
	}

	.dr-wrapper {
		/*margin: 20px;*/
		border-radius: 10px;
		background: rgb(0, 80, 255);
		margin: 10px 0 0 0;
	}

	.PSSscore {
		height: 200px;
		width: 100%;
	}

	.note {
		margin-top: 5px;
		margin-left: 5px;
		font-size: 0.8em;
		color: rgb(100, 100, 100);
	}
	
	.box-card {
		margin-top: 5px;
		margin-bottom: 5px;
		width: auto;
		height: 100%;
		//background: #dddddd;
		background: rgb(246, 246, 246);
		//background: rgb(249, 170, 139);
		// border-radius: 10px;
		p {
			font-size: 0.95em;
			color: rgb(40, 40, 40);
			padding: 5px;
		}
	}
</style>