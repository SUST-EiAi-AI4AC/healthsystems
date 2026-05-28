<template>
	<view class="content">
		<view class="reg-header">
			<text class="reg-title">注册账号</text>
			<text class="reg-sub">填写信息完成注册</text>
		</view>

		<view class="list">
			<view class="list-call">
				<u-icon name="phone" color="#EE2626" size="40"></u-icon>
				<input class="sl-input" v-model="phone" type="number" maxlength="11" placeholder="手机号（将作为账号）" />
			</view>
			<view class="list-call">
				<u-icon name="account" color="#EE2626" size="40"></u-icon>
				<input class="sl-input" v-model="userName" type="text" maxlength="32" placeholder="用户名（可用手机号）" />
			</view>
			<view class="list-call">
				<u-icon name="lock" color="#EE2626" size="40"></u-icon>
				<input class="sl-input" v-model="password" type="text" maxlength="32" placeholder="登录密码（至少6位）"
					:password="!showPassword" />
				<u-icon @click="display" :name="showPassword?'eye-off':'eye-fill'" color="#EE2626" size="40"></u-icon>
			</view>
			<view class="list-call">
				<u-icon name="fingerprint" color="#EE2626" size="40"></u-icon>
				<input class="sl-input" v-model="confirmPassword" type="text" maxlength="32" placeholder="确认密码"
					:password="!showConfirmPassword" />
				<u-icon @click="displayConfirm" :name="showConfirmPassword?'eye-off':'eye-fill'" color="#EE2626" size="40"></u-icon>
			</view>
			<view class="list-call">
				<u-icon name="coupon" color="#EE2626" size="40"></u-icon>
				<input class="sl-input" v-model="inviteCode" type="text" maxlength="20" placeholder="请输入邀请码" />
			</view>
		</view>

		<view class="button-login" hover-class="button-hover" @tap="bindRegister">
			<text>注册</text>
		</view>

		<view class="back-login" @tap="goToLogin">
			<text>已有账号？返回登录</text>
		</view>

		<view class="agreement">
			<image @tap="agreementSuccess"
				:src="agreement==true?'/static/images/login/ty1.png':'/static/images/login/ty0.png'"></image>
			<text @tap="agreementSuccess"> 同意</text>
			<navigator url="agreement?id=1" open-type="navigate">《软件用户协议》</navigator>
		</view>
	</view>
</template>

<script>
	import {
		registerApi
	} from "@/nxTemp/apis/login.js";

	export default {
		onLoad() {},
		data() {
			return {
				phone: '',
				userName: '',
				password: '',
				confirmPassword: '',
				inviteCode: '',
				agreement: true,
				showPassword: false,
				showConfirmPassword: false
			};
		},
		methods: {
			display() {
				this.showPassword = !this.showPassword;
			},
			displayConfirm() {
				this.showConfirmPassword = !this.showConfirmPassword;
			},
			agreementSuccess() {
				this.agreement = !this.agreement;
			},
			goToLogin() {
				uni.navigateBack();
			},
			bindRegister() {
				// 同意协议校验
				if (this.agreement == false) {
					uni.showToast({
						icon: 'none',
						title: '请先阅读《软件用户协议》'
					});
					return;
				}
				// 手机号校验
				if (this.phone.length != 11) {
					uni.showToast({
						icon: 'none',
						title: '手机号格式不正确，请输入11位手机号'
					});
					return;
				}
				if (!/^1[3-9]\d{9}$/.test(this.phone)) {
					uni.showToast({
						icon: 'none',
						title: '手机号格式不正确'
					});
					return;
				}
				// 用户名处理：若为空则用手机号作为用户名
				if (this.userName.trim().length === 0) {
					this.userName = this.phone;
				}
				// 密码校验
				if (this.password.length < 6) {
					uni.showToast({
						icon: 'none',
						title: '密码至少需要 6 位'
					});
					return;
				}
				// 确认密码校验
				if (this.password !== this.confirmPassword) {
					uni.showToast({
						icon: 'none',
						title: '两次输入的密码不一致'
					});
					return;
				}
				// 邀请码校验
				if (!this.inviteCode || this.inviteCode.trim().length === 0) {
					uni.showToast({
						icon: 'none',
						title: '邀请码不能为空'
					});
					return;
				}
				if (this.inviteCode.trim() !== '2026') {
					uni.showToast({
						icon: 'none',
						title: '邀请码无效，请输入正确的邀请码',
						duration: 2500
					});
					return;
				}

				// 提交注册请求
				uni.showLoading({
					title: '注册中...',
					mask: true
				});

				const registerData = {
					phone: this.phone,
					userName: this.userName.trim(),
					password: this.password,
					inviteCode: this.inviteCode.trim(),
					role: 'user',
					permission: 'normal',
					email: '',
					garminPassword: '',
					realName: '',
					city: '',
					province: '',
					country: '',
					avatar: '',
					nwpu: 0,
					nwpuId: '',
					college: '',
					grade: 0,
					type: '未知',
					sex: '男',
					height: 0,
					weight: 0.0,
					doctorId: 1,
					depressed: '',
					remark: ''
				};

				registerApi(registerData).then(res => {
					if (res.code == 200) {
						// 注册成功，保存用户信息和 token
						if (res.result) {
							this.$store.dispatch('setUserData', res.result);
						}
						if (res.header && res.header.Authorization) {
							this.$store.dispatch('setToken', res.header.Authorization);
						} else if (res.header && res.header.authorization) {
							this.$store.dispatch('setToken', res.header.authorization);
						}
						uni.hideLoading();
						uni.showToast({
							title: '注册成功！',
							icon: 'success',
							duration: 1500
						});
						setTimeout(() => {
							uni.reLaunch({
								url: '/pages/index/index'
							});
						}, 1500);
					} else {
						uni.hideLoading();
						uni.showToast({
							title: res.message || '注册失败，请重试',
							icon: 'none',
							duration: 3000
						});
					}
				}).catch(err => {
					uni.hideLoading();
					const msg = (err && err.errMsg) ? err.errMsg : '注册失败，请重试';
					uni.showToast({
						title: msg,
						icon: 'none',
						duration: 3000
					});
				});
			}
		}
	}
</script>

<style>
	page {
		background: linear-gradient(to bottom, rgb(198, 221, 255), rgb(88, 107, 203));
	}

	.content {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		padding-bottom: 40rpx;
	}

	.reg-header {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-top: 80rpx;
		padding-bottom: 40rpx;
	}

	.reg-title {
		font-size: 50rpx;
		font-weight: bold;
		color: #333;
		margin-bottom: 12rpx;
	}

	.reg-sub {
		font-size: 28rpx;
		color: #666;
	}

	.list {
		display: flex;
		flex-direction: column;
		padding-top: 20rpx;
		padding-left: 70rpx;
		padding-right: 70rpx;
		background-color: rgba(255, 255, 255, 0.85);
		margin: 0 30rpx;
		border-radius: 20rpx;
		box-shadow: 0 4rpx 20rpx rgba(0, 0, 0, 0.08);
	}

	.list-call {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
		height: 100rpx;
		color: #333333;
		border-bottom: 0.5px solid #e2e2e2;
	}

	.list-call:last-child {
		border-bottom: none;
	}

	.list-call .sl-input {
		flex: 1;
		text-align: left;
		font-size: 32rpx;
		margin-left: 16rpx;
	}

	.button-login {
		color: #FFFFFF;
		font-size: 34rpx;
		width: 470rpx;
		height: 100rpx;
		line-height: 100rpx;
		background: linear-gradient(#f6d365, #fda085);
		border-radius: 50rpx;
		text-align: center;
		margin-left: auto;
		margin-right: auto;
		margin-top: 60rpx;
	}

	.button-hover {
		background: linear-gradient(#fda085, #f6d365);
	}

	.back-login {
		text-align: center;
		margin-top: 30rpx;
		font-size: 28rpx;
		color: #fff;
	}

	.agreement {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		font-size: 28rpx;
		margin-top: 40rpx;
		color: #fff;
		text-align: center;
		height: 40rpx;
		line-height: 40rpx;
	}

	.agreement image {
		width: 40rpx;
		height: 40rpx;
	}

	.agreement navigator {
		color: #f6d365;
		font-size: 28rpx;
	}
</style>
