<template>
	<view>
		<p class="title">请回想最近<span style="color: red;">两周</span>，发生下列各状况的频率</p>

		<div class="box-card">
			<p>虽然有些问题看起来相似，但对结果都有不同的影响，所以每一题均需作答。作答方式尽量以快速、不假思索方式填答，以期能反映您真实的状况。
			</p>
		</div>

		<div id="myFormBox" v-bind:class="{'form-box': isActive}" style="margin-top: 5px;">
			<!-- 第一部分 -->
			<div v-if="currentPage === 1">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="1.当意想不到的事情发生时感到烦躁" prop="pssQ1" required>
						<u-radio-group placement="column" v-model="PSS.pssQ1" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 2">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="2.感到自己无法控制生活中重要的事情" prop="pssQ2" required>
						<u-radio-group placement="column" v-model="PSS.pssQ2" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 3">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="3.感到紧张和有压力" prop="pssQ3" required>
						<u-radio-group placement="column" v-model="PSS.pssQ3" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 4">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="4.成功地解决了令人烦恼的生活琐事" prop="pssQ4" required>
						<u-radio-group placement="column" v-model="PSS.pssQ4" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 5">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="5.自己正在有效地处理生活中发生的重大变化" prop="pssQ5" required>
						<u-radio-group placement="column" v-model="PSS.pssQ5" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 6">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="6.自己有信心能够处理个人问题" prop="pssQ6" required>
						<u-radio-group placement="column" v-model="PSS.pssQ6" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 7">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="7.事情正在和希望的一样发展" prop="pssQ7" required>
						<u-radio-group placement="column" v-model="PSS.pssQ7" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 8">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="8.自己不能处理所有必须做的事情" prop="pssQ8" required>
						<u-radio-group placement="column" v-model="PSS.pssQ8" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 9">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="9.自己能控制生活中的一些恼怒情绪" prop="pssQ9" required>
						<u-radio-group placement="column" v-model="PSS.pssQ9" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 10">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="10.自己能安排一切" prop="pssQ10" required>
						<u-radio-group placement="column" v-model="PSS.pssQ10" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 11">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="11.因无法掌控发生的事情感到生气" prop="pssQ11" required>
						<u-radio-group placement="column" v-model="PSS.pssQ11" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 12">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="12.自己必须完成某件事情" prop="pssQ12" required>
						<u-radio-group placement="column" v-model="PSS.pssQ12" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 13">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="13.自己能控制时间安排的方式" prop="pssQ13" required>
						<u-radio-group placement="column" v-model="PSS.pssQ13" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 14">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="PSS" :rules="rules">
					<u-form-item label="14.困难积累得太大而无法克服" prop="pssQ14" required>
						<u-radio-group placement="column" v-model="PSS.pssQ14" @change="changeRadio">
							<u-radio v-for="item in LevelList" :name="item.qId" :label="item.message" :key="item.qId"
								style="margin: 5rpx;">
							</u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="submit('PSS')">提交</button> -->
				</u-form>
			</div>
		</div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">上一题</button></div>
			<div v-if="currentPage !== 14"><button class="button" @click="nextPage">下一题</button></div>
			<div v-if="currentPage === 14"><button class="button" @click="submit('PSS')">提交</button></div>
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
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ2: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ3: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ4: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ5: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ6: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ7: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ8: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ9: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ10: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ11: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ12: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ13: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					pssQ14: [{
						type: 'number',
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}]
				},

				currentPage: 1,

				LevelList: [{
						qId: 0,
						message: "从不"
					},
					{
						qId: 1,
						message: "偶尔"
					},
					{
						qId: 2,
						message: "有时"
					},
					{
						qId: 3,
						message: "时常"
					},
					{
						qId: 4,
						message: "总是"
					}
				]
			}
		},

		methods: {

			nextPage() {
				if (this.currentPage < 14) {  
				    
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
				console.log(_this.PSS)
				this.$refs.form.validate().then(res => {
					http.post(`${config.baseUrl}/scale/ps/add`, this.PSS).then((res) => {
						console.log(res.data)
						if (res.code === 200) { //返回成功码200，弹窗提示，延迟转到用户主页
							uni.showToast({
								title: "提交成功"
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
								title: "提交失败",
								icon: 'error'
							});
						}
					})
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
				http.get(`${config.baseUrl}/scale/ps/getRecentInput`).then((res) => {
					if (res.result) {
						this.PSS = res.result;

						uni.showToast({
							title: "两周内已填报"
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