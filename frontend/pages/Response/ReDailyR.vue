<template>
	<view>
		<h2 class="title">您的状态指数</h2>

		<div class="main">
			<div class="rating center">
				<u-rate active-color="#ffaa00" size='50rpx' readonly v-model="anxietyRating"></u-rate>
			</div>

			<div class="box-card">
				<p>
					{{ review + advice }}
				</p>
			</div>

			<button type="primary" plain @click="jump()" style="width: 90%;">返回首页</button>
			<button type="warning" plain @click="history()" style="margin-top: 15rpx; width: 90%;">历史记录</button>

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
				anxietyDescription: "",
				review: "",
				advice: "",
				anxietyScore: "30", // 量表得分
				anxietyRating: "", // 量表得分对应的星星个数

				activityScore: "",
				appetiteScore: "",
				weakupScore: "",
				sleepScore: "",
				timeManagementScore: "",
				yesterdayEndFeelScore: "",
				communicateScore: "",
				socialScore: "",
				yesterdayNightScore: "",
				sportsScore: "",
				studyOrWorkStateScore: "",
				freeSymptomScore: "",

				// 分页查询
				currentPage: 1,
				// 每页的数据条目数
				pageSize: 1,

				sas: [{
						l: 0,
						h: 28,
						desc: '低能量'
					},
					{
						l: 29,
						h: 44,
						desc: '中能量'
					},
					{
						l: 45,
						h: 60,
						desc: '高能量'
					}
				],
			}
		},
		methods: {
			getData() {
				console.log("start")
				http.get("/answer/getlist?currentPage=" + this.currentPage + "&pageSize=" + this.pageSize).then(
					response => {
						console.log(response.result.data);

						// 获得数据
						this.opinionData = response.result.data;
						console.log(this.opinionData);
						const data = this.opinionData[0];

						// 			// 饮食评分
						// 			if (data.dietInfo === "完全没有食欲") {
						// 				this.appetiteScore = 1;
						// 			} else if (data.dietInfo === "几乎不想吃东西" || data.dietInfo === "经常忘记吃饭或吃得很少") {
						// 				this.appetiteScore = 2;
						// 			} else {
						// 				this.appetiteScore = 4;
						// 			}

						// 			// 起床状态评分
						// 			if (data.weakupStatus === "感到毫无动力起床") {
						// 				this.weakupScore = 1;
						// 			} else if (data.weakupStatus === "继续躺在床上，查看手机或社交媒体" || data.weakupStatus === "继续躺在床上，多睡一会儿") {
						// 				this.weakupScore = 2;
						// 			} else {
						// 				this.weakupScore = 4;
						// 			}

						// 			// 时间管理评分
						// 			if (data.timeManagement === "不知道该如何安排时间") {
						// 				this.timeManagementScore = 1;
						// 			} else if (data.timeManagement === "没有制定计划，随心情行动") {
						// 				this.timeManagementScore = 2;
						// 			} else {
						// 				this.timeManagementScore = 4;
						// 			}

						// 			// 社交表达评分
						// 			if (data.socialExpression === "对交流行为感到抵触，不愿与人接触") {
						// 				this.socialScore = 1;
						// 			} else if (data.socialExpression === "较少参与交流活动，更喜欢独处") {
						// 				this.socialScore = 2;
						// 			} else {
						// 				this.socialScore = 4;
						// 			}

						// 			// 沟通时间评分
						// 			if (data.communicateTime === "少于30分钟") {
						// 				this.communicateScore = 1;
						// 			} else if (data.communicateTime === "30分钟-1小时") {
						// 				this.communicateScore = 2;
						// 			} else {
						// 				this.communicateScore = 4;
						// 			}

						// 			// 工作或学习状态评分
						// 			if (data.studyOrWorkState === "几乎无法工作或学习") {
						// 				this.studyOrWorkStateScore = 1;
						// 			} else if (data.studyOrWorkState === "难以集中注意力，经常分心" || data.studyOrWorkState === "感觉很疲惫，不想工作或学习") {
						// 				this.studyOrWorkStateScore = 2;
						// 			} else {
						// 				this.studyOrWorkStateScore = 4;
						// 			}

						// 			// 工作或学习时长评分
						// 			if (data.studyOrWorkTime === "少于1小时") {
						// 				this.studyOrWorkTimeScore = 1;
						// 			} else if (data.studyOrWorkTime === "1-3小时") {
						// 				this.studyOrWorkTimeScore = 2;
						// 			} else {
						// 				this.studyOrWorkTimeScore = 4;
						// 			}

						// 			// 空闲状态评分
						// 			if (data.free === "几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧") {
						// 				this.freeScore = 1;
						// 			} else if (data.free === "感到无聊或空虚，不知如何打发时间") {
						// 				this.freeScore = 2;
						// 			} else {
						// 				this.freeScore = 4;
						// 			}

						// 			// 空闲时症状评分
						// 			if (data.freeSymptom === "极度心神不宁，焦虑不安") {
						// 				this.freeSymptomScore = 1;
						// 			} else if (data.freeSymptom === "明显心神不宁或小动作多") {
						// 				this.freeSymptomScore = 2;
						// 			} else {
						// 				this.freeSymptomScore = 4;
						// 			}

						// 			// 昨晚活动评分
						// 			if (data.yesterdayNight === "感到焦虑或不安，难以放松") {
						// 				this.yesterdayNightScore = 1;
						// 			} else {
						// 				this.yesterdayNightScore = 4;
						// 			}

						// 			// 昨日结束感受评分
						// 			if (data.yesterdayEndFeel === "感到有点绝望，对明天毫无期待") {
						// 				this.yesterdayEndFeelScore = 1;
						// 			} else if (data.yesterdayEndFeel === "感到些许沮丧或失望") {
						// 				this.yesterdayEndFeelScore = 2;
						// 			} else {
						// 				this.yesterdayEndFeelScore = 4;
						// 			}

						// 			// 玩手机时间评分（时间越长分数越低）
						// 			if (data.phonePlayTime === "超过2小时") {
						// 				this.phonePlayTimeScore = 1;
						// 			} else if (data.phonePlayTime === "1.5-2小时") {
						// 				this.phonePlayTimeScore = 2;
						// 			} else {
						// 				this.phonePlayTimeScore = 4;
						// 			}

						// 			// 汇总总得分
						// 			this.anxietyScore =
						// 				this.appetiteScore +
						// 				this.weakupScore +
						// 				this.timeManagementScore +
						// 				this.socialScore +
						// 				this.communicateScore +
						// 				this.studyOrWorkStateScore +
						// 				this.studyOrWorkTimeScore +
						// 				this.freeScore +
						// 				this.freeSymptomScore +
						// 				this.yesterdayNightScore +
						// 				this.yesterdayEndFeelScore +
						// 				this.phonePlayTimeScore;


						// 			console.log(this.activityScore);
						// 			console.log(this.appetiteScore);
						// 			console.log(this.weakupScore);
						// 			console.log(this.freeSymptomScore);
						// 			console.log(this.sleepScore);
						// 			console.log(this.socialScore);
						// 			console.log(this.sportsScore);
						// 			console.log(this.timeManagementScore);
						// 			console.log(this.yesterdayEndFeelScore);
						// 			console.log(this.yesterdayNightScore);
						// 			console.log(this.communicateScore);
						// 			console.log(this.studyOrWorkStateScore);


						// 			// this.anxietyScore = this.opinionData[0].score;
						// 			console.log(this.anxietyScore);

						// 			// 星星越多，表示状态越好，所以这里要反过来
						// 			// 一共5颗星星
						// 			if (this.anxietyScore >= 0 && this.anxietyScore <= 20) {
						// 				this.anxietyRating = 1;
						// 			} else if (this.anxietyScore > 20 && this.anxietyScore <= 36) {
						// 				this.anxietyRating = 3;
						// 			} else {
						// 				this.anxietyRating = 5;
						// 			}// 压力只有3个等级
						// 			console.log("this.anxietyRating: ", this.anxietyRating)
						// 			this.getResult();
						// 		}).catch((err) => {
						// 		alert(err)
						// 	});
						// },

						// 1. 饮食评分 (appetiteList)
						if (data.dietInfo === "完全没有食欲") {
							this.appetiteScore = 1;
						} else if (data.dietInfo === "几乎不想吃东西") {
							this.appetiteScore = 2;
						} else if (data.dietInfo === "经常忘记吃饭或吃得少") {
							this.appetiteScore = 3;
						} else if (data.dietInfo === "偶尔漏餐，但总体还好") {
							this.appetiteScore = 4;
						} else if (data.dietInfo === "按时吃饭，食欲正常") {
							this.appetiteScore = 5;
						}

						// 2. 起床状态评分 (weakupStatusList)
						if (data.weakupStatus === "感到没有动力起床") {
							this.weakupScore = 1;
						} else if (data.weakupStatus === "赖床刷手机或社交媒体") {
							this.weakupScore = 2;
						} else if (data.weakupStatus === "继续睡了一会儿") {
							this.weakupScore = 3;
						} else if (data.weakupStatus === "起床前稍作休息") {
							this.weakupScore = 4;
						} else if (data.weakupStatus === "立刻起床，精神不错") {
							this.weakupScore = 5;
						}

						// 3. 时间管理评分 (timeManagementList)
						if (data.timeManagement === "不清楚如何安排时间") {
							this.timeManagementScore = 1;
						} else if (data.timeManagement === "没有计划，随心而行") {
							this.timeManagementScore = 2;
						} else if (data.timeManagement === "有大致计划但不明确") {
							this.timeManagementScore = 3;
						} else if (data.timeManagement === "制定了计划但有所调整") {
							this.timeManagementScore = 4;
						} else if (data.timeManagement === "制定了清晰的计划并基本执行") {
							this.timeManagementScore = 5;
						}

						// 4. 社交表达评分 (socialExpressionList)
						if (data.socialExpression === "抵触交流，不愿与人接触") {
							this.socialScore = 1;
						} else if (data.socialExpression === "较少参与交流，更喜欢独处") {
							this.socialScore = 2;
						} else if (data.socialExpression === "尝试与他人进行交流，但稍感吃力") {
							this.socialScore = 3;
						} else if (data.socialExpression === "尝试与他人进行交流，享受互动时光") {
							this.socialScore = 4;
						} else if (data.socialExpression === "积极参与交流，但稍感吃力") {
							this.socialScore = 4;
						} else if (data.socialExpression === "积极参与交流，享受互动时光") {
							this.socialScore = 5;
						}

						// 5. 沟通时间评分 (communicateTimeList)
						if (data.communicateTime === "少于30分钟") {
							this.communicateScore = 1;
						} else if (data.communicateTime === "30分钟-1小时") {
							this.communicateScore = 2;
						} else if (data.communicateTime === "1-1.5小时") {
							this.communicateScore = 3;
						} else if (data.communicateTime === "1.5-2小时") {
							this.communicateScore = 4;
						} else if (data.communicateTime === "超过2小时") {
							this.communicateScore = 5;
						}

						// 6. 工作或学习状态评分 (studyOrWorkStateList)
						if (data.studyOrWorkState === "外部环境影响，几乎无法工作或学习" ||
							data.studyOrWorkState === "自身原因，不想工作或学习") {
							this.studyOrWorkStateScore = 1;
						} else if (data.studyOrWorkState === "难以集中注意力，容易分心") {
							this.studyOrWorkStateScore = 2;
						} else if (data.studyOrWorkState === "大多数时候能集中注意力，但效率一般") {
							this.studyOrWorkStateScore = 3;
						} else if (data.studyOrWorkState === "大多数时候能集中注意力且高效") {
							this.studyOrWorkStateScore = 4;
						} else if (data.studyOrWorkState === "持续专注且高效") {
							this.studyOrWorkStateScore = 5;
						} else if (data.studyOrWorkState === "未工作或学习") {
							this.studyOrWorkStateScore = 3; // 未工作/学习作为中性评分
						}

						// 7. 工作或学习时长评分 (studyOrWorkTimeList)
						if (data.studyOrWorkTime === "少于1小时") {
							this.studyOrWorkTimeScore = 1;
						} else if (data.studyOrWorkTime === "1-3小时") {
							this.studyOrWorkTimeScore = 2;
						} else if (data.studyOrWorkTime === "3-5小时") {
							this.studyOrWorkTimeScore = 4;
						} else if (data.studyOrWorkTime === "5-8小时") {
							this.studyOrWorkTimeScore = 5;
						} else if (data.studyOrWorkTime === "超过8小时") {
							this.studyOrWorkTimeScore = 3; // 过长时间工作学习评分适中
						}

						// 8. 空闲状态评分 (freeList)
						if (data.free === "几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧") {
							this.freeScore = 1;
						} else if (data.free === "感到无聊或空虚，不知如何打发时间") {
							this.freeScore = 2;
						} else if (data.free === "休息或简单娱乐") {
							this.freeScore = 4;
						} else if (data.free === "参加喜欢的社交活动") {
							this.freeScore = 5;
						}

						// 9. 空闲时症状评分 (freeSymptomList)
						if (data.freeSymptom === "极度焦虑不安，难以放松") {
							this.freeSymptomScore = 1;
						} else if (data.freeSymptom === "明显心神不宁或小动作多") {
							this.freeSymptomScore = 2;
						} else if (data.freeSymptom === "有些心神不宁") {
							this.freeSymptomScore = 3;
						} else if (data.freeSymptom === "都没有") {
							this.freeSymptomScore = 5;
						}

						// 10. 昨晚活动评分 (yesterdayNightList)
						if (data.yesterdayNight === "感到焦虑或不安，难以放松") {
							this.yesterdayNightScore = 1;
						} else if (data.yesterdayNight === "上网或玩游戏") {
							this.yesterdayNightScore = 2;
						} else if (data.yesterdayNight === "直接睡觉") {
							this.yesterdayNightScore = 3;
						} else if (data.yesterdayNight === "与家人朋友聊天") {
							this.yesterdayNightScore = 4;
						} else if (data.yesterdayNight === "阅读或学习" ||
							data.yesterdayNight === "听音乐、看电影等放松活动") {
							this.yesterdayNightScore = 5;
						}

						// 11. 昨日结束感受评分 (yesterdayEndFeelList)
						if (data.yesterdayEndFeel === "感到绝望，对明天没有期待") {
							this.yesterdayEndFeelScore = 1;
						} else if (data.yesterdayEndFeel === "有些许沮丧或失望") {
							this.yesterdayEndFeelScore = 2;
						} else if (data.yesterdayEndFeel === "一般，但还可以") {
							this.yesterdayEndFeelScore = 3;
						} else if (data.yesterdayEndFeel === "感到充实和满足") {
							this.yesterdayEndFeelScore = 5;
						}

						// 12. 玩手机时间评分（时间越长分数越低）(phonePlayTimeList)
						if (data.phonePlayTime === "超过2小时") {
							this.phonePlayTimeScore = 1;
						} else if (data.phonePlayTime === "1.5-2小时") {
							this.phonePlayTimeScore = 2;
						} else if (data.phonePlayTime === "1-1.5小时") {
							this.phonePlayTimeScore = 3;
						} else if (data.phonePlayTime === "30分钟-1小时") {
							this.phonePlayTimeScore = 4;
						} else if (data.phonePlayTime === "少于30分钟") {
							this.phonePlayTimeScore = 5;
						}

						// 汇总总得分（12个题目，每题1-5分，总分范围12-60）
						this.anxietyScore =
							this.appetiteScore +
							this.weakupScore +
							this.timeManagementScore +
							this.socialScore +
							this.communicateScore +
							this.studyOrWorkStateScore +
							this.studyOrWorkTimeScore +
							this.freeScore +
							this.freeSymptomScore +
							this.yesterdayNightScore +
							this.yesterdayEndFeelScore +
							this.phonePlayTimeScore;


						console.log("各题得分：");
						console.log("饮食：", this.appetiteScore);
						console.log("起床状态：", this.weakupScore);
						console.log("时间管理：", this.timeManagementScore);
						console.log("社交表达：", this.socialScore);
						console.log("沟通时间：", this.communicateScore);
						console.log("工作/学习状态：", this.studyOrWorkStateScore);
						console.log("工作/学习时长：", this.studyOrWorkTimeScore);
						console.log("空闲状态：", this.freeScore);
						console.log("空闲症状：", this.freeSymptomScore);
						console.log("昨晚活动：", this.yesterdayNightScore);
						console.log("昨日结束感受：", this.yesterdayEndFeelScore);
						console.log("玩手机时间：", this.phonePlayTimeScore);
						console.log("总得分：", this.anxietyScore);

						// 星星越多，表示状态越好，所以这里要反过来
						// 一共5颗星星
						if (this.anxietyScore >= 0 && this.anxietyScore <= 28) {
							this.anxietyRating = 1;
						} else if (this.anxietyScore > 28 && this.anxietyScore <= 44) {
							this.anxietyRating = 3;
						} else {
							this.anxietyRating = 5;
						} // 压力只有3个等级
						console.log("this.anxietyRating: ", this.anxietyRating)
						this.getResult();
					}).catch((err) => {
					alert(err)
				});
			},

			getResult() {
				const context =
					"此结果仅反映您近两日状态，可能是当前工作生活状态变化的正常反应。建议您积极调节情绪打满能量，"
				const adviceArray = [

					"从今天开始，选择一点小小的改变，比如多喝水、多走路或是早点放下手机休息，这些都能让你离更健康的自己更近一步。",
					"改变从不嫌晚，每一小步都是向着更健康生活的迈进。你的力量比你想象的要强大得多，每一次呼吸都是重新开始的勇气。",
					"坚持健康的生活方式，就是对自己最好的投资。",
				];
				let al = -1;
				this.sas.find((v, i) => {
					if (this.anxietyScore <= v.h) {
						this.anxietyDescription = v.desc;
						al = i - 1
						return true
					}
					return false
				})

				if (al === -1) {
					this.review = "您现在各项指标都很正常，";
					this.advice = "祝您生活愉快！";
				} else if (al >= 0) {
					//焦虑
					this.review = "您的状态指数是" + this.anxietyDescription + "状态，";
					this.advice = context + adviceArray[al];
				}
			},
			jump() {
				setTimeout(() => {
					uni.reLaunch({
						url: "/pages/index/index"
					});
				}, 700)
			},

			history() {
				setTimeout(() => {
					uni.navigateTo({
						url: '/pages/Chart/DailyReportChart'
					});
				}, 700)
			},
		},
		onLoad(parms) {
			this.getData();
		},
	}
</script>

<style lang="scss" scoped>
	.center {
		/*居中*/
		text-align: center;
		justify-content: center;
		display: flex;
	}

	.app-wrapper {
		width: 100%;
		top: 0;
		z-index: 10;
		overflow: scroll;
		//background: linear-gradient(#cadcf8, #ffffff);
	}

	.title {
		font-size: 1.3em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px; // 文字
		margin: 10px auto;
		border-left: 8px solid rgb(64, 158, 255);
	}

	.rating {
		margin-top: 30px;
		margin-bottom: 30px;
	}

	.inner {
		margin-left: 20px;
		margin-right: 20px;
	}

	.box-card {
		//width: 100%;
		height: 190px;
		background: #eaeaea;
		//background: rgb(249, 170, 139);
		border-radius: 10px;
		margin: 20px;
		font-size: 12px;
		line-height: 20px;

		p {
			font-size: 1.2em;
			font-weight: bold;
			color: rgb(40, 40, 40);
			padding: 16px 10px 0 10px;
		}

		position: relative;
		z-index: 1;

		&::before {
			content: "";
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-image: url('@/static/images/scale/tang.jpg');
			background-size: cover;
			background-position: center;
			filter: blur(2px); // 调整模糊度  
			z-index: -1; // 确保这个伪元素位于原元素之下  
		}
	}
</style>