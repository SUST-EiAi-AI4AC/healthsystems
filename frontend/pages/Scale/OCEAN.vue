<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">OCEAN 大五人格量表</text>
			<text class="intro-text">以下问题描述您的性格特征，请根据<text style="color:#e74c3c;">真实情况</text>选择符合程度（1=非常不符合，5=非常符合）。</text>
			<view class="dimension-list">
				<text class="dim-tag" v-for="d in dimensionNames" :key="d">{{ d }}</text>
			</view>
		</view>

		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="score-hint">
			<view v-for="s in 5" :key="s" class="hint-item">
				<text class="hint-score">{{ s }}</text>
				<text class="hint-label">{{ oceanLabels[s-1] }}</text>
			</view>
		</view>

		<view class="form-box">
			<view class="dim-badge" :style="{ background: getDimColor(currentPage) }">{{ getDimName(currentPage) }}</view>
			<view class="question-label">{{ currentPage }}. {{ questions[currentPage - 1] }}</view>
			<view class="score-row">
				<view v-for="s in 5" :key="s" class="score-btn"
					:class="{ selected: form['q' + currentPage] === s }"
					@click="form['q' + currentPage] = s">
					{{ s }}
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
				totalPages: 60,
				form: {},
				oceanLabels: ['非常不符合', '不太符合', '一般', '比较符合', '非常符合'],
				dimensionNames: ['开放性O', '尽责性C', '外向性E', '宜人性A', '神经质N'],
				dimColors: [
					'linear-gradient(135deg,#667eea,#764ba2)',
					'linear-gradient(135deg,#f093fb,#f5576c)',
					'linear-gradient(135deg,#4facfe,#00f2fe)',
					'linear-gradient(135deg,#43e97b,#38f9d7)',
					'linear-gradient(135deg,#fda085,#f6d365)'
				],
				// O:1-12, C:13-24, E:25-36, A:37-48, N:49-60
				questions: [
					// O开放性 1-12
					'我有丰富的想象力', '我喜欢思考抽象概念', '我对艺术和美有强烈的感受',
					'我喜欢探索新的思想和观念', '我对各种事物充满好奇', '我喜欢读诗歌或听音乐',
					'我欣赏艺术、音乐和文学', '我有创造性思维', '我享受思考哲学问题',
					'我乐于尝试新的体验', '我对文化和历史感兴趣', '我容易被新鲜事物吸引',
					// C尽责性 13-24
					'我做事有条理、有规划', '我总是能完成自己开始的任务', '我努力工作，追求卓越',
					'我严格遵守规则和义务', '我做决定前会仔细考虑', '我可靠，别人可以依赖我',
					'我对细节很注意', '我做事前会充分准备', '我有很强的自律性',
					'我按时完成工作任务', '我对自己的目标坚持不懈', '我会按计划行事',
					// E外向性 25-36
					'我喜欢与他人交流', '我在社交场合感到舒适', '我喜欢成为关注的焦点',
					'我喜欢参加聚会和社交活动', '我容易交到新朋友', '我喜欢团队合作',
					'我精力充沛，活力四射', '我善于表达自己的想法', '我乐于主动与陌生人交谈',
					'我喜欢刺激和冒险', '我倾向于多说话', '我在群体中感到有活力',
					// A宜人性 37-48
					'我关心他人的感受', '我容易信任他人', '我愿意帮助有困难的人',
					'我避免与他人发生冲突', '我对他人很宽容', '我总是考虑他人的需要',
					'我善良温和', '我不喜欢操控他人', '我能理解他人的立场',
					'我欣赏与他人合作', '我容易原谅他人', '我对他人很体贴',
					// N神经质 49-60
					'我经常感到焦虑或担忧', '我容易情绪化', '我在压力下容易崩溃',
					'我经常感到紧张', '我容易感到沮丧', '我的情绪波动很大',
					'我经常感到孤独或忧郁', '我对批评很敏感', '我容易感到不安全',
					'我有时会感到空虚', '我在挫折面前容易灰心', '我的情绪常常影响我的行为'
				]
			};
		},
		created() {
			for (let i = 1; i <= 60; i++) {
				this.$set(this.form, 'q' + i, null);
			}
		},
		methods: {
			getDimName(page) {
				if (page <= 12) return '开放性 O';
				if (page <= 24) return '尽责性 C';
				if (page <= 36) return '外向性 E';
				if (page <= 48) return '宜人性 A';
				return '神经质 N';
			},
			getDimColor(page) {
				if (page <= 12) return this.dimColors[0];
				if (page <= 24) return this.dimColors[1];
				if (page <= 36) return this.dimColors[2];
				if (page <= 48) return this.dimColors[3];
				return this.dimColors[4];
			},
			prevPage() { if (this.currentPage > 1) this.currentPage--; },
			nextPage() { if (this.currentPage < this.totalPages) this.currentPage++; },
			calcDimScores() {
				const dims = { O: [1, 12], C: [13, 24], E: [25, 36], A: [37, 48], N: [49, 60] };
				const scores = {};
				for (const [dim, [s, e]] of Object.entries(dims)) {
					let sum = 0;
					for (let i = s; i <= e; i++) sum += this.form['q' + i] || 0;
					scores[dim] = sum;
				}
				return scores;
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const scores = this.calcDimScores();
				const dimNames = { O: '开放性', C: '尽责性', E: '外向性', A: '宜人性', N: '神经质' };
				let content = 'OCEAN 各维度得分（满分60）：\n';
				for (const [k, v] of Object.entries(scores)) {
					content += `${dimNames[k]}(${k})：${v}\n`;
				}
				const payload = { status: 2 }
				for (let i = 1; i <= 60; i++) payload['q' + i] = this.form['q' + i] || 0
				try {
					await http.post(`${config.baseUrl}/scale/ocean/add`, payload)
				} catch(e) {}
				const record = { date: new Date().toLocaleDateString(), form: this.form, scores };
				let history = uni.getStorageSync('ocean_history') || [];
				history.unshift(record);
				uni.setStorageSync('ocean_history', history);
				// 写入统一历史记录
				try {
					const dimNameMap = { O: '开放性', C: '尽责性', E: '外向性', A: '宜人性', N: '神经质' };
					const dimArr = Object.entries(scores).map(([k, v]) => ({ name: `${dimNameMap[k]}(${k})`, value: v, pct: Math.min(v / 60 * 100, 100) }));
					const entry = {
						scale: 'OCEAN', scaleName: '大五人格量表',
						date: new Date().toLocaleString(),
						totalScore: Object.values(scores).reduce((a,b)=>a+b,0),
						level: '已完成人格测评',
						levelColor: '#fda085',
						scoreText: Object.entries(scores).map(([k,v])=>`${k}:${v}`).join(' '),
						dims: dimArr, comment: content, rawScores: scores
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
		background-image: linear-gradient(180deg, #fff8e8 0%, #ffe8f8 100%);
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
		padding: 3px 10px; background: linear-gradient(135deg, #fda085, #f6d365);
		border-radius: 12px; font-size: 0.72em; color: white;
	}
	.progress-wrap { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
	.progress-bar { flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden; }
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #fda085, #f6d365);
		border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.score-hint {
		display: flex; justify-content: space-between; margin-bottom: 10px;
		background: white; border-radius: 12px; padding: 10px 8px;
		box-shadow: 0 2px 6px rgba(0,0,0,0.06);
	}
	.hint-item { display: flex; flex-direction: column; align-items: center; gap: 3px; flex: 1; }
	.hint-score { font-size: 1em; font-weight: bold; color: #fda085; }
	.hint-label { font-size: 0.58em; color: #888; text-align: center; }
	.form-box {
		background: white; border-radius: 14px; padding: 20px;
		margin-bottom: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.dim-badge {
		display: inline-block; padding: 3px 12px; border-radius: 12px;
		font-size: 0.75em; color: white; margin-bottom: 12px;
	}
	.question-label { font-size: 1em; color: #2c3e50; line-height: 1.7; margin-bottom: 20px; font-weight: 500; }
	.score-row { display: flex; justify-content: space-around; gap: 6px; }
	.score-btn {
		width: 52px; height: 52px; border-radius: 50%;
		background: #f0f0f0; color: #555; font-size: 1.2em; font-weight: bold;
		display: flex; align-items: center; justify-content: center;
		border: 3px solid transparent;
	}
	.score-btn.selected {
		background: linear-gradient(135deg, #fda085, #f6d365);
		color: white; border-color: #fda085;
	}
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev { flex: 1; padding: 12px; border-radius: 50px; background: #fff3e0; color: #ffa726; font-size: 0.95em; border: none; box-shadow: none; overflow: visible; }
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #fda085, #f6d365);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #43e97b, #38f9d7);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
