<template>
	<view>
		<p class="title">请回想最近<span style="color: red;">两周</span>，发生下列各状况的频率</p>

		<div class="box-card">
			<p>虽然有些问题看起来相似，但对结果都有不同的影响，所以每一题均需作答。作答方式尽量以快速、不假思索方式填答，以期能反映您真实的状况。
			</p>
		</div>

		<div id="myFormBox" class="" style="margin-top: 5px;">
			<!-- 第一部分 -->
			<div v-if="currentPage === 1">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item style="font-weight: bold;" label="1.我感到郁闷，情绪低落" prop="q1" required>
						<u-radio-group placement="column" v-model="PHQ.q1" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 2">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form2" :model="PHQ" :rules="rules">
					<u-form-item label="2.我感到早晨心情最好" prop="q2" required>
						<u-radio-group placement="column" v-model="PHQ.q2" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 3">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="3.我要哭或想哭" prop="q3" required>
						<u-radio-group placement="column" v-model="PHQ.q3" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 4">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="4.我夜间睡眠不好" prop="q4" required>
						<u-radio-group placement="column" v-model="PHQ.q4" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 5">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="5.我吃东西和平常一样多" prop="q5" required>
						<u-radio-group placement="column" v-model="PHQ.q5" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 6">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="6.我与异性接触时和以往一样感到愉快" prop="q6" required>
						<u-radio-group placement="column" v-model="PHQ.q6" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 7">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="7.我感到体重减轻" prop="q7" required>
						<u-radio-group placement="column" v-model="PHQ.q7" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 8">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="8.我为便秘烦恼" prop="q8" required>
						<u-radio-group placement="column" v-model="PHQ.q8" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 9">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="9.我的心跳比平常快" prop="q9" required>
						<u-radio-group placement="column" v-model="PHQ.q9" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 10">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="10.我无故感到疲劳" prop="q10" required>
						<u-radio-group placement="column" v-model="PHQ.q10" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 11">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="11.我的头脑像往常一样清楚" prop="q11" required>
						<u-radio-group placement="column" v-model="PHQ.q11" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 12">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="12.我做事像平常一样不感到困难" prop="q12" required>
						<u-radio-group placement="column" v-model="PHQ.q12" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 13">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="13.我坐卧不安，难以平静" prop="q13" required>
						<u-radio-group placement="column" v-model="PHQ.q13" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 14">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="14.我对未来感到有希望" prop="q14" required>
						<u-radio-group placement="column" v-model="PHQ.q14" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 15">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="15.我比平时容易激动生气" prop="q15" required>
						<u-radio-group placement="column" v-model="PHQ.q15" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 16">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="16.我觉得决定什么事很容易" prop="q16" required>
						<u-radio-group placement="column" v-model="PHQ.q16" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 17">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="17.我感到自己是很有用的和不可缺少的人" prop="q17" required>
						<u-radio-group placement="column" v-model="PHQ.q17" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 18">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="18.我的生活过得很有意思" prop="q18" required>
						<u-radio-group placement="column" v-model="PHQ.q18" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 19">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="19.我认为我死了别人会过得更好" prop="q19" required>
						<u-radio-group placement="column" v-model="PHQ.q19" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 20">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PHQ" :rules="rules">
					<u-form-item label="20.我仍旧喜爱自己平时喜爱的东西" prop="q20" required>
						<u-radio-group placement="column" v-model="PHQ.q20" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="submit()">提交</button> -->
					<!-- <button @click="submitForm">提交</button> -->
				</u-form>
			</div>
		</div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">上一题</button></div>
			<div v-if="currentPage !== 20"><button class="button" @click="nextPage">下一题</button></div>
			<div v-if="currentPage === 20"><button class="button" @click="submit()">提交</button></div>
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
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q2: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q3: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q4: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q5: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q6: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q7: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q8: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q9: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q10: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q11: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q12: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q13: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q14: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q15: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q16: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q17: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q18: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q19: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					q20: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}]
				},
				currentPage: 1, // 控制当前页面  
				LevelList: [{
						qId: 1,
						message: "没有或很少时间"
					},
					{
						qId: 2,
						message: "少部分时间"
					},
					{
						qId: 3,
						message: "相当多时间"
					},
					{
						qId: 4,
						message: "大部分或全部时间"
					}
				]
			};
		},

		methods: {
			nextPage() {
				if (this.currentPage < 20) {
					this.currentPage++;
				}
			},

			prevPage() {
				if (this.currentPage > 1) {
					this.currentPage--;
				}
			},

			submit() {
				let _this = this;
				this.$refs.form.validate().then(vaild => {
					if (vaild) {
						//后端通信
						http.post(`${config.baseUrl}/scale/phq9/add`, this.PHQ).then((res) => {
							if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
								uni.showToast({
									title: "提交成功"
								});

								setTimeout(() => {
									uni.navigateTo({
										url: '/pages/Response/RePHQ'
									});
								}, 700);
							} else { //返回非200，弹窗提示失败，停留在此页
								uni.showToast({
									title: "提交失败",
									icon: 'error'
								});
							}
						})
					} else {
						uni.$u.toast("需全部填写后才能提交哦");
						console.log("submit error!")
						return false
					}
				}).catch(err => {
					uni.$u.toast("选项未填，请修改后重新提交");
					const query = uni.createSelectorQuery().in(this);
					var dataTitle;
					query.select(`.title`).boundingClientRect((data) => {
						dataTitle = data;
						console.log(dataTitle)
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
				http.get(`${config.baseUrl}/scale/phq9/getRecentInput`).then((res) => {
					if (res.result) {
						this.PHQ = res.result;
						uni.showToast({
							title: "两周内已填报"
						});
						//是否生效遮罩控制不修改已填写表单
						this.isActive = true
						let myDiv = document.getElementById('myFormBox');
						if (this.isActive) {  
						    myDiv.classList.add('form-box'); // 如果isActive为true，则添加form-box类  
						} else {  
						    myDiv.classList.remove('form-box'); // 如果isActive为false，则移除form-box类  
						}
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
		// border: 2px solid #00aa00;
		margin-top: 10px;
	} 
	
	::v-deep .u-radio {  
		// 修改单选按钮的样式  
		// width: 160px;
		height: 60px;
		// margin: 20px 10px 0 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		// border: 2px solid #00ff00;
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
	}  
	
	.all-button{
		width: 100%;
		display: flex;
		justify-content: center;
		position: absolute;
		bottom: 0;
		margin-bottom: 20px;
		// border: 2px solid #ff55ff;
		// padding: 10px;
	}
	.button {
		width: 160px;
		background-color: #4554F5;
		color: white;
		margin: 10px;
	}
</style>