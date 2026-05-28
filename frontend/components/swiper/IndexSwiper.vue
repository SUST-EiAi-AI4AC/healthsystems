<template>
	<swiper :indicator-dots="true" :autoplay="true" :interval="4000" :duration="1000" circular="true" >
		<!-- <swiper-item> -->
			<!-- <view class="swiper-item"></view> -->
			<!-- <image class="swiper-img" src="../../static/images/index/emo11.jpeg"></image> -->
		<!-- </swiper-item> -->
		<swiper-item @click="DailyReport_1">
			<!-- <router-link to="/pages/pagerouters/pagerouter1"> -->
				<image class="swiper-img" src="../../static/images/index/emo22.jpg" ></image>
				<div class="box-data">
					<span>年轻人都想上岸，“岸”的尽头是什么<br></span>
				</div>
			<!-- </router-link> -->

		</swiper-item>
		<swiper-item @click="DailyReport_2">
			<!-- <router-link to="/pages/pagerouters/pagerouter2"> -->
				<image class="swiper-img" src="../../static/images/index/emo33.jpeg"></image>
				<div class="box-data">
					<span>大学生“向上社交”：功利工具还是成长利器<br></span>
				</div>
			<!-- </router-link> -->
		</swiper-item>
		<swiper-item @click="DailyReport_3">
			<!-- <router-link to="/pages/pagerouters/pagerouter3"> -->
				<image class="swiper-img" src="../../static/images/index/emo44.jpg"></image>
				<div class="box-data">
					<span>“毒鸡汤”危害心理 <br></span>
				</div>
			<!-- </router-link> -->
		</swiper-item>
		<swiper-item @click="DailyReport_4">
			<!-- <router-link to="/pages/pagerouters/pagerouter4"> -->
				<image class="swiper-img" src="../../static/images/index/emo55.jpg"></image>
				<div class="box-data">
					<span>你在生活中出现过“情绪劳动”吗？<br></span>
				</div>
			<!-- </router-link> -->
		</swiper-item>
		<swiper-item @click="DailyReport_5">
			<!-- <router-link to="/pages/pagerouters/pagerouter5"> -->
				<image class="swiper-img" src="../../static/images/index/emo66.jpg"></image>
				<div class="box-data">
					<span>走近回避型依恋者 如何寻找真爱？<br></span>
				</div>
			<!-- </router-link> -->
		</swiper-item>
		<swiper-item @click="DailyReport_6">
			<!-- <router-link to="/pages/pagerouters/pagerouter6"> -->
				<image class="swiper-img" src="../../static/images/index/emo77.jpg"></image>
				<div class="box-data">
					<span>年轻人社交趋势：交“零糖”朋友 寻“吗喽”减压<br></span>
				</div>
			<!-- </router-link> -->
		</swiper-item>
		<swiper-item @click="DailyReport_7">
			<!-- <router-link to="/pages/pagerouters/pagerouter7"> -->
				<image class="swiper-img" src="../../static/images/index/emo88.jpg"></image>
				<div class="box-data">
					<span>站上人生新关口！<br>毕业季，如何应对“戒断反应”</span>
				</div>
			<!-- </router-link> -->
		</swiper-item>
	</swiper>
</template>

<script>
	// #ifdef APP-PLUS
	var jpushModule = uni.requireNativePlugin("JG-JPush");
	// #endif
	
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";
	
	import {
		testApi
	} from "@/nxTemp/apis/index.js";
	
	export default {
		methods: {
			DailyReport_1() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter1'
				});
			},
			DailyReport_2() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter2'
				});
			},
			DailyReport_3() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter3'
				});
			},
			DailyReport_4() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter4'
				});
			},
			DailyReport_5() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter5'
				});
			},
			DailyReport_6() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter6'
				});
			},
			DailyReport_7() {
				// const _this = this;
				uni.navigateTo({
					url: 'pages/pagerouters/pagerouter7'
				});
			},
		}
	}
	
</script>

<style>
swiper{
	width: 100%;
	height: 400rpx;
	padding: 8px;
	flex-shrink: 0;
	box-sizing: border-box;
}

.swiper-img{
	width: 100%;
	height: 100%;
	border-radius: 12px;
	object-fit: cover;
	object-position: center;
	/* z-index: -1; */
}
.box-data{
	width: 100%;
	height: 46px;
	border-radius: 12px 12px 0 0;
	/* border: 2px solid #000; */
	color: white;
	font-weight: bold;
	position: absolute;
	top: 0;
	left: 0;
	font-size: 1.15em;
	padding: 6px 0 0 10px;
	background: linear-gradient(rgb(89, 89, 89), rgba(255, 255, 255, 0));
	box-sizing: border-box;
}

</style>