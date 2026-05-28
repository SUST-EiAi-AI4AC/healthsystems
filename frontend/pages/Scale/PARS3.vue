<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">PARS-3 体育活动等级量表</text>
			<text class="intro-text">请根据您<text style="color:#e74c3c;">上个月</text>的体育锻炼情况，回答以下5个问题。</text>
		</view>

		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="form-box">
			<!-- Q1 运动强度 -->
			<view v-if="currentPage === 1">
				<view class="question-label">1. 在上个月，您锻炼时的<text class="highlight">运动强度</text>通常是？</view>
				<view class="radio-list">
					<view v-for="item in intensityOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q1 === item.value }" @click="form.q1 = item.value">
						<view class="radio-dot" :class="{ active: form.q1 === item.value }"></view>
						<view class="radio-content">
							<text class="radio-main">{{ item.label }}</text>
							<text class="radio-desc">{{ item.desc }}</text>
						</view>
					</view>
				</view>
			</view>

			<!-- Q2 运动频率 -->
			<view v-if="currentPage === 2">
				<view class="question-label">2. 在上个月，您平均每周锻炼的<text class="highlight">频率</text>是？</view>
				<view class="radio-list">
					<view v-for="item in frequencyOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q2 === item.value }" @click="form.q2 = item.value">
						<view class="radio-dot" :class="{ active: form.q2 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<!-- Q3 每次持续时间 -->
			<view v-if="currentPage === 3">
				<view class="question-label">3. 在上个月，您每次锻炼的<text class="highlight">持续时间</text>通常是？</view>
				<view class="radio-list">
					<view v-for="item in durationOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q3 === item.value }" @click="form.q3 = item.value">
						<view class="radio-dot" :class="{ active: form.q3 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<!-- Q4 主要运动类型 -->
			<view v-if="currentPage === 4">
				<view class="question-label">4. 您上个月主要进行的<text class="highlight">运动类型</text>是？（可多选）</view>
				<view class="checkbox-list">
					<view v-for="item in sportTypes" :key="item.value"
						class="checkbox-item" :class="{ selected: form.q4.includes(item.value) }" @click="toggleSport(item.value)">
						<view class="checkbox-box" :class="{ checked: form.q4.includes(item.value) }">
							<text v-if="form.q4.includes(item.value)" class="check-mark">✓</text>
						</view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<!-- Q5 主观感受 -->
			<view v-if="currentPage === 5">
				<view class="question-label">5. 总体来看，您对上个月自己的<text class="highlight">体育锻炼情况</text>的自我评价是？</view>
				<view class="radio-list">
					<view v-for="item in selfRatingOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5 === item.value }" @click="form.q5 = item.value">
						<view class="radio-dot" :class="{ active: form.q5 === item.value }"></view>
						<view class="radio-content">
							<text class="radio-main">{{ item.label }}</text>
							<text class="radio-desc">{{ item.desc }}</text>
						</view>
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
				totalPages: 5,
				form: { q1: null, q2: null, q3: null, q4: [], q5: null },
				intensityOptions: [
					{ value: 1, label: '低强度', desc: '散步、轻松骑车，几乎不出汗' },
					{ value: 2, label: '中等强度', desc: '快步走、慢跑，轻微出汗，可以说话' },
					{ value: 3, label: '高强度', desc: '跑步、球类运动，大量出汗，难以说话' }
				],
				frequencyOptions: [
					{ value: 1, label: '1次或更少' },
					{ value: 2, label: '2次' },
					{ value: 3, label: '3-4次' },
					{ value: 4, label: '5-6次' },
					{ value: 5, label: '每天（7次及以上）' }
				],
				durationOptions: [
					{ value: 1, label: '少于15分钟' },
					{ value: 2, label: '15-29分钟' },
					{ value: 3, label: '30-59分钟' },
					{ value: 4, label: '1-2小时' },
					{ value: 5, label: '2小时以上' }
				],
				sportTypes: [
					{ value: 1, label: '步行 / 徒步' },
					{ value: 2, label: '跑步 / 慢跑' },
					{ value: 3, label: '骑车（户外或室内）' },
					{ value: 4, label: '游泳' },
					{ value: 5, label: '球类运动（篮球、羽毛球等）' },
					{ value: 6, label: '健身训练（力量、瑜伽等）' },
					{ value: 7, label: '舞蹈 / 操类' },
					{ value: 8, label: '其他' }
				],
				selfRatingOptions: [
					{ value: 1, label: '非常不足', desc: '几乎没有锻炼' },
					{ value: 2, label: '不足', desc: '锻炼较少，不满意' },
					{ value: 3, label: '一般', desc: '基本达到要求' },
					{ value: 4, label: '良好', desc: '锻炼较充分，比较满意' },
					{ value: 5, label: '非常好', desc: '锻炼充足，非常满意' }
				]
			};
		},
		methods: {
			prevPage() { if (this.currentPage > 1) this.currentPage--; },
			nextPage() { if (this.currentPage < this.totalPages) this.currentPage++; },
			toggleSport(val) {
				const idx = this.form.q4.indexOf(val);
				if (idx === -1) this.form.q4.push(val);
				else this.form.q4.splice(idx, 1);
			},
			calcScore() {
				const s1 = this.form.q1 || 0;
				const s2 = this.form.q2 || 0;
				const s3 = this.form.q3 || 0;
				return s1 * s2 * s3;
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const score = this.calcScore();
				let level = '';
				if (score >= 30) level = '高度活跃';
				else if (score >= 10) level = '中度活跃';
				else level = '低度活跃';
				const payload = { status: 2, q1: this.form.q1 || 0, q2: this.form.q2 || 0, q3: this.form.q3 || 0, q4Types: (this.form.q4 || []).join(','), q5: this.form.q5 || 0 }
				try {
					await http.post(`${config.baseUrl}/scale/pars3/add`, payload)
				} catch(e) {}

				const record = {
					date: new Date().toLocaleDateString(),
					form: this.form,
					score,
					level
				};
				let history = uni.getStorageSync('pars3_history') || [];
				history.unshift(record);
				uni.setStorageSync('pars3_history', history);
				// 写入统一历史记录
				try {
					const entry = {
						scale: 'PARS-3', scaleName: '体育活动等级量表',
						date: new Date().toLocaleString(),
						totalScore: score,
						level,
						levelColor: score >= 30 ? '#43e97b' : score >= 10 ? '#4facfe' : '#f5576c',
						scoreText: `综合得分 ${score}`,
						dims: [], comment: `PARS-3综合得分：${score}\n活动等级：${level}`,
						rawScores: { '综合得分': score, '活动等级': level }
					};
					const sh = uni.getStorageSync('scale_history') || [];
					sh.push(entry);
					uni.setStorageSync('scale_history', sh);
				} catch(e) {}

				uni.showModal({
					title: '提交成功',
					content: `PARS-3综合得分：${score}\n活动等级：${level}`,
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
		background-image: linear-gradient(180deg, #f0fff4 0%, #e8f5e9 100%);
		min-height: 100vh;
	}
	.intro-card {
		background: white; border-radius: 14px; padding: 16px;
		margin-bottom: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.intro-title {
		font-size: 1.05em; font-weight: bold; color: #2c3e50;
		display: block; margin-bottom: 8px;
	}
	.intro-text { font-size: 0.85em; color: #666; }
	.progress-wrap { display: flex; align-items: center; gap: 10px; margin-bottom: 12px; }
	.progress-bar { flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden; }
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #43e97b, #38f9d7);
		border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.form-box {
		background: white; border-radius: 14px; padding: 16px;
		margin-bottom: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.question-label {
		font-size: 0.95em; color: #2c3e50; line-height: 1.6;
		margin-bottom: 14px; font-weight: 500;
	}
	.highlight { color: #27ae60; font-weight: bold; }
	.radio-list { display: flex; flex-direction: column; gap: 10px; }
	.radio-item {
		display: flex; align-items: center; gap: 10px; padding: 12px;
		border-radius: 10px; background: #f8f8f8;
		border: 2px solid transparent;
	}
	.radio-item.selected { background: #f0fff4; border-color: #43e97b; }
	.radio-dot {
		width: 18px; height: 18px; border-radius: 50%;
		border: 2px solid #ccc; flex-shrink: 0;
	}
	.radio-dot.active { border-color: #43e97b; background: #43e97b; }
	.radio-content { display: flex; flex-direction: column; }
	.radio-main { font-size: 0.9em; color: #333; }
	.radio-desc { font-size: 0.75em; color: #888; margin-top: 2px; }
	.checkbox-list { display: flex; flex-direction: column; gap: 10px; }
	.checkbox-item {
		display: flex; align-items: center; gap: 10px; padding: 12px;
		border-radius: 10px; background: #f8f8f8;
		font-size: 0.9em; color: #333; border: 2px solid transparent;
	}
	.checkbox-item.selected { background: #f0fff4; border-color: #43e97b; }
	.checkbox-box {
		width: 20px; height: 20px; border-radius: 5px; border: 2px solid #ccc;
		display: flex; align-items: center; justify-content: center; flex-shrink: 0;
	}
	.checkbox-box.checked { border-color: #43e97b; background: #43e97b; }
	.check-mark { color: white; font-size: 0.8em; font-weight: bold; }
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev {
		flex: 1; padding: 12px; border-radius: 50px;
		background: #e8f5e9; color: #4caf50; font-size: 0.95em; border: none; box-shadow: none; overflow: visible;
	}
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #43e97b, #38f9d7);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #43e97b, #38f9d7);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
