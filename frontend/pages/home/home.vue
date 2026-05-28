<template>
	<view>

	</view>
</template>

<script>
	// #ifdef APP-PLUS
	var jpushModule = uni.requireNativePlugin("JG-JPush");
	// #endif

	import {
		router
	} from '@/nxTemp/router/index.js'
	import {
		getScjzByCodeApi
	} from "@/nxTemp/apis/jiezhuang.js";
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {}
		},
		methods: {

		},
		onLoad(parms) {
			let userInfo = uni.getStorageSync('userInfo');
			if (!userInfo) { //没有登录信息执行登录操作
				setTimeout(function() {
					uni.reLaunch({
						url: "/pages/login/login"
					});
				}, 500);
			} else {
				// #ifdef APP-PLUS
				// 设置别名
				uni.$emit('userLoginEvent', {});
				http.get("/user/pushConnected").then((res) => {})
				// #endif
				setTimeout(function() {
					uni.reLaunch({
						url: "/pages/index/index"
					});
				}, 500);
			}
		},
	}
</script>

<style>

</style>