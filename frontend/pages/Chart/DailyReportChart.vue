<template>
	<view class="total">

		<div class="title">
			最近{{this.period}}天的社交情况
		</div>
		<div class="sportshour-wrapper">
			<!-- 社交时间-->
			<l-echart class="sportshour" ref="socialHour" @finished="initDrawSocialHour"></l-echart>
		</div>

		<div class="title">
			最近{{this.period}}天的工作或学习情况
		</div>
		<div class="sportshour-wrapper">
			<!-- 工作学习时间-->
			<l-echart class="sportshour" ref="studyorworkHour" @finished="initDrawStudyorworkHour"></l-echart>
		</div>


		<div class="title">
			最近{{this.period}}天的使用手机情况
		</div>
		<div class="sportshour-wrapper">
			<!-- 手机时间-->
			<l-echart class="sportshour" ref="phoneHour" @finished="initDrawPhoneHour"></l-echart>
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

	export default {
		data() {
			return {
				dataGeted: false,
				// 分页查询
				currentPage: 1,
				// 每页的数据条目数
				pageSize: 15,
				period: 7,
				opinionData: [], //数据库中每日填报的数据
				LogDateData: [], // 睡眠日期
				beforeDate: '', //储存第一条记录之前的一天

				socialData: [], //社交时长
				socialHourData: [], //社交时长转化数据
				extremSocial: [], //社交时长异常点

				studyorworkData: [], //工作学习时长
				studyorworkHourData: [], //工作学习时长转化数据
				extremStudyWork: [], //工作学习时长异常点

				freeData: [], //空闲时长
				freeHourData: [], //空闲时长转化数据
				extremFree: [], //空闲时长异常点

				phoneData: [], //手机时长
				phoneHourData: [], //手机时长转化数据
				extremPhone: [], //手机时长异常点
			}
		},
		methods: {
			getData() {
				let _this = this;
				if (this.dataGeted) return;

				http.get("/answer/getSleepTimeByTime?period=" + _this.period).then(response => {
					this.opinionData = response.result;
					console.log(response)
					console.log(this.opinionData);

					// 时间排序（升序）
					this.opinionData.sort((a, b) => Date.parse(a.logDate) - Date.parse(b.logDate));

					// 填入日期数据
					this.beforeDate = this.getNextDate(this.opinionData[0].logDate, -1).slice(-5);
					this.LogDateData.push(this.beforeDate);

					for (let i = 0; i < this.opinionData.length; i++) {
						const item = this.opinionData[i];
						const date = item.logDate.slice(-5);
						this.LogDateData.push(date)
						// 使用手机时间
						this.phoneData.push(item.phonePlayTime);
						// 工作学习时间
						this.studyorworkData.push(item.studyOrWorkTime);
						// 社交时间
						this.socialData.push(item.communicateTime);
					}
					this.LogDateData.pop(); // 去掉多余的一天

					// 手机使用时长转为数字
					for (let i = 0; i < this.phoneData.length; i++) {
						const val = this.phoneData[i];
						if (val === "" || val === "0") {
							this.phoneHourData.push(val === "" ? -0.01 : 0);
						} else if (val === "少于30分钟") {
							this.phoneHourData.push(0.5);
						} else if (val === "30分钟-1小时") {
							this.phoneHourData.push(1);
						} else if (val === "1-1.5小时") {
							this.phoneHourData.push(1.5);
						} else if (val === "1.5-2小时") {
							this.phoneHourData.push(2);
						} else if (val === "超过2小时") {
							this.phoneHourData.push(2.5);
						}
						if (this.phoneHourData[i] === -0.01) {
							this.extremPhone.push({
								xAxis: this.LogDateData[i],
								yAxis: -0.01
							});
						}
					}

					// 工作学习时间转为数字
					for (let i = 0; i < this.studyorworkData.length; i++) {
						const val = this.studyorworkData[i];
						if (val === "" || val === "0") {
							this.studyorworkHourData.push(val === "" ? -0.01 : 0);
						} else if (val === "少于1小时") {
							this.studyorworkHourData.push(1);
						} else if (val === "1-3小时") {
							this.studyorworkHourData.push(2);
						} else if (val === "3-5小时") {
							this.studyorworkHourData.push(4);
						} else if (val === "5-8小时") {
							this.studyorworkHourData.push(8);
						} else if (val === "超过8小时") {
							this.studyorworkHourData.push(10);
						}
						if (this.studyorworkHourData[i] === -0.01) {
							this.extremStudyWork.push({
								xAxis: this.LogDateData[i],
								yAxis: -0.01
							});
						}
					}

					// 社交时间转为数字
					for (let i = 0; i < this.socialData.length; i++) {
						const val = this.socialData[i];
						if (val === "" || val === "0") {
							this.socialHourData.push(val === "" ? -0.01 : 0);
						} else if (val === "少于30分钟") {
							this.socialHourData.push(0.5);
						} else if (val === "30分钟-1小时") {
							this.socialHourData.push(1);
						} else if (val === "1-1.5小时") {
							this.socialHourData.push(1.5);
						} else if (val === "1.5-2小时") {
							this.socialHourData.push(2);
						} else if (val === "超过2小时") {
							this.socialHourData.push(2.5);
						}
						if (this.socialHourData[i] === -0.01) {
							this.extremSocial.push({
								xAxis: this.LogDateData[i],
								yAxis: -0.01
							});
						}
					}

					this.dataGeted = true;
				}, err => {
					console.error("获取数据失败：", err);
				});
			},

			getNextDate(date, day) {
				var dd = new Date(date);
				dd.setDate(dd.getDate() + day);
				var y = dd.getFullYear();
				var m = dd.getMonth() + 1 < 10 ? "0" + (dd.getMonth() + 1) : dd.getMonth() + 1;
				var d = dd.getDate() < 10 ? "0" + dd.getDate() : dd.getDate();
				return y + "-" + m + "-" + d;
			},



			async initDrawSocialHour(){
					if (!this.dataGeted) {
						setTimeout(this.initDrawSocialHour, 500);
					} else {
						// chart 图表实例不能存在data里
						const charts = await this.$refs.socialHour.init(echarts);
						this.drawSocialHour(charts);
					}
				},
				drawSocialHour(charts5) {
					charts5.setOption({
						title: {
							text: "社交",
							subtext: "",
							textStyle: {
								color: "white",
							},
					
						},
					
						// 线的颜色，看这样子默认是红色,有颜色的线条好看一些~
						color: ["white"],
						
						// 提示框组件
						tooltip: {
							trigger: 'axis',
					
							axisPointer: {
								// 坐标轴指示器，坐标轴触发有效
								type: "shadow", // 默认为直线，可选为：'line' | 'shadow'
							},
					
							formatter: (param) => {
								// 打印一下看看param有什么，才能知道可以用哪些东西
								param = param[0];
					
								//将数字对应回字符
								var message;
								//if (this.extremDate_2.includes(param.name)) {
								if (param.value == -0.01) {
									return [
										'日期:' + param.name + '\n',
										"未填报",
									].join('');
								} else {
									if (param.value == 0) {
										return [
											'日期:' + param.name + '\n',
											"当天没有运动",
										].join('');
									}
									if (param.value == 0.5) {
										message = "不超过30分钟";
									} else if (param.value == 1) {
										message = "30分钟到1小时";
									} else if (param.value == 1.5) {
										message = "1小时到1.5小时";
									} else if (param.value == 2) {
										message = "1.5小时到2小时";
									} else if (param.value == 2.5) {
										message = "超过2小时";
									}
									return [
										'日期:' + param.name + '\n',
										'时长:' + message,
									].join('');
								}
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
							left: 'right',
							data: ['社交时长'],
							textStyle: {
								color: "white",
							},
							selectedMode: false, // 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
						},
					
						// 直角坐标系 X 轴
						xAxis: {
							name: "日期", //  坐标轴的单位
							data: this.LogDateData,
							axisLabel: {
								interval: 0, //X轴信息全部展示
								rotate: -60, //60 标签倾斜的角度
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
						},
					
						// 直角坐标系 Y 轴
						yAxis: {
							name: "小时", //  坐标轴的单位
					
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
							name: "社交时长",
							type: 'line', // 图表类型，折线图还是柱状图还是饼图
							smooth: true,
							// barWidth: "50%",
							markPoint: {
								symbol: 'triangle', //标记(气泡)的图形
								symbolSize: 15, //标记(气泡)的大小
								itemStyle: {
									color: 'rgb(234, 129, 87)', //图形的颜色。
									borderColor: '#000', //图形的描边颜色。支持的颜色格式同 color，不支持回调函数。
									borderWidth: 0, //描边线宽。为 0 时无描边。
									borderType: 'solid', //柱条的描边类型，默认为实线，支持 ‘solid’, ‘dashed’, ‘dotted’。
								},
								label: {
									formatter: function(param) {
										return [
											"未填报"
										]
									},
									fontSize: 10,
									textBorderColor: 'rgb(234,129,87)', //图形的颜色
									color: 'white',
									textBorderWidth: 2
								},
								data: this.extremSocial
								// data: [
								//   { type:'min', value:"未填报"}
								// ]
							},
							data: this.socialHourData, // 运动时间
						}]
					})
				},
				
				async initDrawStudyorworkHour(){
					if (!this.dataGeted) {
						setTimeout(this.initDrawStudyorworkHour, 500);
					} else {
						// chart 图表实例不能存在data里
						const charts = await this.$refs.studyorworkHour.init(echarts);
						this.drawStudyorworkHour(charts);
					}
				},
				drawStudyorworkHour(charts6) {
					charts6.setOption({
						title: {
							text: "工作或学习",
							subtext: "",
							textStyle: {
								color: "white",
							},
					
						},
					
						// 线的颜色，看这样子默认是红色,有颜色的线条好看一些~
						color: ["white"],
						
						// 提示框组件
						tooltip: {
							trigger: 'axis',
					
							axisPointer: {
								// 坐标轴指示器，坐标轴触发有效
								type: "shadow", // 默认为直线，可选为：'line' | 'shadow'
							},
					
							formatter: (param) => {
								// 打印一下看看param有什么，才能知道可以用哪些东西
								param = param[0];
					
								//将数字对应回字符
								var message;
								//if (this.extremDate_2.includes(param.name)) {
								if (param.value == -0.01) {
									return [
										'日期:' + param.name + '\n',
										"未填报",
									].join('');
								} else {
									if (param.value == 0) {
										return [
											'日期:' + param.name + '\n',
											"当天没有运动",
										].join('');
									}
									if (param.value == 1) {
										message = "不超过1小时";
									} else if (param.value == 2) {
										message = "1小时到3小时";
									} else if (param.value == 4) {
										message = "3小时到5小时";
									} else if (param.value == 8) {
										message = "5小时到8小时";
									} else if (param.value == 10) {
										message = "超过8小时";
									}
									return [
										'日期:' + param.name + '\n',
										'时长:' + message,
									].join('');
								}
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
							left: 'right',
							data: ['工作或学习时长'],
							textStyle: {
								color: "white",
							},
							selectedMode: false, // 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
						},
					
						// 直角坐标系 X 轴
						xAxis: {
							name: "日期", //  坐标轴的单位
							data: this.LogDateData,
							axisLabel: {
								interval: 0, //X轴信息全部展示
								rotate: -60, //60 标签倾斜的角度
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
						},
					
						// 直角坐标系 Y 轴
						yAxis: {
							name: "小时", //  坐标轴的单位
					
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
							name: "工作或学习时长",
							type: 'line', // 图表类型，折线图还是柱状图还是饼图
							smooth: true,
							// barWidth: "50%",
							markPoint: {
								symbol: 'triangle', //标记(气泡)的图形
								symbolSize: 15, //标记(气泡)的大小
								itemStyle: {
									color: 'rgb(234, 129, 87)', //图形的颜色。
									borderColor: '#000', //图形的描边颜色。支持的颜色格式同 color，不支持回调函数。
									borderWidth: 0, //描边线宽。为 0 时无描边。
									borderType: 'solid', //柱条的描边类型，默认为实线，支持 ‘solid’, ‘dashed’, ‘dotted’。
								},
								label: {
									formatter: function(param) {
										return [
											"未填报"
										]
									},
									fontSize: 10,
									textBorderColor: 'rgb(234,129,87)', //图形的颜色
									color: 'white',
									textBorderWidth: 2
								},
								data: this.extremStudyWork
								// data: [
								//   { type:'min', value:"未填报"}
								// ]
							},
							data: this.studyorworkHourData, // 运动时间
						}]
					})
				},
				
				async initDrawPhoneHour(){
					if (!this.dataGeted) {
						setTimeout(this.initDrawPhoneHour, 500);
					} else {
						// chart 图表实例不能存在data里
						const charts = await this.$refs.phoneHour.init(echarts);
						this.drawPhoneHour(charts);
					}
				},
				drawPhoneHour(charts8) {
					charts8.setOption({
						title: {
							text: "使用手机",
							subtext: "",
							textStyle: {
								color: "white",
							},
					
						},
					
						// 线的颜色，看这样子默认是红色,有颜色的线条好看一些~
						color: ["white"],
						
						// 提示框组件
						tooltip: {
							trigger: 'axis',
					
							axisPointer: {
								// 坐标轴指示器，坐标轴触发有效
								type: "shadow", // 默认为直线，可选为：'line' | 'shadow'
							},
					
							formatter: (param) => {
								// 打印一下看看param有什么，才能知道可以用哪些东西
								param = param[0];
					
								//将数字对应回字符
								var message;
								//if (this.extremDate_2.includes(param.name)) {
								if (param.value == -0.01) {
									return [
										'日期:' + param.name + '\n',
										"未填报",
									].join('');
								} else {
									if (param.value == 0) {
										return [
											'日期:' + param.name + '\n',
											"当天没有运动",
										].join('');
									}
									if (param.value == 0.5) {
										message = "不超过30分钟";
									} else if (param.value == 1) {
										message = "30分钟到1小时";
									} else if (param.value == 1.5) {
										message = "1小时到1.5小时";
									} else if (param.value == 2) {
										message = "1.5小时到2小时";
									} else if (param.value == 2.5) {
										message = "超过2小时";
									}
									return [
										'日期:' + param.name + '\n',
										'时长:' + message,
									].join('');
								}
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
							left: 'right',
							data: ['使用手机'],
							textStyle: {
								color: "white",
							},
							selectedMode: false, // 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
						},
					
						// 直角坐标系 X 轴
						xAxis: {
							name: "日期", //  坐标轴的单位
							data: this.LogDateData,
							axisLabel: {
								interval: 0, //X轴信息全部展示
								rotate: -60, //60 标签倾斜的角度
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
						},
					
						// 直角坐标系 Y 轴
						yAxis: {
							name: "小时", //  坐标轴的单位
					
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
							name: "使用手机",
							type: 'line', // 图表类型，折线图还是柱状图还是饼图
							smooth: true,
							// barWidth: "50%",
							markPoint: {
								symbol: 'triangle', //标记(气泡)的图形
								symbolSize: 15, //标记(气泡)的大小
								itemStyle: {
									color: 'rgb(234, 129, 87)', //图形的颜色。
									borderColor: '#000', //图形的描边颜色。支持的颜色格式同 color，不支持回调函数。
									borderWidth: 0, //描边线宽。为 0 时无描边。
									borderType: 'solid', //柱条的描边类型，默认为实线，支持 ‘solid’, ‘dashed’, ‘dotted’。
								},
								label: {
									formatter: function(param) {
										return [
											"未填报"
										]
									},
									fontSize: 10,
									textBorderColor: 'rgb(234,129,87)', //图形的颜色
									color: 'white',
									textBorderWidth: 2
								},
								data: this.extremPhone
								// data: [
								//   { type:'min', value:"未填报"}
								// ]
							},
							data: this.phoneHourData, // 运动时间
						}]
					})
				},
				
			},
		onLoad(parms) {
			this.getData();
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
		padding: 2px 0 2px 5px; // 文字
		margin: 10px auto;
		border-left: 8px solid rgb(0, 80, 255);
	}

	.sleephour-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		border-radius: 10px;
		background: rgb(60, 108, 240);
		margin-left: 10rpx;
		margin-right: 10rpx;
	}

	.sportshour-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		border-radius: 10px;
		background: rgb(60, 108, 240);
		margin-left: 10rpx;
		margin-right: 10rpx;
	}

	.sleepStart-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		border-radius: 10px;
		background: rgb(60, 108, 240);
		margin-left: 10rpx;
		margin-right: 10rpx;
	}

	.sleepEnd-wrapper {
		padding-top: 10px;
		margin: 10px auto;
		height: 100%;
		border-radius: 10px;
		background: rgb(60, 108, 240);
		margin-left: 10rpx;
		margin-right: 10rpx;
	}

	.sleephour {
		height: 200px;
		width: calc(100% - 20rpx);
	}

	.sportshour {
		height: 200px;
		width: calc(100% - 20rpx);
	}

	.sleepStart {
		height: 200px;
		width: calc(100% - 20rpx);
	}

	.sleepEnd {
		height: 200px;
		width: calc(100% - 20rpx);
	}
</style>