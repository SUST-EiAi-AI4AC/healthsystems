<template>
	<div class="all">
		<p class="title">请结合自身情况回答下列问题</p>

		<div id="myFormBox" v-bind:class="{'form-box': isActive}" style="margin-top: 5px;">
			<!-- 第一部分 -->

			<div v-if="currentPage === 1">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="1、今天早晨醒来后，你的状态是？" prop="weakupStatus" class="weakupStatus" required>
						<u-radio-group placement="column" v-model="DailyReport.weakupStatus">
							<u-radio v-for="item in weakupStatusList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
				</u-form>
			</div>

			<div v-if="currentPage === 2">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="2、今天是否规划了时间？" prop="timeManagement" class="timeManagement" required>
						<u-radio-group placement="column" v-model="DailyReport.timeManagement">
							<u-radio v-for="item in timeManagementList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 3">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="3、你今天是否与他人有交流？" prop="socialExpression" class="socialExpression" required>
						<u-radio-group placement="column" v-model="DailyReport.socialExpression">
							<u-radio v-for="item in socialExpressionList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 4">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="4、你今天与他人交流的时长共计？" prop="communicateTime" class="communicateTime" required>
						<u-radio-group placement="column" v-model="DailyReport.communicateTime">
							<u-radio v-for="item in communicateTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 5">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="5、今天的工作或学习中，你的专注度如何？" prop="studyOrWorkState" class="studyOrWorkState" required>
						<u-radio-group placement="column" v-model="DailyReport.studyOrWorkState">
							<u-radio v-for="item in studyOrWorkStateList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 6">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="6、你今天学习或工作的时长共计？" prop="studyOrWorkTime" class="studyOrWorkTime" required>
						<u-radio-group placement="column" v-model="DailyReport.studyOrWorkTime">
							<u-radio v-for="item in studyOrWorkTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 7">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="7、今天的空闲时间，你主要做了什么？" prop="free" class="free" required>
						<u-radio-group placement="column" v-model="DailyReport.free">
							<u-radio v-for="item in freeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 8">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="8、在空闲时，你是否出现过下列情况？" prop="freeSymptom" class="freeSymptom" required>
						<u-radio-group placement="column" v-model="DailyReport.freeSymptom">
							<u-radio v-for="item in freeSymptomList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 9">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="9、今天玩手机的时长共计？" prop="phonePlayTime" class="phonePlayTime" required>
						<u-radio-group placement="column" v-model="DailyReport.phonePlayTime">
							<u-radio v-for="item in phonePlayTimeList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 10">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="10、整体来看，你今天的食欲如何？" prop="dietInfo" class="dietInfo" required>
						<u-radio-group placement="column" v-model="DailyReport.dietInfo">
							<u-radio v-for="item in appetiteList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 11">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="11、睡觉前通常会做些什么来放松自己？" prop="yesterdayNight" class="yesterdayNight" required>
						<u-radio-group placement="column" v-model="DailyReport.yesterdayNight">
							<u-radio v-for="item in yesterdayNightList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

			<div v-if="currentPage === 12">
				<u-form class="form" labelPosition="top" labelWidth='100%' ref="form" :model="DailyReport"
					:rules="rules">
					<u-form-item label="12、整体来看，你对今天的感受是？" prop="yesterdayEndFeel" class="yesterdayEndFeel" required>
						<u-radio-group placement="column" v-model="DailyReport.yesterdayEndFeel">
							<u-radio v-for="item in yesterdayEndFeelList" :name="item" :label="item" :key="item"
								style="margin: 5rpx;"></u-radio>
						</u-radio-group>
					</u-form-item>
					<!-- <button class="button" @click="prevPage">上一题</button> -->
					<!-- <button class="button" @click="nextPage">下一题</button> -->
				</u-form>
			</div>

		</div>

		<div class="on-form-box"></div>
		<div class="all-button">
			<div v-if="currentPage !== 1"><button class="button" @click="prevPage">上一题</button></div>
			<div v-if="currentPage !== 12"><button class="button" @click="nextPage">下一题</button></div>
			<div v-if="currentPage === 12"><button class="button" @click="submit('form')">提交</button></div>
		</div>
	</div>
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
				DailyReport: {
					radio: '',
					id: 0,
					userId: 0,
					logDate: '',
					addTimestampMils: 0,

					stepInfo: null,
					dietInfo: null,
					medicine: 0,
					sleepInfo: null,
					sleepTime: null,
					statementUrl: null,
					sleepTimeStart: null,
					sleepTimeEnd: null,
					weakupStatus: null,
					breakfirstTime: null,
					timeManagement: null,
					socialExpression: null,
					studyOrWorkTime: null,
					studyOrWorkState: null,
					free: null,
					freeTime: null,
					freeSymptom: null,
					yesterdayNight: null,
					yesterdayEndFeel: null,
					mealTime: null,
					mealSleepTime: null,
					communicateTime: null,
					activityInfo: null,
					dinnerTime: null,
					phonePlayTime: null
				},
				rules: {
					sportsInfo: [{
						type: 'array',
						min: 1,
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sportsTime: [{
						required: true,
						message: "此项非必填项",
						trigger: 'blur'
					}],
					stepInfo: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					dietInfo: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					medicine: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sleepInfo: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sleepTimeStart: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					sleepTimeEnd: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					weakupStatus: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					breakfirstTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					timeManagement: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					socialExpression: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					studyOrWorkTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					studyOrWorkState: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					free: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					freeTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					freeSymptom: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					yesterdayNight: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					yesterdayEndFeel: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					mealTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					mealSleepTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					communicateTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					activityInfo: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					dinnerTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}],
					phonePlayTime: [{
						required: true,
						message: "此项为必填项",
						trigger: 'blur'
					}]
				},

				currentPage: 1,

				sportsList: ["走路‍", "跑步‍", "游泳‍️️‍️‍️‍️️‍", "球类运动", "瑜伽", "跳绳", "爬山", "骑车", "健身", "没有运动"],
				timeList: ["少于30分钟", "30分钟-1小时", "1-1.5小时", "1.5-2小时", "超过2小时"],
				stepList: ["0-2000", "2001-4000", "4001-6000", "6001-8000", "8001-10000", "10000以上"],
				appetiteList: ["按时吃饭，食欲正常", "偶尔漏餐，但总体还好", "经常忘记吃饭或吃得少", "几乎不想吃东西", "完全没有食欲"],
				mealList: ["0", "1", "2", "3", "4及以上"],
				sleepList: ["我的睡眠情况与平时相比没有变化", "相比平时，我需要额外一段时间才能入睡",
					"相比平时，我总是半夜醒来，睡得不安稳", "我比平时更容易入睡或睡得更安稳"
				],
				medicineList: ["是", "否", "不需服药"],
				weakupStatusList: [
					"立刻起床，精神不错",
					"起床前稍作休息",
					"赖床刷手机或社交媒体",
					"感到没有动力起床",
					"继续睡了一会儿"
				],
				breakfirstTimeList: ["没吃早饭", "早上7点前", "早上7点-8点", "早上8点-9点", "早上9点后"],
				timeManagementList: [
					"制定了清晰的计划并基本执行",
					"制定了计划但有所调整",
					"有大致计划但不明确",
					"没有计划，随心而行",
					"不清楚如何安排时间"
				],
				socialExpressionList: ["积极参与交流，享受互动时光", "积极参与交流，但稍感吃力", "尝试与他人进行交流，享受互动时光", "尝试与他人进行交流，但稍感吃力",
					"较少参与交流，更喜欢独处", "抵触交流，不愿与人接触"
				],
				studyOrWorkTimeList: ["少于1小时", "1-3小时", "3-5小时", "5-8小时", "超过8小时"],
				studyOrWorkStateList: ["未工作或学习", "持续专注且高效", "大多数时候能集中注意力且高效", "大多数时候能集中注意力，但效率一般", "难以集中注意力，容易分心",
					"自身原因，不想工作或学习",
					"外部环境影响，几乎无法工作或学习"
				],
				freeList: ["参加喜欢的社交活动", "休息或简单娱乐", "感到无聊或空虚，不知如何打发时间", "几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧"],
				freeTimeList: ["没有", "少于30分钟", "30分钟-1小时", "1-1.5小时", "1.5-2小时", "超过2小时"],
				freeSymptomList: ["都没有", "有些心神不宁", "明显心神不宁或小动作多", "极度焦虑不安，难以放松"],
				yesterdayNightList: ["阅读或学习", "听音乐、看电影等放松活动", "与家人朋友聊天", "上网或玩游戏", "感到焦虑或不安，难以放松", "直接睡觉"],
				yesterdayEndFeelList: ["感到充实和满足", "一般，但还可以", "有些许沮丧或失望", "感到绝望，对明天没有期待"],
				mealTimeList: ["没吃午饭", "中午12点前", "中午12点-13点", "中午13点-14点", "中午14点后"],
				mealSleepTimeList: ["没有午休", "少于30分钟", "30分钟-1小时", "1-2小时", "超过2小时"],
				communicateTimeList: ["少于30分钟", "30分钟-1小时", "1-1.5小时", "1.5-2小时", "超过2小时"],
				activityInfoList: ["没有参与特别的活动", "参加了体育比赛或社团活动", "投入时间学习或练习了某个兴趣爱好", "感到无事可做，对任何活动都提不起兴趣"],
				dinnerTimeList: ["没吃晚饭", "下午18点前", "下午18点到20点", "准备吃宵夜"],
				phonePlayTimeList: ["少于30分钟", "30分钟-1小时", "1-1.5小时", "1.5-2小时", "超过2小时"],

				isActive: false,
			}
		},
		methods: {
			// checkboxChange(e) {
			// 	let _this = this;
			// 	console.log(_this.DailyReport.sportsInfo);
			// },

			nextPage() {
				let _this = this;
				if (this.currentPage < 12) {
					this.$refs.form.validate().then(valid => {
						if (valid) {
							// 处理问题9的跳过逻辑
							if (this.currentPage === 5 && _this.DailyReport.studyOrWorkState === _this
								.studyOrWorkStateList[0]) {
								_this.DailyReport.studyOrWorkTime = "0";
								this.currentPage = 7; // 跳过第6页
							} else {
								this.currentPage++;
							}
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
					// 处理问题9的跳过逻辑
					if (this.currentPage === 7 && this.DailyReport.studyOrWorkState === this.studyOrWorkStateList[0]) {
						this.currentPage = 5; // 跳回第5页
					} else {
						this.currentPage--;
					}
				}
			},

			submit(formName) {
				let _this = this;

				// // 增加时间判断 —— 限制 20:00 前不能提交
				// const now = new Date();
				// const hours = now.getHours();
				// if (hours < 20) {
				// 	uni.showToast({
				// 		title: "未到填报时间，请在晚上8点后再填写",
				// 		icon: 'none'
				// 	});
				// 	return; // 阻止继续提交
				// }

				// 处理问题9的自动填写
				if (_this.DailyReport.studyOrWorkState === _this.studyOrWorkStateList[0]) {
					_this.DailyReport.studyOrWorkTime = "0";
				}

				this.$refs.form.validate().then(res => {
					let dataToAdd = {
						..._this.DailyReport
					};

					http.post(`${config.baseUrl}/answer/add`, dataToAdd).then((res) => {
						if (res.code === 200) {
							uni.showToast({
								title: "提交成功"
							});
							setTimeout(() => {
								uni.navigateTo({
									url: "/pages/Response/ReDailyR"
								});
							}, 700);
						} else {
							uni.showToast({
								title: "提交失败",
								icon: 'none'
							});
						}
					})
				}).catch(err => {
					uni.$u.toast("请填写该问题");
					if (err && err.length > 0) {
						const query = uni.createSelectorQuery().in(this);
						var dataTitle;
						query.select(`.title`).boundingClientRect((data) => {
							dataTitle = data;
						}).exec();
						query.select('.' + err[0].field).boundingClientRect((data) => {
							uni.pageScrollTo({
								scrollTop: data.top - dataTitle.top,
								duration: 100
							});
						}).exec();
					}
				})
			},

			//计算小时差
			getTime() {
				var time1 = this.DailyReport.sleepTimeStart.split(':') //隔开小时和分钟
				var time2 = this.DailyReport.sleepTimeEnd.split(':') //隔开小时和分钟
				var day1 = new Date()
				var day2 = new Date()

				day1.setHours(time1[0])
				day1.setMinutes(time1[1])

				day2.setMinutes(time2[1])

				//醒来时间小于入睡时间 应该是跨了一天
				if (time1[0] > time2[0]) {
					var hour = parseInt(parseInt(time2[0]) + 24)
					day2.setHours(hour)
				} else {
					day2.setHours(time2[0])
				}
				console.log("b比a多了：" + (day2 - day1) / 1000 / 60 / 60 + "小时")
				var time = (day2 - day1) / 1000 / 60 / 60 //计算相差小时数
				console.log(Math.round(time)) //四舍五入
				return Math.round(time)
			},

			changeRadio() {
				const _this = this;
			},
			resetform(formName) {
				this.$refs[formName].resetFields();
			},

			getTodayInput() {
				http.get(`${config.baseUrl}/answer/gettodaydetail`).then((res) => {
					if (res.result) {
						let dataToShow = {
							...res.result
						};
						// 只保留需要的字段
						const keepFields = [
							'id', 'userId', 'logDate', 'addTimestampMils',
							'weakupStatus', 'timeManagement', 'socialExpression', 'communicateTime',
							'studyOrWorkState', 'studyOrWorkTime', 'free', 'freeSymptom',
							'phonePlayTime', 'dietInfo', 'yesterdayNight', 'yesterdayEndFeel'
						];

						Object.keys(dataToShow).forEach(key => {
							if (!keepFields.includes(key)) {
								delete dataToShow[key];
							}
						});

						this.DailyReport = dataToShow;
						uni.showToast({
							title: "今日已填报"
						});
						this.isActive = true
					}
				})
			}
		},
		onLoad(parms) {
			// 时间限制 —— 20 点前禁止进入
			const now = new Date();
			const hours = now.getHours();
			// 允许时间段：20:00–23:59 或 0:00–4:59
			if (!(hours >= 20 || hours < 5)) {
				uni.showToast({
					title: '未到填报时间，请在晚上8点到次日凌晨5点之间填写',
					icon: 'none'
				});
				setTimeout(() => {
					uni.navigateBack(); // 直接返回上一页
				}, 1000);
				return;
			}
			this.getTodayInput();

		},
	}
</script>


<style lang="scss" scoped>
	.all {
		width: 100%;
		height: 100vh;
		// border: 2px solid #00ff00;
		// background: linear-gradient(#c2e9fb, #a1c4fd);
		// background: rgb(245,255,250)
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

	.form-box {
		// margin-top: 5px;
		// border-radius: 10px;
		position: relative;

		// z-index: -1;
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

	// .on-form-box{
	// 	height: 90%;
	// 	border: 2px solid #00ff00;
	// }
	.form {
		padding-left: 50rpx;
		padding-right: 50rpx;

	}

	// 如果你还想修改<u-radio-group>的样式，可以这样做（但这通常不是必需的，除非有特别的布局需求）
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

	::v-deep .u-checkbox-group {
		// 哪些运动按钮设置
		width: 100%;
		height: 400px;
		display: flex; // 假设你想让它以flex布局显示  
		flex-wrap: wrap;
		// flex-direction: column; // 已经是column了，但这里只是示例  
		// border: 2px solid #00aa00;
		margin-top: 10px;

	}

	::v-deep .u-checkbox {
		// 修改单选按钮的样式  
		width: 155px;
		height: 60px;
		// margin: 20px 10px 0 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  
		// border: 2px solid #00ff00;
		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
		flex: 1 1 auto;
	}

	::v-deep .u-form-item {
		// font-size: 20px;
		font-weight: bold;
		// border: 2px solid #00ff00;
		margin-bottom: 10px;
	}

	.sleepTimeEnd {
		height: 60px;
		margin: 10px 0 20px 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  

		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
		font-size: 15px;
	}

	.sleepTimeStart {
		height: 60px;
		margin: 10px 0 20px 0; // 修改垂直间距  
		padding: 5px 0 5px 15px; // 假设有内边距  
		border-radius: 10px; // 圆角  

		background-color: #ffffff;
		box-shadow: 1px 2px 5px #e2e2e2;
		font-weight: bold;
		font-size: 15px;
	}


	.all-button {
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
		// margin-bottom: 10px;
		margin: 10px;
	}
</style>