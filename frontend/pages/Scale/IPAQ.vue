<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">IPAQ 国际体力活动量表（短卷）</text>
			<text class="intro-text">以下问题询问您<text style="color:#e74c3c;">过去7天</text>内的体力活动情况，请如实填写各类活动的天数和时间。</text>
		</view>

		<!-- 进度条 -->
		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="form-box">
			<!-- Q1 -->
			<view v-if="currentPage === 1">
				<view class="question-label">1. 在过去7天内，您有几天进行了<text class="highlight">剧烈体力活动</text>？<br/>（如搬重物、挖掘、有氧运动或快速骑车，每次至少10分钟）</view>
				<view class="option-row">
					<view v-for="d in 8" :key="d" class="day-btn" :class="{ selected: form.q1_days === (d-1) }" @click="form.q1_days = d-1">
						{{ d-1 }}天
					</view>
				</view>
				<view v-if="form.q1_days > 0" class="sub-question">
					<view class="question-label">平均每天剧烈活动多长时间？</view>
					<div class="input-row">
						<input type="number" class="time-input" v-model="form.q1_hours" placeholder="小时" />
						<text class="unit">小时</text>
						<input type="number" class="time-input" v-model="form.q1_minutes" placeholder="分钟" />
						<text class="unit">分钟</text>
					</div>
				</view>
			</view>

			<!-- Q2 -->
			<view v-if="currentPage === 2">
				<view class="question-label">2. 在过去7天内，您有几天进行了<text class="highlight">中等强度体力活动</text>？<br/>（如搬运轻物、普通骑车或双打网球，每次至少10分钟，不含步行）</view>
				<view class="option-row">
					<view v-for="d in 8" :key="d" class="day-btn" :class="{ selected: form.q2_days === (d-1) }" @click="form.q2_days = d-1">
						{{ d-1 }}天
					</view>
				</view>
				<view v-if="form.q2_days > 0" class="sub-question">
					<view class="question-label">平均每天中等强度活动多长时间？</view>
					<div class="input-row">
						<input type="number" class="time-input" v-model="form.q2_hours" placeholder="小时" />
						<text class="unit">小时</text>
						<input type="number" class="time-input" v-model="form.q2_minutes" placeholder="分钟" />
						<text class="unit">分钟</text>
					</div>
				</view>
			</view>

			<!-- Q3 -->
			<view v-if="currentPage === 3">
				<view class="question-label">3. 在过去7天内，您有几天<text class="highlight">步行</text>至少10分钟（包括工作、出行、休闲等）？</view>
				<view class="option-row">
					<view v-for="d in 8" :key="d" class="day-btn" :class="{ selected: form.q3_days === (d-1) }" @click="form.q3_days = d-1">
						{{ d-1 }}天
					</view>
				</view>
				<view v-if="form.q3_days > 0" class="sub-question">
					<view class="question-label">平均每天步行多长时间？</view>
					<div class="input-row">
						<input type="number" class="time-input" v-model="form.q3_hours" placeholder="小时" />
						<text class="unit">小时</text>
						<input type="number" class="time-input" v-model="form.q3_minutes" placeholder="分钟" />
						<text class="unit">分钟</text>
					</div>
				</view>
			</view>

			<!-- Q4 -->
			<view v-if="currentPage === 4">
				<view class="question-label">4. 在过去7天内，您在工作日（周一至周五）平均每天<text class="highlight">坐着</text>的时间是多少（包括在桌前、乘车、看电视等）？</view>
				<div class="input-row">
					<input type="number" class="time-input" v-model="form.q4_hours" placeholder="小时" />
					<text class="unit">小时</text>
					<input type="number" class="time-input" v-model="form.q4_minutes" placeholder="分钟" />
					<text class="unit">分钟</text>
				</div>
			</view>

			<!-- Q5 -->
			<view v-if="currentPage === 5">
				<view class="question-label">5. 在过去7天内，您在<text class="highlight">周末</text>平均每天坐着的时间是多少？</view>
				<div class="input-row">
					<input type="number" class="time-input" v-model="form.q5_hours" placeholder="小时" />
					<text class="unit">小时</text>
					<input type="number" class="time-input" v-model="form.q5_minutes" placeholder="分钟" />
					<text class="unit">分钟</text>
				</div>
			</view>

			<!-- Q6 -->
			<view v-if="currentPage === 6">
				<view class="question-label">6. 您认为自己目前的<text class="highlight">整体体力活动水平</text>如何？</view>
				<view class="radio-list">
					<view v-for="item in activityLevels" :key="item.value" class="radio-item" :class="{ selected: form.q6 === item.value }" @click="form.q6 = item.value">
						<view class="radio-dot" :class="{ active: form.q6 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<!-- Q7 -->
			<view v-if="currentPage === 7">
				<view class="question-label">7. 您进行体力活动的主要<text class="highlight">阻碍因素</text>是什么？（可多选）</view>
				<view class="checkbox-list">
					<view v-for="item in barriers" :key="item.value" class="checkbox-item" :class="{ selected: form.q7.includes(item.value) }" @click="toggleBarrier(item.value)">
						<view class="checkbox-box" :class="{ checked: form.q7.includes(item.value) }">
							<text v-if="form.q7.includes(item.value)" class="check-mark">✓</text>
						</view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>
		</view>

		<!-- 导航按钮 -->
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
				totalPages: 7,
				form: {
					q1_days: null, q1_hours: '', q1_minutes: '',
					q2_days: null, q2_hours: '', q2_minutes: '',
					q3_days: null, q3_hours: '', q3_minutes: '',
					q4_hours: '', q4_minutes: '',
					q5_hours: '', q5_minutes: '',
					q6: null,
					q7: []
				},
				activityLevels: [
					{ value: 1, label: '久坐不动（几乎不运动）' },
					{ value: 2, label: '低度活跃（偶尔轻度活动）' },
					{ value: 3, label: '中度活跃（每周3-4天中等活动）' },
					{ value: 4, label: '高度活跃（每周5天以上剧烈活动）' }
				],
				barriers: [
					{ value: 1, label: '时间不足' },
					{ value: 2, label: '疲劳或体力不支' },
					{ value: 3, label: '缺乏设施或场地' },
					{ value: 4, label: '天气或环境因素' },
					{ value: 5, label: '缺乏动力或兴趣' },
					{ value: 6, label: '健康或伤病问题' }
				]
			};
		},
		methods: {
			prevPage() {
				if (this.currentPage > 1) this.currentPage--;
			},
			nextPage() {
				if (this.currentPage < this.totalPages) this.currentPage++;
			},
			toggleBarrier(val) {
				const idx = this.form.q7.indexOf(val);
				if (idx === -1) this.form.q7.push(val);
				else this.form.q7.splice(idx, 1);
			},
			calcMET() {
				const v1 = (parseInt(this.form.q1_days) || 0) * ((parseInt(this.form.q1_hours) || 0) * 60 + (parseInt(this.form.q1_minutes) || 0)) * 8.0;
				const v2 = (parseInt(this.form.q2_days) || 0) * ((parseInt(this.form.q2_hours) || 0) * 60 + (parseInt(this.form.q2_minutes) || 0)) * 4.0;
				const v3 = (parseInt(this.form.q3_days) || 0) * ((parseInt(this.form.q3_hours) || 0) * 60 + (parseInt(this.form.q3_minutes) || 0)) * 3.3;
				return Math.round(v1 + v2 + v3);
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const totalMET = this.calcMET();
				// 转换为 100 分制：参考 IPAQ 标准，6000 MET-min/week 对应满分 100
				const metScore = Math.min(100, Math.round(totalMET / 6000 * 100));
				let level = '';
				if (totalMET >= 3000) level = '高度活跃';
				else if (totalMET >= 600) level = '中度活跃';
				else level = '低度活跃';
				const payload = {
					status: 2,
					q1Days: this.form.q1_days || 0, q1Hours: parseInt(this.form.q1_hours) || 0, q1Minutes: parseInt(this.form.q1_minutes) || 0,
					q2Days: this.form.q2_days || 0, q2Hours: parseInt(this.form.q2_hours) || 0, q2Minutes: parseInt(this.form.q2_minutes) || 0,
					q3Days: this.form.q3_days || 0, q3Hours: parseInt(this.form.q3_hours) || 0, q3Minutes: parseInt(this.form.q3_minutes) || 0,
					q4Hours: parseInt(this.form.q4_hours) || 0, q4Minutes: parseInt(this.form.q4_minutes) || 0,
					q5Hours: parseInt(this.form.q5_hours) || 0, q5Minutes: parseInt(this.form.q5_minutes) || 0,
					q6: this.form.q6 || 0,
					q7: (this.form.q7 || []).join(',')
				}
				try {
					await http.post(`${config.baseUrl}/scale/ipaq/add`, payload)
				} catch(e) {}
			
				const record = {
					date: new Date().toLocaleDateString(),
					form: this.form,
					totalMET,
					level
				};
				let history = uni.getStorageSync('ipaq_history') || [];
				history.unshift(record);
				uni.setStorageSync('ipaq_history', history);
				// 写入统一历史记录
				try {
					const entry = {
						scale: 'IPAQ', scaleName: '国际体力活动量表',
						date: new Date().toLocaleString(),
						totalScore: metScore,
						level,
						levelColor: totalMET >= 3000 ? '#43e97b' : totalMET >= 600 ? '#4facfe' : '#f5576c',
						scoreText: `${metScore}分`,
						dims: [], comment: `体力活动总 MET分：${totalMET}\n活动等级：${level}\n活动评分：${metScore}/100`,
						rawScores: { '总 MET分': totalMET, '活动评分': `${metScore}/100`, '活动等级': level }
					};
					const sh = uni.getStorageSync('scale_history') || [];
					sh.push(entry);
					uni.setStorageSync('scale_history', sh);
				} catch(e) {}
			
				uni.showModal({
					title: '提交成功',
					content: `您的体力活动评分：${metScore}/100 分\n总 MET分：${totalMET}\n活动等级：${level}`,
					showCancel: false,
					success: () => { uni.navigateBack(); }
				});
			}
		}
	};
</script>

<style lang="scss" scoped>
	.page {
		padding: 12px;
		padding-bottom: 20px;
		background-image: linear-gradient(180deg, #e8f4fd 0%, #eafbf0 100%);
		min-height: 100vh;
	}
	.intro-card {
		background: white;
		border-radius: 14px;
		padding: 16px;
		margin-bottom: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.intro-title {
		font-size: 1.05em;
		font-weight: bold;
		color: #2c3e50;
		display: block;
		margin-bottom: 8px;
	}
	.intro-text { font-size: 0.85em; color: #666; }
	.progress-wrap {
		display: flex; align-items: center; gap: 10px; margin-bottom: 12px;
	}
	.progress-bar {
		flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden;
	}
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #4facfe, #00f2fe); border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.form-box {
		background: white; border-radius: 14px; padding: 16px; margin-bottom: 0;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.question-label {
		font-size: 0.95em; color: #2c3e50; line-height: 1.6; margin-bottom: 14px; font-weight: 500;
	}
	.highlight { color: #3498db; font-weight: bold; }
	.option-row {
		display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 12px;
	}
	.day-btn {
		padding: 8px 14px; border-radius: 20px; background: #f0f0f0;
		font-size: 0.85em; color: #555; border: 2px solid transparent;
	}
	.day-btn.selected {
		background: #e8f4fd; color: #3498db; border-color: #4facfe;
	}
	.sub-question { margin-top: 12px; padding-top: 12px; border-top: 1px solid #f0f0f0; }
	.input-row {
		display: flex; align-items: center; gap: 8px; margin-top: 8px;
	}
	.time-input {
		width: 80px; border: 1px solid #ddd; border-radius: 8px;
		padding: 10px 10px; font-size: 1em;
		height: 46px; box-sizing: border-box; line-height: 1.4; text-align: center;
	}
	.unit { font-size: 0.85em; color: #888; }
	.radio-list { display: flex; flex-direction: column; gap: 10px; }
	.radio-item {
		display: flex; align-items: center; gap: 10px; padding: 12px;
		border-radius: 10px; background: #f8f8f8; font-size: 0.9em; color: #333;
		border: 2px solid transparent;
	}
	.radio-item.selected { background: #e8f4fd; border-color: #4facfe; }
	.radio-dot {
		width: 18px; height: 18px; border-radius: 50%; border: 2px solid #ccc; flex-shrink: 0;
	}
	.radio-dot.active { border-color: #4facfe; background: #4facfe; }
	.checkbox-list { display: flex; flex-direction: column; gap: 10px; }
	.checkbox-item {
		display: flex; align-items: center; gap: 10px; padding: 12px;
		border-radius: 10px; background: #f8f8f8; font-size: 0.9em; color: #333;
		border: 2px solid transparent;
	}
	.checkbox-item.selected { background: #e8f4fd; border-color: #4facfe; }
	.checkbox-box {
		width: 20px; height: 20px; border-radius: 5px; border: 2px solid #ccc;
		display: flex; align-items: center; justify-content: center; flex-shrink: 0;
	}
	.checkbox-box.checked { border-color: #4facfe; background: #4facfe; }
	.check-mark { color: white; font-size: 0.8em; font-weight: bold; }
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev {
		flex: 1; padding: 12px; border-radius: 50px; background: #e3f2fd;
		color: #42a5f5; font-size: 0.95em; border: none; box-shadow: none; overflow: visible;
	}
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #4facfe, #00f2fe);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #43e97b, #38f9d7);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
