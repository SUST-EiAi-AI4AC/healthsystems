<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">MAIA-2 多维度内感受意识量表</text>
			<text class="intro-text">请根据您<text style="color:#e74c3c;">平时的真实感受</text>，对以下描述进行评分（0=从不，5=始终）。</text>
			<view class="dimension-list">
				<text class="dim-tag" v-for="d in dimensions" :key="d">{{ d }}</text>
			</view>
		</view>

		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="score-hint">
			<view v-for="s in 6" :key="s" class="hint-item">
				<text class="hint-score">{{ s - 1 }}</text>
				<text class="hint-label">{{ maiaLabels[s-1] }}</text>
			</view>
		</view>

		<view class="form-box">
			<view class="dim-badge">{{ getDimension(currentPage) }}</view>
			<view class="question-label">{{ currentPage }}. {{ questions[currentPage - 1] }}</view>
			<view class="score-row">
				<view v-for="s in 6" :key="s" class="score-btn"
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
				totalPages: 37,
				form: {},
				maiaLabels: ['从不', '偶尔', '有时', '较多', '经常', '始终'],
				dimensions: ['注意感知', '不干扰', '不担忧', '注意调节', '情绪察觉', '自我调节', '身体倾听', '信任'],
				// 维度分配：注意感知1-4，不干扰5-7，不担忧8-10，注意调节11-15，情绪察觉16-19，自我调节20-22，身体倾听23-25，信任26-37（修正后）
				dimensionMap: {
					1: '注意感知', 2: '注意感知', 3: '注意感知', 4: '注意感知',
					5: '不干扰', 6: '不干扰', 7: '不干扰',
					8: '不担忧', 9: '不担忧', 10: '不担忧',
					11: '注意调节', 12: '注意调节', 13: '注意调节', 14: '注意调节', 15: '注意调节',
					16: '情绪察觉', 17: '情绪察觉', 18: '情绪察觉', 19: '情绪察觉',
					20: '自我调节', 21: '自我调节', 22: '自我调节',
					23: '身体倾听', 24: '身体倾听', 25: '身体倾听',
					26: '信任', 27: '信任', 28: '信任', 29: '信任',
					30: '信任', 31: '信任', 32: '信任', 33: '信任',
					34: '信任', 35: '信任', 36: '信任', 37: '信任'
				},
				questions: [
					'我注意到身体不适的感觉，如肌肉酸痛、疼痛或不舒适',
					'当我感到压力时，我会注意到身体的反应',
					'我注意到身体舒适的感觉，比如放松或感到轻盈',
					'当与某人交谈时，我注意到身体的细微感受',
					'我不理会身体疼痛和不适的感觉',
					'我能把注意力转移到其他事情上而不受疼痛干扰',
					'当我身体不舒服时，我试图放松并度过它',
					'我不担心当我感到疼痛或不适的感受',
					'我不为身体的不舒服而感到焦虑',
					'我的身体感受不会让我感到害怕',
					'我可以保持对身体感觉的注意，即使有其他干扰',
					'我可以把注意力集中在我的呼吸上',
					'我可以将注意力转移到身体的不同部位',
					'我在做一件事情的同时，能保持对身体感受的觉察',
					'我能专注于身体感觉，同时也能与他人交流',
					'当我焦虑时，我能注意到身体内部的感受',
					'我注意到当我的情绪随着身体感受变化',
					'我注意到情绪状态的改变对我身体的影响',
					'我能觉察情绪时的躯体感受',
					'当我遇到困难时，我可以从身体感受中找到平静',
					'我能用身体感受来调节自己的情绪状态',
					'当我需要平静下来时，我会关注身体的感受',
					'我在做决策时，我会倾听身体的感受',
					'当做出重要决定时，我注意身体的感受',
					'我信任身体的感受来引导我的行为',
					'我觉得与身体的联系是积极的',
					'我信任身体的感受',
					'我感受到身体给我的信号',
					'我的身体是我的盟友',
					'我欣赏我的身体',
					'我感到自己身处于自己的身体中',
					'我感到与自己的身体和谐相处',
					'与身体的关系让我感到安全',
					'我感到我的身体是我的一部分',
					'我接受身体给我的反馈',
					'我与我的身体之间有良好的关系',
					'我的身体感受对我很有意义'
				]
			};
		},
		created() {
			for (let i = 1; i <= 37; i++) {
				this.$set(this.form, 'q' + i, null);
			}
		},
		methods: {
			getDimension(page) {
				return this.dimensionMap[page] || '';
			},
			prevPage() { if (this.currentPage > 1) this.currentPage--; },
			nextPage() { if (this.currentPage < this.totalPages) this.currentPage++; },
			calcDimScores() {
				const ranges = {
					'注意感知': [1, 4], '不干扰': [5, 7], '不担忧': [8, 10],
					'注意调节': [11, 15], '情绪察觉': [16, 19],
					'自我调节': [20, 22], '身体倾听': [23, 25], '信任': [26, 37]
				};
				const scores = {};
				for (const [dim, [start, end]] of Object.entries(ranges)) {
					let sum = 0, count = 0;
					for (let i = start; i <= end; i++) {
						sum += this.form['q' + i] || 0;
						count++;
					}
					scores[dim] = (sum / count).toFixed(1);
				}
				return scores;
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const dimScores = this.calcDimScores();
				let content = 'MAIA-2 各维度均分：\n';
				for (const [dim, score] of Object.entries(dimScores)) {
					content += `${dim}：${score}\n`;
				}
				const payload = { status: 2 }
				for (let i = 1; i <= 37; i++) payload['q' + i] = this.form['q' + i] || 0
				try {
					await http.post(`${config.baseUrl}/scale/maia2/add`, payload)
				} catch(e) {}
				const record = { date: new Date().toLocaleDateString(), form: this.form, dimScores };
				let history = uni.getStorageSync('maia2_history') || [];
				history.unshift(record);
				uni.setStorageSync('maia2_history', history);
				// 写入统一历史记录
				try {
					const dimArr = Object.entries(dimScores).map(([name, value]) => ({ name, value, pct: Math.min(parseFloat(value) / 5 * 100, 100) }));
					const avgScore = (Object.values(dimScores).reduce((a, b) => a + parseFloat(b), 0) / Object.keys(dimScores).length).toFixed(2);
					const entry = {
						scale: 'MAIA-2', scaleName: '多维度内感受意识量表',
						date: new Date().toLocaleString(),
						totalScore: avgScore,
						level: parseFloat(avgScore) >= 3 ? '内感受意识良好' : '内感受意识待加强',
						levelColor: parseFloat(avgScore) >= 3 ? '#43e97b' : '#fa709a',
						scoreText: `平均分 ${avgScore}`,
						dims: dimArr, comment: content, rawScores: dimScores
					};
					const sh = uni.getStorageSync('scale_history') || [];
					sh.push(entry);
					uni.setStorageSync('scale_history', sh);
				} catch(e) {}
				uni.showModal({
					title: '提交成功',
					content,
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
		background-image: linear-gradient(180deg, #fff0f9 0%, #fce8d5 100%);
		min-height: 100vh;
	}
	.intro-card {
		background: white; border-radius: 14px; padding: 16px;
		margin-bottom: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.intro-title { font-size: 1.05em; font-weight: bold; color: #2c3e50; display: block; margin-bottom: 8px; }
	.intro-text { font-size: 0.85em; color: #666; margin-bottom: 10px; display: block; }
	.dimension-list { display: flex; flex-wrap: wrap; gap: 6px; margin-top: 8px; }
	.dim-tag {
		padding: 3px 10px; background: linear-gradient(135deg, #fa709a, #fee140);
		border-radius: 12px; font-size: 0.72em; color: white;
	}
	.progress-wrap { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
	.progress-bar { flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden; }
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #fa709a, #fee140);
		border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.score-hint {
		display: flex; justify-content: space-between; margin-bottom: 10px;
		background: white; border-radius: 12px; padding: 10px 8px;
		box-shadow: 0 2px 6px rgba(0,0,0,0.06);
	}
	.hint-item { display: flex; flex-direction: column; align-items: center; gap: 3px; }
	.hint-score { font-size: 1em; font-weight: bold; color: #fa709a; }
	.hint-label { font-size: 0.6em; color: #888; text-align: center; }
	.form-box {
		background: white; border-radius: 14px; padding: 20px;
		margin-bottom: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.dim-badge {
		display: inline-block; padding: 3px 12px;
		background: linear-gradient(135deg, #fa709a, #fee140);
		border-radius: 12px; font-size: 0.75em; color: white;
		margin-bottom: 12px;
	}
	.question-label { font-size: 1em; color: #2c3e50; line-height: 1.7; margin-bottom: 20px; font-weight: 500; }
	.score-row { display: flex; justify-content: space-around; gap: 6px; }
	.score-btn {
		width: 46px; height: 46px; border-radius: 50%;
		background: #f0f0f0; color: #555; font-size: 1.1em; font-weight: bold;
		display: flex; align-items: center; justify-content: center;
		border: 3px solid transparent;
	}
	.score-btn.selected {
		background: linear-gradient(135deg, #fa709a, #fee140);
		color: white; border-color: #fa709a;
	}
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev { flex: 1; padding: 12px; border-radius: 50px; background: #fce4ec; color: #f06292; font-size: 0.95em; border: none; box-shadow: none; overflow: visible; }
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #fa709a, #fee140);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #fa709a, #fee140);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
