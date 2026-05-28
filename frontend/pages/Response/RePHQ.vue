<template>
	<view>
		<h2 class="title">您的抑郁测评报告</h2>

		<div class="main">
			<div class="rating center">
				<u-rate active-color="#ffaa00" size='50rpx' readonly v-model="depressRating"></u-rate>
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
				depressDesc: "",
				review: "",
				advice: "",
				depressScore: 0, // 量表得分
				depressRating: 0, // 量表得分对应的星星个数
				currentPage: 1,
				pageSize: 1,
				sds: [{
						l: 0,
						h: 16,
						desc: '正常'
					},
					{
						l: 17,
						h: 32,
						desc: '轻度抑郁'
					},
					{
						l: 33,
						h: 48,
						desc: '中度抑郁'
					},
					{
						l: 49,
						h: 64,
						desc: '中重度抑郁'
					},
					{
						l: 65,
						h: 80,
						desc: '重度抑郁'
					}
				],


			}
		},
		methods: {
			getScore() {
				console.log("start")
				http.get("/scale/phq9/getlist?currentPage=" + this.currentPage + "&pageSize=" + this.pageSize).then(
				res => {
					this.depressScore = parseInt(res.result.data[0].score) //拿到数据库里最新的记录的分数
					console.log("this.depressScore: ", this.depressScore)

					// 星星越多，表示状态越好，所以这里要反过来
					// 一共5颗星星
					if (this.depressScore >= 0 && this.depressScore <= 16) {
						this.depressRating = 5;

					} else if (this.depressScore <= 32) {
						this.depressRating = 4;

					} else if (this.depressScore <= 48) {
						this.depressRating = 3;

					} else if (this.depressScore <= 64) {
						this.depressRating = 2;

					} else if (this.depressScore <= 80) {
						this.depressRating = 1;

					}
					console.log("this.depressRating: ", this.depressRating)
					this.getAdvice();
				}).catch((err) => {
					alert(err)
				});
			},

			getAdvice() {
				const adviceArray = [
					"适度放松一下自己的心态，保持心情舒畅。", // 轻度抑郁
					"你还是原来的那个你，只是需要一段时间重整旗鼓而已。", // 中度抑郁
					"每个人都有悲伤打不起精神的时候，只是这次特别长而已。没什么的，天总会亮的，总有一天你又会精神奕奕的。不管是低谷还是高潮是的你，都是一样美好的。", // 中重度抑郁
					"你不会一直这样下去的，一定要振作，一切都会好起来的！" // 重度抑郁
				];

				let dl = -1;
				this.sds.find((v, i) => {
					if (this.depressScore <= v.h) {
						this.depressDesc = v.desc;
						dl = i - 1;
						return true
					}
					return false;
				})

				if (dl == -1) {
					this.review = "您现在各项指标都很正常，";
					this.advice = "祝您生活愉快！"
				} else {
					this.review = "";
					this.advice = adviceArray[dl]
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
						url: '/pages/Chart/PHQ9Chart'
					});
				}, 700)
			},
		},
		onLoad(parms) {
			this.getScore();
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