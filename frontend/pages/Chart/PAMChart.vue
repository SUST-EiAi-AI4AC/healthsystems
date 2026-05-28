<!-- 现在不用这个页面 -->
<template>
	<view>
		<div class="title">
			{{ this.date }} 情绪变化曲线
		</div>

		<div class="center" style="display: flex;justify-content:center">
			<!--    <div>-->
			<!--      <p>选择日期-->
			<!--      </p>-->
			<div style="line-height: 55rpx;"> 统计日期： </div>
			<xp-picker mode="ymd" v-model="date" placeholder="选择日期" @confirm="getData"
				style="font-size: 35rpx;border: 1px solid #DCDFE6;border-radius:5rpx;background-color:white;padding: 6rpx;padding-right: 25rpx;" />
		</div>

		<!-- 愉悦度 -->
		<div class="title">
			愉悦度变化曲线
		</div>

		<div class="va-wrapper">
			<!-- 愉悦度 -->
			<l-echart class="valence" ref="valence" @finished="initDrawValence"></l-echart>
		</div>

		<p class="note">
			注：<b>愉悦度</b>整数取值范围-2至2，值越高表示越开心
		</p>

		<!--  唤醒度 -->
		<div class="title">
			唤醒度变化曲线
		</div>

		<div class="ar-wrapper">
			<!--  唤醒度 -->
			<l-echart class="arousal" ref="arousal" @finished="initDrawArousal"></l-echart>

		</div>

		<p class="note">
			注：<b>唤醒度</b>整数取值范围-2至2，表示对外界刺激的情感反映程度
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
	import data from "../Emotion/IMAGE_FOLDERS.js"

	let chartsEmotion = null;
	let chartsArousal = null;
	let chartsValence = null;

	export default {
		data() {
			return {
				dataGeted: false,
				charts: '',
				opinionData: [],
				pamScoreLogDateData: [], // pam score的时间
				pamScoreData: [], // pam score
				valenceData: [], // valence data
				arousalData: [], // arousal data
				dataImages: data.IMAGE_FOLDERS,
				emotionLogTime: [],
				emotionList: [],
				date: this.getTodayDate(),

			}
		},
		methods: {
			/**
			 * 获取当天的日期，并转化为 YYYY-MM-dd 的格式（与数据库保持一致
			 * @returns {*}
			 */
			getTodayDate() {
				let tmp = new Date()
				//// 格式为 2020/10/01
				//// console.log("tmp:",tmp.toLocaleDateString())

				const Y = tmp.getFullYear();
				const M = tmp.getMonth() + 1;
				const D = tmp.getDate();

				// 我们需要的格式是2020-10-01, 与数据库保持一致
				return Y + (M < 10 ? "-0" : "-") + M + (D < 10 ? "-0" : "-") + D;
			},

			/**
			 *
			 * 向服务器请求数据
			 *
			 */
			getData() {
				/**
				 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 * 每次请求数据前，要清空之前请求过的数据 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				 * @type {*[]}
				 */
				this.pamScoreLogDateData = [];
				this.pamScoreData = [];
				this.valenceData = []; // valence data
				this.arousalData = []; // arousal data
				this.emotionLogTime = [];
				this.emotionList = [];

				console.log(this.date)
				console.log(typeof this.date)
				http.post("/emaanswer/getPamListByDate", {
					'logDate': this.date
				}).then(response => {
					console.log("response.data:", response);
					// 获得数据
					this.opinionData = response.result.pam;
					console.log("opinionData:", this.opinionData);

					for (var i = 0, l = this.opinionData.length; i < l; i++) {

						// 日期的形式是 10:23:58，slice(0, 5)切出 10:23
						// this.pamScoreLogDateData.push(this.opinionData[i].logTime.slice(0, 5));
						this.pamScoreLogDateData.push(this.opinionData[i].logTime);
						console.log("opinionData[i].logTime:", this.opinionData[i].logTime)

						// this.pamScoreData.push(this.opinionData[i].pamScore);
						this.valenceData.push(this.opinionData[i].valence);
						console.log("this.opinionData[i].valence:", this.opinionData[i].valence)
						console.log("valenceData:", this.valenceData);

						this.arousalData.push(this.opinionData[i].arousal);
						console.log("this.opinionData[i].arousal:", this.opinionData[i].arousal)
						console.log("valenceData:", this.arousalData);
					}

					var emotionData = response.result.emotion;
					for (var i = 0, l = emotionData.length; i < l; i++) {
						this.emotionLogTime.push(emotionData[i].logTime);

						switch (emotionData[i].inference) {
							case 'Happy':
								this.emotionList.push(1);
								break;
							case 'Neutral':
								this.emotionList.push(0);
								break;
							case 'Sad':
								this.emotionList.push(-6);
								break;
							case 'Angry':
								this.emotionList.push(-5);
								break;
							case 'Fear':
								this.emotionList.push(-4);
								break;
							case 'Anxious':
								this.emotionList.push(-3);
								break;
							case 'Disgust':
								this.emotionList.push(-2);
								break;
							case 'Tired':
								this.emotionList.push(-1);
								break;
						}
					}

					console.log(this.emotionLogTime);
					console.log(this.emotionList);

					// this.drawPAMScore()
					if (this.dataGeted) {
						this.drawValence()
						this.drawArousal()
						this.drawEmotion()
					}
					this.dataGeted = true;

				}, response => {
					console.log("error");
				});
			},

			getRandomInt(min, max) {
				return Math.floor(Math.random() * (max - min + 1)) + min;
			},
			async initDrawValence() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawValence, 500);
				} else {
					// chart 图表实例不能存在data里
					chartsValence = await this.$refs.valence.init(echarts);
					this.drawValence();
				}
			},
			/**
			 *
			 * 绘制 valence 的折线图
			 *
			 */
			drawValence() {

				console.log("pamScoreLogDateData:", this.pamScoreLogDateData);
				console.log("valenceData:", this.valenceData);

				// 绘制图表
				// 配置项option的文档：https://echarts.apache.org/zh/option.html#title
				chartsValence.setOption({

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
							console.log(param[0])
							param = param[0];
							return [
								'时间:' + param.name + '<br/>',
								'值:' + param.value + '<br/>',
							].join('');
						}
					},

					// 图例
					// legend的data 与 series的name 两者必须同时存在，且数量和文字内容必须一致。
					legend: {
						// bottom: 10,
						left: 'right',
						data: ['愉悦度'],
						textStyle: {
							color: "white",
						},
						selectedMode: false, // 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
					},

					// 直角坐标系 X 轴
					xAxis: {
						name: "时间", //  坐标轴的单位
						data: this.pamScoreLogDateData,
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
					},

					// 直角坐标系 Y 轴
					yAxis: {
						name: "值", //  坐标轴的单位
						minInterval: 1,
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
						name: "愉悦度",
						type: 'line', // 图表类型，折线图还是柱状图还是饼图
						smooth: true,
						// barWidth: "50%",
						data: this.valenceData, // valence data

					}]
				})
			},
			async initDrawArousal() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawArousal, 500);
				} else {
					// chart 图表实例不能存在data里
					chartsArousal = await this.$refs.arousal.init(echarts);
					this.drawArousal();
				}
			},
			/**
			 *
			 * 绘制 arousal 的折线图
			 *
			 */
			drawArousal() {

				console.log("pamScoreLogDateData:", this.pamScoreLogDateData);
				console.log("arousalData:", this.arousalData);

				// 绘制图表
				// 配置项option的文档：https://echarts.apache.org/zh/option.html#title
				chartsArousal.setOption({

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
							console.log(param[0])
							param = param[0];


							return [
								'时间:' + param.name + '<br/>',
								'值:' + param.value + '<br/>',
							].join('');
						}
					},

					// 图例
					// legend的data 与 series的name 两者必须同时存在，且数量和文字内容必须一致。
					legend: {
						// bottom: 10,
						left: 'right',
						data: ['唤醒度'],
						textStyle: {
							color: "white",
						},
						selectedMode: false, // 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
					},

					// 直角坐标系 X 轴
					xAxis: {
						name: "时间", //  坐标轴的单位
						data: this.pamScoreLogDateData,
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

					},

					// 直角坐标系 Y 轴
					yAxis: {
						name: "值", //  坐标轴的单位
						minInterval: 1,
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
						name: "唤醒度",
						type: 'line', // 图表类型，折线图还是柱状图还是饼图
						smooth: true,
						// barWidth: "50%",
						data: this.arousalData, // arousal data

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
	.title {
		font-size: 1.2em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px; // 文字
		margin: 10px auto;
		border-left: 8px solid rgb(234, 129, 87);
	}

	.va-wrapper {
		/*margin: 20px;*/
		border-radius: 10px;
		/*background: rgb(239, 157, 90);*/
		background: rgb(234, 129, 87);
		margin-left: 10rpx;
		margin-right: 10rpx;
	}

	.ar-wrapper {
		/*margin: 20px;*/
		border-radius: 10px;
		/*background: rgb(239, 157, 90);*/
		background: rgb(234, 129, 87);
		margin-left: 10rpx;
		margin-right: 10rpx;

	}

	.valence {
		height: 200px;
		width: calc(100% - 20rpx);
	}

	.arousal {
		height: 200px;
		width: calc(100% - 20rpx);
	}

	.emotion {
		width: calc(100% - 20rpx);
		height: 300px;
	}

	.center {
		/*居中*/
		text-align: center;
	}

	.note {
		font-size: 0.8em;
		color: rgb(100, 100, 100);
	}
</style>