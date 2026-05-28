<template>
	<view>
		<div class="content-all2">
			<view class="swiper-container-wrap">
				<IndexSwiper></IndexSwiper>
			</view>
			
			<!-- 快捷功能入口 -->
			<div class="quick-entry-section">
				<!-- 大卡片：日常状态 -->
				<div class="qe-card-large" @click="DailyReport">
					<div class="qe-card-inner">
						<div class="qe-header-row">
							<div class="qe-icon-wrap">
								<text class="qe-icon">✦</text>
							</div>
							<div class="qe-tag">每日填报</div>
						</div>
						<div class="qe-large-title">日常状态</div>
						<div class="qe-large-desc">每日晚八点后提交1次</div>
					</div>
					<div class="qe-circle qe-circle-1"></div>
					<div class="qe-circle qe-circle-2"></div>
				</div>
				<!-- 下方两个小卡片 -->
				<div class="qe-row">
					<div class="qe-card-small qe-yellow" @click.stop="goHealthAssess">
						<div class="qe-card-inner">
							<div class="qe-small-icon-wrap">
								<text class="qe-small-icon">♡</text>
							</div>
							<div class="qe-small-title">健康评估</div>
							<div class="qe-small-desc">10大科学心理量表</div>
						</div>
						<div class="qe-circle qe-circle-s1"></div>
					</div>
					<div class="qe-card-small qe-teal" @click.stop="BraceletData">
						<div class="qe-card-inner">
							<div class="qe-small-icon-wrap">
								<text class="qe-small-icon">⊞</text>
							</div>
							<div class="qe-small-title">手环数据</div>
							<div class="qe-small-desc">连接 GARMIN 智能手环</div>
						</div>
						<div class="qe-circle qe-circle-s2"></div>
					</div>
				</div>
			</div>
			
			<div class="title"></div>
			<div class="content">
				<div @click="DepressionVideo" class="box hover" id="depressionvideo">
					<div class="box-content">
						<div class="box-title">迷你访谈</div>
						<div class="box-en">Mini-interviews Assessment</div>
						<div class="custom-divider" text-align="center" />
						<div class="box-data">
							<span>说说最近的事和心情吧</span>
						</div>
						<div class="image-container">
							<image class="box-img" src="../../static/images/index/set/in2.png"></image>
						</div>
					</div>
				</div>
				<div @click="goHeal" class="box hover" id="braceletData">
					<div class="box-content">
						<div class="box-title">疗愈</div>
						<div class="box-en">Healing</div>
						<div class="custom-divider" text-align="center" />
						<div class="box-data">
							<span>24h聊天/游戏/日记陪伴</span>
						</div>
						<div class="image-container">
							<image class="box-img" src="../../static/images/index/set/in2.png"></image>
						</div>
					</div>
				</div>
			</div>
			<!-- <u-divider class="custom-divider" text-align="center" /> -->
			<div class="title-2">{{ warmText }}</div>
			<!-- <div class="content">
				<div @click="" class="box hover" id="dailyReport">
					<div class="box-content">
						<div class="box-title">量表1</div>
						<div class="box-en"> Something</div>
						<div class="custom-divider" text-align="center" />
						<div class="box-data">
							<span>信息</span>
						</div>
					</div>
				</div>
				<div @click="" class="box hover" id="dailyReport">
					<div class="box-content">
						<div class="box-title">量表2</div>
						<div class="box-en">Something</div>
						<div class="custom-divider" text-align="center" />
						<div class="box-data">
							<span>信息</span>
						</div>
					</div>
				</div>
				<div @click="" class="box hover" id="dailyReport">
					<div class="box-content">
						<div class="box-title">量表3</div>
						<div class="box-en">Something</div>
						<div class="custom-divider" text-align="center" />
						<div class="box-data">
							<span>信息</span>
						</div>
					</div>
				</div>
			</div> -->
		</div>
	</view>
</template>

<script>
	import IndexSwiper from '@/components/swiper/IndexSwiper.vue';

	// #ifdef APP-PLUS
	var jpushModule = uni.requireNativePlugin("JG-JPush");
	// #endif

	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	import {
		testApi
	} from "@/nxTemp/apis/index.js";

	const WARM_TEXTS = [
		"保持好心情，让生活处处充满色彩。",
		"无论晴雨，愿你今天也是充满阳光的一天。",
		"慢下来，深呼吸，生活其实有很多美好在等你。",
		"给自己一个微笑，你比想象中更加坚强和美丽。",
		"每一天都是新的开始，愿你的心里开满温柔的小花。",
		"照顾好自己，听听心里的声音，你已经做得非常棒了。",
		"今天也是值得被爱的一天，愿你被温柔以待。",
		"在属于自己的节奏里，慢慢走，总会遇到温暖的阳光。",
		"愿你的世界温润饱满，有花香，有暖阳，也有好梦。",
		"生活不必太完美，适度放松，保持内心的平静就好。"
	];

	export default {
		data() {
			return {
				userInfo: {
					userName: '',
					password: '',
					userPhone: '',
					userGender: '',
					birthDate: ''
				},
				hasBasicInfo: true,
				warmText: "保持好心情，让生活处处充满色彩。"
			};
		},

		components: {
			IndexSwiper
		},

		onLoad(parms) {
			try {
				// #ifdef APP-PLUS
				var Color = plus.android.importClass("android.graphics.Color");
				plus.android.importClass("android.view.Window");
				var mainActivity = plus.android.runtimeMainActivity();
				var window_android = mainActivity.getWindow();
				window_android.setNavigationBarColor(Color.parseColor("#ffffff"));
				// #endif
			} catch (err) {}

			// 获取
			let userInfo = uni.getStorageSync('userInfo');

			this.userInfo = userInfo;
			// #ifdef APP-PLUS
			// 设置别名
			uni.$emit('userLoginEvent', {});
			// #endif
			http.get("/user/pushConnected").then((res) => {})
		},

		onShow(parms) {
			this.getBasicInfoStatus();
			const randomIndex = Math.floor(Math.random() * WARM_TEXTS.length);
			this.warmText = WARM_TEXTS[randomIndex];
		},

		onUnload() {},
		methods: {
			getBasicInfoStatus() {
				http.get("/basicInfo/getRecord").then((res) => {
					if (res.result == 0) {
						this.hasBasicInfo = false;
					}
				})
			},

			// EMA() {
			// 	const _this = this;
			// 	uni.navigateTo({
			// 		url: 'pages/Emotion/EMA'
			// 	});
			// },
			// 添加手环数据跳转方法
			BraceletData() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/braceletData/braceletData'
				});
			},

			// DailyReport() {
			// 	const _this = this;
			// 	uni.navigateTo({
			// 		url: 'pages/health/DailyReport'
			// 	});
			// },
			DailyReport() {
				const now = new Date();
				const hours = now.getHours();

				// 允许时间段：20:00–23:59 或 0:00–4:59
				if (!(hours >= 20 || hours < 5)) {
					uni.showToast({
						title: '未到填报时间，请在晚上8点到次日凌晨5点之间填写',
						icon: 'none'
					});
					return;
				}

				// 满足条件才跳转
				uni.navigateTo({
					url: 'pages/health/DailyReport'
				});
			},


			DepressionVideo() {
				uni.navigateTo({
					url: '/pages/video/Video'
				});
			},

			// 量表
			PSS() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/Scale/PSS'
				});
			},

			PHQ() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/Scale/SDS'
				});
			},

			SAS() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/Scale/SAS'
				});
			},

			// 快捷功能入口
			goAIAssess() {
				uni.setStorageSync('aiassessInitTab', 0);
				uni.switchTab({
					url: '/pages/aiassess/aiassess'
				});
			},

			goPsychTest() {
				uni.setStorageSync('aiassessInitTab', 1);
				uni.switchTab({
					url: '/pages/aiassess/aiassess'
				});
			},

			goHeal() {
				uni.switchTab({
					url: '/pages/heal/heal'
				});
			},

			goHealthAssess() {
				uni.setStorageSync('aiassessInitTab', 0);
				uni.switchTab({
					url: '/pages/aiassess/aiassess'
				});
			}
		}
	}
</script>

<style lang="scss" scoped>
	.content-all {
		// background-color: #fff2dc;
		// background: linear-gradient(#fda085, #f6d365);
		background-image: linear-gradient(180deg, #e0f7fd 0%, #ebfbec 100%);

		// background-image: url('../../static/images/background/blur3.jpg');
		// background-size: cover;
		// background-position: center;

		// position: relative;  
		// z-index: 1;
		// &::before {  
		//     content: "";  
		//     position: absolute;
		// }
	}

	.content-all2 {
		height: calc(100vh - var(--window-top) - var(--window-bottom));
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		overflow-y: auto;
		background-color: #cffdff;
		background-image:
			radial-gradient(closest-side, rgb(194, 243, 164), rgba(235, 105, 78, 0)),
			radial-gradient(closest-side, rgb(255, 211, 211), rgba(243, 11, 164, 0)),
			radial-gradient(closest-side, rgb(202, 221, 250), rgba(254, 234, 131, 0)),
			radial-gradient(closest-side, rgb(250, 220, 96), rgba(170, 142, 245, 0));

		background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
		background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
		background-repeat: no-repeat;
		animation: 15s moiveAnimation infinite;
	}

	@keyframes moiveAnimation {

		0%,
		100% {
			background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
			background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
		}

		25% {
			background-size: 120vw 120vh, 130vw 150vh, 130vw 120vh, 100vw 110vh;
			background-position: -30vw -30vh, 40vw -10vh, 0vw 10vh, -10vw 20vh;
		}

		50% {
			background-size: 130vw 130vh, 140vw 100vh, 100vw 150vh, 90vw 110vh;
			background-position: 10vw -60vh, 20vw 10vh, 10vw 30vh, 10vw -20vh;
		}

		75% {
			background-size: 140vw 140vh, 100vw 130vh, 100vw 150vh, 130vw 110vh;
			background-position: -70vw -70vh, 0vw -10vh, 30vw -20vh, 20vw 30vh;
		}
	}

	/*分割线的样式*/
	.title {
		/*上右下左（顺时针）*/
		padding: 0px; // 文字
		// margin: 8px auto;
		font-size: 1em;
		font-weight: bold;
		color: #4a4c50;
		// background-color: #333399;
		// background-color: #EF8374;
		border-radius: 10px 10px 0 0;
	}

	.title-2 {
		/*上右下左（顺时针）*/
		// padding: 2px; // 文字
		text-align: center;
		font-size: 0.8em;
		color: #75787e;
		padding: 4px 0 24px;
		margin-top: 12px;
		flex-shrink: 0;
	}

	.custom-divider {
		height: 1px;
		/* 分割线的高度 */
		background-color: white;
		/* 分割线的颜色 */
		width: 90%;
		/* 分割线的宽度，这里设置为父容器宽度的80% */
		margin-top: 5px;
		/* 上下外边距和水平居中 */
	}

	.content {
		width: 100%;
		height: auto;
		display: flex;
		padding: 10px 12px;
		align-content: flex-start;
		flex-wrap: wrap;
		gap: 12px;
		box-sizing: border-box;
		flex-shrink: 0;
	}

	/* 固定两列布局 */
	.content-row {
		padding-bottom: 0;
	}

	.content-row-bottom {
		padding-top: 3px;
	}

	.content-1 {
		width: 95%;
		height: 100%;
		display: flex;
		padding: 10px 10px 0 10px;
		// background-color: #afdcef;
		align-content: flex-start;
		/* 换行紧贴 */
		flex-wrap: wrap;
		/* 换行 */
	}

	.content-2 {
		width: 95%;
		height: 100%;
		display: flex;
		padding: 0 10px 10px 10px;
		// background-color: #afdcef;
		align-content: flex-start;
		/* 换行紧贴 */
		flex-wrap: wrap;
		/* 换行 */
	}

	.box {
		height: 112px;
		position: relative;
		width: calc(50% - 6px);
		border-radius: 14px;
		padding: 8px 0 0 12px;
		margin: 0;
		box-sizing: border-box;
		flex-shrink: 0;
	}

	.box-content {
		width: 100%;
		height: 100%;
		padding: 2px 4px;
		position: relative;
		//box-shadow: 1px 1px 4px gray;
	}

	.content-wrapper .content {
		margin-top: 8px;
		margin-left: 16px;
		font-size: 2.2em;
	}

	.box-title {
		font-size: 1.1em;
		font-weight: bold;
		color: white;
		// letter-spacing: 1.5px;
	}

	.box-en {
		margin-top: 2px;
		font-size: 0.68em;
		color: white;
	}

	.box-data {
		margin-top: 8px;
		color: #626364;

		span {
			font-size: 0.72em;
			// font-weight: bolder;
		}
	}

	.image-container {
		position: absolute;
		bottom: 8px;
		right: 12px;
		padding: 0;
	}

	.box-img {
		width: 20px;
		height: 25px;
	}


	/*
十六进制颜色码转换成RGB颜色值：
http://www.sioe.cn/yingyong/yanse-rgb-16/
*/
	/*
	每一行两个按钮，但最后一行会出现只有1个按钮，
	这时候为了保持一行两个按钮 of layout，
	添加一个空元素占位
*/
	#empty {
		background: rgb(255, 255, 255);
	}

	#dailyReport {
		background: linear-gradient(#a1c4fd, #c2e9fb);
	}

	#braceletData {
		background: linear-gradient(#96e6a1, #cef475);
	}

	#healthAssess {
		background: linear-gradient(135deg, #fccb90 0%, #d57eeb 100%);
	}

	#phq {
		background: linear-gradient(#fda085, #f6d365);
	}

	#depressionvideo {
		// background: rgb(237, 180, 88);
		// background: #FEA443
		background: linear-gradient(#ff9a9c, #fad0c4);
	}

	#pss {
		background: linear-gradient(#a18cd1, #fbc2eb);
	}

	#sas {
		// background: rgb(190, 243, 248);
		background: linear-gradient(#a7b2c1, #dfe1e3);
		// background: #C8E9EE
	}

	/* ======== 快捷功能入口 ======== */
	.swiper-container-wrap {
		width: 100%;
		height: 400rpx;
		flex-shrink: 0;
	}

	.quick-entry-section {
		padding: 8px 14px 10px;
		display: flex;
		flex-direction: column;
		gap: 12px;
		flex-shrink: 0;
	}

	/* 大卡片 */
	.qe-card-large {
		position: relative;
		width: 100%;
		height: 125px;
		background: linear-gradient(135deg, #f7a4c2 0%, #c47ed6 50%, #9b84e0 100%);
		border-radius: 18px;
		overflow: hidden;
		cursor: pointer;
		box-shadow: 0 4px 16px rgba(154, 100, 210, 0.25);
	}

	.qe-card-inner {
		position: relative;
		z-index: 2;
		padding: 10px 14px;
	}

	.qe-card-large .qe-card-inner {
		padding: 14px 16px;
	}

	.qe-card-small .qe-card-inner {
		padding: 12px 14px;
	}

	.qe-header-row {
		display: flex;
		align-items: center;
		gap: 10px;
		margin-bottom: 4px;
	}

	.qe-icon-wrap {
		width: 36px;
		height: 36px;
		background: rgba(255, 255, 255, 0.3);
		border-radius: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.qe-icon {
		font-size: 1.2em;
		color: #fff;
	}

	.qe-tag {
		background: rgba(255, 255, 255, 0.25);
		color: #fff;
		font-size: 0.75em;
		padding: 3px 10px;
		border-radius: 20px;
		font-weight: 500;
	}

	.qe-large-title {
		font-size: 1.3em;
		font-weight: bold;
		color: #fff;
		line-height: 1.2;
	}

	.qe-large-desc {
		font-size: 0.75em;
		color: rgba(255, 255, 255, 0.85);
		margin-top: 4px;
	}

	/* 装饰圆圈 */
	.qe-circle {
		position: absolute;
		border-radius: 50%;
		background: rgba(255, 255, 255, 0.15);
		z-index: 1;
	}

	.qe-circle-1 {
		width: 120px;
		height: 120px;
		bottom: -40px;
		right: -20px;
	}

	.qe-circle-2 {
		width: 70px;
		height: 70px;
		bottom: 10px;
		right: 80px;
		background: rgba(255, 255, 255, 0.1);
	}

	/* 下方两列小卡片 */
	.qe-row {
		display: flex;
		gap: 6px;
	}

	.qe-card-small {
		position: relative;
		flex: 1;
		height: 110px;
		border-radius: 18px;
		overflow: hidden;
		cursor: pointer;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}

	.qe-yellow {
		background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
	}

	.qe-teal {
		background: linear-gradient(135deg, #5eddc8 0%, #3bbfa8 100%);
	}

	.qe-small-icon-wrap {
		width: 26px;
		height: 26px;
		background: rgba(255, 255, 255, 0.3);
		border-radius: 8px;
		display: flex;
		align-items: center;
		justify-content: center;
		margin-bottom: 6px;
	}

	.qe-small-icon {
		font-size: 0.85em;
		color: #fff;
	}

	.qe-small-title {
		font-size: 0.95em;
		font-weight: bold;
		color: #fff;
	}

	.qe-small-desc {
		font-size: 0.65em;
		color: rgba(255, 255, 255, 0.82);
		margin-top: 4px;
	}

	.qe-circle-s1 {
		width: 80px;
		height: 80px;
		bottom: -25px;
		right: -15px;
		background: rgba(255, 255, 255, 0.15);
	}

	.qe-circle-s2 {
		width: 80px;
		height: 80px;
		bottom: -25px;
		right: -15px;
		background: rgba(255, 255, 255, 0.15);
	}
</style>