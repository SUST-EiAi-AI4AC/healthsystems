<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">PSQI 匹兹堡睡眠质量指数</text>
			<text class="intro-text">以下问题询问您<text style="color:#e74c3c;">过去1个月</text>的睡眠习惯，请根据最近一个月多数夜晚的实际情况填写。</text>
		</view>

		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="form-box">
			<view v-if="currentPage === 1">
				<view class="question-label">1. 近1个月，晚上通常<text class="highlight">几点上床睡觉</text>？</view>
				<div class="input-row">
					<input type="text" class="text-input" v-model="form.q1" placeholder="例如：22:30" />
				</div>
			</view>

			<view v-if="currentPage === 2">
				<view class="question-label">2. 近1个月，从上床到<text class="highlight">入睡通常需要多长时间</text>（分钟）？</view>
				<view class="option-row">
					<view v-for="item in sleepLatencyOptions" :key="item.value"
						class="select-btn" :class="{ selected: form.q2 === item.value }" @click="form.q2 = item.value">
						{{ item.label }}
					</view>
				</view>
			</view>

			<view v-if="currentPage === 3">
				<view class="question-label">3. 近1个月，通常<text class="highlight">早晨几点起床</text>？</view>
				<div class="input-row">
					<input type="text" class="text-input" v-model="form.q3" placeholder="例如：7:00" />
				</div>
			</view>

			<view v-if="currentPage === 4">
				<view class="question-label">4. 近1个月，每晚通常<text class="highlight">实际睡眠时间</text>有多少小时？（不等于卧床时间）</view>
				<view class="option-row">
					<view v-for="item in sleepDurationOptions" :key="item.value"
						class="select-btn" :class="{ selected: form.q4 === item.value }" @click="form.q4 = item.value">
						{{ item.label }}
					</view>
				</view>
			</view>

			<view v-if="currentPage === 5">
				<view class="question-label">5. 近1个月，您是否因为以下原因而睡眠不好：<text class="highlight">入睡困难（30分钟内不能入睡）</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5a === item.value }" @click="form.q5a = item.value">
						<view class="radio-dot" :class="{ active: form.q5a === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 6">
				<view class="question-label">6. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">夜间易醒或早醒</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5b === item.value }" @click="form.q5b = item.value">
						<view class="radio-dot" :class="{ active: form.q5b === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 7">
				<view class="question-label">7. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">起夜上厕所</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5c === item.value }" @click="form.q5c = item.value">
						<view class="radio-dot" :class="{ active: form.q5c === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 8">
				<view class="question-label">8. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">呼吸不畅</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5d === item.value }" @click="form.q5d = item.value">
						<view class="radio-dot" :class="{ active: form.q5d === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 9">
				<view class="question-label">9. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">咳嗽或鼾声高</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5e === item.value }" @click="form.q5e = item.value">
						<view class="radio-dot" :class="{ active: form.q5e === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 10">
				<view class="question-label">10. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">感觉冷</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5f === item.value }" @click="form.q5f = item.value">
						<view class="radio-dot" :class="{ active: form.q5f === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 11">
				<view class="question-label">11. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">感觉太热</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5g === item.value }" @click="form.q5g = item.value">
						<view class="radio-dot" :class="{ active: form.q5g === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 12">
				<view class="question-label">12. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">做噩梦</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5h === item.value }" @click="form.q5h = item.value">
						<view class="radio-dot" :class="{ active: form.q5h === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 13">
				<view class="question-label">13. 近1个月，您是否因为以下原因睡眠不好：<text class="highlight">疼痛不适</text></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5i === item.value }" @click="form.q5i = item.value">
						<view class="radio-dot" :class="{ active: form.q5i === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 14">
				<view class="question-label">14. 近1个月，有无其他影响睡眠的事情？若有，请描述频率</view>
				<div class="input-row">
					<textarea class="text-area" v-model="form.q5j_desc" placeholder="请描述（可选）"></textarea>
				</div>
				<view class="radio-list" style="margin-top:10px;">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5j === item.value }" @click="form.q5j = item.value">
						<view class="radio-dot" :class="{ active: form.q5j === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 15">
				<view class="question-label">15. 近1个月，总体来说，您认为自己的<text class="highlight">睡眠质量</text>如何？</view>
				<view class="radio-list">
					<view v-for="item in qualityOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q6 === item.value }" @click="form.q6 = item.value">
						<view class="radio-dot" :class="{ active: form.q6 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 16">
				<view class="question-label">16. 近1个月，您是否服用<text class="highlight">催眠药物（包括医生处方或非处方）</text>？</view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q7 === item.value }" @click="form.q7 = item.value">
						<view class="radio-dot" :class="{ active: form.q7 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 17">
				<view class="question-label">17. 近1个月，您在<text class="highlight">开车、吃饭或从事社会活动</text>时是否难以保持清醒？</view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q8 === item.value }" @click="form.q8 = item.value">
						<view class="radio-dot" :class="{ active: form.q8 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 18">
				<view class="question-label">18. 近1个月，您在积极完成工作方面是否存在<text class="highlight">困难</text>？</view>
				<view class="radio-list">
					<view v-for="item in difficultyOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q9 === item.value }" @click="form.q9 = item.value">
						<view class="radio-dot" :class="{ active: form.q9 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>
		</view>

		<view class="nav-btns">
			<button v-if="currentPage > 1" class="btn-prev" @click="prevPage">上一题</button>
			<button v-if="currentPage < totalPages" class="btn-next" @click="nextPage">下一题</button>
			<button v-if="currentPage === totalPages" class="btn-submit" @click="submitForm">提交</button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				currentPage: 1,
				totalPages: 18,
				form: {
					q1: '', q2: null, q3: '', q4: null,
					q5a: null, q5b: null, q5c: null, q5d: null, q5e: null,
					q5f: null, q5g: null, q5h: null, q5i: null, q5j: null, q5j_desc: '',
					q6: null, q7: null, q8: null, q9: null
				},
				freqOptions: [
					{ value: 0, label: '近1个月内没有' },
					{ value: 1, label: '每周不足1次' },
					{ value: 2, label: '每周1～2次' },
					{ value: 3, label: '每周3次或以上' }
				],
				sleepLatencyOptions: [
					{ value: 0, label: '≤15分钟' },
					{ value: 1, label: '16～30分钟' },
					{ value: 2, label: '31～60分钟' },
					{ value: 3, label: '>60分钟' }
				],
				sleepDurationOptions: [
					{ value: 0, label: '>7小时' },
					{ value: 1, label: '6～7小时' },
					{ value: 2, label: '5～6小时' },
					{ value: 3, label: '<5小时' }
				],
				qualityOptions: [
					{ value: 0, label: '很好' },
					{ value: 1, label: '较好' },
					{ value: 2, label: '较差' },
					{ value: 3, label: '很差' }
				],
				difficultyOptions: [
					{ value: 0, label: '没有困难' },
					{ value: 1, label: '一点困难' },
					{ value: 2, label: '较多困难' },
					{ value: 3, label: '很大困难' }
				]
			};
		},
		methods: {
			prevPage() { if (this.currentPage > 1) this.currentPage--; },
			nextPage() { if (this.currentPage < this.totalPages) this.currentPage++; },
			calcScore() {
				// PSQI 7个成分
				const C1 = this.form.q6 || 0;
				const C2 = (this.form.q2 || 0) + (this.form.q5a || 0) > 3 ? 3 : (this.form.q2 || 0) + (this.form.q5a || 0);
				const C3 = this.form.q4 || 0;
				const C4 = 0; // 睡眠效率需要计算，简化处理
				const C5List = [this.form.q5b, this.form.q5c, this.form.q5d, this.form.q5e,
					this.form.q5f, this.form.q5g, this.form.q5h, this.form.q5i, this.form.q5j];
				const C5sum = C5List.reduce((a, b) => a + (b || 0), 0);
				const C5 = C5sum === 0 ? 0 : C5sum <= 9 ? 1 : C5sum <= 18 ? 2 : 3;
				const C6 = this.form.q7 || 0;
				const C7 = ((this.form.q8 || 0) + (this.form.q9 || 0)) > 3 ? 3 : (this.form.q8 || 0) + (this.form.q9 || 0);
				return C1 + C2 + C3 + C4 + C5 + C6 + C7;
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const score = this.calcScore();
				let level = score <= 5 ? '睡眠质量良好' : score <= 10 ? '睡眠质量一般' : '睡眠质量较差，建议就医';
				const payload = {
					status: 2,
					q1: this.form.q1 || '',
					q2: this.form.q2 || 0,
					q3: this.form.q3 || '',
					q4: this.form.q4 || 0,
					q5a: this.form.q5a || 0, q5b: this.form.q5b || 0, q5c: this.form.q5c || 0, q5d: this.form.q5d || 0, q5e: this.form.q5e || 0,
					q5f: this.form.q5f || 0, q5g: this.form.q5g || 0, q5h: this.form.q5h || 0, q5i: this.form.q5i || 0, q5j: this.form.q5j || 0,
					q5jDesc: this.form.q5j_desc || '',
					q6: this.form.q6 || 0, q7: this.form.q7 || 0, q8: this.form.q8 || 0, q9: this.form.q9 || 0
				}
				try {
					await http.post(`${config.baseUrl}/scale/psqi/add`, payload)
				} catch(e) {}
				const record = {
					date: new Date().toLocaleDateString(),
					form: this.form,
					score,
					level
				};
				let history = uni.getStorageSync('psqi_history') || [];
				history.unshift(record);
				uni.setStorageSync('psqi_history', history);
				// 写入统一历史记录
				try {
					const entry = {
						scale: 'PSQI', scaleName: '匹兹堡睡眠质量指数',
						date: new Date().toLocaleString(),
						totalScore: score,
						level,
						levelColor: score <= 5 ? '#43e97b' : score <= 10 ? '#fda085' : '#f5576c',
						scoreText: `总分 ${score}`,
						dims: [], comment: `PSQI总分：${score}\n${level}`,
						rawScores: { 'PSQI总分': score, '睡眠质量': level }
					};
					const sh = uni.getStorageSync('scale_history') || [];
					sh.push(entry);
					uni.setStorageSync('scale_history', sh);
				} catch(e) {}

				uni.showModal({
					title: '提交成功',
					content: `PSQI总分：${score}\n${level}`,
					showCancel: false,
					success: () => { uni.navigateBack(); }
				});
			}
		}
	};
</script>

<style lang="scss" scoped>
	.page {
		padding: 12px; padding-bottom: 20px;
		background-image: linear-gradient(180deg, #e8f5fd 0%, #f0e8ff 100%);
		min-height: 100vh;
	}
	.intro-card {
		background: white; border-radius: 14px; padding: 16px;
		margin-bottom: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.intro-title { font-size: 1.05em; font-weight: bold; color: #2c3e50; display: block; margin-bottom: 8px; }
	.intro-text { font-size: 0.85em; color: #666; }
	.progress-wrap { display: flex; align-items: center; gap: 10px; margin-bottom: 12px; }
	.progress-bar { flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden; }
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #84fab0, #8fd3f4);
		border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.form-box {
		background: white; border-radius: 14px; padding: 16px;
		margin-bottom: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.question-label { font-size: 0.95em; color: #2c3e50; line-height: 1.6; margin-bottom: 14px; font-weight: 500; }
	.highlight { color: #8fd3f4; font-weight: bold; }
	.input-row { display: flex; align-items: center; gap: 8px; margin-top: 8px; }
	.text-input {
		width: 100%; border: 1px solid #ddd; border-radius: 8px;
		padding: 12px 14px; font-size: 1em; background: #f8f8f8;
		height: 46px; box-sizing: border-box; line-height: 1.4;
	}
	.text-area {
		width: 100%; border: 1px solid #ddd; border-radius: 8px;
		padding: 10px 12px; font-size: 0.9em; background: #f8f8f8; height: 70px;
	}
	.option-row { display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 8px; }
	.select-btn {
		padding: 10px 16px; border-radius: 20px; background: #f0f0f0;
		font-size: 0.85em; color: #555; border: 2px solid transparent;
	}
	.select-btn.selected { background: #e8f5fd; color: #3498db; border-color: #8fd3f4; }
	.radio-list { display: flex; flex-direction: column; gap: 10px; }
	.radio-item {
		display: flex; align-items: center; gap: 10px; padding: 12px;
		border-radius: 10px; background: #f8f8f8; border: 2px solid transparent;
	}
	.radio-item.selected { background: #e8f5fd; border-color: #8fd3f4; }
	.radio-dot { width: 18px; height: 18px; border-radius: 50%; border: 2px solid #ccc; flex-shrink: 0; }
	.radio-dot.active { border-color: #8fd3f4; background: #8fd3f4; }
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev { flex: 1; padding: 12px; border-radius: 50px; background: #e8f5e9; color: #66bb6a; font-size: 0.95em; border: none; box-shadow: none; overflow: visible; }
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #84fab0, #8fd3f4);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #84fab0, #8fd3f4);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
