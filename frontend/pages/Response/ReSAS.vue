<template>
	<view>
		<h2 class="title">您的焦虑测评报告</h2>

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
				anxietyScore: 0, // 量表得分
				anxietyRating: 0, // 量表得分对应的星星个数
				// 分页查询
				currentPage: 1,
				// 每页的数据条目数
				pageSize: 1,

				sas: [{
						l: 0,
						h: 49,
						desc: '正常'
					},
					{
						l: 50,
						h: 59,
						desc: '轻度焦虑'
					},
					{
						l: 60,
						h: 69,
						desc: '中度焦虑'
					},
					{
						l: 70,
						h: 100,
						desc: '重度焦虑'
					}
				],
			}
		},
		methods: {
			getData() {
				console.log("start")
				http.get("/scale/sas/getlist?currentPage=" + this.currentPage + "&pageSize=" + this.pageSize).then(
					response => {
						//console.log(response.data);

						// 获得数据
						this.opinionData = response.result.data;
						console.log(this.opinionData);
						this.anxietyScore = this.opinionData[0].score;
						console.log(this.anxietyScore);

						// 星星越多，表示状态越好，所以这里要反过来
						// 一共5颗星星
						if (this.anxietyScore >= 25 && this.anxietyScore <= 49) {
							this.anxietyRating = 5;

						} else if (this.anxietyScore <= 59) {
							this.anxietyRating = 4;

						} else if (this.anxietyScore <= 69) {
							this.anxietyRating = 3;

						} else if (this.anxietyScore <= 100) {
							this.anxietyRating = 2;

						} // 压力只有4个等级

						console.log("this.anxietyRating: ", this.anxietyRating)

						this.getResult();
					}).catch((err) => {
					alert(err)
				});
			},

			getResult() {
				const context =
					"不过不要惊慌，此结果仅反映您最近一个月的焦虑状态，可能是当前工作生活状态变化的正常反应，不代表焦虑障碍。建议您积极调节情绪并定期测评，一般随着时间的推移会逐渐改善。如果长期持续此状态，"
				const adviceArray = [
					"最好咨询心理医生或心理医学工作者。",
					"建议咨询心理医生或精神科医生。",
					"一定要看心理医生或精神科医生。"
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
					this.review = "根据量表测试分数显示，您现在已经是" + this.anxietyDescription + "了，";
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
						url: '/pages/Chart/SASChart'
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
		// background-image: url('@/static/images/scale/hug.jpg');
		// background-size: cover; /* 覆盖整个元素 */  
		// background-position: center;
		//background: rgb(249, 170, 139);
		border-radius: 10px;
		margin: 20px;
		font-size: 12px;
		line-height: 20px;
		p {
			font-weight: bold;
			font-size: 1.2em;
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
		    background-image: url('@/static/images/scale/hug.jpg');  
		    background-size: cover;  
		    background-position: center;  
		    filter: blur(2px); // 调整模糊度  
		    z-index: -1; // 确保这个伪元素位于原元素之下  
		  } 
	}
</style>