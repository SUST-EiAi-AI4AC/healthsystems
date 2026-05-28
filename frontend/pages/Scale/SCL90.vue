<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">SCL-90 症状自评量表</text>
			<text class="intro-text">请根据您<text style="color:#e74c3c;">最近一周</text>的实际感受，选择符合程度（1=无，2=轻度，3=中度，4=相当重，5=严重）。</text>
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
				<text class="hint-label">{{ sclLabels[s-1] }}</text>
			</view>
		</view>

		<view class="form-box">
			<view class="dim-badge">{{ getDimName(currentPage) }}</view>
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
				totalPages: 90,
				form: {},
				sclLabels: ['无', '轻度', '中度', '相当重', '严重'],
				dimensionNames: ['躯体化', '强迫', '人际敏感', '抑郁', '焦虑', '敌对', '恐怖', '偏执', '精神病性'],
				// 维度题目分配（标准SCL-90）
				// 躯体化1-12(1,4,12,27,40,42,48,49,52,53,56,58)
				// 强迫(3,9,10,28,38,45,46,51,55,65)
				// 人际敏感(6,21,34,36,37,41,61,69,73)
				// 抑郁(5,14,15,20,22,26,29,30,31,32,54,71,79)
				// 焦虑(2,17,23,33,39,57,72,78,80,86)
				// 敌对(11,24,63,67,74,81)
				// 恐怖(13,25,47,50,70,75,82)
				// 偏执(8,18,43,68,76,83)
				// 精神病性(7,16,35,62,77,84,85,87,88,90)
				// 其他(19,44,59,60,64,66,89)
				dimMapping: {
					1:'躯体化',4:'躯体化',12:'躯体化',27:'躯体化',40:'躯体化',42:'躯体化',
					48:'躯体化',49:'躯体化',52:'躯体化',53:'躯体化',56:'躯体化',58:'躯体化',
					3:'强迫',9:'强迫',10:'强迫',28:'强迫',38:'强迫',45:'强迫',46:'强迫',51:'强迫',55:'强迫',65:'强迫',
					6:'人际敏感',21:'人际敏感',34:'人际敏感',36:'人际敏感',37:'人际敏感',41:'人际敏感',61:'人际敏感',69:'人际敏感',73:'人际敏感',
					5:'抑郁',14:'抑郁',15:'抑郁',20:'抑郁',22:'抑郁',26:'抑郁',29:'抑郁',30:'抑郁',31:'抑郁',32:'抑郁',54:'抑郁',71:'抑郁',79:'抑郁',
					2:'焦虑',17:'焦虑',23:'焦虑',33:'焦虑',39:'焦虑',57:'焦虑',72:'焦虑',78:'焦虑',80:'焦虑',86:'焦虑',
					11:'敌对',24:'敌对',63:'敌对',67:'敌对',74:'敌对',81:'敌对',
					13:'恐怖',25:'恐怖',47:'恐怖',50:'恐怖',70:'恐怖',75:'恐怖',82:'恐怖',
					8:'偏执',18:'偏执',43:'偏执',68:'偏执',76:'偏执',83:'偏执',
					7:'精神病性',16:'精神病性',35:'精神病性',62:'精神病性',77:'精神病性',84:'精神病性',85:'精神病性',87:'精神病性',88:'精神病性',90:'精神病性'
				},
				questions: [
					'头痛','神经过敏、心中不踏实','头脑中有不必要的想法或字句盘旋','头昏或昏倒',
					'对异性的兴趣减退','对旁人责备求全','感到别人能控制您的思想','责怪别人制造麻烦',
					'忘性大','担心自己的衣饰整齐及仪态的端正','容易烦恼和激动','胸痛',
					'害怕空旷的场所或街道','感到自己的精力下降，活动减慢','想结束自己的生命','听到旁人听不到的声音',
					'发抖','感到大多数人都不可信任','胃口差','容易哭泣',
					'同异性相处时感到害羞不自在','感到受骗，中了圈套或有人想抓住您','无缘无故地突然感到害怕','自己不能控制地大发脾气',
					'怕单独出门','经常责怪自己','腰痛','感到难以完成任务',
					'感到孤独','感到苦闷','过分担忧','对事物不感兴趣',
					'感到害怕','您的感情容易受到伤害','旁人能知道您的私下想法','感到别人不理解您，不同情您',
					'感到人们对您不友好，不喜欢您','做事必须做得很慢以保证做得正确','心跳得很厉害','恶心或胃部不舒服',
					'感到比不上他人','肌肉酸痛','注意到旁人能观察您的一举一动','难以入睡',
					'做事必须反复检查','感到难以作出决定','怕乘电车、公共汽车、地铁或火车','呼吸有困难',
					'一阵阵发冷或发热','因为感到害怕而避开某些东西、场合或活动','脑子变空了','身体发麻或刺痛',
					'喉咙有梗塞感','感到前途没有希望','不能集中注意','感到身体的某一部分软弱无力',
					'感到紧张或容易紧张','感到手或脚发重','想到死亡的事','吃得太多',
					'当别人看着您或谈论您时感到不自在','有一些不属于您自己的想法','有想打人或伤害他人的冲动','醒得太早',
					'必须反复洗手，点数目或触摸某些东西','睡得不稳不深','有想摔坏或破坏东西的冲动','有一些别人没有的想法或念头',
					'感到对别人神经过敏','在商店或电影院等人多的地方感到不自在','感到任何事情都很困难','一阵阵恐惧或惊恐',
					'感到在公共场合吃东西很不舒服','经常与人争论','单独一人时神经很紧张','别人对您的成绩没有作出恰当的评价',
					'即使和别人在一起也感到孤单','感到坐立不安，心神不宁','感到自己没有什么价值','感到熟悉的东西变得陌生或不像是真的',
					'大叫或摔东西','害怕会在公共场合晕倒','感到别人想占您的便宜','为一些有关性的想法而很苦恼',
					'您认为应该因为自己的过错而受到惩罚','感到要很快把事情做完','感到自己的身体有严重问题',
					'从未感到和其他人很亲近','感到罪孽深重','看到或听到过去没有的东西'
				]
			};
		},
		created() {
			for (let i = 1; i <= 90; i++) {
				this.$set(this.form, 'q' + i, null);
			}
		},
		methods: {
			getDimName(page) {
				return this.dimMapping[page] || '附加项目';
			},
			prevPage() { if (this.currentPage > 1) this.currentPage--; },
			nextPage() { if (this.currentPage < this.totalPages) this.currentPage++; },
			calcScores() {
				const dims = { '躯体化':[1,4,12,27,40,42,48,49,52,53,56,58], '强迫':[3,9,10,28,38,45,46,51,55,65],
					'人际敏感':[6,21,34,36,37,41,61,69,73], '抑郁':[5,14,15,20,22,26,29,30,31,32,54,71,79],
					'焦虑':[2,17,23,33,39,57,72,78,80,86], '敌对':[11,24,63,67,74,81],
					'恐怖':[13,25,47,50,70,75,82], '偏执':[8,18,43,68,76,83],
					'精神病性':[7,16,35,62,77,84,85,87,88,90] };
				const scores = {};
				for (const [dim, items] of Object.entries(dims)) {
					const sum = items.reduce((a, i) => a + (this.form['q' + i] || 0), 0);
					scores[dim] = (sum / items.length).toFixed(2);
				}
				let total = 0;
				for (let i = 1; i <= 90; i++) total += this.form['q' + i] || 0;
				scores['总分'] = total;
				scores['阳性均分'] = (total / 90).toFixed(2);
				return scores;
			},
			async submitForm() {
				const http = (await import('@/nxTemp/config/requestConfig')).default
				const config = (await import('@/nxTemp/config/index.config')).default
				const scores = this.calcScores();
				const total = scores['总分'];
				const avg = scores['阳性均分'];
				let content = `SCL-90总分：${total}，阳性均分：${avg}\n\n各维度均分：\n`;
				const dimOrder = ['躯体化','强迫','人际敏感','抑郁','焦虑','敌对','恐怖','偏执','精神病性'];
				for (const d of dimOrder) {
					const flag = parseFloat(scores[d]) >= 2 ? '⚠️' : '';
					content += `${d}：${scores[d]}${flag}\n`;
				}
				const payload = { status: 2 }
				for (let i = 1; i <= 90; i++) payload['q' + i] = this.form['q' + i] || 0
				try {
					await http.post(`${config.baseUrl}/scale/scl90/add`, payload)
				} catch(e) {}
				const record = { date: new Date().toLocaleDateString(), form: this.form, scores };
				let history = uni.getStorageSync('scl90_history') || [];
				history.unshift(record);
				uni.setStorageSync('scl90_history', history);
				// 写入统一历史记录
				try {
					const dims = dimOrder.map(d => ({ name: d, value: scores[d], pct: Math.min(parseFloat(scores[d]) / 5 * 100, 100) }));
					const entry = {
						scale: 'SCL-90', scaleName: '症状自评量表',
						date: new Date().toLocaleString(),
						totalScore: total,
						level: parseFloat(avg) >= 2 ? '存在阳性症状' : '无明显异常',
						levelColor: parseFloat(avg) >= 2 ? '#f5576c' : '#43e97b',
						scoreText: `总分 ${total}，阳性均分 ${avg}`,
						dims, comment: content, rawScores: scores
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
		background-image: linear-gradient(180deg, #fff0f5 0%, #ffe8ee 100%);
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
		padding: 3px 8px; background: linear-gradient(135deg, #f093fb, #f5576c);
		border-radius: 12px; font-size: 0.7em; color: white;
	}
	.progress-wrap { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
	.progress-bar { flex: 1; height: 6px; background: #e0e0e0; border-radius: 3px; overflow: hidden; }
	.progress-fill {
		height: 100%; background: linear-gradient(90deg, #f093fb, #f5576c);
		border-radius: 3px; transition: width 0.3s;
	}
	.progress-text { font-size: 0.8em; color: #888; white-space: nowrap; }
	.score-hint {
		display: flex; justify-content: space-between; margin-bottom: 10px;
		background: white; border-radius: 12px; padding: 10px 8px;
		box-shadow: 0 2px 6px rgba(0,0,0,0.06);
	}
	.hint-item { display: flex; flex-direction: column; align-items: center; gap: 3px; flex: 1; }
	.hint-score { font-size: 1em; font-weight: bold; color: #f5576c; }
	.hint-label { font-size: 0.6em; color: #888; text-align: center; }
	.form-box {
		background: white; border-radius: 14px; padding: 20px;
		margin-bottom: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	.dim-badge {
		display: inline-block; padding: 3px 12px; border-radius: 12px;
		background: linear-gradient(135deg, #f093fb, #f5576c);
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
		background: linear-gradient(135deg, #f093fb, #f5576c);
		color: white; border-color: #f093fb;
	}
	.nav-btns {
		display: flex; gap: 10px; padding: 14px 2px 14px;
	}
	.btn-prev { flex: 1; padding: 12px; border-radius: 50px; background: #fce4ec; color: #e57373; font-size: 0.95em; border: none; box-shadow: none; overflow: visible; }
	.btn-prev::after { border: none; }
	.btn-next {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #f093fb, #f5576c);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
	.btn-submit {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #43e97b, #38f9d7);
		color: white; font-size: 0.95em; font-weight: bold; border: none;
	}
</style>
