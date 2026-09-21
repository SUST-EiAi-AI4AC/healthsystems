<template>
	<div class="settings-page">
		<!-- <h1>设置页面</h1>  -->
		<div class="settings-section">
			<div class="setting-item" @click="Logoff">
				<div class="arrow"></div>
				<h3>{{ $t('mineSub.setting.logoffTitle') }}</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">{{ $t('mineSub.setting.logoffDesc') }}</p>
			</div>
			<div class="setting-item" @click="goToPrivacyPolicy">
				<div class="arrow"></div>
				<h3>{{ $t('mineSub.setting.privacyTitle') }}</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">{{ $t('mineSub.setting.privacyDesc') }}</p>
			</div>
			<div class="setting-item" @click="goToDataCollection">
				<div class="arrow"></div>
				<h3>{{ $t('mineSub.setting.collectionTitle') }}</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">{{ $t('mineSub.setting.collectionDesc') }}</p>
			</div>
			<div class="setting-item" @click="goToThirdPartySDKs">
				<div class="arrow"></div>
				<h3>{{ $t('mineSub.setting.sdkTitle') }}</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">{{ $t('mineSub.setting.sdkDesc') }}</p>
			</div>

			<div class="setting-item" @click="Chart">
				<div class="arrow"></div>
				<h3>{{ $t('mineSub.setting.historyTitle') }}</h3>
				<p style="font-size: 0.8em; margin-top: 5px;">{{ $t('mineSub.setting.historyDesc') }}</p>
			</div>

			<div class="setting-item" style="display: flex; align-items: center; justify-content: space-between;">
				<h3>{{ $t('mineSub.setting.versionTitle') }}</h3>
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
		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('mineSub.setting.navTitle') || '系统设置'
			});
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
					title: _this.$t('mineSub.setting.logoffConfirmTitle') || '提示',
					content: _this.$t('mineSub.setting.logoffConfirmContent') || '您确定要注销账户吗？',
					confirmText: _this.$t('common.confirm') || '确定',
					cancelText: _this.$t('common.cancel') || '取消',
					success: function(res) {
						let userInfo = uni.getStorageSync('userInfo');
						let userId = {};
						userId.userId = userInfo.userId;
						if (res.confirm) {
							const config = require('@/nxTemp/config/index.config.js').default;
							const http = require('@/nxTemp/config/requestConfig').default;
							http.get(`${config.baseUrl}/user/deleteUserById`, userId).then((res) => {
								if (res.code === 200) {
									uni.showToast({ title: _this.$t('mineSub.setting.logoffSuccess') || '注销成功' });
									setTimeout(() => { uni.reLaunch({ url: '/pages/login/login' }); }, 700);
								} else {
									uni.showToast({ title: _this.$t('mineSub.setting.logoffFailed') || '注销失败', icon: 'error' });
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