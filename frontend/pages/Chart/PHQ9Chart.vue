<template>
	<view>
		<div class="title">
			{{ ($i18n && $i18n.currentLang === 'en') ? ('Depression Assessment Results (Last ' + pageSize + ' Times)') : ('最近' + pageSize + '次的抑郁量表测试结果') }}
		</div>

		<div class="dr-wrapper">
			<!-- PHQ9 图表 -->
			<l-echart class="PHQ9" ref="PHQ9" @finished="initDrawPHQ9"></l-echart>
		</div>

		<p class="note" v-html="$t('mineSub.chartDetail.chartNote')"></p>

		<div class="box-card">
			<p v-html="$t('mineSub.chartDetail.chartDisclaimer')"></p>
		</div>

		<div>
			<basic-table :columns="columns" :data="tableData"> </basic-table>
		</div>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";
	import * as echarts from '@/uni_modules/lime-echart/static/echarts.min'

	let chartsPHQ9 = null;

	export default {
		data() {
			return {
				dataGeted: false,
				currentPage: 1,
				pageSize: 5,
				charts: '',
				//数据类型为数组
				phq9Data: [],
				logDate: [],
				score: []
			}
		},
		methods: {
			/**
			 *
			 * 向服务器请求数据
			 *
			 */
			getData() {
				http.get("/scale/phq9/getlist?currentPage=" + this.currentPage + "&pageSize=" + this.pageSize).then(
				res => {
					console.log(res)
					//处理get到的数据
					this.phq9Data = res.result.data
					console.log(this.phq9Data);

					//对日期进行升序排列
					this.phq9Data.sort(function(a, b) {
						return Date.parse(a.logDate) - Date.parse(b.logDate);
					});

					for (var i = 0, l = this.phq9Data.length; i < l; i++) {
						this.logDate.push(this.phq9Data[i].logDate.slice(-10));
						this.score.push(this.phq9Data[i].score);
					}

					console.log(this.logDate);
					console.log(this.score);
					this.dataGeted = true;
				})
			},
			async initDrawPHQ9() {
				if (!this.dataGeted) {
					setTimeout(this.initDrawPHQ9, 500);
				} else {
					// chart 图表实例不能存在data里
					chartsPHQ9 = await this.$refs.PHQ9.init(echarts);
					this.drawScore();
				}
			},
			drawScore() {
				const isEn = this.$i18n && this.$i18n.currentLang === 'en';
				const scoreName = isEn ? 'Test Score' : '测试得分';
				const dateName = isEn ? 'Date' : '日期';
				const ptsName = isEn ? 'Score' : '分数';
				const maxName = isEn ? 'Max' : '最大值';
				const minName = isEn ? 'Min' : '最小值';
				const avgName = isEn ? 'Average' : '平均值';

				//绘图
				chartsPHQ9.setOption({
					color: ["white"],
					tooltip: {
						trigger: 'axis',
						triggerOn: 'mousemove',
						axisPointer: {
							type: "shadow"
						},
						formatter: function(param) {
							param = param[0];
							return [
								(isEn ? 'Date: ' : '日期:') + param.name + '</br>',
								(isEn ? 'Score: ' : '分数:') + param.value + (isEn ? ' pts' : '分') + '</br>'
							].join('');
						}
					},
					grid: {},
					legend: {
						left: 'right',
						data: [scoreName],
						textStyle: {
							color: "white"
						},
						selectedMode: false,
					},
					xAxis: {
						name: dateName,
						data: this.logDate,
						axisLabel: {
							interval: 0,
							rotate: -30,
							color: "white",
						},
						axisTick: {
							alignWithLabel: true
						},
						axisLine: {
							lineStyle: {
								color: "white",
							}
						},
					},
					yAxis: {
						name: ptsName,
						axisLabel: {
							color: "white"
						},
						axisTick: {
							alignWithLabel: true
						},
						axisLine: {
							lineStyle: {
								color: "white"
							}
						},
						splitLine: {
							show: false
						}
					},
					series: [{
						name: scoreName,
						type: 'line',
						smooth: true,
						data: this.score,
						itemStyle: {
							normal: {
								label: {
									show: true
								}
							}
						},
						markPoint: {
							symbol: 'pin',
							symbolSize: 40,
							itemStyle: {
								color: 'rgb(85, 156, 255)',
								borderColor: '#000',
								borderWidth: 0,
								borderType: 'solid',
							},
							data: [{
									type: 'max',
									name: maxName,
									label: {
										formatter: '{c}'
									},
									itemStyle: {
										color: "rgb(110, 210, 100)",
									},
								},
								{
									type: 'min',
									name: minName,
									label: {
										formatter: '{c}'
									},
									itemStyle: {
										color: "rgb(85, 156, 255)",
									},
								}
							]
						},
						markLine: {
							data: [{
								type: 'average',
								name: avgName,
								label: {
									formatter: '{c}'
								},
								itemStyle: {
									color: "rgb(255, 255, 255)",
								},
							}]
						}
					}]
				})
			}
		},
		computed: {
			columns() {
				const isEn = this.$i18n && this.$i18n.currentLang === 'en';
				return [
					{ fieldName: 'scoreSection', fieldDesc: isEn ? 'Score Range' : '分数段' },
					{ fieldName: 'explanation', fieldDesc: isEn ? 'Explanation' : '分数说明' },
					{ fieldName: 'advice', fieldDesc: isEn ? 'Advice' : '建议' }
				];
			},
			tableData() {
				const isEn = this.$i18n && this.$i18n.currentLang === 'en';
				return isEn ? [
					{ scoreSection: '0-52', explanation: 'No depression', advice: 'Take good care of yourself' },
					{ scoreSection: '53-62', explanation: 'Possible mild depression', advice: 'Consult a counselor or doctor' },
					{ scoreSection: '63-72', explanation: 'Possible moderate depression', advice: 'Better to consult a mental health specialist' },
					{ scoreSection: '73-80', explanation: 'Possible severe depression', advice: 'Must see a psychiatrist or mental health doctor' }
				] : [
					{ scoreSection: '0-52', explanation: '没有抑郁症', advice: '注意自我保重' },
					{ scoreSection: '53-62', explanation: '可能有轻微抑郁症', advice: '建议咨询心理医生或心理医学工作者' },
					{ scoreSection: '63-72', explanation: '可能有中度抑郁症', advice: '最好咨询心理医生或心理医学工作者' },
					{ scoreSection: '73-80', explanation: '可能有重度抑郁症', advice: '一定要看心理医生或精神科医生' }
				];
			}
		},
		onLoad(parms) {
			this.getData();
		},
		onShow() {
			uni.setNavigationBarTitle({
				title: (this.$i18n && this.$i18n.currentLang === 'en') ? 'Depression Charts' : '抑郁评估记录'
			});
		}
	}
</script>

<style lang="scss" scoped>
	.title {
		font-size: 1.2em;
		color: rgb(40, 40, 40);
		padding: 2px 0 2px 5px; // 文字
		margin: 10px auto;
		border-left: 8px solid rgb(234, 129, 87);
	}

	.dr-wrapper {
		/*margin: 20px;*/
		height: 100%;
		border-radius: 10px;
		background: rgb(234, 129, 87);
	}

	.PHQ9 {
		height: 200px;
		width: 100%;
	}

	.note {
		margin-top: 5px;
		margin-left: 5px;
		font-size: 0.8em;
		color: rgb(100, 100, 100);
	}

	.box-card {
		margin-top: 5px;
		margin-bottom: 5px;
		width: auto;
		height: 100%;
		//background: #dddddd;
		background: rgb(246, 246, 246);
		//background: rgb(249, 170, 139);
		// border-radius: 10px;
		p {
			font-size: 0.95em;
			color: rgb(40, 40, 40);
			padding: 5px;
		}
	}
</style>