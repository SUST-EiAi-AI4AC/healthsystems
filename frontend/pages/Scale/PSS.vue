<template>
	<view>
		<p class="title">{{ $t('scales.common.recollectRecentTwoWeeks') }}</p>

		<div class="box-card">
			<p>{{ $t('scales.common.scaleInstruction') }}</p>
		</div>

		<div id="myFormBox" v-bind:class="{'form-box': isActive}" style="margin-top: 5px;">
			<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
				<div v-for="page in 14" :key="page" v-if="currentPage === page">
					<u-form-item :label="getQuestionLabel(page)" :prop="'pssQ' + page" required>
						<u-radio-group placement="column" v-model="PSS['pssQ' + page]" @change="changeRadio">
							<u-radio v-for="item in currentLevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
				</div>
			</u-form>
		</div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">{{ $t('scales.common.prev') }}</button></div>
			<div v-if="currentPage !== 14"><button class="button" @click="nextPage">{{ $t('scales.common.next') }}</button></div>
			<div v-if="currentPage === 14"><button class="button" @click="submit('PSS')">{{ $t('scales.common.submit') }}</button></div>
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
			return {
				isActive: false,
				PSS: {
					id: 0,
					logDate: '',
					pssQ1: '',
					pssQ2: '',
					pssQ3: '',
					pssQ4: '',
					pssQ5: '',
					pssQ6: '',
					pssQ7: '',
					pssQ8: '',
					pssQ9: '',
					pssQ10: '',
					pssQ11: '',
					pssQ12: '',
					pssQ13: '',
					pssQ14: '',
					score: '50',
					userId: ''
				},

				rules: {
					pssQ1: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ2: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ3: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ4: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ5: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ6: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ7: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ8: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ9: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ10: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ11: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ12: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ13: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					pssQ14: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}]
				},

				currentPage: 1,

				LevelList: []
			}
		},

		computed: {
			currentLevelList() {
				const opts = this.$t('scales.pss.options');
				const defaultOpts = ["从不", "几乎没有", "有时有", "相当多", "总是"];
				return [
					{ qId: 0, message: (opts && opts[0]) || defaultOpts[0] },
					{ qId: 1, message: (opts && opts[1]) || defaultOpts[1] },
					{ qId: 2, message: (opts && opts[2]) || defaultOpts[2] },
					{ qId: 3, message: (opts && opts[3]) || defaultOpts[3] },
					{ qId: 4, message: (opts && opts[4]) || defaultOpts[4] }
				];
			},
			pssQuestions() {
				return this.$t('scales.pss.questions') || [];
			}
		},

		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('scales.pss.navTitle') || '压力自测量表PSS'
			});
		},

		methods: {
			getQuestionLabel(page) {
				if (this.pssQuestions && this.pssQuestions[page - 1]) {
					return this.pssQuestions[page - 1];
				}
				return page + '.';
			},

			nextPage() {
				if (this.currentPage < 14) {  
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
				console.log(_this.PSS)
				this.$refs.form.validate().then(res => {
					http.post(`${config.baseUrl}/scale/ps/add`, this.PSS).then((res) => {
						console.log(res.data)
						if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
							uni.showToast({
								title: this.$t('scales.common.submitSuccess') || "提交成功"
							});
							// 保存历史记录
							try {
								const qKeys = ['pssQ1','pssQ2','pssQ3','pssQ4','pssQ5','pssQ6','pssQ7','pssQ8','pssQ9','pssQ10','pssQ11','pssQ12','pssQ13','pssQ14'];
								const total = qKeys.reduce((s,k) => s + (parseInt(this.PSS[k]) || 0), 0);
								const level = total <= 13 ? '压力轻微' : total <= 26 ? '压力中等' : '压力较重';
								const entry = {
									scale: 'PSS', scaleName: '压力自测量表',
									date: new Date().toLocaleString(),
									totalScore: total,
									level,
									levelColor: total <= 13 ? '#43e97b' : total <= 26 ? '#fda085' : '#f5576c',
									scoreText: `PSS得分 ${total}`,
									dims: [], comment: `PSS总分：${total}\n压力等级：${level}`,
									rawScores: { 'PSS得分': total, '压力等级': level }
								};
								const sh = uni.getStorageSync('scale_history') || [];
								sh.push(entry);
								uni.setStorageSync('scale_history', sh);
							} catch(e) {}
							setTimeout(() => {
								uni.navigateTo({
									url: '/pages/Response/RePSS'
								});
							}, 700);
						} else { //返回非200，弹窗提示失败，停留在此页
							uni.showToast({
								title: this.$t('scales.common.submitFailed') || "提交失败",
								icon: 'error'
							});
						}
					})
				}).catch(err => {
					uni.$u.toast(this.$t('scales.common.fillRequired') || "请填写该问题");
					const query = uni.createSelectorQuery().in(this);
					var dataTitle;
					query.select(`.title`).boundingClientRect((data) => {
						dataTitle = data;
					}).exec();

					var itemBody;
					query.select(`.u-form-item__body`).boundingClientRect((data) => {
						itemBody = data;
					}).exec();

					query.select(`.u-form-item__body__right__message`).boundingClientRect((data) => {
						uni.pageScrollTo({
							scrollTop: data.top - dataTitle.top - itemBody.height,
							duration: 100
						});
					}).exec();
				});
			},

			changeRadio() {
				const _this = this;
			},
			resetform(formName) {
				this.$refs[formName].resetFields();
			},
			getRecentInput() {
				http.get(`${config.baseUrl}/scale/ps/getRecentInput`).then((res) => {
					if (res.result) {
						this.PSS = res.result;

						uni.showToast({
							title: this.$i18n && this.$i18n.currentLang === 'en' ? 'Submitted within the last two weeks' : "两周内已填报"
						});
						
						//是否生效遮罩控制不修改已填写表单
						this.isActive = true
					}
				})
			}
		},
		onLoad(parms) {
			this.getRecentInput();
		},
	}
</script>

<style lang="scss" scoped>
	.title {
		font-size: 38rpx;
		color: rgb(98, 98, 98);
		padding: 10px 0 10px 15px; // 文字
		font-weight: bold;
		// margin: 10px auto;
		border-left: 10px solid #4554F5;
		// border: 2px solid #00ff00;
	}

	.box-card {
		width: auto;
		height: 100px;
		background-color: rgb(254, 254, 254);
		// border-radius: 10px;
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
		// margin-top: 5px;
		// border-radius: 10px;
		position: relative;
		&::before {
			// border: 2px solid #00ff00;
		    content: "";  
		    position: absolute;  
		    top: 0;  
		    left: 0;  
		    right: 0;  
		    bottom: 0;  
		    // background-image: url('@/static/images/scale/hug.jpg');  
		    background-size: cover;  
		    background-position: center;  
		    filter: blur(2px); // 调整模糊度  
		    z-index: 1; // 确保这个伪元素位于原元素之下  
		} 
	}
	
	::v-deep .u-form-item {
		// font-size: 20px;
		font-weight: bold;
		// border: 2px solid #00ff00;
		margin-bottom: 10px;
	}
	
	::v-deep .u-radio-group {
		display: flex; // 假设你想让它以flex布局显示  
		flex-direction: column; // 已经是column了，但这里只是示例  
		width: 100%;
		margin-top: 10px;
	} 
	
	::v-deep .u-radio {  
		// 修改单选按钮的样式  
		width: 100% !important;
		box-sizing: border-box !important;
		height: 60px;
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
	}  
	
	::v-deep .u-radio__text,
	::v-deep .u-radio__label {
		flex: 1 !important;
		width: 100% !important;
		height: 100% !important;
		display: flex !important;
		align-items: center !important;
	}
	
	.all-button{
		width: 100%;
		display: flex;
		justify-content: center;
		margin-top: 30px;
		margin-bottom: 40px;
	}
	.button {
		width: 160px;
		background-color: #4554F5;
		color: white;
		margin: 10px;
	}
</style>