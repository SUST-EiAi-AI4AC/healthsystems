<template>
	<view class="page-container">
		<!-- 顶部切换按钮 -->
		<view class="tab-header">
			<view class="tab-btn" :class="{ active: currentTab === 0 }" @click="switchTab(0)">🧠 评估</view>
			<view class="tab-btn" :class="{ active: currentTab === 1 }" @click="switchTab(1)">📋 测评</view>
			<view class="tab-btn" :class="{ active: currentTab === 2 }" @click="switchTab(2)">🎨 画画</view>
		</view>

		<!-- swiper 内容区域 -->
		<swiper class="swiper-box" :current="currentTab" @change="onSwiperChange" :duration="300">
			<!-- 评估 Tab -->
			<swiper-item>
				<scroll-view scroll-y class="scroll-content">
					<view class="section-title">心理健康评估</view>
					<view class="section-desc">以下量表与医生线下访谈时填写，建议每两周填写一次</view>

					<view class="scale-list">
						<view class="scale-card-wide" id="sds" @click="goTo('/pages/Scale/SDS')">
							<view class="card-left">
								<view class="card-title">SDS</view>
								<view class="card-subtitle">心理自测量表</view>
								<view class="card-subtitle-en">Self-rating Depression Scale</view>
								<view class="card-divider"></view>
								<view class="card-info">20个问题 · 每两周填写一次</view>
							</view>
							<view class="card-arrow">»</view>
						</view>

						<view class="scale-card-wide" id="pss" @click="goTo('/pages/Scale/PSS')">
							<view class="card-left">
								<view class="card-title">PSS</view>
								<view class="card-subtitle">压力自测量表</view>
								<view class="card-subtitle-en">Perceived Stress Scale</view>
								<view class="card-divider"></view>
								<view class="card-info">14个问题 · 每两周填写一次</view>
							</view>
							<view class="card-arrow">»</view>
						</view>

						<view class="scale-card-wide" id="sas" @click="goTo('/pages/Scale/SAS')">
							<view class="card-left">
								<view class="card-title">SAS</view>
								<view class="card-subtitle">焦虑自测量表</view>
								<view class="card-subtitle-en">Self-rating Anxiety Scale</view>
								<view class="card-divider"></view>
								<view class="card-info">20个问题 · 每两周填写一次</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					</view>

					<!-- 历史记录入口按鈕 -->
					<view class="scale-history-btn" @click="openScaleHistory">
						<text class="scale-history-btn-icon">📜</text>
						<text class="scale-history-btn-text">历史记录</text>
						<text class="scale-history-btn-arrow">›</text>
					</view>

					<view class="footer-tip">{{ warmText }}</view>
				</scroll-view>
			</swiper-item>

			<!-- 测评 -->
			<swiper-item>
				<scroll-view scroll-y class="scroll-content">
					<view class="section-title">心理测评量表</view>
					<view class="section-desc">以下量表用于全面评估心理健康状态，请根据实际情况填写</view>

					<view class="scale-grid">
						<view class="scale-card" id="pars3" @click="goTo('/pages/Scale/PARS3')">
							<view class="card-left">
								<view class="card-title">PARS-3</view>
								<view class="card-subtitle">体育活动等级量表</view>
								<view class="card-divider"></view>
								<view class="card-info">5个条目 · 评估上月体育锻炼</view>
								<view class="card-info">3维度综合评分</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					
						<view class="scale-card" id="ipaq" @click="goTo('/pages/Scale/IPAQ')">
							<view class="card-left">
								<view class="card-title">IPAQ</view>
								<view class="card-subtitle">国际体力活动量表</view>
								<view class="card-divider"></view>
								<view class="card-info">7个条目 · 评估过去7天体力活动</view>
								<view class="card-info">含久坐时间评估</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					
						<view class="scale-card" id="maia2" @click="goTo('/pages/Scale/MAIA2')">
							<view class="card-left">
								<view class="card-title">MAIA-2</view>
								<view class="card-subtitle">多维度内感受意识量表</view>
								<view class="card-divider"></view>
								<view class="card-info">37个条目 · 8个维度</view>
								<view class="card-info">评估身体感知与情绪调节能力</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					
						<view class="scale-card" id="cdrisc" @click="goTo('/pages/Scale/CDRISC')">
							<view class="card-left">
								<view class="card-title">CD-RISC</view>
								<view class="card-subtitle">心理弹性量表</view>
								<view class="card-divider"></view>
								<view class="card-info">25个条目 · 评估心理韧性</view>
								<view class="card-info">5级评分（0=完全不对，4=几乎总是对）</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					
						<view class="scale-card" id="ocean" @click="goTo('/pages/Scale/OCEAN')">
							<view class="card-left">
								<view class="card-title">OCEAN</view>
								<view class="card-subtitle">大五人格量表</view>
								<view class="card-divider"></view>
								<view class="card-info">60个条目 · 5个维度咆12题</view>
								<view class="card-info">全面评估人格特质</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					
						<view class="scale-card" id="psqi" @click="goTo('/pages/Scale/PSQI')">
							<view class="card-left">
								<view class="card-title">PSQI</view>
								<view class="card-subtitle">匹兹堡睡眠质量指数</view>
								<view class="card-divider"></view>
								<view class="card-info">18个条目 · 评估近1个月睡眠</view>
								<view class="card-info">7个成分综合评分</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					
						<view class="scale-card scale-card-full" id="scl90" @click="goTo('/pages/Scale/SCL90')">
							<view class="card-left">
								<view class="card-title">SCL-90</view>
								<view class="card-subtitle">症状自评量表</view>
								<view class="card-divider"></view>
								<view class="card-info">90个条目 · 评估近一周心理症状</view>
								<view class="card-info">5级评分（1=无，5=严重）</view>
							</view>
							<view class="card-arrow">»</view>
						</view>
					</view>

					<view class="footer-tip">保持健康，从了解自己开始。</view>
				</scroll-view>
			</swiper-item>

			<!-- 画画 Tab -->
			<swiper-item>
				<scroll-view scroll-y class="scroll-content">
					<view class="htp-banner" @click="goTo('/pages/Scale/HTP')">
						<view class="htp-banner-left">
							<text class="htp-banner-emoji">🎨</text>
							<view class="htp-banner-text">
								<text class="htp-banner-title">房树人心理测验</text>
								<text class="htp-banner-sub">HTP Test · House · Tree · Person</text>
							</view>
						</view>
						<text class="htp-banner-arrow">»</text>
					</view>

					<view class="htp-intro-card">
						<view class="htp-intro-title">✨ 关于 HTP 测验</view>
						<view class="htp-intro-text">房树人测验（House-Tree-Person Test）是一种投射性心理测验。通过分析您自由绘制的房屋、树木和人物，从色彩运用、笔触特征、画面构图和叙事逻辑等多个维度，综合评估您的心理健康状态、情商水平及生活满意度。</view>
					</view>

					<view class="htp-dim-grid">
						<view v-for="dim in htpDims" :key="dim.name" class="htp-dim-item">
							<text class="htp-dim-icon">{{ dim.icon }}</text>
							<text class="htp-dim-name">{{ dim.name }}</text>
							<text class="htp-dim-desc">{{ dim.desc }}</text>
						</view>
					</view>

					<view class="htp-start-btn" @click="goTo('/pages/Scale/HTP')">
						<!-- 笔尾圆头（左侧） -->
						<view class="brush-cap"></view>
						<!-- 笔杆 + 文字 -->
						<view class="brush-handle">
							<text class="brush-text">开始绘画测验</text>
						</view>
						<!-- 金属笔箋 -->
						<view class="brush-ferrule"></view>
						<!-- 笔尖（右侧尖头） -->
						<view class="brush-tip"></view>
					</view>

					<view class="footer-tip">拿起画笔，让内心说话。</view>
				</scroll-view>
			</swiper-item>
		</swiper>

	<!-- 历史记录列表弹窗 -->
	<view v-if="showScaleHistory" class="sh-mask" @click.self="showScaleHistory = false">
		<view class="sh-modal">
			<view class="sh-header">
				<text class="sh-title">📜 量表历史记录</text>
				<text class="sh-close" @click="showScaleHistory = false">✕</text>
			</view>
			<view class="sh-search-row">
				<view class="sh-search-wrap">
					<text class="sh-search-icon">🔍</text>
					<input
						class="sh-search-input"
						v-model="scaleSearchText"
						placeholder="搜索量表名称或评估等级..."
						placeholder-style="color:#bbb;font-size:0.82em"
					/>
					<text v-if="scaleSearchText" class="sh-search-clear" @click="scaleSearchText = ''">✕</text>
				</view>
			</view>
			<scroll-view scroll-x class="sh-filter-row">
				<view
					v-for="f in scaleFilters"
					:key="f.key"
					class="sh-filter-tag"
					:class="{ 'sh-filter-active': scaleFilterKey === f.key }"
					@click="scaleFilterKey = f.key"
				>{{ f.label }}</view>
			</scroll-view>
			<scroll-view scroll-y class="sh-body">
				<view v-if="filteredHistory.length === 0" class="sh-empty">
					<text class="sh-empty-icon">📊</text>
					<text class="sh-empty-text">暂无历史记录，完成量表后自动保存</text>
				</view>
				<view v-for="(item, idx) in filteredHistory" :key="idx" class="sh-card">
					<view class="sh-card-badge" :style="{ background: scaleColorMap[item.scale] || 'linear-gradient(135deg,#a18cd1,#fbc2eb)' }">
						<text class="sh-card-badge-text">{{ item.scale }}</text>
					</view>
					<view class="sh-card-body">
						<view class="sh-card-row1">
							<text class="sh-card-name">{{ item.scaleName }}</text>
							<text class="sh-card-level" :style="{ color: item.levelColor || '#5b8dee' }">{{ item.level }}</text>
						</view>
						<text class="sh-card-date">{{ item.date }}</text>
						<text v-if="item.scoreText" class="sh-card-score-text">{{ item.scoreText }}</text>
					</view>
					<view class="sh-card-actions">
						<view class="sh-action-btn sh-view-btn" @click="viewScaleDetail(idx)">详情</view>
						<view class="sh-action-btn sh-del-btn" @click="deleteScaleRecord(idx)">删除</view>
					</view>
				</view>
			</scroll-view>
			<view class="sh-footer">
				<text class="sh-footer-text">共 {{ filteredHistory.length }} 条记录</text>
			</view>
		</view>
	</view>

	<!-- 历史详情弹窗 -->
	<view v-if="showScaleDetail && scaleDetailItem" class="sh-mask" @click.self="showScaleDetail = false">
		<view class="sh-modal">
			<view class="sh-header">
				<view class="sh-detail-title-wrap">
					<text class="sh-title">{{ scaleDetailItem.scaleName }}</text>
					<text class="sh-detail-subtitle">{{ scaleDetailItem.scale }}</text>
				</view>
				<text class="sh-close" @click="showScaleDetail = false">✕</text>
			</view>
			<scroll-view scroll-y class="sh-body">
				<view class="sh-detail-banner" :style="{ background: scaleColorMap[scaleDetailItem.scale] || 'linear-gradient(135deg,#a18cd1,#fbc2eb)' }">
					<view class="sh-detail-banner-left">
						<text class="sh-detail-score-label">最终得分</text>
						<text class="sh-detail-score">{{ scaleDetailItem.totalScore }}</text>
					</view>
					<view class="sh-detail-banner-right">
						<text class="sh-detail-level">{{ scaleDetailItem.level }}</text>
						<text class="sh-detail-date">{{ scaleDetailItem.date }}</text>
					</view>
				</view>
				<view v-if="scaleDetailItem.dims && scaleDetailItem.dims.length" class="sh-detail-dims">
					<text class="sh-detail-section-title">各维度得分</text>
					<view v-for="dim in scaleDetailItem.dims" :key="dim.name" class="sh-detail-dim-item">
						<view class="sh-detail-dim-row">
							<text class="sh-detail-dim-name">{{ dim.name }}</text>
							<text class="sh-detail-dim-val">{{ dim.value }}</text>
						</view>
						<view class="sh-detail-bar-bg">
							<view class="sh-detail-bar-fill" :style="{ width: dim.pct + '%', background: scaleColorMap[scaleDetailItem.scale] || '#5b8dee' }"></view>
						</view>
					</view>
				</view>
				<view v-if="scaleDetailItem.comment" class="sh-detail-comment">
					<text class="sh-detail-section-title">评估说明</text>
					<text class="sh-detail-comment-text">{{ scaleDetailItem.comment }}</text>
				</view>
				<view v-if="scaleDetailItem.rawScores" class="sh-detail-raw">
					<text class="sh-detail-section-title">得分明细</text>
					<view v-for="(val, key) in scaleDetailItem.rawScores" :key="key" class="sh-detail-raw-row">
						<text class="sh-detail-raw-key">{{ key }}</text>
						<text class="sh-detail-raw-val">{{ val }}</text>
					</view>
				</view>
			</scroll-view>
			<view class="sh-footer">
				<view class="sh-footer-close-btn" @click="showScaleDetail = false">关闭</view>
			</view>
		</view>
	</view>

	<!-- 删除确认弹窗 -->
	<view v-if="showDeleteConfirm" class="sh-confirm-mask">
		<view class="sh-confirm-box">
			<text class="sh-confirm-title">确认删除</text>
			<text class="sh-confirm-content">确定删除「{{ deleteConfirmItem ? deleteConfirmItem.scaleName : '' }}」的这条记录？</text>
			<view class="sh-confirm-btns">
				<view class="sh-confirm-btn sh-confirm-cancel" @click="showDeleteConfirm = false">取消</view>
				<view class="sh-confirm-btn sh-confirm-ok" @click="doDeleteRecord">删除</view>
			</view>
		</view>
	</view>

</view>
</template>

<script>
	const WARM_TEXTS = [
		"保持好心情，让生活处处充满色彩。",
		"无论晴雨，愿你今天也是充满阳光的一天。",
		"慢下来，深呼吸，生活其实有很多美好在等你。",
		"给自己一个微笑，你比想象中更加坚强和美丽。",
		"每一天都是新的开始，愿你的心里开满温柔的小花。",
		"照顾好自己，听听心里的声音，你已经做得非常棒了。",
		"今天也是值得被爱的一天，愿你被温柔以待。",
		"在属于自己的节奏里，慢慢走，总会遇到温暖的阳光。",
		"愿你的世界温润饱满，有花香，有暖阳，也有好梦。",
		"生活不必太完美，适度放松，保持内心的平静就好。"
	];

	export default {
		onLoad(options) {
			if (options && options.tab !== undefined) {
				this.currentTab = parseInt(options.tab) || 0;
			}
		},
		onShow() {
			// 通过 Storage 接收来自首页的指定 tab
			const tab = uni.getStorageSync('aiassessInitTab');
			if (tab !== '' && tab !== undefined) {
				this.currentTab = Number(tab);
				uni.removeStorageSync('aiassessInitTab');
			}
			// 每次显示时刷新历史记录
			this._loadScaleHistory();
			// 随机亲切文字
			const randomIndex = Math.floor(Math.random() * WARM_TEXTS.length);
			this.warmText = WARM_TEXTS[randomIndex];
		},
		computed: {
			filteredHistory() {
				let list = this.scaleHistoryList || [];
				// 将旧版 IPAQ scoreText （总 MET分 XXXX）展示为 100 分制
				list = list.map(item => {
					if (item.scale === 'IPAQ' && item.scoreText && item.scoreText.includes('MET')) {
						const metVal = parseInt(item.scoreText.replace(/[^\d]/g, '')) || 0;
						const metScore = Math.min(100, Math.round(metVal / 6000 * 100));
						return { ...item, scoreText: `${metScore}分` };
					}
					return item;
				});
				// 按量表类型筛选
				if (this.scaleFilterKey && this.scaleFilterKey !== 'all') {
					list = list.filter(item => item.scale === this.scaleFilterKey);
				}
				// 按关键词搜索
				const kw = (this.scaleSearchText || '').trim().toLowerCase();
				if (kw) {
					list = list.filter(item =>
						(item.scaleName || '').toLowerCase().includes(kw) ||
						(item.scale || '').toLowerCase().includes(kw) ||
						(item.level || '').toLowerCase().includes(kw) ||
						(item.scoreText || '').toLowerCase().includes(kw)
					);
				}
				// 最新的排前面
				return list.slice().reverse();
			}
		},
		data() {
			return {
				currentTab: 0,
				warmText: "保持好心情，让生活处处充满色彩。",
				// 历史记录弹窗
				showScaleHistory: false,
				showScaleDetail: false,
				// 删除确认弹窗
				showDeleteConfirm: false,
				deleteConfirmItem: null,
				deleteConfirmRawIdx: -1,
				scaleHistoryList: [],     // 全量历史数据
				scaleDetailItem: null,    // 当前查看详情的条目
				scaleSearchText: '',      // 搜索关键词
				scaleFilterKey: 'all',    // 筛选量表类型
				scaleFilters: [
					{ key: 'all',     label: '全部' },
					{ key: 'SCL-90',  label: 'SCL-90' },
					{ key: 'IPAQ',    label: 'IPAQ' },
					{ key: 'PARS-3',  label: 'PARS-3' },
					{ key: 'MAIA-2',  label: 'MAIA-2' },
					{ key: 'CD-RISC', label: 'CD-RISC' },
					{ key: 'OCEAN',   label: 'OCEAN' },
					{ key: 'PSQI',    label: 'PSQI' },
					{ key: 'SDS',     label: 'SDS' },
					{ key: 'PSS',     label: 'PSS' },
					{ key: 'SAS',     label: 'SAS' }
				],
				// 各量表主题色映射
				scaleColorMap: {
					'SCL-90':  'linear-gradient(135deg,#f093fb,#f5576c)',
					'IPAQ':    'linear-gradient(135deg,#4facfe,#00f2fe)',
					'PARS-3':  'linear-gradient(135deg,#43e97b,#38f9d7)',
					'MAIA-2':  'linear-gradient(135deg,#fa709a,#fee140)',
					'CD-RISC': 'linear-gradient(135deg,#a18cd1,#fbc2eb)',
					'OCEAN':   'linear-gradient(135deg,#fda085,#f6d365)',
					'PSQI':    'linear-gradient(135deg,#84fab0,#8fd3f4)',
					'SDS':     'linear-gradient(135deg,#fda085,#f6d365)',
					'PSS':     'linear-gradient(135deg,#a18cd1,#fbc2eb)',
					'SAS':     'linear-gradient(135deg,#a7b2c1,#dfe1e3)'
				},
				htpDims: [
					{ icon: '🎨', name: '色彩运用', desc: '多样性·温暖度·单调性' },
					{ icon: '✏️', name: '笔触特征', desc: '力度·粗细·连贯性' },
					{ icon: '🖼️', name: '画面构图', desc: '饰满度·留白·空间分布' },
					{ icon: '🧠', name: '叙事逻辑', desc: '积极性·协调性·发展趋势' },
					{ icon: '✨', name: '构图合理性', desc: '秩序感·混乱度' },
					{ icon: '💖', name: '感官感受', desc: '温暖感·舒适度·内心状态' }
				]
			};
		},
		methods: {
			switchTab(index) {
				this.currentTab = index;
				// #ifdef H5
				const url = new URL(window.location.href);
				url.searchParams.set('tab', index);
				history.replaceState(null, '', url.toString());
				// #endif
			},
			onSwiperChange(e) {
				this.currentTab = e.detail.current;
			},
			goTo(url) {
				uni.navigateTo({ url });
			},
			// ========== 历史记录相关 ==========
			_loadScaleHistory() {
				try {
					const list = uni.getStorageSync('scale_history');
					this.scaleHistoryList = Array.isArray(list) ? list : [];
				} catch (e) {
					this.scaleHistoryList = [];
				}
			},
			openScaleHistory() {
				this._loadScaleHistory();
				this.scaleSearchText = '';
				this.scaleFilterKey = 'all';
				this.showScaleHistory = true;
			},
			viewScaleDetail(idx) {
				// filteredHistory 是 reversed 的，需要找到原始列表中的项
				const item = this.filteredHistory[idx];
				if (!item) return;
				this.scaleDetailItem = item;
				this.showScaleDetail = true;
			},
			deleteScaleRecord(idx) {
				const item = this.filteredHistory[idx];
				if (!item) return;
				const rawIdx = this.scaleHistoryList.indexOf(item);
				this.deleteConfirmItem = item;
				this.deleteConfirmRawIdx = rawIdx;
				this.showDeleteConfirm = true;
			},
			doDeleteRecord() {
				const rawIdx = this.deleteConfirmRawIdx;
				if (rawIdx !== -1) {
					this.scaleHistoryList.splice(rawIdx, 1);
					uni.setStorageSync('scale_history', this.scaleHistoryList);
				}
				this.showDeleteConfirm = false;
				this.deleteConfirmItem = null;
				this.deleteConfirmRawIdx = -1;
			}
		}
	};
</script>

<style lang="scss" scoped>
	.page-container {
		display: flex;
		flex-direction: column;
		height: 100vh;
		background-image: linear-gradient(180deg, #e0f0fd 0%, #ebfbec 100%);
	}

	/* 顶部Tab */
	.tab-header {
		display: flex;
		flex-direction: row;
		background: rgba(255, 255, 255, 0.6);
		padding: 10px 20px 0;
		gap: 10px;
	}

	.tab-btn {
		flex: 1;
		text-align: center;
		padding: 10px 0;
		font-size: 1em;
		font-weight: bold;
		color: #888;
		border-bottom: 3px solid transparent;
		transition: all 0.2s;
	}

	.tab-btn.active {
		color: #5b8dee;
		border-bottom: 3px solid #5b8dee;
	}

	/* Swiper */
	.swiper-box {
		flex: 1;
		height: calc(100vh - 56px);
	}

	.scroll-content {
		height: 100%;
		padding: 12px 12px 80px;
		box-sizing: border-box;
	}

	.section-title {
		font-size: 1.1em;
		font-weight: bold;
		color: #3a3d4a;
		margin: 6px 4px 4px;
	}

	.section-desc {
		font-size: 0.8em;
		color: #888;
		margin: 0 4px 12px;
	}

	.scale-list {
		display: flex;
		flex-direction: column;
		gap: 10px;
	}

	/* 双列网格布局 */
	.scale-grid {
		display: flex;
		flex-wrap: wrap;
		gap: 10px;
	}

	.scale-grid .scale-card {
		width: calc(50% - 5px);
		box-sizing: border-box;
		min-height: 100px;
		align-items: flex-start;
	}

	/* SCL-90 占满一整行 */
	.scale-grid .scale-card-full {
		width: 100%;
	}

	/* 测评卡片 */
	.scale-card {
		display: flex;
		flex-direction: row;
		align-items: center;
		border-radius: 14px;
		padding: 14px 16px;
		min-height: 90px;
	}

	.scale-card-wide {
		display: flex;
		flex-direction: row;
		align-items: center;
		border-radius: 14px;
		padding: 16px 20px;
		min-height: 100px;
	}

	.card-left {
		flex: 1;
	}

	.card-title {
		font-size: 1.3em;
		font-weight: bold;
		color: #fff;
	}

	.card-subtitle {
		font-size: 0.85em;
		color: rgba(255, 255, 255, 0.9);
		margin-top: 2px;
	}

	.card-subtitle-en {
		font-size: 0.75em;
		color: rgba(255, 255, 255, 0.75);
		margin-top: 1px;
	}

	.card-divider {
		height: 1px;
		background: rgba(255, 255, 255, 0.4);
		width: 90%;
		margin: 6px 0;
	}

	.card-info {
		font-size: 0.75em;
		color: rgba(60, 60, 60, 0.85);
		margin-top: 2px;
	}

	.card-arrow {
		font-size: 1.4em;
		color: rgba(255, 255, 255, 0.8);
		padding-left: 8px;
	}

	.footer-tip {
		text-align: center;
		font-size: 0.85em;
		color: #888;
		padding: 20px 0 10px;
	}

	/* 画画 Tab 测验活动样式 */
	.tab-btn:last-child.active {
		color: #f7971e;
		border-bottom-color: #f7971e;
	}

	.htp-banner {
		background: linear-gradient(135deg, #11998e, #38ef7d);
		border-radius: 18px;
		padding: 20px 18px;
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-bottom: 14px;
		box-shadow: 0 4px 16px rgba(17,153,142,0.35);
	}
	.htp-banner-left { display: flex; align-items: center; gap: 14px; }
	.htp-banner-emoji { font-size: 2.4em; }
	.htp-banner-text { display: flex; flex-direction: column; gap: 4px; }
	.htp-banner-title { font-size: 1.1em; font-weight: bold; color: #fff; }
	.htp-banner-sub { font-size: 0.75em; color: rgba(255,255,255,0.85); }
	.htp-banner-arrow { font-size: 1.6em; color: rgba(255,255,255,0.8); }

	.htp-intro-card {
		background: white;
		border-radius: 14px;
		padding: 16px;
		margin-bottom: 14px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.07);
	}
	.htp-intro-title { font-size: 0.95em; font-weight: bold; color: #2c3e50; margin-bottom: 8px; display: block; }
	.htp-intro-text { font-size: 0.82em; color: #666; line-height: 1.7; display: block; }

	.htp-dim-grid {
		display: flex;
		flex-wrap: wrap;
		gap: 10px;
		margin-bottom: 18px;
	}
	.htp-dim-item {
		flex: 0 0 calc(33.33% - 7px);
		background: white;
		border-radius: 14px;
		padding: 14px 10px;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 5px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.06);
	}
	.htp-dim-icon { font-size: 1.5em; }
	.htp-dim-name { font-size: 0.8em; font-weight: bold; color: #2c3e50; text-align: center; }
	.htp-dim-desc { font-size: 0.68em; color: #999; text-align: center; line-height: 1.4; }

	.htp-start-btn {
		display: flex;
		align-items: center;
		width: 100%;
		height: 52px;
		margin-bottom: 14px;
		cursor: pointer;
		filter: drop-shadow(0 3px 8px rgba(120,100,220,0.25));
	}
	/* 笔尾圆头（左侧） */
	.brush-cap {
		width: 26px;
		height: 52px;
		background: rgba(255,160,40,0.65);
		border-radius: 50% 0 0 50% / 50% 0 0 50%;
		flex-shrink: 0;
	}
	/* 笔杆：彩虹渐变 */
	.brush-handle {
		flex: 1;
		height: 52px;
		background: linear-gradient(90deg,
			rgba(255,160,40,0.65) 0%,
			rgba(255,80,80,0.65) 20%,
			rgba(210,60,200,0.65) 42%,
			rgba(40,160,255,0.65) 64%,
			rgba(80,200,100,0.65) 84%,
			rgba(100,80,255,0.65) 100%
		);
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.brush-text {
		color: #fff;
		font-size: 1em;
		font-weight: bold;
		letter-spacing: 2px;
		text-shadow: 0 1px 4px rgba(0,0,0,0.28);
	}
	/* 金属笔箍 - 换为金色 */
	.brush-ferrule {
		width: 14px;
		height: 52px;
		background: linear-gradient(180deg, #ede0ff 0%, #b48ee8 50%, #ede0ff 100%);
		flex-shrink: 0;
	}
	/* 笔尖：右侧三角尖头 */
	.brush-tip {
		width: 0;
		height: 0;
		border-top: 26px solid transparent;
		border-bottom: 26px solid transparent;
		border-left: 32px solid rgba(100,80,255,0.65);
		flex-shrink: 0;
	}
	/* 删除旧的笔头毛尖样式 */
	.brush-hair, .brush-hair-inner { display: none; }

	/* 各卡片颜色 */
	.htp-card {
		background: linear-gradient(135deg, #f7971e, #ffd200, #f7971e);
		background-size: 200% 200%;
		animation: htpShimmer 3s ease infinite;
		position: relative;
		overflow: hidden;
		min-height: 100px;
	}
	.htp-card::before {
		content: '';
		position: absolute;
		top: -30px; right: -20px;
		width: 90px; height: 90px;
		background: rgba(255,255,255,0.15);
		border-radius: 50%;
	}
	@keyframes htpShimmer {
		0%   { background-position: 0% 50%; }
		50%  { background-position: 100% 50%; }
		100% { background-position: 0% 50%; }
	}
	.htp-icon-wrap {
		width: 44px; height: 44px;
		background: rgba(255,255,255,0.3);
		border-radius: 12px;
		display: flex; align-items: center; justify-content: center;
		margin-right: 12px; flex-shrink: 0;
	}
	.htp-icon { font-size: 1.6em; }

	/* 各卡片颜色 */
	#scl90 {
		background: linear-gradient(135deg, #f093fb, #f5576c);
	}
	#ipaq {
		background: linear-gradient(135deg, #4facfe, #00f2fe);
	}
	#pars3 {
		background: linear-gradient(135deg, #43e97b, #38f9d7);
	}
	#maia2 {
		background: linear-gradient(135deg, #fa709a, #fee140);
	}
	#cdrisc {
		background: linear-gradient(135deg, #a18cd1, #fbc2eb);
	}
	#ocean {
		background: linear-gradient(135deg, #fda085, #f6d365);
	}
	#psqi {
		background: linear-gradient(135deg, #84fab0, #8fd3f4);
	}

	#sds {
		background: linear-gradient(135deg, #fda085, #f6d365);
	}
	#pss {
		background: linear-gradient(135deg, #a18cd1, #fbc2eb);
	}
	#sas {
		background: linear-gradient(135deg, #a7b2c1, #dfe1e3);
	}

	/* =========================================
	   历史记录入口按鈕
	   ========================================= */
	.scale-history-btn {
		display: flex;
		align-items: center;
		background: rgba(255,255,255,0.85);
		border-radius: 14px;
		padding: 20px 18px;
		margin: 14px 0 4px;
		box-shadow: 0 2px 10px rgba(91,141,238,0.12);
		cursor: pointer;
	}
	.scale-history-btn-icon {
		font-size: 1.3em;
		margin-right: 10px;
	}
	.scale-history-btn-text {
		flex: 1;
		font-size: 0.95em;
		font-weight: bold;
		color: #3a3d4a;
	}
	.scale-history-btn-arrow {
		font-size: 1.3em;
		color: #5b8dee;
		font-weight: bold;
	}

	/* =========================================
	   历史记录弹窗公用样式
	   ========================================= */
	.sh-mask {
		position: fixed;
		top: 0; left: 0; right: 0; bottom: 0;
		background: rgba(0,0,0,0.45);
		z-index: 1000;
		display: flex;
		align-items: flex-end;
		justify-content: center;
	}
	.sh-modal {
		width: 100%;
		max-height: 88vh;
		background: #f5f7fa;
		border-radius: 20px 20px 0 0;
		display: flex;
		flex-direction: column;
		overflow: hidden;
		padding-bottom: env(safe-area-inset-bottom, 0);
	}
	.sh-header {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 16px 18px 12px;
		background: #fff;
		border-bottom: 1px solid #f0f0f0;
	}
	.sh-title {
		font-size: 1.05em;
		font-weight: bold;
		color: #2c3e50;
	}
	.sh-close {
		font-size: 1.2em;
		color: #aaa;
		cursor: pointer;
		padding: 4px 8px;
	}
	/* 搜索框 */
	.sh-search-row {
		padding: 10px 14px 6px;
		background: #fff;
	}
	.sh-search-wrap {
		display: flex;
		align-items: center;
		background: #f0f2f5;
		border-radius: 20px;
		padding: 6px 12px;
		gap: 6px;
	}
	.sh-search-icon { font-size: 0.9em; color: #bbb; }
	.sh-search-input {
		flex: 1;
		font-size: 0.85em;
		color: #333;
		background: transparent;
		border: none;
		outline: none;
	}
	.sh-search-clear { font-size: 0.85em; color: #ccc; cursor: pointer; }
	/* 筛选标签 */
	.sh-filter-row {
		white-space: nowrap;
		padding: 8px 14px;
		background: #fff;
		border-bottom: 1px solid #f0f0f0;
	}
	.sh-filter-tag {
		display: inline-block;
		padding: 4px 12px;
		margin-right: 8px;
		border-radius: 14px;
		background: #f0f2f5;
		color: #666;
		font-size: 0.8em;
		cursor: pointer;
		transition: all 0.2s;
	}
	.sh-filter-active {
		background: #5b8dee !important;
		color: #fff !important;
	}
	/* 列表区 */
	.sh-body {
		flex: 1;
		overflow-y: auto;
		padding: 10px 14px;
	}
	.sh-empty {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding: 48px 0;
		gap: 10px;
	}
	.sh-empty-icon { font-size: 2.4em; }
	.sh-empty-text { font-size: 0.85em; color: #bbb; }
	/* 卡片 */
	.sh-card {
		display: flex;
		align-items: center;
		background: #fff;
		border-radius: 14px;
		margin-bottom: 10px;
		overflow: hidden;
		box-shadow: 0 2px 8px rgba(0,0,0,0.07);
	}
	.sh-card-badge {
		width: 54px;
		min-height: 72px;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-shrink: 0;
	}
	.sh-card-badge-text {
		color: #fff;
		font-size: 0.72em;
		font-weight: bold;
		text-align: center;
		word-break: break-all;
		padding: 0 4px;
	}
	.sh-card-body {
		flex: 1;
		padding: 10px 8px 10px 12px;
		overflow: hidden;
	}
	.sh-card-row1 {
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 6px;
	}
	.sh-card-name {
		font-size: 0.9em;
		font-weight: bold;
		color: #2c3e50;
		flex: 1;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.sh-card-level {
		font-size: 0.8em;
		font-weight: bold;
		flex-shrink: 0;
	}
	.sh-card-date {
		font-size: 0.75em;
		color: #bbb;
		display: block;
		margin-top: 3px;
	}
	.sh-card-score-text {
		font-size: 0.78em;
		color: #888;
		display: block;
		margin-top: 3px;
	}
	.sh-card-actions {
		display: flex;
		flex-direction: column;
		gap: 6px;
		padding: 0 10px;
		flex-shrink: 0;
	}
	.sh-action-btn {
		padding: 5px 10px;
		border-radius: 8px;
		font-size: 0.75em;
		cursor: pointer;
		text-align: center;
		min-width: 42px;
	}
	.sh-view-btn {
		background: #5b8dee;
		color: #fff;
	}
	.sh-del-btn {
		background: #fff0f2;
		color: #f5576c;
		border: 1px solid #fde;
	}
	/* 底部统计栏 */
	.sh-footer {
		padding: 10px 18px;
		background: #fff;
		border-top: 1px solid #f0f0f0;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.sh-footer-text {
		font-size: 0.8em;
		color: #bbb;
	}
	.sh-footer-close-btn {
		padding: 10px 40px;
		background: #5b8dee;
		color: #fff;
		border-radius: 22px;
		font-size: 0.9em;
		font-weight: bold;
		cursor: pointer;
		text-align: center;
	}
	/* 详情弹窗 */
	.sh-detail-title-wrap {
		display: flex;
		flex-direction: column;
		gap: 2px;
	}
	.sh-detail-subtitle {
		font-size: 0.75em;
		color: #888;
	}
	.sh-detail-banner {
		margin: 12px 0;
		border-radius: 14px;
		padding: 16px 20px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.sh-detail-banner-left {
		display: flex;
		flex-direction: column;
		gap: 4px;
	}
	.sh-detail-score-label {
		font-size: 0.78em;
		color: rgba(255,255,255,0.85);
	}
	.sh-detail-score {
		font-size: 2em;
		font-weight: bold;
		color: #fff;
	}
	.sh-detail-banner-right {
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		gap: 6px;
	}
	.sh-detail-level {
		font-size: 1em;
		font-weight: bold;
		color: #fff;
		background: rgba(255,255,255,0.25);
		padding: 3px 10px;
		border-radius: 12px;
	}
	.sh-detail-date {
		font-size: 0.78em;
		color: rgba(255,255,255,0.8);
	}
	.sh-detail-dims, .sh-detail-comment, .sh-detail-raw {
		background: #fff;
		border-radius: 14px;
		padding: 14px 16px;
		margin-bottom: 12px;
	}
	.sh-detail-section-title {
		font-size: 0.88em;
		font-weight: bold;
		color: #3a3d4a;
		display: block;
		margin-bottom: 10px;
	}
	.sh-detail-dim-item {
		margin-bottom: 10px;
	}
	.sh-detail-dim-row {
		display: flex;
		justify-content: space-between;
		margin-bottom: 4px;
	}
	.sh-detail-dim-name {
		font-size: 0.82em;
		color: #555;
	}
	.sh-detail-dim-val {
		font-size: 0.82em;
		color: #333;
		font-weight: bold;
	}
	.sh-detail-bar-bg {
		height: 6px;
		background: #f0f2f5;
		border-radius: 3px;
		overflow: hidden;
	}
	.sh-detail-bar-fill {
		height: 100%;
		border-radius: 3px;
		transition: width 0.4s ease;
	}
	.sh-detail-comment-text {
		font-size: 0.83em;
		color: #666;
		line-height: 1.7;
		display: block;
	}
	.sh-detail-raw-row {
		display: flex;
		justify-content: space-between;
		padding: 5px 0;
		border-bottom: 1px solid #f5f5f5;
	}
	.sh-detail-raw-key {
		font-size: 0.8em;
		color: #888;
	}
	.sh-detail-raw-val {
		font-size: 0.8em;
		color: #333;
		font-weight: bold;
	}
	/* 删除确认弹窗 */
	.sh-confirm-mask {
		position: fixed;
		top: 0; left: 0; right: 0; bottom: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.sh-confirm-box {
		width: 78%;
		max-width: 320px;
		background: #fff;
		border-radius: 16px;
		padding: 24px 20px 16px;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 10px;
		box-shadow: 0 8px 32px rgba(0,0,0,0.18);
	}
	.sh-confirm-title {
		font-size: 1.05em;
		font-weight: bold;
		color: #2c3e50;
		text-align: center;
	}
	.sh-confirm-content {
		font-size: 0.88em;
		color: #666;
		text-align: center;
		line-height: 1.6;
		margin-bottom: 6px;
	}
	.sh-confirm-btns {
		display: flex;
		gap: 12px;
		width: 100%;
	}
	.sh-confirm-btn {
		flex: 1;
		padding: 10px 0;
		border-radius: 10px;
		font-size: 0.9em;
		font-weight: bold;
		text-align: center;
		cursor: pointer;
	}
	.sh-confirm-cancel {
		background: #f0f2f5;
		color: #666;
	}
	.sh-confirm-ok {
		background: linear-gradient(135deg, #f5576c, #f093fb);
		color: #fff;
	}
</style>
