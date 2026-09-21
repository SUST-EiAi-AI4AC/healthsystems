<template>
	<view class="page">
		<view class="intro-card">
			<text class="intro-title">{{ $t('scales.psqi.title') }}</text>
			<view class="intro-text" v-html="$t('scales.psqi.intro')"></view>
		</view>

		<view class="progress-wrap">
			<view class="progress-bar">
				<view class="progress-fill" :style="{ width: (currentPage / totalPages * 100) + '%' }"></view>
			</view>
			<text class="progress-text">{{ currentPage }} / {{ totalPages }}</text>
		</view>

		<view class="form-box">
			<view v-if="currentPage === 1">
				<view class="question-label" v-html="$t('scales.psqi.q1')"></view>
				<div class="input-row">
					<input type="text" class="text-input" v-model="form.q1" :placeholder="$t('scales.psqi.q1Placeholder')" />
				</div>
			</view>

			<view v-if="currentPage === 2">
				<view class="question-label" v-html="$t('scales.psqi.q2')"></view>
				<view class="option-row">
					<view v-for="item in sleepLatencyOptions" :key="item.value"
						class="select-btn" :class="{ selected: form.q2 === item.value }" @click="form.q2 = item.value">
						{{ item.label }}
					</view>
				</view>
			</view>

			<view v-if="currentPage === 3">
				<view class="question-label" v-html="$t('scales.psqi.q3')"></view>
				<div class="input-row">
					<input type="text" class="text-input" v-model="form.q3" :placeholder="$t('scales.psqi.q3Placeholder')" />
				</div>
			</view>

			<view v-if="currentPage === 4">
				<view class="question-label" v-html="$t('scales.psqi.q4')"></view>
				<view class="option-row">
					<view v-for="item in sleepDurationOptions" :key="item.value"
						class="select-btn" :class="{ selected: form.q4 === item.value }" @click="form.q4 = item.value">
						{{ item.label }}
					</view>
				</view>
			</view>

			<view v-if="currentPage === 5">
				<view class="question-label" v-html="$t('scales.psqi.q5a')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5a === item.value }" @click="form.q5a = item.value">
						<view class="radio-dot" :class="{ active: form.q5a === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 6">
				<view class="question-label" v-html="$t('scales.psqi.q5b')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5b === item.value }" @click="form.q5b = item.value">
						<view class="radio-dot" :class="{ active: form.q5b === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 7">
				<view class="question-label" v-html="$t('scales.psqi.q5c')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5c === item.value }" @click="form.q5c = item.value">
						<view class="radio-dot" :class="{ active: form.q5c === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 8">
				<view class="question-label" v-html="$t('scales.psqi.q5d')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5d === item.value }" @click="form.q5d = item.value">
						<view class="radio-dot" :class="{ active: form.q5d === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 9">
				<view class="question-label" v-html="$t('scales.psqi.q5e')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5e === item.value }" @click="form.q5e = item.value">
						<view class="radio-dot" :class="{ active: form.q5e === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 10">
				<view class="question-label" v-html="$t('scales.psqi.q5f')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5f === item.value }" @click="form.q5f = item.value">
						<view class="radio-dot" :class="{ active: form.q5f === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 11">
				<view class="question-label" v-html="$t('scales.psqi.q5g')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5g === item.value }" @click="form.q5g = item.value">
						<view class="radio-dot" :class="{ active: form.q5g === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 12">
				<view class="question-label" v-html="$t('scales.psqi.q5h')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5h === item.value }" @click="form.q5h = item.value">
						<view class="radio-dot" :class="{ active: form.q5h === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 13">
				<view class="question-label" v-html="$t('scales.psqi.q5i')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q5i === item.value }" @click="form.q5i = item.value">
						<view class="radio-dot" :class="{ active: form.q5i === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 14">
				<view class="question-label" v-html="$t('scales.psqi.q5j')"></view>
				<div class="input-row">
					<textarea class="text-area" v-model="form.q5j_desc" :placeholder="$t('scales.psqi.q5jPlaceholder')"></textarea>
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
				<view class="question-label" v-html="$t('scales.psqi.q6')"></view>
				<view class="radio-list">
					<view v-for="item in qualityOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q6 === item.value }" @click="form.q6 = item.value">
						<view class="radio-dot" :class="{ active: form.q6 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 16">
				<view class="question-label" v-html="$t('scales.psqi.q7')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q7 === item.value }" @click="form.q7 = item.value">
						<view class="radio-dot" :class="{ active: form.q7 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 17">
				<view class="question-label" v-html="$t('scales.psqi.q8')"></view>
				<view class="radio-list">
					<view v-for="item in freqOptions" :key="item.value"
						class="radio-item" :class="{ selected: form.q8 === item.value }" @click="form.q8 = item.value">
						<view class="radio-dot" :class="{ active: form.q8 === item.value }"></view>
						<text>{{ item.label }}</text>
					</view>
				</view>
			</view>

			<view v-if="currentPage === 18">
				<view class="question-label" v-html="$t('scales.psqi.q9')"></view>
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
			<button v-if="currentPage > 1" class="btn-prev" @click="prevPage">{{ $t('scales.common.prev') }}</button>
			<button v-if="currentPage < totalPages" class="btn-next" @click="nextPage">{{ $t('scales.common.next') }}</button>
			<button v-if="currentPage === totalPages" class="btn-submit" @click="submitForm">{{ $t('scales.common.submit') }}</button>
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
				}
			};
		},
		computed: {
			freqOptions() {
				const list = this.$t('scales.psqi.freqOptions');
				return Array.isArray(list) ? list.map((label, value) => ({ value, label })) : [];
			},
			sleepLatencyOptions() {
				const list = this.$t('scales.psqi.sleepLatencyOptions');
				return Array.isArray(list) ? list.map((label, value) => ({ value, label })) : [];
			},
			sleepDurationOptions() {
				const list = this.$t('scales.psqi.sleepDurationOptions');
				return Array.isArray(list) ? list.map((label, value) => ({ value, label })) : [];
			},
			qualityOptions() {
				const list = this.$t('scales.psqi.qualityOptions');
				return Array.isArray(list) ? list.map((label, value) => ({ value, label })) : [];
			},
			difficultyOptions() {
				const list = this.$t('scales.psqi.difficultyOptions');
				return Array.isArray(list) ? list.map((label, value) => ({ value, label })) : [];
			}
		},
		onShow() {
			uni.setNavigationBarTitle({
				title: this.$t('scales.psqi.navTitle')
			});
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
				const isEn = this.$i18n && this.$i18n.currentLang === 'en';

				let levelZh = score <= 5 ? '睡眠质量良好' : score <= 10 ? '睡眠质量一般' : '睡眠质量较差，建议就医';
				let levelEn = score <= 5 ? 'Good Sleep Quality' : score <= 10 ? 'Fair Sleep Quality' : 'Poor Sleep Quality, medical consultation recommended';
				let displayLevel = isEn ? levelEn : levelZh;

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
					level: displayLevel
				};
				let history = uni.getStorageSync('psqi_history') || [];
				history.unshift(record);
				uni.setStorageSync('psqi_history', history);
				// 写入统一历史记录
				try {
					const entry = {
						scale: 'PSQI', scaleName: isEn ? 'Pittsburgh Sleep Quality Index' : '匹兹堡睡眠质量指数',
						date: new Date().toLocaleString(),
						totalScore: score,
						level: displayLevel,
						levelColor: score <= 5 ? '#43e97b' : score <= 10 ? '#fda085' : '#f5576c',
						scoreText: isEn ? `Total Score ${score}` : `总分 ${score}`,
						dims: [], comment: isEn ? `PSQI Total: ${score}\n${displayLevel}` : `PSQI总分：${score}\n${displayLevel}`,
						rawScores: { [isEn ? 'PSQI Score' : 'PSQI总分']: score, [isEn ? 'Sleep Quality' : '睡眠质量']: displayLevel }
					};
					const sh = uni.getStorageSync('scale_history') || [];
					sh.push(entry);
					uni.setStorageSync('scale_history', sh);
				} catch(e) {}

				uni.showModal({
					title: this.$t('scales.common.submitSuccess') || '提交成功',
					content: isEn ? `PSQI Total Score: ${score}\n${displayLevel}` : `PSQI总分：${score}\n${displayLevel}`,
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
