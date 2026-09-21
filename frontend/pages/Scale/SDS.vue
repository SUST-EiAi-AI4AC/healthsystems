<template>
	<view>
		<p class="title">{{ $t('scales.common.recollectRecentTwoWeeks') }}</p>

		<div class="box-card">
			<p>{{ $t('scales.common.scaleInstruction') }}</p>
		</div>

		<div id="myFormBox" v-bind:class="{'form-box': isActive}" style="margin-top: 5px;">
			<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
				<div v-for="page in 20" :key="page" v-if="currentPage === page">
					<u-form-item style="font-weight: bold;" :label="getQuestionLabel(page)" :prop="'q' + page" required>
						<u-radio-group placement="column" v-model="PHQ['q' + page]" @change="changeRadio">
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
			<div v-if="currentPage === 20"><button class="button" @click="submit">{{ $t('scales.common.submit') }}</button></div>
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
				PHQ: {
					id: 0,
					logDate: '',
					q1: null,
					q2: null,
					q3: null,
					q4: null,
					q5: null,
					q6: null,
					q7: null,
					q8: null,
					q9: null,
					q10: null,
					q11: null,
					q12: null,
					q13: null,
					q14: null,
					q15: null,
					q16: null,
					q17: null,
					q18: null,
					q19: null,
					q20: null,
					score: '50',
					userId: ''
				},

				rules: {
					q1: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'change'
					}],
					q2: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q3: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q4: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q5: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q6: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q7: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q8: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q9: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q10: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q11: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q12: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q13: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q14: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q15: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q16: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q17: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q18: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q19: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}],
					q20: [{
						type: 'number',
						required: true,
						message: this.$t('scales.common.requiredNotice') || "此项为必填项",
						trigger: 'blur'
					}]
				},
				labelPosition: 'top',
				currentPage: 1, // 控制当前页面  
				LevelList: []
			};
		},

		computed: {
			currentLevelList() {
				const opts = this.$t('scales.sds.options');
				const defaultOpts = ["没有或很少时间", "少部分时间", "相当多时间", "大部分或全部时间"];
				return [
					{ qId: 1, message: (opts && opts[0]) || defaultOpts[0] },
					{ qId: 2, message: (opts && opts[1]) || defaultOpts[1] },
					{ qId: 3, message: (opts && opts[2]) || defaultOpts[2] },
					{ qId: 4, message: (opts && opts[3]) || defaultOpts[3] }
				];
			},
			sdsQuestions() {
				return this.$t('scales.sds.questions') || [];
			}
		},

		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('scales.sds.navTitle') || '抑郁自测量表SDS'
			});
		},

		methods: {
			getQuestionLabel(page) {
				if (this.sdsQuestions && this.sdsQuestions[page - 1]) {
					return this.sdsQuestions[page - 1];
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
				    
				  //   this.$refs.form.validate().then(valid => {  
				  //     if (valid) {  
				  //       this.currentPage--;  
				  //     } else {  
				  //       uni.$u.toast('请填写该问题');  
				  //     }  
				  //   }).catch(err => {  
						// uni.$u.toast('请填写该问题');  
				  //   });  
					this.currentPage--;  
				} 
			},

			submit() {
				let _this = this;
				this.$refs.form.validate().then(vaild => {
					if (vaild) {
						console.log(this.PHQ)
						//后端通信
						http.post(`${config.baseUrl}/scale/phq9/add`, this.PHQ).then((res) => {
							if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
								uni.showToast({
									title: this.$t('scales.common.submitSuccess') || "提交成功"
								});
								// 保存历史记录
								try {
									const qKeys = ['q1','q2','q3','q4','q5','q6','q7','q8','q9','q10','q11','q12','q13','q14','q15','q16','q17','q18','q19','q20'];
									const rawSum = qKeys.reduce((s,k) => s + (parseInt(this.PHQ[k]) || 0), 0);
									const sdsScore = Math.round(rawSum * 1.25);
									const level = sdsScore < 50 ? '无抑郁' : sdsScore < 60 ? '轻度抑郁' : sdsScore < 70 ? '中度抑郁' : '重度抑郁';
									const entry = {
										scale: 'SDS', scaleName: '抑郁自测量表',
										date: new Date().toLocaleString(),
										totalScore: sdsScore,
										level,
										levelColor: sdsScore < 50 ? '#43e97b' : sdsScore < 60 ? '#fda085' : '#f5576c',
										scoreText: `SDS换算分 ${sdsScore}`,
										dims: [], comment: `SDS换算分：${sdsScore}\n评估等级：${level}`,
										rawScores: { 'SDS换算分': sdsScore, '等级': level }
									};
									const sh = uni.getStorageSync('scale_history') || [];
									sh.push(entry);
									uni.setStorageSync('scale_history', sh);
								} catch(e) {}
								setTimeout(() => {
									uni.navigateTo({
										url: '/pages/Response/RePHQ'
									});
								}, 700);
							} else { //返回非200，弹窗提示失败，停留在此页
								uni.showToast({
									title: this.$t('scales.common.submitFailed') || "提交失败",
									icon: 'error'
								});
							}
						})
					} else {
						uni.$u.toast(this.$i18n && this.$i18n.currentLang === 'en' ? 'Please complete all items before submitting' : "需全部填写后才能提交哦");
						console.log("submit error!")
						return false
					}
				}).catch(err => {
					uni.$u.toast(this.$t('scales.common.fillRequired') || "请填写该问题");
					// const query = uni.createSelectorQuery().in(this);
					// var dataTitle;
					// query.select(`.title`).boundingClientRect((data) => {
					// 	dataTitle = data;
					// 	console.log(data)
					// }).exec();

					// var itemBody;
					// query.select(`.u-form-item__body`).boundingClientRect((data) => {
					// 	itemBody = data;
					// }).exec();

					// query.select(`.u-form-item__body__right__message`).boundingClientRect((data) => {
					// 	uni.pageScrollTo({
					// 		scrollTop: data.top - dataTitle.top - itemBody.height,
					// 		duration: 100
					// 	});
					// }).exec();
				});
			},

			changeRadio() {
				const _this = this;
			},

			resetform(formName) {
				this.$refs[formName].resetFields();
			},

			getRecentInput() {
				http.get(`${config.baseUrl}/scale/phq9/getRecentInput`).then((res) => {
					if (res.result) {
						this.PHQ = res.result;
						uni.showToast({
							title: this.$i18n && this.$i18n.currentLang === 'en' ? 'Submitted within the last two weeks' : "两周内已填报"
						});
						//是否生效遮罩控制不修改已填写表单
						this.isActive = true
						// let myDiv = document.getElementById('myFormBox');
						// if (this.isActive) {  
						    // myDiv.classList.add('form-box'); // 如果isActive为true，则添加form-box类  
						// } 
						// else {  
						//     myDiv.classList.remove('form-box'); // 如果isActive为false，则移除form-box类  
						// }
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