<template>
	<view>
		<p class="title">请回想最近<span style="color: red;">两周</span>，发生下列各状况的频率</p>

		<div class="box-card">
			<p>虽然有些问题看起来相似，但对结果都有不同的影响，所以每一题均需作答。作答方式尽量以快速、不假思索方式填答，以期能反映您真实的状况。
			</p>
		</div>

		<div id="myFormBox" v-bind:class="{'form-box': isActive}" style="margin-top: 5px;">
			<div v-if="currentPage === 1">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="1.我觉得比平时更紧张和焦虑" prop="sasQ1" required>
						<u-radio-group placement="column" v-model="SAS.sasQ1" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 2">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="2.我无缘无故地感到害怕" prop="sasQ2" required>
						<u-radio-group placement="column" v-model="SAS.sasQ2" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 3">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="3.我容易心里烦乱或觉得惊恐" prop="sasQ3" required>
						<u-radio-group placement="column" v-model="SAS.sasQ3" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 4">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="4.我感觉自己快要崩溃了" prop="sasQ4" required>
						<u-radio-group placement="column" v-model="SAS.sasQ4" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 5">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="5.我觉得一切都很好，不会发生什么不好的事情" prop="sasQ5" required>
						<u-radio-group placement="column" v-model="SAS.sasQ5" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 6">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="6.我手脚发抖打颤" prop="sasQ6" required>
						<u-radio-group placement="column" v-model="SAS.sasQ6" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 7">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="7.我因为头疼、头颈痛和背痛而苦恼" prop="sasQ7" required>
						<u-radio-group placement="column" v-model="SAS.sasQ7" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 8">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="8.我感到容易衰弱和疲乏" prop="sasQ8" required>
						<u-radio-group placement="column" v-model="SAS.sasQ8" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 9">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="9.我觉得心平气和，并且容易安静坐着" prop="sasQ9" required>
						<u-radio-group placement="column" v-model="SAS.sasQ9" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 10">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="10.我觉得心跳得很快" prop="sasQ10" required>
						<u-radio-group placement="column" v-model="SAS.sasQ10" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 11">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="11.我因为一阵阵头晕而苦恼" prop="sasQ11" required>
						<u-radio-group placement="column" v-model="SAS.sasQ11" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 12">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="12.我有晕倒发作或觉得要晕倒似的" prop="sasQ12" required>
						<u-radio-group placement="column" v-model="SAS.sasQ12" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 13">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="13.我呼气、吸气都感到很容易" prop="sasQ13" required>
						<u-radio-group placement="column" v-model="SAS.sasQ13" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 14">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="14.我手脚麻木和刺痛" prop="sasQ14" required>
						<u-radio-group placement="column" v-model="SAS.sasQ14" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 15">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="15.我因为胃痛和消化不良而苦恼" prop="sasQ15" required>
						<u-radio-group placement="column" v-model="SAS.sasQ15" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 16">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="16.我常常要小便" prop="sasQ16" required>
						<u-radio-group placement="column" v-model="SAS.sasQ16" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 17">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="17.我的手脚常常是干燥温暖的" prop="sasQ17" required>
						<u-radio-group placement="column" v-model="SAS.sasQ17" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 18">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="18.我脸红发热" prop="sasQ18" required>
						<u-radio-group placement="column" v-model="SAS.sasQ18" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 19">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="19.我容易入睡，并且一夜睡得很好" prop="sasQ19" required>
						<u-radio-group placement="column" v-model="SAS.sasQ19" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 20">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="SAS" :rules="rules">
					<u-form-item label="20.我做噩梦" prop="sasQ20" required>
						<u-radio-group placement="column" v-model="SAS.sasQ20" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="submit('SAS')">提交</button> -->
				</u-form>
			</div>
		</div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">上一题</button></div>
			<div v-if="currentPage !== 20"><button class="button" @click="nextPage">下一题</button></div>
			<div v-if="currentPage === 20"><button class="button" @click="submit('SAS')">提交</button></div>
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

				rules: {
					sasQ1: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ2: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ3: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ4: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ5: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ6: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ7: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ8: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ9: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ10: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ11: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ12: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ13: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ14: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ15: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ16: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ17: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ18: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ19: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sasQ20: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}]
				},

				currentPage: 1,

				labelPosition: 'top',

				LevelList: [{
						qId: 1,
						message: "几乎从不"
					},
					{
						qId: 2,
						message: "有时"
					},
					{
						qId: 3,
						message: "经常"
					},
					{
						qId: 4,
						message: "几乎总是"
					},
				]
			}
		},
		methods: {
			nextPage() {
				if (this.currentPage < 20) {  
				    
				    this.$refs.form.validate().then(valid => {  
				      if (valid) {  
				        this.currentPage++;  
				      } else {  
				        uni.$u.toast('请填写该问题');  
				      }  
				    }).catch(err => {  
						uni.$u.toast('请填写该问题');  
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

			submit(formName) {
				let _this = this;
				this.$refs.form.validate().then(vaild => {
					if (vaild) {
						http.post(`${config.baseUrl}/scale/sas/add`, this.SAS).then((res) => {
							console.log(res.data)
							if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
								uni.showToast({
									title: "提交成功"
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
					uni.$u.toast("请填写该问题");
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
				http.get(`${config.baseUrl}/scale/sas/getRecentInput`).then((res) => {
					if (res.result) {
						this.SAS = res.result;
						uni.showToast({
							title: "两周内已填报"
						});
						
						//是否生效遮罩控制不修改已填写表单
						this.isActive = true
						// let myDiv = document.getElementById('myFormBox');
						// if (this.isActive) {  
						//     myDiv.classList.add('form-box'); // 如果isActive为true，则添加form-box类  
						// } else {  
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
		    // filter: blur(2px); // 调整模糊度  
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