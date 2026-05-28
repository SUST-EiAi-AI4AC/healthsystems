<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">CD-RISC 心理弹性量表</text>
			<text class="intro-text">请根据以下描述，选择最符合您<text style="color:#e74c3c;">最近情况</text>的选项（0=完全不对，4=几乎总是对）。</text>
		</view>

		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="score-hint">
			<view v-for="s in scoreLabels" :key="s.value" class="hint-item">
				<text class="hint-score">{{ s.value }}</text>
				<text class="hint-label">{{ s.label }}</text>
			</view>
		</view>

		<view class="form-box">
			<view class="question-label">{{ currentPage }}. {{ questions[currentPage - 1] }}</view>
			<view class="score-row">
				<view v-for="s in 5" :key="s" class="score-btn"
					:class="{ selected: form['q' + currentPage] === (s - 1) }"
					@click="form['q' + currentPage] = s - 1">
					{{ s - 1 }}
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
				totalPages: 25,
				form: {},
				scoreLabels: [
					{ value: 0, label: '完全不对' },
					{ value: 1, label: '很少如此' },
					{ value: 2, label: '有时如此' },
					{ value: 3, label: '经常如此' },
					{ value: 4, label: '几乎总是' }
				],
				questions: [
					'当事情没有明确答案时，我也能应对',
					'压力减轻后，我很快能从疾病、受伤或其他困难中恢复过来',
					'我感到自己能够处理任何事情',
					'过去的成功经历让我相信，未来的挑战也能解决',
					'当面对挫折和困难时，我能以幽默的态度对待它',
					'处理压力让我更坚强',
					'我从挫折中能够轻松恢复',
					'我认为自己是一个坚强的人',
					'我能够处理不愉快或痛苦的感受',
					'我相信即使感到绝望，事情也能有好的结果',
					'我能控制自己的人生方向',
					'我喜欢挑战',
					'我做事情需要找到目标或意义',
					'我尽力把事情做到最好',
					'我做决定不后悔',
					'我能应对任何情况',
					'我处理关系时是一个坚强有力的人',
					'我能作出不受欢迎的决定并坚持执行',
					'我能处理痛苦的感受，如悲伤、恐惧和愤怒',
					'我能直觉地了解应该怎么做',
					'我有清晰的目标感',
					'我能掌控自己的生活',
					'我喜欢挑战',
					'我为自己的努力和成就感到自豪',
					'当我遇到阻碍时，我会想方设法克服'
				]
			};
		},
		created() {
			for (let i = 1; i <= 25; i++) {
				this.$set(this.form, 'q' + i, null);
			}
		},
		methods: {
			prevPage() { if (this.currentPage > 1) this.currentPage--; },
			nextPage() { if (this.currentPage < this.totalPages) this.currentPage++; },
			calcScore() {
				let total = 0;
				for (let i = 1; i <= 25; i++) {
					total += this.form['q' + i] || 0;
				}
				return total;
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const score = this.calcScore();
				let level = score >= 80 ? '心理弹性优秀' :
					score >= 60 ? '心理弹性良好' :
					score >= 40 ? '心理弹性中等' : '心理弹性较低，建议关注';
				const payload = { status: 2 }
				for (let i = 1; i <= 25; i++) payload['q' + i] = this.form['q' + i] || 0
				try {
					await http.post(`${config.baseUrl}/scale/cdrisc/add`, payload)
				} catch(e) {}
				const record = { date: new Date().toLocaleDateString(), form: this.form, score, level };
				let history = uni.getStorageSync('cdrisc_history') || [];
				history.unshift(record);
				uni.setStorageSync('cdrisc_history', history);
				// 写入统一历史记录
				try {
					const entry = {
						scale: 'CD-RISC', scaleName: '心理弹性量表',
						date: new Date().toLocaleString(),
						totalScore: score,
						level,
						levelColor: score >= 80 ? '#43e97b' : score >= 60 ? '#4facfe' : score >= 40 ? '#fda085' : '#f5576c',
						scoreText: `总分 ${score}/100`,
						dims: [], comment: `CD-RISC总分：${score}/100\n${level}`,
						rawScores: { '总分': score, '等级': level }
					};
					const sh = uni.getStorageSync('scale_history') || [];
					sh.push(entry);
					uni.setStorageSync('scale_history', sh);
				} catch(e) {}
				uni.showModal({
					title: '提交成功',
					content: `CD-RISC总分：${score}/100\n${level}`,
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
		background-image: linear-gradient(180deg, #f5f0ff 0%, #fce4f4 100%);
		min-height: 100vh;
	}
	.intro-card {
		background: white; border-radius: 14px; padding: 16px;
		margin-bottom: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.intro-title { font-size: 1.05em; font-weight: bold; color: #2c3e50; display: block; margin-bottom: 8px; }
	.intro-text { font-size: 0.85em; color: #666; }
	.progress-wrap { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
	.progress-bar { flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden; }
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #a18cd1, #fbc2eb);
		border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.score-hint {
		display: flex; justify-content: space-between; margin-bottom: 10px;
		background: white; border-radius: 12px; padding: 10px 14px;
		box-shadow: 0 2px 6px rgba(0,0,0,0.06);
	}
	.hint-item { display: flex; flex-direction: column; align-items: center; gap: 3px; }
	.hint-score { font-size: 1em; font-weight: bold; color: #a18cd1; }
	.hint-label { font-size: 0.65em; color: #888; text-align: center; }
	.form-box {
		background: white; border-radius: 14px; padding: 20px;
		margin-bottom: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.question-label { font-size: 1em; color: #2c3e50; line-height: 1.7; margin-bottom: 20px; font-weight: 500; }
	.score-row { display: flex; justify-content: space-around; gap: 8px; }
	.score-btn {
		width: 52px; height: 52px; border-radius: 50%;
		background: #f0f0f0; color: #555; font-size: 1.2em; font-weight: bold;
		display: flex; align-items: center; justify-content: center;
		border: 3px solid transparent;
	}
	.score-btn.selected {
		background: linear-gradient(135deg, #a18cd1, #fbc2eb);
		color: white; border-color: #a18cd1;
	}
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev { flex: 1; padding: 12px; border-radius: 50px; background: #ede7f6; color: #9575cd; font-size: 0.95em; border: none; box-shadow: none; overflow: visible; }
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #a18cd1, #fbc2eb);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #a18cd1, #fbc2eb);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
