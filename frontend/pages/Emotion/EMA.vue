<template>
	<view>
		<p class="title">请选择一张最能描述您当前心情的图片</p>

		<!--     SINGLE SELECTION-->
		<!--    可以增加 :use-label="true" 来显示图片的标签 -->
		<vue-select-image v-bind:class="{'form-2': isActive}" :dataImages="dataImages" @onselectimage="onSelectImage" ref="singleSelectImage">
		</vue-select-image>
		
		<u-divider class="custom-divider" text-align="center" /> 

		<p class="title">请回答下列问题</p>

		<u--form v-bind:class="{'form': isActive}" :model="EMAAnswer" labelWidth='100%' label-position="top" :rules="rules" ref="form" style="padding-left: 50rpx; padding-right: 50rpx; display:flex; align-content: flex-start; flex-wrap: wrap;">

			<!--          <u-form-item label="1. How are you right now?">-->
			<u-form-item label="1、您现在感觉怎么样？" prop="mood" required>
				<u-radio-group placement="column" v-model="EMAAnswer.mood" @change="changeRadio" >
					<u-radio v-for="item in moodList" :label="item" :key="item" :name="item" >
					</u-radio>
				</u-radio-group>
			</u-form-item>

			<!--          <u-form-item :label="`2. If you feel {EMAAnswer.mood}，how ${EMAAnswer.mood}?`">-->
			<u-form-item :label="`2、如果您感到${EMAAnswer.mood}，${EMAAnswer.mood}的程度如何？`" prop="moodLevel" required>
				<u-radio-group placement="column" v-model="EMAAnswer.moodLevel" @change="changeRadio">
					<u-radio v-for="item in moodLevelList" :label="item" :key="item" :name="item" style="margin: 5rpx;">
					</u-radio>
				</u-radio-group>
			</u-form-item>

			<u-form-item label="3、您现在感觉有压力吗？" prop="stressLevel" required>
				<u-radio-group placement="column" v-model="EMAAnswer.stressLevel" @change="changeRadio">
					<u-radio v-for="item in stressLevelList" :label="item" :key="item" :name="item"
						style="margin: 5rpx;">
					</u-radio>
				</u-radio-group>
			</u-form-item>
	
			<button type="primary" @click="submit()" class="button">确定</button>

		</u--form>
		
		
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import VueSelectImage from "@/CustomComponents/vue-select-image/VueSelectImage.vue"
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";
	import data, {
		getArousalById,
		getValenceById
	} from "./IMAGE_FOLDERS.js"
	import {
		getPAMScoreById
	} from "./IMAGE_FOLDERS";

	export default {
		components: {
			VueSelectImage
		},

		data() {
			return {
				isActive : false,
				// 需要提交给服务器的表单
				EMAAnswer: {
					id: 0, // 不用管
					logDate: "", // 数据库维护
					logTime: 0, // 数据库维护
					userId: 1,

					// 下面的是需要前端维护的
					mood: '',
					moodLevel: '',
					stressLevel: '',
					speechUrl: '',
					pam: '',
					pamScore: 0,
					valence: 0,
					arousal: 0,
					imgSelected: null,
					imgDatas: null
				},

				// Form 组件提供了表单验证的功能，只需要通过 rules 属性传入约定的验证规则，并将 Form-Item 的 prop 属性设置为需校验的字段名即可。
				rules: {
					mood: [{
						required: true,
						message: '请选择您现在的感觉',
						trigger: 'change'
					}],
					moodLevel: [{
						required: true,
						message: '请选择这种感觉的程度',
						trigger: 'change'
					}],
					stressLevel: [{
						required: true,
						message: '请选择您现在的压力程度',
						trigger: 'change'
					}],
					//  pam没有使用elementui所以在submit按钮响应函数里判断，未选择图片就弹框提示
				},

				labelPosition: 'top',
				
				// 中文版
				moodList: ["高兴", "悲伤", "生气", "恐惧", "忧虑", "中性", "疲惫"],
				moodLevelList: ["有一点", "中等程度", "比较多", "极其多"],
				stressLevelList: ["没有压力", "有一点压力", "有一定程度的压力", "压力很大"],

				// 记录选中图片的信息
				imageSelected: {
					id: '',
					src: '',
					alt: ''
				},
				dataImages: data.dataImages,
			}
		},
		methods: {
			/**
			 * 选择图片的响应函数
			 */
			onSelectImage: function(data) {
				console.log('fire event onSelectImage: ', data)
				this.imageSelected = data
			},

			submit() {
				let _this = this;
				this.$refs.form.validate().then(vaild => {

					if (vaild) {
						if (_this.imageSelected.id !== '' && _this.imageSelected.alt !== '') {

							const _this = this
							_this.EMAAnswer.imgDatas = JSON.stringify(this.dataImages);
							_this.EMAAnswer.imgSelected = JSON.stringify(this.imageSelected);

							// pam
							_this.EMAAnswer.pam = this.imageSelected.alt;
							console.log("pam:", _this.EMAAnswer.pam);


							// pamScore
							_this.EMAAnswer.pamScore = getPAMScoreById(this.imageSelected.id);
							console.log("pamScore:", _this.EMAAnswer.pamScore);

							// valence
							_this.EMAAnswer.valence = getValenceById(this.imageSelected.id);
							console.log("valence:", _this.EMAAnswer.valence);

							// arousal
							_this.EMAAnswer.arousal = getArousalById(this.imageSelected.id);
							console.log("arousal:", _this.EMAAnswer.arousal);

							//后端通信
							http.post(`${config.baseUrl}/emaanswer/add`, this.EMAAnswer).then((res) => {

								if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
									uni.showToast({
										title: "提交成功"
									});

									setTimeout(() => {
										uni.reLaunch({
											url: "/pages/index/index"
										});
									}, 700);
								} else { //返回非200，弹窗提示失败，停留在此页
									uni.showToast({
										title: "提交失败",
										icon: 'error'
									});
								}
							});
						} else {
							uni.showToast({
								title: "请选择一个图片",
								icon: 'error'
							});
							console.log("submit error!")
							return false
						}
					}
				}).catch(err => {
					uni.$u.toast("表单填写有误，请修改后重新提交");
				});
			},

			changeRadio() {
				const _this = this;
			},
			resetform(formName) {
				this.$refs[formName].resetFields();
			},
			getRecentInput() {
				http.get(`${config.baseUrl}/emaanswer/getRecentInput`).then((res) => {
					if (res.result) {
						this.EMAAnswer = res.result;
						// debugger;
						if (res.result.imgDatas) {
							this.dataImages = JSON.parse(res.result.imgDatas);
						}
						if (res.result.imgSelected) {
							let sel = JSON.parse(res.result.imgSelected);
							let ele = this.$refs.singleSelectImage;
							ele.singleSelected.id = sel.id;
							this.imageSelected = sel;
						}

						uni.showToast({
							title: "本时间段已填报"
						});
						
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
	.center {
		/*居中*/
		text-align: center;
	}
	
	.custom-divider {
	  height: 3px; /* 分割线的高度 */  
	  background-color: #333399; /* 分割线的颜色 */  
	  width: 100%; /* 分割线的宽度，这里设置为父容器宽度的80% */  
	  margin: 10px auto; /* 上下外边距和水平居中 */  
	}
	
	.title {
		font-size: 38rpx;
		color: rgb(98, 98, 98);
		padding: 10px 0 10px 15px; // 文字
		font-weight: bold;
		// margin: 10px auto;
		border-left: 10px solid #4554F5;
		// border: 2px solid #00ff00;
	}

	.form {
		padding-left: 50rpx;
		padding-right: 50rpx;
		// border: 2px solid #00ff00;
		display: flex;  
		// align-items: center; /* 垂直居中 */  
		// justify-content: center;
		align-content: flex-start;
		/* 换行紧贴 */
		flex-wrap: wrap;
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
	
	.form-2 {
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
			width: 100%;
			// font-size: 20px;
			font-weight: bold;
			// border: 2px solid #00ff00;
			margin-bottom: 10px;
		}
		
	::v-deep .u-radio-group {
		width: 100%;
		display: flex; // 假设你想让它以flex布局显示  
		flex-direction: column; // 已经是column了，但这里只是示例  
		// border: 2px solid #00aa00;
		margin-top: 10px;
	} 
	
	::v-deep .u-radio {  
		// 修改单选按钮的样式  
		// width: 160px;
		height: 50px;
		margin: 4px 0 0 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		// border: 2px solid #00ff00;
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
	}  
	
	
	
	.button {
		width: 80%;
		background-color: #4554F5;
		color: white;
		justify-content: center; 
		// margin-bottom: 10px;
		// border: 2px solid #00ff00;
		// margin: 10px;
		
	}
	
</style>