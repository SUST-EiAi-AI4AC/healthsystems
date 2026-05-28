<template>
	<div class="settings-page">
		<!-- <h1>设置页面</h1>  -->
		<div class="settings-section">
			<div class="setting-item" @click="Logoff">
				<div class="arrow"></div>
				<h3>注销账户</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">永久注销您的账号</p>
			</div>
			<div class="setting-item" @click="goToPrivacyPolicy">
				<div class="arrow"></div>
				<h3>隐私政策</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">查看我们的隐私政策以保护您的个人信息</p>
			</div>
			<div class="setting-item" @click="goToDataCollection">
				<div class="arrow"></div>
				<h3>信息收集说明</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">了解我们如何收集您的个人信息</p>
			</div>
			<div class="setting-item" @click="goToThirdPartySDKs">
				<div class="arrow"></div>
				<h3>第三方SDK信息</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">查看我们使用的第三方SDK及其隐私政策</p>
			</div>

			<div class="setting-item" @click="Chart">
				<div class="arrow"></div>
				<h3>历史记录</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">查询过去提交的记录</p>
			</div>

			<div class="setting-item" style="display: flex; align-items: center; justify-content: space-between;">
				<h3>版本</h3>
				<p style="font-size: 0.9em; margin-right: 5px;">v 1.0.3</p>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {
			goToPrivacyPolicy() {
				const _this = this;
				uni.navigateTo({
					url: "pages/mine/privacyPolicy"
				});
			},
			goToDataCollection() {
				const _this = this;
				uni.navigateTo({
					url: "pages/mine/collection"
				});
			},
			goToThirdPartySDKs() {
				const _this = this;
				uni.navigateTo({
					url: "pages/mine/sdk"
				});
			},
			Chart() {
				const _this = this;
				uni.navigateTo({
					url: "/pages/Chart/ChartMain"
				});
			},

			Modify() {
				const _this = this;
				uni.navigateTo({
					url: '/pages/me/ChangePass'
				});
			},
			Logoff() {
				let _this = this;
				uni.showModal({
					title: '提示',
					content: '您确定要注销账户吗？',
					success: function(res) {
						let userInfo = uni.getStorageSync('userInfo');
						let userId = {};
						userId.userId = userInfo.userId;
						if (res.confirm) {
							const config = require('@/nxTemp/config/index.config.js').default;
							const http = require('@/nxTemp/config/requestConfig').default;
							http.get(`${config.baseUrl}/user/deleteUserById`, userId).then((res) => {
								if (res.code === 200) {
									uni.showToast({ title: '注销成功' });
									setTimeout(() => { uni.reLaunch({ url: '/pages/login/login' }); }, 700);
								} else {
									uni.showToast({ title: '注销失败', icon: 'error' });
								}
							});
						}
					}
				});
			},
		}
	}
</script>

<style>
	.settings-page {
		/* max-width: 600px;  */
		margin-top: 10px;
		/* padding: 20px;  */
		/* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  */
	}

	.settings-section {
		display: flex;
		flex-direction: column;
		gap: 8px;

	}

	.setting-item {
		background-color: #f9f9f9;
		padding: 15px 20px;
		/* border-radius: 5px;  */
		cursor: pointer;
		transition: background-color 0.3s;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

	}

	.arrow {
		width: 15px;
		height: 15px;
		border-top: 2px solid #999;
		border-right: 2px solid #999;
		transform: rotate(45deg);
		position: absolute;
		right: 15px;
		/* top: 22px; */
		margin-top: 15px;
		/* border: 1px solid blue; */
	}

	.setting-item:hover {
		background-color: #e9e9e9;
	}

	/* h2 {  
	  margin-top: 0;  
	} */
</style>