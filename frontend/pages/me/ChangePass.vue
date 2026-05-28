<template>
	<view>
		<u--form class="form" labelPosition="top" ref="form" :labelWidth='labelWidth' :model="psInfo" :rules="rules">
			<u-form-item label="原密码" prop="oldPs" required>
				<u--input type="password" v-model="psInfo.oldPs" style="background-color: white;"></u--input>
			</u-form-item>

			<u-form-item label="新密码" prop="newPs" required>
				<u--input type="password" v-model="psInfo.newPs" style="background-color: white;"></u--input>
			</u-form-item>

			<u-form-item label="重复新密码" prop="repeatNewPs" required>
				<u--input type="password" v-model="psInfo.repeatNewPs" style="background-color: white;"></u--input>
			</u-form-item>

		</u--form>

		<button type="primary" @click="submit('form')" style="margin-top: 35px; width: 90%; background-color: #4554F5">提交</button>
		<!--            <el-button @click="resetuni-forms('DailyReport')">重置</el-button>-->
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
				psInfo: {
					oldPs: null,
					newPs: null,
					repeatNewPs: null
				},
				rules: {
					oldPs: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					newPs: [{
							required: true,
							message: "此项为必填项",
							trigger: 'blur'
						},
						{
							validator: (rule, value, callback) => {
								return value.length > 5;
							},
							message: '密码太短',
							// 触发器可以同时用blur和change
							trigger: ['change', 'blur'],
						}
					],
					repeatNewPs: [{
							required: true,
							message: "此项为必填项",
							trigger: 'blur'
						},
						{
							validator: (rule, value, callback) => {
								return value.length > 5;
							},
							message: '密码太短',
							// 触发器可以同时用blur和change
							trigger: ['change', 'blur'],
						},
						{
							validator: (rule, value, callback) => {
								return value == this.psInfo.newPs;
							},
							message: '两次输入密码不一致',
							// 触发器可以同时用blur和change
							trigger: ['change', 'blur'],
						}
					]
				},
				labelWidth: '80%',
			}
		},
		methods: {
			submit(formName) {
				let _this = this;

				this.$refs.form.validate().then(res => {
					let dataToAdd = {
						oldPassword: this.psInfo.oldPs,
						newPassword: this.psInfo.newPs
					};

					http.post(`${config.baseUrl}/user/updatePassword`, dataToAdd).then((res) => {
						if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
							uni.$u.toast("修改成功，请重新登录");

							_this.$store.dispatch('setUserData', null);
							uni.setStorageSync('token', null);
							setTimeout(() => {
								uni.reLaunch({
									url: "/pages/login/login"
								});
							}, 500)
						} else { //返回非200，弹窗提示失败，停留在此页
							uni.showToast({
								title: "提交失败",
								icon: 'error'
							});
						}
					})
				}).catch(err => {
					uni.$u.toast("表单填写有误，请修改后重新提交");
				})
			},

			changeRadio() {
				const _this = this;
			},
			resetform(formName) {
				this.$refs[formName].resetFields();
			},
		},
		onLoad(parms) {},
	}
</script>

<style lang="scss" scoped>
	.form {
		margin: 15px;
		padding-left: 30rpx;
		padding-right: 30rpx;
	}

	.center {
		text-align: center;
	}

	.title {
		font-size: 30rpx;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px; // 文字
		margin: 10px auto;
		border-left: 8px solid rgb(64, 158, 255);

	}

	.uni-forms {
		padding-left: 15px;
	}

	.el-dropdown-link {
		cursor: pointer;
		color: #409EFF;
	}

	.el-icon-arrow-down {
		font-size: 12px;
	}
</style>