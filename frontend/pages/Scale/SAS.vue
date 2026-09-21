<template>
	<view>
		<p class="title">{{ $t('scales.common.recollectRecentTwoWeeks') }}</p>

		<div class="box-card">
			<p>{{ $t('scales.common.scaleInstruction') }}</p>
		</div>

		<div id="myFormBox" v-bind:class="{'form-box': isActive}" style="margin-top: 5px;">
			<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
				<div v-for="page in 20" :key="page" v-if="currentPage === page">
					<u-form-item :label="getQuestionLabel(page)" :prop="'sasQ' + page" required>
						<u-radio-group placement="column" v-model="SAS['sasQ' + page]" @change="changeRadio">
							<u-radio v-for="item in currentLevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
				</div>
			</u-form>
		</div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">{{ $t('scales.common.prev') }}</button></div>
			<div v-if="currentPage !== 20"><button class="button" @click="nextPage">{{ $t('scales.common.next') }}</button></div>
			<div v-if="currentPage === 20"><button class="button" @click="submit('SAS')">{{ $t('scales.common.submit') }}</button></div>
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
			const rules = {};
			for (let i = 1; i <= 20; i++) {
				rules['sasQ' + i] = [{
					type: 'number',
					required: true,
					message: this.$t('scales.common.requiredNotice') || "此项为必填项",
					trigger: 'blur'
				}];
			}
			return {
				isActive: false,
				SAS: {
					id: 0,
					logDate: '',
					sasQ1: '',
					sasQ2: '',
					sasQ3: '',
					sasQ4: '',
					sasQ5: '',
					sasQ6: '',
					sasQ7: '',
					sasQ8: '',
					sasQ9: '',
					sasQ10: '',
					sasQ11: '',
					sasQ12: '',
					sasQ13: '',
					sasQ14: '',
					sasQ15: '',
					sasQ16: '',
					sasQ17: '',
					sasQ18: '',
					sasQ19: '',
					sasQ20: '',
					score: '50',
					userId: ''
				},
				rules,
				currentPage: 1,
				labelPosition: 'top',
				LevelList: []
			};
		},

		computed: {
			currentLevelList() {
				const opts = this.$t('scales.sas.options');
				const defaultOpts = ["没有或很少时间", "少部分时间", "相当多时间", "大部分或全部时间"];
				return [
					{ qId: 1, message: (opts && opts[0]) || defaultOpts[0] },
					{ qId: 2, message: (opts && opts[1]) || defaultOpts[1] },
					{ qId: 3, message: (opts && opts[2]) || defaultOpts[2] },
					{ qId: 4, message: (opts && opts[3]) || defaultOpts[3] }
				];
			},
			sasQuestions() {
				return this.$t('scales.sas.questions') || [];
			}
		},

		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('scales.sas.navTitle') || '焦虑自测量表SAS'
			});
		},

		onLoad(parms) {
			this.getRecentInput();
		},

		methods: {
			getQuestionLabel(page) {
				if (this.sasQuestions && this.sasQuestions[page - 1]) {
					return this.sasQuestions[page - 1];
				}
				return page + '.';
			},

			nextPage() {
				if (this.currentPage < 20) {  
				    this.$refs.form.validate().then(valid => {  
				      if (valid) {  
				        this.currentPage++;  
				      } else {  
				        uni.$u.toast(this.$t('scales.common.fillRequired') || '请填写该问题');  
				      }  
				    }).catch(err => {  
						uni.$u.toast(this.$t('scales.common.fillRequired') || '请填写该问题');  
				    });  
				} 
			},
			
			prevPage() {
				if (this.currentPage > 1) {
					this.currentPage--;  
				} 
			},

			submit(formName) {
				let _this = this;
				this.$refs.form.validate().then(vaild => {
					if (vaild) {
						http.post(`${config.baseUrl}/scale/sas/add`, this.SAS).then((res) => {
							if (res.code === 200) {
								uni.showToast({
									title: _this.$t('scales.common.submitSuccess') || "提交成功"
								});
								// 保存历史记录
								try {
									const qKeys = ['sasQ1','sasQ2','sasQ3','sasQ4','sasQ5','sasQ6','sasQ7','sasQ8','sasQ9','sasQ10','sasQ11','sasQ12','sasQ13','sasQ14','sasQ15','sasQ16','sasQ17','sasQ18','sasQ19','sasQ20'];
									const rawSum = qKeys.reduce((s,k) => s + (parseInt(this.SAS[k]) || 0), 0);
									const sasScore = Math.round(rawSum * 1.25);
									const level = sasScore < 50 ? '没有焦虑' : sasScore < 60 ? '轻度焦虑' : sasScore < 70 ? '中度焦虑' : '重度焦虑';
									const entry = {
										scale: 'SAS', scaleName: '焦虑自测量表',
										date: new Date().toLocaleString(),
										totalScore: sasScore,
										level,
										levelColor: sasScore < 50 ? '#43e97b' : sasScore < 60 ? '#fda085' : '#f5576c',
										scoreText: `SAS换算分 ${sasScore}`,
										dims: [], comment: `SAS换算分：${sasScore}\n焦虑等级：${level}`,
										rawScores: { 'SAS换算分': sasScore, '焦虑等级': level }
									};
									const sh = uni.getStorageSync('scale_history') || [];
									sh.push(entry);
									uni.setStorageSync('scale_history', sh);
								} catch(e) {}
								setTimeout(() => {
									uni.reLaunch({
										url: "/pages/Response/ReSAS"
									});
								}, 700);
							} else {
								uni.showToast({
									title: _this.$t('scales.common.submitFailed') || "提交失败",
									icon: 'error'
								});
							}
						})
					} else {
						uni.$u.toast(this.$i18n && this.$i18n.currentLang === 'en' ? 'Please complete all items before submitting' : "需全部填写后才能提交哦");
						return false
					}
				}).catch(err => {
					uni.$u.toast(_this.$t('scales.common.fillRequired') || "请填写该问题");
				});
			},

			changeRadio() {},

			resetform(formName) {
				this.$refs[formName].resetFields();
			},

			getRecentInput() {
				http.get(`${config.baseUrl}/scale/sas/getRecentInput`).then((res) => {
					if (res.result) {
						this.SAS = res.result;
						uni.showToast({
							title: this.$i18n && this.$i18n.currentLang === 'en' ? 'Submitted within the last two weeks' : "两周内已填报"
						});
						this.isActive = true;
					}
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.title {
		font-size: 38rpx;
		color: rgb(98, 98, 98);
		padding: 10px 0 10px 15px;
		font-weight: bold;
		border-left: 10px solid #4554F5;
	}
	
	.box-card {
		width: auto;
		height: 100px;
		background-color: rgb(254, 254, 254);
		margin: 15px 5px 5px 5px;
	
		p {
			font-size: 1.0em;
			color: rgb(40, 40, 40);
			padding: 18px 10px 10px 18px;
		}
	}
	
	.form {
		padding-left: 50rpx;
		padding-right: 50rpx;
	}
	
	.form-box {
		position: relative;
		&::before {
			content: "";
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-color: rgba(255, 255, 255, 0.7);
			z-index: 10;
		}
	}
	
	.all-button {
		position: fixed;
		bottom: 0;
		width: 100%;
		display: flex;
		justify-content: space-around;
		background-color: #ffffff;
		padding: 15rpx 0 25rpx 0;
		box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
	}
	
	.button {
		background-color: #4554F5;
		color: white;
		border-radius: 20px;
		min-width: 130px;
		font-size: 32rpx;
	}
</style>
