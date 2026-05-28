<template>
	<view class="game-full-page">
		<!-- 加载遮罩 -->
		<view class="game-loading" v-if="loading">
			<view class="game-loading-inner">
				<view class="game-spinner"></view>
				<text class="game-loading-text">游戏加载中...</text>
				<text class="game-loading-hint">首次加载可能需要10~30秒</text>
			</view>
		</view>
		<!-- App 端 web-view -->
		<!-- #ifndef H5 -->
		<web-view
			:src="gameUrl"
			class="game-webview"
			@load="onLoad"
			@error="onError"
		></web-view>
		<!-- #endif -->
		<!-- H5 端 iframe -->
		<!-- #ifdef H5 -->
		<iframe
			:src="gameUrl"
			class="game-iframe"
			frameborder="0"
			allow="autoplay; fullscreen; gamepad"
			allowfullscreen
			@load="onLoad"
		></iframe>
		<!-- #endif -->
	</view>
</template>

<script>
export default {
	onLoad(options) {
		this.gameUrl = options.url ? decodeURIComponent(options.url) : 'https://poki.com/zh/g/temple-run-2-holi-festival#fullscreen';
		this.loading = true;
	},
	data() {
		return {
			gameUrl: '',
			loading: true
		};
	},
	methods: {
		onLoad() {
			this.loading = false;
		},
		onError() {
			this.loading = false;
			uni.showToast({ title: '游戏加载失败，请检查网络', icon: 'none' });
		}
	}
};
</script>

<style scoped>
.game-full-page {
	width: 100%;
	height: 100vh;
	background: #0d0d1a;
	position: relative;
	display: flex;
	flex-direction: column;
}
.game-webview,
.game-iframe {
	flex: 1;
	width: 100%;
	height: 100%;
	border: none;
	display: block;
}
.game-loading {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: linear-gradient(160deg, #0d0d2b 0%, #1a1a3e 50%, #0d1a2b 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10;
}
.game-loading-inner {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 14px;
}
.game-spinner {
	width: 56px;
	height: 56px;
	border-radius: 50%;
	border: 4px solid rgba(255,255,255,0.15);
	border-top-color: #f97316;
	animation: spin 0.9s linear infinite;
}
@keyframes spin {
	to { transform: rotate(360deg); }
}
.game-loading-text {
	font-size: 1.05em;
	color: #fff;
	font-weight: bold;
	letter-spacing: 1px;
}
.game-loading-hint {
	font-size: 0.78em;
	color: rgba(255,255,255,0.5);
	text-align: center;
}
</style>
