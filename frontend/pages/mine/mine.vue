<template>
	<view class="mine-page">
		<div class="head">
			<!-- 头像：点击可更换 -->
			<view class="avatar-wrap" @click="showAvatarPicker = true">
				<image class="img" :src="currentAvatar" mode="aspectFill" />
				<view class="avatar-edit-badge"><text class="avatar-edit-icon">📷</text></view>
			</view>
			<div class="user-info-container">
				<div class="greet">用户：{{ userInfo.userName || "未登录" }}</div>
				<div class="button-container">
					<el-button class="logoutClass" type="text" icon="el-icon-switch-button" @click="showBasicInfo"
						v-if="hasBasicInfo">个人信息</el-button>
					<el-button class="logoutClass" type="text" icon="el-icon-switch-button" @click="showBasicInfo"
						v-else>个人信息待完善<span class="red-dot" /></el-button>
				</div>
			</div>
		</div>

		<u-divider class="custom-divider" text-align="center" />

		<div class="title">服务</div>
		<div class="content">
			<div @click="HealthReport" class="box hover" id="healthReport">
				<div class="box-content">
					<div class="box-title">健康报告</div>
					<div class="box-data">
						<span>查看综合健康评估报告</span>
					</div>
				</div>
			</div>
			<div @click="Chart" class="box hover" id="chart">
				<div class="box-content">
					<div class="box-title">历史记录</div>
					<div class="box-data">
						<span>查询过去提交的记录</span>
					</div>
				</div>
			</div>
			<div @click="Settings" class="box hover" id="setting">
				<div class="box-content">
					<div class="box-title">系统设置</div>
					<div class="box-data">
						<span>管理通知与隐私偏好</span>
					</div>
				</div>
			</div>
			<div @click="Modify" class="box hover" id="modify">
				<div class="box-content">
					<div class="box-title">修改密码</div>
					<div class="box-data">
						<span>修改您的登录密码</span>
					</div>
				</div>
			</div>
			<div @click="Logout" class="box hover" id="logout">
				<div class="box-content">
					<div class="box-title">退出登录</div>
				</div>
			</div>
		</div>

		<!-- 头像选择弹窗 -->
		<view class="avatar-modal-mask" v-if="showAvatarPicker" @click.self="showAvatarPicker = false">
			<view class="avatar-modal">
				<view class="avatar-modal-header">
					<text class="avatar-modal-title">更换头像</text>
					<text class="avatar-modal-close" @click="showAvatarPicker = false">✕</text>
				</view>

				<!-- 上传自定义头像 -->
				<view class="avatar-upload-btn" @click="uploadCustomAvatar">
					<text class="avatar-upload-icon">📸</text>
					<text class="avatar-upload-text">上传自定义头像</text>
				</view>

				<!-- 预设头像：男性 -->
				<text class="avatar-section-label">男性风格</text>
				<view class="avatar-preset-grid">
					<view
						v-for="(av, i) in maleAvatars"
						:key="'m'+i"
						class="avatar-preset-item"
						:class="{ 'avatar-preset-selected': currentAvatar === av.url }"
						@click="selectPresetAvatar(av.url)"
					>
						<image class="avatar-preset-img" :src="av.url" mode="aspectFill" />
						<view class="avatar-preset-check" v-if="currentAvatar === av.url">✓</view>
					</view>
				</view>

				<!-- 预设头像：女性 -->
				<text class="avatar-section-label">女性风格</text>
				<view class="avatar-preset-grid">
					<view
						v-for="(av, i) in femaleAvatars"
						:key="'f'+i"
						class="avatar-preset-item"
						:class="{ 'avatar-preset-selected': currentAvatar === av.url }"
						@click="selectPresetAvatar(av.url)"
					>
						<image class="avatar-preset-img" :src="av.url" mode="aspectFill" />
						<view class="avatar-preset-check" v-if="currentAvatar === av.url">✓</view>
					</view>
				</view>
			</view>
		</view>
	</view>
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
		data() {
			const DEFAULT_AVATAR = 'https://api.dicebear.com/7.x/avataaars/svg?seed=DefaultUser&backgroundColor=c8f0d8';
			return {
				userInfo: {
					userName: '',
					password: '',
					userPhone: '',
					userGender: '',
					avatar: '',
					birthDate: ''
				},
				hasBasicInfo: true,
				showAvatarPicker: false,
				currentAvatar: uni.getStorageSync('userAvatar') || DEFAULT_AVATAR,
				DEFAULT_AVATAR,
				// 5 个男性风格预设头像（自定义真实人物头像）
				maleAvatars: [
					{ url: 'https://tse2.mm.bing.net/th/id/OIP.JXixrtqu6-SGuc8H2zyFogHaHa?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://tse3.mm.bing.net/th/id/OIP.fwnj3VOYFymYAqGatqTYzAAAAA?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://tse2.mm.bing.net/th/id/OIP.m_wDQ2YRYZIN6TRaawDsgwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://tse1.mm.bing.net/th/id/OIP.kmOlW7zruVymqGDSNnfS_wHaHY?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://tse3.mm.bing.net/th/id/OIP.NS9PihpGbADChVBXuGOvTgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3' }
				],
				// 5 个女性风格预设头像（自定义真实人物头像）
				femaleAvatars: [
					{ url: 'https://tse2.mm.bing.net/th/id/OIP.DbjMDUf18KAYmIkccbdulwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://tse2.mm.bing.net/th/id/OIP.1hWWKPNgG1xZeIz4-7Fs-QHaHZ?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://tse2.mm.bing.net/th/id/OIP.yA-PvTRLFAJub1eIJxAKFwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3' },
					{ url: 'https://img0.baidu.com/it/u=692173430,997477520&fm=253&app=138&f=JPEG?w=820&h=800' },
					{ url: 'https://th.bing.com/th?id=OIF.yHiOhj2gVH0Pgt1%2bwK2DgA&rs=1&pid=ImgDetMain&o=7&rm=3' }
				]
			};
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
			jpushModule.setAlias({
				'alias': userInfo.userId,
				'sequence': 1
			});
			// #endif
			http.get("/user/pushConnected").then((res) => {})
		},

		onShow(parms) {
			this.getBasicInfoStatus();
			// 每次进入页面同步最新头像
			const saved = uni.getStorageSync('userAvatar');
			if (saved) this.currentAvatar = saved;
		},

		methods: {
			getBasicInfoStatus() {
				http.get("/basicInfo/getRecord").then((res) => {
					if (res.result == 0) {
						this.hasBasicInfo = false;
					}
				})
			},
		
			// 选择预设头像
			selectPresetAvatar(url) {
				this.currentAvatar = url;
				this.saveAvatar(url);
				this.showAvatarPicker = false;
				uni.showToast({ title: '头像已更换 ✨', icon: 'none' });
			},
		
			// 保存头像到本地存储
			saveAvatar(url) {
				uni.setStorageSync('userAvatar', url);
				// 同步更新 userInfo.avatar
				if (this.userInfo) this.userInfo.avatar = url;
			},
		
			// 上传自定义头像
			uploadCustomAvatar() {
				uni.chooseImage({
					count: 1,
					sizeType: ['compressed'],
					sourceType: ['album', 'camera'],
					success: (res) => {
						const filePath = res.tempFilePaths[0];
						// H5 环境直接使用本地路径；其他平台可对接云存储
						this.currentAvatar = filePath;
						this.saveAvatar(filePath);
						this.showAvatarPicker = false;
						uni.showToast({ title: '头像已更换 ✨', icon: 'none' });
					}
				});
			},
		
			// 上传到云存储（按需调用）
			async uploadFiles(filePath, cloudPath) {
				try {
					const result = await uniCloud.uploadFile({ filePath, cloudPath });
					return result.fileID;
				} catch (error) {
					throw new Error('Failed to upload file: ' + error.message);
				}
			},

			scanCode: function() {
				uni.scanCode({
					success: function(res) {
						console.log('条码类型：' + res.scanType);
						console.log('条码内容：' + res.result);
					}
				});
			},

			Chart() {
				const _this = this;
				uni.navigateTo({
					url: "/pages/Chart/ChartMain"
				});
			},

			HealthReport() {
				uni.navigateTo({
					url: '/pages/mine/HealthReport'
				});
			},

			Modify() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/me/ChangePass'
				});
			},

			showBasicInfo() {
				const _this = this;
				uni.navigateTo({
					url: "/pages/health/BasicInfo"
				});
			},

			DepressionVideo() {
				uni.navigateTo({
					url: '/pages/video/Video'
				});
			},
			
			Settings() {
				uni.navigateTo({
					url: '/pages/me/setting'
				});
			},

			Logout() {
				let _this = this;
				uni.showModal({
					title: '提示',
					content: '您确定要退出登录吗？',
					success: function(res) {
						if (res.confirm) {
							
							_this.$store.dispatch('setUserData', null);
							uni.setStorageSync('token', null);
							setTimeout(() => {
								uni.reLaunch({
									url: "/pages/login/login"
								});
							}, 500)
						}
					}
				});
			},
			Logoff() {
				let _this = this;
				uni.showModal({
					title: '提示',
					content: '您确定要注销账户吗？',
					success: function(res) {
						let userInfo = uni.getStorageSync('userInfo');
						this.userInfo = userInfo;
						let userId = {};
						userId.userId = this.userInfo.userId;
						console.log(userId.userId)
						if (res.confirm) {
							console.log(this.userId)
							console.log(`Sending request to: ${config.baseUrl}/user/deleteUserById`);
							console.log('Request data:', userId);
							http.get(`${config.baseUrl}/user/deleteUserById`, userId).then((res) => {
								console.log(this.userId)
								if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
									uni.showToast({
										title: "注销成功"
									});
									setTimeout(() => {
										uni.navigateTo({
											url: "/pages/login/login"
										});
									}, 700);
								} else { //返回非200，弹窗提示失败，停留在此页
									uni.showToast({
										title: "注销失败",
										icon: 'error'
									});
								}
							})
							
							// _this.$store.dispatch('setUserData', null);
							// uni.setStorageSync('token', null);
							// setTimeout(() => {
							// 	uni.reLaunch({
							// 		url: "/pages/login/login"
							// 	});
							// }, 500)
						}
					}
				});
			},
		}
	}
</script>

<style lang="scss" scoped>
	.mine-page {
		display: flex;
		flex-direction: column;
		height: 100vh;
		overflow: hidden;
	}
	.logoutClass{
		border-radius: 15px;
		// height: 60px;
		padding: 5px 10px;
		background: linear-gradient(to right, #fda085, #f6d365);
		color: #ffffff;
	}
	
	.custom-divider {
		height: 1px;
		background-color: #d8d8d8;
		width: 100%;
		margin: 0;
		// border: 2px solid #00ff00;
	}

	.head {
		display: flex;
		height: 100px;
		width: 100%;
		z-index: 1;
		border-radius: 10px;
		padding: 10px;
		align-items: center;

		/* 头像外包层 */
		.avatar-wrap {
			position: relative;
			width: 100px;
			height: 100px;
			flex-shrink: 0;
			margin-right: 10px;
			cursor: pointer;
		}
		.img {
			width: 100px;
			height: 100px;
			border-radius: 50%;
			object-fit: cover;
		}
		/* 小相机角标 */
		.avatar-edit-badge {
			position: absolute;
			bottom: 2px;
			right: 2px;
			width: 26px;
			height: 26px;
			border-radius: 50%;
			background: rgba(255,255,255,0.92);
			box-shadow: 0 1px 4px rgba(0,0,0,0.18);
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.avatar-edit-icon {
			font-size: 0.85em;
		}

		.user-info-container {
			display: flex;
			flex-direction: column;
			align-items: flex-start;
			// border: 1px solid #00ff00;
			margin-left: 10px;
			/* 或者 center，取决于你想要的对齐方式 */
		}

		.greet {
			font-size: 1.5em;
			font-weight: bold;
		}

		.button-container {
			color: #333399;
			margin-top: 20px;

		}

		.red-dot {
			display: inline-block;
			width: 5px;
			height: 5px;
			background-color: red;
			border-radius: 50%;
			margin-left: 8px;
			/* 小红点与文本之间的间隔 */
		}
	}

	/*分割线的样式*/
	.title {
		/*上右下左（顺时针）*/
		padding: 2px 0 2px 10px; // 文字
		margin: 8px 0 8px 10px;
		border-left: 8px solid #4554F5;
		font-size: 2em;
		font-weight: bold;
		color: #4c5158;
	}

	.content {
		width: 100%;
		flex: 1;
		overflow-y: auto;
		padding-bottom: 60px;
	}

	.box {
		border-radius: 10px;
		margin: 10px 10px 0 10px;
		padding: 3px 0 0 5px; // 文字
		color: white;
	}

	.box-content {
		width: 100%;
		min-height: 45px;
		height: auto;
		padding: 10px;
	}

	.box-title {
		font-size: 1.6em;
		font-weight: bold;
		// margin-bottom: 3px;
	}

	.box-data {
		color: black;
		margin-top: 5px;
		// margin-bottom: 3px;
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
	#healthReport {
		background: linear-gradient(to right, #5b8dee, #a1c4fd);
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);  
	}

	#chart {
		background: linear-gradient(to right, #a18cd1, #FFF1EB);
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);  
	}

	#modify {
		background: linear-gradient(to right, #96e6a1, #FFF1EB);
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);  
	}
	
	#setting {
		background: linear-gradient(to right, #a1c4fd, #FFF1EB);
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);  
	}
	#logout {
		background: linear-gradient(to right, #a7b2c1, #FFF1EB);
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);  
	}
	#logoff {
		background: linear-gradient(to right, #ffce52, #FFF1EB);
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);  
	}

	/* ===== 头像选择弹窗 ===== */
	.avatar-modal-mask {
		position: fixed;
		inset: 0;
		background: rgba(0,0,0,0.45);
		display: flex;
		align-items: flex-end;
		z-index: 999;
	}
	.avatar-modal {
		width: 100%;
		background: #fff;
		border-radius: 24px 24px 0 0;
		padding: 20px 16px 36px;
		max-height: 80vh;
		overflow-y: auto;
	}
	.avatar-modal-header {
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-bottom: 16px;
	}
	.avatar-modal-title {
		font-size: 1.1em;
		font-weight: bold;
		color: #333;
	}
	.avatar-modal-close {
		font-size: 1.1em;
		color: #aaa;
		padding: 4px 8px;
		cursor: pointer;
	}
	/* 上传自定义按鈕 */
	.avatar-upload-btn {
		display: flex;
		align-items: center;
		gap: 10px;
		background: linear-gradient(135deg, #e8f4ff, #f0e8ff);
		border: 1.5px dashed #a1c4fd;
		border-radius: 14px;
		padding: 14px 18px;
		margin-bottom: 18px;
		cursor: pointer;
		transition: opacity 0.15s;
		&:active { opacity: 0.75; }
	}
	.avatar-upload-icon {
		font-size: 1.5em;
	}
	.avatar-upload-text {
		font-size: 0.95em;
		color: #5b9cf6;
		font-weight: 500;
	}
	/* 分区标题 */
	.avatar-section-label {
		display: block;
		font-size: 0.82em;
		color: #999;
		font-weight: 500;
		margin-bottom: 10px;
		letter-spacing: 0.5px;
	}
	/* 预设头像网格 */
	.avatar-preset-grid {
		display: flex;
		flex-wrap: wrap;
		gap: 12px;
		margin-bottom: 20px;
	}
	.avatar-preset-item {
		position: relative;
		width: calc(20% - 10px);
		aspect-ratio: 1;
		border-radius: 50%;
		overflow: hidden;
		border: 3px solid transparent;
		transition: border-color 0.2s, transform 0.15s;
		cursor: pointer;
		&:active { transform: scale(0.92); }
	}
	.avatar-preset-selected {
		border-color: #5b9cf6;
		box-shadow: 0 0 0 3px rgba(91,156,246,0.3);
	}
	.avatar-preset-img {
		width: 100%;
		height: 100%;
		border-radius: 50%;
	}
	/* 选中打勾 */
	.avatar-preset-check {
		position: absolute;
		inset: 0;
		background: rgba(91,156,246,0.35);
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 1.3em;
		color: #fff;
		font-weight: bold;
	}
	
</style>