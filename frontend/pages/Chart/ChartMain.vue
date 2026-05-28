<template>
	<view>
		<div class="head">
			<div class="greet">
				{{ userInfo.userName }}的记录
			</div>
			<img src="../../static/images/chart/chartmain.png"/>
			<!-- <img url('@/static/chart/chartmain.png')/> -->
		</div>

		<div class="title">每日填报记录</div>

		<div class="content">
			<div @click="DailyReportChart" class="box hover" id="dailyReport">
				<div class="box-content">
					<div class="box-title">日常状态</div>
				</div>
			</div>

			<!-- <div @click="PAMChart" class="box hover" id="ema">
				<div class="box-content">
					<div class="box-title">情绪</div>
				</div>
			</div> -->
		</div>

		<div class="title">自测量表记录</div>

		<div class="content">
			<div @click="PHQ9Chart" class="box hover" id="phq">
				<div class="box-content">
					<div class="box-title">抑郁</div>
				</div>
			</div>

			<div @click="PSSChart" class="box hover" id="pss">
				<div class="box-content">
					<div class="box-title">压力</div>
				</div>
			</div>

			<div @click="SASChart" class="box hover" id="sas">
				<div class="box-content">
					<div class="box-title">焦虑</div>
				</div>
			</div>
		</div>

		<div class="title" style="display: none;">迷你访谈抑郁自测记录</div>

		<div @click="PHQ8Chart" class="box hover" id="phq-8" style="display: none;">
			<div class="box-content">
				<div class="box-title">抑郁评估</div>
			</div>
		</div>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {
				userInfo: {
					userName: '',
				}
			}
		},
		
		methods: {
			getUserName() {
				let userInfo = uni.getStorageSync('userInfo');
				this.userInfo = userInfo
			},
			
			PAMChart() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/Chart/PAMChart'
				});
			},

			DailyReportChart() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/Chart/DailyReportChart'
				});
			},

			PSSChart() {
				uni.navigateTo({
					url: '/pages/Chart/PSSChart'
				});
			},

			SASChart() {
				uni.navigateTo({
					url: '/pages/Chart/SASChart'
				});
			},

			PHQ9Chart() {
				uni.navigateTo({
					url: '/pages/Chart/PHQ9Chart'
				});
			},
		},
		onLoad(parms) {
			this.getUserName();
		}
	}
</script>

<style lang="scss" scoped>
	.head {
		margin: 5px auto;
		height: 25vh;
		width: 97%;
		// z-index: 1;
		position: relative;
		background: #007AFF;
		border-radius: 10px;

		img {
			z-index: 1;
			position: absolute;
			bottom: 0;
			right: 0;
			width: 60%;
		}

		.greet {
			padding: 16px 0;
			font-size: 1.5em;
			margin-left: 20px;
			font-weight: bold;
			color: white;
		}
	}

	/*分割线的样式*/
	.title {
		/*上右下左（顺时针）*/
		padding: 2px 0 2px 10px; // 文字
		margin: 8px auto;
		border-left: 8px solid #3478F6;
		font-size: 1.2em;
		color: #696969;
	}

	.content {
		width: 100%;
		height: 100%;
		display: flex;
		align-content: flex-start;
	}

	.box {
		/*box-shadow: 1px 1px 4px gray;*/
		width: 160px;
		height: 60px;
		position: relative;
		flex: 1 0 25%;
		border-radius: 10px;
		margin: 8px 1.5% 0 1.5%;
		color: white;
		text-align: center;
	}

	.box-content {
		width: 100%;
		height: 100%;
	}
	
	.box-title {
		font-size: 1.2em;
		line-height: 60px;
	}

	.box-data {
		margin-top: 15px;
		span {
			font-size: 0.8em;
		}
	}

	/*
十六进制颜色码转换成RGB颜色值：
https://www.sioe.cn/yingyong/yanse-rgb-16/
*/
	/*
每一行两个按钮，但最后一行会出现只有1个按钮，
这时候为了保持一行两个按钮的布局，
添加一个空元素占位
*/
	.empty {
		background: rgb(255, 255, 255);
	}

	// 每日填报那一栏
	#dailyReport,
	#pss,
	#phq-8 {
		background: rgb(0, 100, 255);
	}

	#ema,
	#phq,
	#sas {
		background: rgb(234, 129, 87);
	}

	// 量表第二栏
	#fs {
		background: rgb(60, 108, 240);
	}

	#ucla {
		background: rgb(234, 129, 87);
	}

	// 量表第三栏
	#gad {
		background: rgb(234, 129, 87);
	}

	// 其他
	#chart {
		background: rgb(85, 156, 255);
	}

	#modify {
		background: rgb(234, 129, 87);
	}

	.hover:hover {
		cursor: pointer;
	}
</style>