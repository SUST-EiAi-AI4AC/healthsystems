<template>
	<view class="page">
		<!-- 提示条 -->
		<view class="hint-bar">
			<text class="hint-text">🏠 请在画布上自由绘制：房屋、树木、人物</text>
		</view>

		<!-- 工具栏（提示条下方） -->
		<view class="toolbar">
			<!-- 工具选择 -->
			<view class="tool-group">
				<view class="tool-btn" :class="{ active: currentTool === 'pencil' }" @click="selectTool('pencil')">
					<text class="tool-icon">✏️</text>
					<text class="tool-label">铅笔</text>
				</view>
				<view class="tool-btn" :class="{ active: currentTool === 'eraser' }" @click="selectTool('eraser')">
					<text class="tool-icon">🧹</text>
					<text class="tool-label">橡皮</text>
				</view>
				<view class="tool-btn" @click="clearCanvas">
					<text class="tool-icon">📄</text>
					<text class="tool-label">白纸</text>
				</view>
			</view>

			<!-- 粗细选择 -->
			<view class="size-group">
				<view v-for="s in sizeOptions" :key="s.val"
					class="size-dot" :class="{ active: brushSize === s.val }"
					:style="{ width: s.px + 'px', height: s.px + 'px' }"
					@click="brushSize = s.val">
				</view>
			</view>

			<!-- 颜色选择 -->
			<view class="color-group">
				<view v-for="c in colorPalette" :key="c"
					class="color-dot"
					:class="{ active: currentColor === c }"
					:style="{ background: c }"
					@click="currentColor = c">
				</view>
			</view>
		</view>

		<!-- 画布区域（正方形） -->
		<view class="canvas-wrap" @touchstart.prevent @touchmove.prevent @touchend.prevent>
			<canvas
				canvas-id="htpCanvas"
				class="canvas"
				@touchstart="onTouchStart"
				@touchmove="onTouchMove"
				@touchend="onTouchEnd"
			></canvas>
		</view>

		<!-- 底部按鈕（画布下方） -->
		<view class="bottom-bar">
			<button class="btn-undo" @click="undo">↩ 撤销</button>
			<button class="btn-analyze" @click="analyzeDrawing">🔍 分析报告</button>
		</view>
		
		<!-- 历史记录按鈕（撤销按鈕下方） -->
		<view class="history-bar">
			<button class="btn-history" @click="openHistory">📜 历史记录</button>
		</view>

		<!-- 报告弹窗 -->
		<view v-if="showReport" class="report-mask" @click.self="showReport = false">
			<view class="report-modal">
				<view class="report-header">
					<text class="report-title">🧠 HTP 心理分析报告</text>
					<text class="report-date">{{ reportDate }}</text>
				</view>
				<scroll-view scroll-y class="report-body">
					<!-- 综合评分 -->
					<view class="score-section">
						<view class="score-circle" :style="{ background: scoreGradient }">
							<text class="score-num">{{ overallScore }}</text>
							<text class="score-unit">分</text>
						</view>
						<view class="score-info">
							<text class="score-level">{{ scoreLevel }}</text>
							<text class="score-desc">{{ scoreDesc }}</text>
						</view>
					</view>

					<!-- 维度分析 -->
					<view class="dim-section">
						<view class="dim-title">多维度分析</view>
						<view v-for="dim in reportDims" :key="dim.name" class="dim-item">
							<view class="dim-row">
								<text class="dim-name">{{ dim.name }}</text>
								<text class="dim-val" :style="{ color: dim.color }">{{ dim.value }}</text>
							</view>
							<view class="dim-bar-bg">
								<view class="dim-bar-fill" :style="{ width: dim.score + '%', background: dim.color }"></view>
							</view>
							<text class="dim-detail">{{ dim.detail }}</text>
						</view>
					</view>

					<!-- 心理解读 -->
					<view class="interpret-section">
						<view class="interpret-title">心理解读</view>
						<view v-for="item in reportInterpret" :key="item.tag" class="interpret-item">
							<view class="interpret-tag" :style="{ background: item.tagColor }">{{ item.tag }}</view>
							<text class="interpret-text">{{ item.text }}</text>
						</view>
					</view>

					<!-- 建议 -->
					<view class="advice-section">
						<view class="advice-title">💡 个性化建议</view>
						<view v-for="(adv, i) in reportAdvice" :key="i" class="advice-item">
							<text class="advice-num">{{ i + 1 }}</text>
							<text class="advice-text">{{ adv }}</text>
						</view>
					</view>
				</scroll-view>

				<view class="report-footer">
					<button class="btn-save" @click="saveReport">💾 保存报告</button>
					<button class="btn-close" @click="showReport = false">关闭</button>
				</view>
			</view>
		</view>

		<!-- 历史记录列表弹窗 -->
	<view v-if="showHistory" class="report-mask" @click.self="showHistory = false">
		<view class="report-modal">
			<view class="report-header">
				<text class="report-title">📜 历史分析记录</text>
				<text class="hist-header-close" @click="showHistory = false">✕</text>
			</view>
			<scroll-view scroll-y class="report-body">
				<view v-if="historyList.length === 0" class="hist-empty">
					<text class="hist-empty-icon">🎨</text>
					<text class="hist-empty-text">暂无历史记录，完成分析后自动保存</text>
				</view>
				<view
					v-for="(item, idx) in historyList"
					:key="idx"
					class="hist-card"
				>
					<view class="hist-card-top">
						<!-- 左侧得分圆 -->
						<view class="hist-score-circle" :style="{ background: item.scoreGradient || 'linear-gradient(135deg,#f7971e,#ffd200)' }">
							<text class="hist-score-num">{{ item.score }}</text>
							<text class="hist-score-unit">分</text>
						</view>
						<!-- 中间信息 -->
						<view class="hist-info">
							<text class="hist-level">{{ item.level }}</text>
							<text class="hist-date">{{ item.date }}</text>
							<view class="hist-tags">
								<view
									v-for="(it, ti) in (item.interpret || []).slice(0, 2)"
									:key="ti"
									class="hist-tag"
									:style="{ background: it.tagColor }"
								>{{ it.tag }}</view>
							</view>
						</view>
						<!-- 右侧缩略图 -->
						<image
							v-if="historyImgMap[idx]"
							class="hist-thumb"
							:src="historyImgMap[idx]"
							mode="aspectFill"
						/>
						<view v-else class="hist-thumb-placeholder">🎨</view>
					</view>
					<!-- 操作按鈕行 -->
					<view class="hist-actions">
						<view class="hist-action-btn hist-view-btn" @click="viewHistoryDetail(idx)">查看详情</view>
						<view class="hist-action-btn hist-del-btn" @click="deleteHistoryItem(idx)">删除</view>
					</view>
				</view>
			</scroll-view>
		</view>
	</view>

	<!-- 历史记录详情弹窗 -->
	<view v-if="showHistoryDetail && detailReport" class="report-mask" @click.self="showHistoryDetail = false">
		<view class="report-modal">
			<view class="report-header">
				<text class="report-title">🧠 HTP 分析报告</text>
				<text class="report-date">{{ detailReport.date }}</text>
			</view>
			<scroll-view scroll-y class="report-body">
				<!-- 画布图像 -->
				<view v-if="detailImage" class="detail-img-wrap">
					<image class="detail-img" :src="detailImage" mode="aspectFit" />
				</view>
				<!-- 综合评分 -->
				<view class="score-section">
					<view class="score-circle" :style="{ background: detailReport.scoreGradient || 'linear-gradient(135deg,#f7971e,#ffd200)' }">
						<text class="score-num">{{ detailReport.score }}</text>
						<text class="score-unit">分</text>
					</view>
					<view class="score-info">
						<text class="score-level">{{ detailReport.level }}</text>
						<text class="score-desc">{{ detailReport.desc }}</text>
					</view>
				</view>
				<!-- 维度分析 -->
				<view class="dim-section">
					<view class="dim-title">多维度分析</view>
					<view v-for="dim in detailReport.dims" :key="dim.name" class="dim-item">
						<view class="dim-row">
							<text class="dim-name">{{ dim.name }}</text>
							<text class="dim-val" :style="{ color: dim.color }">{{ dim.value }}</text>
						</view>
						<view class="dim-bar-bg">
							<view class="dim-bar-fill" :style="{ width: dim.score + '%', background: dim.color }"></view>
						</view>
						<text class="dim-detail">{{ dim.detail }}</text>
					</view>
				</view>
				<!-- 心理解读 -->
				<view class="interpret-section">
					<view class="interpret-title">心理解读</view>
					<view v-for="it in detailReport.interpret" :key="it.tag" class="interpret-item">
						<view class="interpret-tag" :style="{ background: it.tagColor }">{{ it.tag }}</view>
						<text class="interpret-text">{{ it.text }}</text>
					</view>
				</view>
				<!-- 建议 -->
				<view class="advice-section">
					<view class="advice-title">💡 个性化建议</view>
					<view v-for="(adv, i) in detailReport.advice" :key="i" class="advice-item">
						<text class="advice-num">{{ i + 1 }}</text>
						<text class="advice-text">{{ adv }}</text>
					</view>
				</view>
			</scroll-view>
			<view class="report-footer">
				<button class="btn-close" style="flex:1" @click="showHistoryDetail = false">关闭</button>
			</view>
		</view>
	</view>
	</view>
</template>

<script>
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {
				currentTool: 'pencil',
				currentColor: '#333333',
				brushSize: 3,
				sizeOptions: [
					{ val: 2, px: 10 },
					{ val: 4, px: 14 },
					{ val: 7, px: 18 },
					{ val: 12, px: 22 }
				],
				colorPalette: [
					'#333333', '#e74c3c', '#e67e22', '#f1c40f',
					'#2ecc71', '#3498db', '#9b59b6', '#1abc9c',
					'#e91e63'
				],
				// 绘画统计数据
				strokeData: [],       // 每一笔 { color, size, points: [{x,y}] }
				currentStroke: null,
				undoStack: [],        // 用于撤销
				isDrawing: false,
				canvasWidth: 0,
				canvasHeight: 0,
				ctx: null,
				// 报告
				showReport: false,
				reportDate: '',
				overallScore: 0,
				scoreLevel: '',
				scoreDesc: '',
				scoreGradient: '',
				reportDims: [],
				reportInterpret: [],
				reportAdvice: [],
				currentReport: null,
				// 历史记录
				showHistory: false,
				historyList: [],
				historyImgMap: {},    // date -> imageDataUrl
				showHistoryDetail: false,
				detailReport: null,
				detailImage: ''
			};
		},
		onReady() {
			this.initCanvas();
		},
		methods: {
			initCanvas() {
				const query = uni.createSelectorQuery().in(this);
				query.select('.canvas').boundingClientRect(res => {
					if (res) {
						this.canvasWidth = res.width;
						this.canvasHeight = res.height;
					}
				}).exec();
				this.ctx = uni.createCanvasContext('htpCanvas', this);
				this.ctx.setFillStyle('#ffffff');
				this.ctx.fillRect(0, 0, 750, 1000);
				this.ctx.draw();
			},

			selectTool(tool) {
				this.currentTool = tool;
			},

			clearCanvas() {
				uni.showModal({
					title: '清空画布',
					content: '确定清空所有内容并重新开始？',
					success: (res) => {
						if (res.confirm) {
							this.strokeData = [];
							this.undoStack = [];
							this.ctx.setFillStyle('#ffffff');
							this.ctx.fillRect(0, 0, 750, 1000);
							this.ctx.draw();
						}
					}
				});
			},

			undo() {
				if (this.strokeData.length === 0) return;
				this.strokeData.pop();
				this.redrawAll();
			},

			redrawAll() {
				this.ctx.setFillStyle('#ffffff');
				this.ctx.fillRect(0, 0, 750, 1000);
				for (const stroke of this.strokeData) {
					if (stroke.points.length < 2) continue;
					this.ctx.beginPath();
					this.ctx.setStrokeStyle(stroke.isEraser ? '#ffffff' : stroke.color);
					this.ctx.setLineWidth(stroke.isEraser ? stroke.size * 3 : stroke.size);
					this.ctx.setLineCap('round');
					this.ctx.setLineJoin('round');
					this.ctx.moveTo(stroke.points[0].x, stroke.points[0].y);
					for (let i = 1; i < stroke.points.length; i++) {
						this.ctx.lineTo(stroke.points[i].x, stroke.points[i].y);
					}
					this.ctx.stroke();
				}
				this.ctx.draw();
			},

			getEventPos(e) {
				const touch = e.touches[0] || e.changedTouches[0];
				return { x: touch.x, y: touch.y };
			},

			onTouchStart(e) {
				const pos = this.getEventPos(e);
				this.isDrawing = true;
				this.currentStroke = {
					color: this.currentColor,
					size: this.brushSize,
					isEraser: this.currentTool === 'eraser',
					points: [pos]
				};
				this.ctx.beginPath();
				this.ctx.moveTo(pos.x, pos.y);
			},

			onTouchMove(e) {
				if (!this.isDrawing || !this.currentStroke) return;
				const pos = this.getEventPos(e);
				this.currentStroke.points.push(pos);

				const pts = this.currentStroke.points;
				const len = pts.length;
				if (len < 2) return;

				this.ctx.beginPath();
				this.ctx.setStrokeStyle(this.currentStroke.isEraser ? '#ffffff' : this.currentColor);
				this.ctx.setLineWidth(this.currentStroke.isEraser ? this.brushSize * 3 : this.brushSize);
				this.ctx.setLineCap('round');
				this.ctx.setLineJoin('round');
				this.ctx.moveTo(pts[len - 2].x, pts[len - 2].y);
				this.ctx.lineTo(pts[len - 1].x, pts[len - 1].y);
				this.ctx.stroke();
				this.ctx.draw(true);
			},

			onTouchEnd(e) {
				if (!this.isDrawing || !this.currentStroke) return;
				this.isDrawing = false;
				if (this.currentStroke.points.length >= 2) {
					this.strokeData.push(this.currentStroke);
				}
				this.currentStroke = null;
			},

			// ============ 分析引擎 ============
			analyzeDrawing() {
				if (this.strokeData.length === 0) {
					uni.showToast({ title: '请先在画布上绘画', icon: 'none' });
					return;
				}
				uni.showLoading({ title: '正在分析...', mask: true });
				setTimeout(() => {
					const analysis = this.runAnalysis();
					this.buildReport(analysis);
					uni.hideLoading();
					this.showReport = true;
					// 不再自动保存，由用户手动选择是否保存
				}, 1200);
			},
			
			runAnalysis() {
				const strokes = this.strokeData;
				const totalStrokes = strokes.length;

				// --- 色彩分析 ---
				const colorSet = new Set(strokes.filter(s => !s.isEraser).map(s => s.color));
				const colorCount = colorSet.size;
				const warmColors = ['#e74c3c', '#e67e22', '#f1c40f', '#e91e63', '#fda085', '#f6d365'];
				const coolColors = ['#3498db', '#1abc9c', '#9b59b6', '#2ecc71', '#607d8b'];
				const darkColors = ['#333333', '#795548', '#607d8b'];
				let warmCount = 0, coolCount = 0, darkCount = 0;
				colorSet.forEach(c => {
					if (warmColors.includes(c)) warmCount++;
					if (coolColors.includes(c)) coolCount++;
					if (darkColors.includes(c)) darkCount++;
				});
				const colorDiversity = Math.min(100, colorCount * 14);
				const warmth = warmCount > coolCount ? Math.min(100, warmCount * 25) : Math.max(20, 50 - coolCount * 10);

				// --- 笔触分析 ---
				const sizes = strokes.filter(s => !s.isEraser).map(s => s.size);
				const avgSize = sizes.length ? sizes.reduce((a, b) => a + b, 0) / sizes.length : 3;
				const totalPoints = strokes.reduce((a, s) => a + s.points.length, 0);
				// 笔画力度：用笔触粗细和数量代理
				const strokeForce = Math.min(100, (avgSize / 12) * 80 + (totalStrokes > 5 ? 20 : 0));
				// 线条复杂度
				const complexity = Math.min(100, totalPoints / 10);

				// --- 构图分析 ---
				// 使用点分布判断画面饱满度
				const allPoints = strokes.flatMap(s => s.points);
				let xSum = 0, ySum = 0;
				allPoints.forEach(p => { xSum += p.x; ySum += p.y; });
				const cx = allPoints.length ? xSum / allPoints.length : 375;
				const cy = allPoints.length ? ySum / allPoints.length : 500;
				// 偏心度
				const centerBias = Math.sqrt(Math.pow((cx - 375) / 375, 2) + Math.pow((cy - 500) / 500, 2));
				const compositionScore = Math.max(20, Math.min(100, 100 - centerBias * 60));
				// 饱满度：点数覆盖率代理
				const fullness = Math.min(100, totalPoints / 5);

				// --- 叙事分析 ---
				// 综合色彩、数量、笔触推断积极性
				const positivity = Math.round((warmth * 0.4 + colorDiversity * 0.3 + strokeForce * 0.3));

				return {
					colorDiversity, warmth, strokeForce, complexity,
					compositionScore, fullness, positivity,
					colorCount, totalStrokes, totalPoints,
					warmCount, coolCount, darkCount, avgSize,
					hasWhite: colorSet.has('#ffffff')
				};
			},

			buildReport(a) {
				// 综合评分 - 优化算法，提高基础分
				const score = Math.round(
					a.colorDiversity * 0.15 + a.warmth * 0.2 + a.strokeForce * 0.2 +
					a.compositionScore * 0.2 + a.positivity * 0.25
				);
				// 提高最低分，确保分数不会太低
				this.overallScore = Math.max(50, Math.min(100, score + 20));

				// 根据分数段显示不同的等级和建议 - 更委婉的表达
				if (this.overallScore >= 90) {
					this.scoreLevel = '心理状态优秀';
					this.scoreDesc = '您的绘画呈现出非常积极、健康的心理特征，内心充满能量与和谐';
					this.scoreGradient = 'linear-gradient(135deg, #43e97b, #38f9d7)';
				} else if (this.overallScore >= 70) {
					this.scoreLevel = '心理状态良好';
					this.scoreDesc = '整体心理状态平衡稳定，展现出积极的应对能力和情绪调节能力';
					this.scoreGradient = 'linear-gradient(135deg, #4facfe, #00f2fe)';
				} else if (this.overallScore >= 50) {
					this.scoreLevel = '心理状态平稳';
					this.scoreDesc = '当前心理状态基本平稳，部分维度可能存在提升空间，值得关注';
					this.scoreGradient = 'linear-gradient(135deg, #f7971e, #ffd200)';
				} else {
					this.scoreLevel = '建议关注调整';
					this.scoreDesc = '部分指标显示可能存在心理压力或情绪波动，建议适当调整生活方式';
					this.scoreGradient = 'linear-gradient(135deg, #f093fb, #f5576c)';
				}

				// 维度
				this.reportDims = [
					{
						name: '色彩运用', value: a.colorCount <= 1 ? '单调' : a.colorCount <= 3 ? '简洁' : a.colorCount <= 6 ? '丰富' : '多样',
						score: a.colorDiversity, color: '#f093fb',
						detail: `使用了 ${a.colorCount} 种颜色。${a.colorCount >= 5 ? '色彩丰富，体现较强情感表达欲望。' : a.colorCount >= 3 ? '色彩适中，情感较为平衡。' : '色彩偏少，可能存在情绪压抑或内敛倾向。'}`
					},
					{
						name: '感官温度', value: a.warmCount > a.coolCount ? '温暖' : a.coolCount > a.warmCount ? '冷静' : '中性',
						score: a.warmth, color: '#fda085',
						detail: a.warmCount > a.coolCount ? '暖色调为主，暗示对外界持开放、友善态度，情绪较积极。' : a.coolCount > 0 ? '冷色调偏多，体现理性、内敛特质，或存在一定情绪距离感。' : '色调中性，情感表达较为克制。'
					},
					{
						name: '笔触力度', value: a.avgSize >= 8 ? '有力' : a.avgSize >= 4 ? '适中' : '轻柔',
						score: a.strokeForce, color: '#a18cd1',
						detail: a.avgSize >= 8 ? '线条粗壮有力，体现较强自信心和行动力。' : a.avgSize >= 4 ? '笔触均衡，心理状态较为稳定。' : '线条纤细轻柔，可能体现敏感、细腻或犹豫的心理特征。'
					},
					{
						name: '构图合理性', value: a.compositionScore >= 75 ? '居中均衡' : a.compositionScore >= 50 ? '略有偏移' : '偏侧明显',
						score: parseFloat(a.compositionScore.toFixed(1)), color: '#4facfe',
						detail: a.compositionScore >= 75 ? '画面布局居中，构图感强，体现较好的秩序感与控制力。' : a.compositionScore >= 50 ? '构图略有偏移，可能存在轻微的焦虑或不安全感。' : '画面明显偏侧，可能暗示内心失衡或逃避倾向。'
					},
					{
						name: '画面饱满度', value: a.fullness >= 70 ? '充实饱满' : a.fullness >= 40 ? '适度留白' : '大量留白',
						score: a.fullness, color: '#43e97b',
						detail: a.fullness >= 70 ? '画面填充丰富，体现较强的表达欲望和活跃度。' : a.fullness >= 40 ? '留白适度，构图感和空间意识良好。' : '留白较多，可能体现退缩、空虚感或低活跃状态。'
					},
					{
						name: '画面积极性', value: a.positivity >= 70 ? '积极向上' : a.positivity >= 45 ? '平和中性' : '偏向消极',
						score: a.positivity, color: '#f7971e',
						detail: a.positivity >= 70 ? '绘画整体呈现积极、和谐的叙事倾向，生活满意度较高。' : a.positivity >= 45 ? '画面情绪平稳，未见明显消极信号。' : '部分指标偏低，可能存在情绪低落或心理压力。'
					}
				];

				// 心理解读
				this.reportInterpret = [];
				if (a.colorCount >= 5) {
					this.reportInterpret.push({ tag: '情感丰富', tagColor: '#f093fb', text: '多色彩运用反映您具有丰富的情感世界，对生活保持好奇与热情。' });
				} else if (a.colorCount <= 1) {
					this.reportInterpret.push({ tag: '情感内敛', tagColor: '#a18cd1', text: '单一色调提示情感表达较为节制，可能存在压抑或回避的心理倾向。' });
				}
				if (a.warmCount > a.coolCount) {
					this.reportInterpret.push({ tag: '温暖开放', tagColor: '#fda085', text: '暖色偏好显示您倾向于积极的人际关系，具有较好的共情能力和社交意愿。' });
				}
				if (a.avgSize >= 7) {
					this.reportInterpret.push({ tag: '自信坚定', tagColor: '#4facfe', text: '粗壮有力的线条体现较强的自信心和执行力，面对挑战有行动意愿。' });
				} else if (a.avgSize <= 2.5) {
					this.reportInterpret.push({ tag: '细腻敏感', tagColor: '#84fab0', text: '轻柔纤细的笔触暗示您性格敏感细腻，对外界刺激感知较强，需注意情绪调节。' });
				}
				if (a.compositionScore < 45) {
					this.reportInterpret.push({ tag: '内心失衡', tagColor: '#f5576c', text: '构图明显偏移提示当前内心可能存在一定程度的不平衡或焦虑，建议关注自我状态。' });
				}
				if (a.fullness < 30) {
					this.reportInterpret.push({ tag: '空旷感', tagColor: '#a7b2c1', text: '大量留白可能体现空虚感或低能量状态，建议增加社交与户外活动。' });
				}
				if (this.reportInterpret.length === 0) {
					this.reportInterpret.push({ tag: '整体平衡', tagColor: '#43e97b', text: '各项指标较为均衡，未见明显心理警示信号，继续保持良好生活状态。' });
				}

				// 建议 - 根据分数段提供个性化建议
				this.reportAdvice = [];
				
				// 90-100 分：积极正面的建议
				if (this.overallScore >= 90) {
					this.reportAdvice.push('继续保持当前的积极心态和健康的生活方式，您的心理状态非常棒！');
					this.reportAdvice.push('可以尝试挑战新的创意活动，进一步丰富情感表达和自我成长。');
					this.reportAdvice.push('分享您的正能量给身边的人，成为他人的支持者。');
				}
				// 70-89 分：中等程度的建议
				else if (this.overallScore >= 70) {
					this.reportAdvice.push('您的心理状态总体良好，可以通过适度增加创意活动来进一步提升情绪活力。');
					if (a.warmth < 50) {
						this.reportAdvice.push('尝试增加一些温暖的社交互动，与亲友分享日常感受，增进情感联结。');
					}
					if (a.fullness < 50) {
						this.reportAdvice.push('为生活增添一些新鲜体验，如户外活动、艺术创作等，充实内心世界。');
					}
					if (this.reportAdvice.length < 3) {
						this.reportAdvice.push('保持规律的作息和适量运动，这将有助于维持良好的心理状态。');
					}
				}
				// 50-69 分：需要关注的建议
				else if (this.overallScore >= 50) {
					this.reportAdvice.push('您可能正经历一些情绪波动或压力期，这是正常的心理反应，请给自己一些时间和耐心。');
					if (a.colorCount <= 2) {
						this.reportAdvice.push('尝试用色彩表达情绪，如绘画日记、手账等创意活动，帮助释放内心感受。');
					}
					if (a.strokeForce < 50) {
						this.reportAdvice.push('适度的体育锻炼可以增强身体能量感，提升自信心和情绪状态。');
					}
					if (a.compositionScore < 50) {
						this.reportAdvice.push('练习冥想或深呼吸，每天花 5-10 分钟静心，帮助内心找到平静与平衡。');
					}
					if (this.reportAdvice.length < 3) {
						this.reportAdvice.push('建立规律的生活节奏，保证充足睡眠，这对情绪稳定很重要。');
					}
				}
				// 50 分以下：需要寻求专业帮助的建议
				else {
					this.reportAdvice.push('近期可能面临较大的心理压力或情绪困扰，建议您多关注自己的内心需求。');
					this.reportAdvice.push('与信任的家人朋友倾诉感受，寻求社会支持是缓解压力的有效方式。');
					this.reportAdvice.push('如果这种状态持续较长时间，可以考虑咨询专业心理咨询师，获得更有针对性的支持和指导。');
					this.reportAdvice.push('从小事开始照顾自己：规律作息、健康饮食、适度运动，这些都是改善心情的基础。');
				}

				this.reportDate = new Date().toLocaleDateString('zh-CN', { year: 'numeric', month: 'long', day: 'numeric' });
				this.currentReport = {
					date: this.reportDate,
					score: this.overallScore,
					level: this.scoreLevel,
					desc: this.scoreDesc,
					scoreGradient: this.scoreGradient,
					dims: this.reportDims,
					interpret: this.reportInterpret,
					advice: this.reportAdvice,
					analysis: a
				};
			},

			saveReport() {
				if (!this.currentReport) return;
				// 先显示加载提示
				uni.showLoading({ title: '正在保存...', mask: true });
				
				// 立即捕获画布截图
				uni.canvasToTempFilePath({
					canvasId: 'htpCanvas',
					success: (res) => {
						const tempFilePath = res.tempFilePath;
						// 第一步：上传图片到服务器
						this.uploadCanvasImage(tempFilePath, (serverImgUrl) => {
							// 第二步：保存记录到数据库
							this.saveToDatabase(serverImgUrl, tempFilePath);
						});
					},
					fail: () => {
						// 截图失败也要保存文字报告（不上传图片）
						this.saveToDatabase(null, null);
					}
				}, this);
			},

			// 上传画布图片到服务器
			uploadCanvasImage(tempFilePath, callback) {
				const token = uni.getStorageSync('token');
				uni.uploadFile({
					url: `${config.baseUrl}/uploadDrawing?type=drawing`,
					filePath: tempFilePath,
					name: 'file',
					header: {
						'Authorization': token
					},
					success: (uploadRes) => {
						try {
							const data = JSON.parse(uploadRes.data);
							if (data.code === 200 && data.result) {
								console.log('[HTP] 图片上传成功:', data.result);
								callback(data.result); // 服务器返回的图片路径
							} else {
								console.error('[HTP] 图片上传失败:', data);
								callback(null);
							}
						} catch (e) {
							console.error('[HTP] 图片上传响应解析失败:', e);
							callback(null);
						}
					},
					fail: (err) => {
						console.error('[HTP] 图片上传请求失败:', err);
						callback(null);
					}
				});
			},

			// 保存记录到数据库
			saveToDatabase(serverImgUrl, localImgPath) {
				// 构造报告内容（JSON 格式）
				const reportContentStr = JSON.stringify({
					score: this.overallScore,
					level: this.scoreLevel,
					desc: this.scoreDesc,
					dims: this.reportDims,
					interpret: this.reportInterpret,
					advice: this.reportAdvice,
					analysis: this.currentReport?.analysis || {}
				});

				// 调用后端 API 保存记录
				http.post('/htp/add', {
					score: this.overallScore,
					reportContent: reportContentStr,
					drawingImgUrl: serverImgUrl
				}).then(res => {
					console.log('[HTP] 数据库保存成功:', res);
					
					// 同时保存到本地（作为缓存）
					let history = uni.getStorageSync('htp_history') || [];
					history.unshift(this.currentReport);
					uni.setStorageSync('htp_history', history);
					
					if (localImgPath) {
						let imgHistory = uni.getStorageSync('htp_images') || [];
						imgHistory.unshift({ date: this.reportDate, path: localImgPath });
						uni.setStorageSync('htp_images', imgHistory);
					}
					
					uni.hideLoading();
					uni.showToast({ 
						title: '报告已保存', 
						icon: 'success',
						duration: 2000
					});
					
					// 延迟关闭弹窗
						setTimeout(() => {
						this.showReport = false;
					}, 500);
				}).catch(err => {
					console.error('[HTP] 数据库保存失败:', err);
					// 即使数据库保存失败，也保存到本地
					let history = uni.getStorageSync('htp_history') || [];
					history.unshift(this.currentReport);
					uni.setStorageSync('htp_history', history);
					
					if (localImgPath) {
						let imgHistory = uni.getStorageSync('htp_images') || [];
						imgHistory.unshift({ date: this.reportDate, path: localImgPath });
						uni.setStorageSync('htp_images', imgHistory);
					}
					
					uni.hideLoading();
					uni.showModal({
						title: '提示',
						content: '报告已保存到本地',
						showCancel: false
					});
					this.showReport = false;
				});
			},

			// 历史记录
			loadHistory() {
				// 优先从后端加载历史记录
				http.get('/htp/getlist', { 
					params: { currentPage: 1, pageSize: 50 } 
				}).then(res => {
					console.log('[HTP] 从后端加载历史记录成功:', res);
					if (res.result && res.result.data) {
						// 将后端数据转换为前端显示格式
						this.historyList = res.result.data.map(record => {
							let reportContent = {};
							try {
								reportContent = JSON.parse(record.reportContent || '{}');
							} catch (e) {
								console.warn('报告内容解析失败:', e);
							}
							return {
								id: record.id,
								date: record.logDate || record.addTimestamp,
								score: record.score,
								level: reportContent.level || '',
								desc: reportContent.desc || '',
								scoreGradient: reportContent.scoreGradient || 'linear-gradient(135deg,#f7971e,#ffd200)',
								dims: reportContent.dims || [],
								interpret: reportContent.interpret || [],
								advice: reportContent.advice || [],
								drawingImgUrl: record.drawingImgUrl,
								analysis: reportContent.analysis || {}
							};
						});
						
						// 构建图片映射（使用服务器图片URL）
						this.historyImgMap = {};
						res.result.data.forEach((record, index) => {
							if (record.drawingImgUrl) {
								this.historyImgMap[index] = config.baseUrl + '/download?filePath=' + record.drawingImgUrl;
							}
						});
					}
				}).catch(err => {
					console.error('[HTP] 从后端加载历史记录失败，使用本地缓存:', err);
					// 如果后端加载失败，使用本地缓存
					try {
						this.historyList = uni.getStorageSync('htp_history') || [];
						const imgHistory = uni.getStorageSync('htp_images') || [];
						const map = {};
						imgHistory.forEach((item, index) => { 
							if (item.path) map[index] = item.path; 
						});
						this.historyImgMap = map;
					} catch (e) {
						console.warn('本地历史记录加载失败', e);
					}
				});
			},
			openHistory() {
				this.loadHistory();
				this.showHistory = true;
			},
			viewHistoryDetail(idx) {
				const item = this.historyList[idx];
				if (!item) return;
				this.detailReport = item;
				// 优先使用服务器图片URL，否则使用本地图片路径
				this.detailImage = this.historyImgMap[idx] || '';
				this.showHistoryDetail = true;
			},
			deleteHistoryItem(idx) {
				uni.showModal({
					title: '确认删除',
					content: '删除该历史记录，是否继续？',
					confirmColor: '#e05252',
					success: (res) => {
						if (res.confirm) {
							const item = this.historyList[idx];
							this.historyList.splice(idx, 1);
							// 同步删除对应索引的图片记录
							delete this.historyImgMap[idx];
							let imgHistory = [];
							try { imgHistory = uni.getStorageSync('htp_images') || []; } catch (e) {}
							imgHistory.splice(idx, 1);
							try { uni.setStorageSync('htp_images', imgHistory); } catch (e) {}
							try { uni.setStorageSync('htp_history', this.historyList); } catch (e) {}
							uni.showToast({ title: '已删除', icon: 'none', duration: 1000 });
						}
					}
				});
			}
		}
	};
</script>

<style lang="scss" scoped>
	.page {
		display: flex;
		flex-direction: column;
		height: 100vh;
		background: #f8f6f2;
	}

	/* 提示条 */
	.hint-bar {
		background: linear-gradient(135deg, #f953c6, #b91d73);
		padding: 8px 16px;
		text-align: center;
	}
	.hint-text { font-size: 0.82em; color: rgba(255,255,255,0.95); font-weight: 500; }

	/* 画布 */
	.canvas-wrap {
		background: #ffffff;
		margin: 8px auto;
		width: calc(100vw - 16px);
		height: calc(100vw - 16px);
		flex-shrink: 0;
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 4px 20px rgba(0,0,0,0.10);
	}
	.canvas {
		width: 100%;
		height: 100%;
		display: block;
	}

	/* 工具栏 */
	.toolbar {
		background: rgba(255,255,255,0.95);
		padding: 6px 14px 4px;
		display: flex;
		flex-direction: column;
		gap: 6px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.06);
	}
	.toolbar-row1 {
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 8px;
	}
	.tool-group {
		display: flex;
		gap: 12px;
		justify-content: center;
	}
	.action-group {
		display: flex;
		gap: 6px;
		align-items: center;
	}
	.tool-btn {
		display: flex; flex-direction: column; align-items: center;
		padding: 4px 16px; border-radius: 12px;
		background: #f0f0f0; gap: 2px;
		border: 2px solid transparent;
	}
	.tool-btn.active {
		background: #fff8e0; border-color: #f7971e;
	}
	.tool-icon { font-size: 1.3em; }
	.tool-label { font-size: 0.7em; color: #666; }

	/* 粗细 */
	.size-group {
		display: flex; gap: 14px; align-items: center; justify-content: center;
	}
	.size-dot {
		border-radius: 50%; background: #555;
		border: 3px solid transparent; box-sizing: border-box;
	}
	.size-dot.active { border-color: #f7971e; }

	/* 颜色 */
	.color-group {
		display: flex; gap: 8px; flex-wrap: wrap; justify-content: center;
	}
	.color-dot {
		width: 24px; height: 24px; border-radius: 50%;
		border: 3px solid transparent; box-sizing: border-box;
		box-shadow: 0 1px 4px rgba(0,0,0,0.2);
	}
	.color-dot.active { border-color: #f7971e; transform: scale(1.2); }

	/* 底部按钮（画布下方） */
	.bottom-bar {
		display: flex; gap: 10px; padding: 10px 14px 14px;
		background: rgba(255,255,255,0.95);
	}
	.btn-undo {
		flex: 1; padding: 10px; border-radius: 25px;
		background: #f0f0f0; color: #555; font-size: 0.9em; border: none;
	}
	.btn-analyze {
		flex: 2; padding: 10px; border-radius: 25px;
		background: linear-gradient(135deg, #f7971e, #ffd200);
		color: #5a3e00; font-size: 0.95em; font-weight: bold; border: none;
	}

	/* 报告弹窗 */
	.report-mask {
		position: fixed; top: 0; left: 0; right: 0; bottom: 0;
		background: rgba(0,0,0,0.5); z-index: 999;
		display: flex; align-items: flex-end;
	}
	.report-modal {
		background: #fff; border-radius: 24px 24px 0 0;
		width: 100%; max-height: 85vh;
		display: flex; flex-direction: column;
	}
	.report-header {
		padding: 20px 20px 12px;
		border-bottom: 1px solid #f0f0f0;
		display: flex; align-items: center; justify-content: space-between;
	}
	.report-title { font-size: 1.1em; font-weight: bold; color: #2c3e50; }
	.report-date { font-size: 0.75em; color: #aaa; }
	.report-body {
		flex: 1; padding: 16px 18px; overflow-y: auto;
	}

	/* 综合评分 */
	.score-section {
		display: flex; align-items: center; gap: 16px;
		background: #f8f9fa; border-radius: 16px; padding: 16px; margin-bottom: 18px;
	}
	.score-circle {
		width: 72px; height: 72px; border-radius: 50%;
		display: flex; flex-direction: column; align-items: center; justify-content: center;
		flex-shrink: 0;
	}
	.score-num { font-size: 1.6em; font-weight: bold; color: #fff; }
	.score-unit { font-size: 0.7em; color: rgba(255,255,255,0.85); }
	.score-level { font-size: 1em; font-weight: bold; color: #2c3e50; display: block; }
	.score-desc { font-size: 0.8em; color: #888; margin-top: 4px; display: block; line-height: 1.5; }

	/* 维度 */
	.dim-section { margin-bottom: 18px; }
	.dim-title {
		font-size: 0.95em; font-weight: bold; color: #2c3e50;
		margin-bottom: 12px;
	}
	.dim-item { margin-bottom: 14px; }
	.dim-row { display: flex; justify-content: space-between; margin-bottom: 4px; }
	.dim-name { font-size: 0.85em; color: #555; font-weight: 500; }
	.dim-val { font-size: 0.85em; font-weight: bold; }
	.dim-bar-bg {
		height: 6px; background: #f0f0f0; border-radius: 3px; overflow: hidden; margin-bottom: 4px;
	}
	.dim-bar-fill { height: 100%; border-radius: 3px; transition: width 0.5s; }
	.dim-detail { font-size: 0.75em; color: #888; line-height: 1.5; }

	/* 解读 */
	.interpret-section { margin-bottom: 18px; }
	.interpret-title {
		font-size: 0.95em; font-weight: bold; color: #2c3e50; margin-bottom: 10px;
	}
	.interpret-item {
		display: flex; align-items: flex-start; gap: 8px; margin-bottom: 10px;
	}
	.interpret-tag {
		padding: 2px 10px; border-radius: 12px; font-size: 0.72em;
		color: white; flex-shrink: 0; margin-top: 2px;
	}
	.interpret-text { font-size: 0.82em; color: #444; line-height: 1.6; }

	/* 建议 */
	.advice-section { margin-bottom: 10px; }
	.advice-title {
		font-size: 0.95em; font-weight: bold; color: #2c3e50; margin-bottom: 10px;
	}
	.advice-item {
		display: flex; align-items: flex-start; gap: 10px; margin-bottom: 10px;
		background: #fffbf0; border-radius: 10px; padding: 10px 12px;
	}
	.advice-num {
		width: 20px; height: 20px; border-radius: 50%;
		background: linear-gradient(135deg, #f7971e, #ffd200);
		color: #5a3e00; font-size: 0.72em; font-weight: bold;
		display: flex; align-items: center; justify-content: center;
		flex-shrink: 0;
	}
	.advice-text { font-size: 0.82em; color: #555; line-height: 1.6; }

	/* 底部按钮 */
	.report-footer {
		display: flex; gap: 10px; padding: 12px 18px 20px;
		border-top: 1px solid #f0f0f0;
	}
	.btn-save {
		flex: 2; padding: 12px; border-radius: 25px;
		background: linear-gradient(135deg, #f7971e, #ffd200);
		color: #5a3e00; font-size: 0.9em; font-weight: bold; border: none;
	}
	.btn-close {
		flex: 1; padding: 12px; border-radius: 25px;
		background: #f0f0f0; color: #666; font-size: 0.9em; border: none;
	}

	/* ===== 历史记录按鈕行 ===== */
	.history-bar {
		padding: 0 14px 14px;
		background: rgba(255,255,255,0.95);
	}
	.btn-history {
		width: 100%; padding: 10px; border-radius: 25px;
		background: #f0f0f0; color: #555; font-size: 0.88em;
		border: none; font-weight: 500;
	}

	/* ===== 历史记录弹窗头部关闭按鈕 ===== */
	.hist-header-close {
		font-size: 1em; color: #aaa; padding: 4px 8px; cursor: pointer;
	}

	/* 空状态 */
	.hist-empty {
		display: flex; flex-direction: column; align-items: center;
		padding: 40px 20px; gap: 12px;
	}
	.hist-empty-icon { font-size: 2.5em; }
	.hist-empty-text { font-size: 0.85em; color: #aaa; text-align: center; }

	/* 历史卡片 */
	.hist-card {
		background: #f8f9fa; border-radius: 14px;
		padding: 12px 14px; margin-bottom: 12px;
	}
	.hist-card-top {
		display: flex; align-items: center; gap: 10px;
	}
	.hist-score-circle {
		width: 54px; height: 54px; border-radius: 50%;
		display: flex; flex-direction: column;
		align-items: center; justify-content: center; flex-shrink: 0;
	}
	.hist-score-num { font-size: 1.2em; font-weight: bold; color: #fff; }
	.hist-score-unit { font-size: 0.62em; color: rgba(255,255,255,0.85); }
	.hist-info {
		flex: 1; display: flex; flex-direction: column; gap: 3px; min-width: 0;
	}
	.hist-level { font-size: 0.88em; font-weight: bold; color: #2c3e50; }
	.hist-date { font-size: 0.72em; color: #aaa; }
	.hist-tags { display: flex; flex-wrap: wrap; gap: 4px; margin-top: 2px; }
	.hist-tag {
		padding: 2px 8px; border-radius: 10px;
		font-size: 0.68em; color: #fff; flex-shrink: 0;
	}
	.hist-thumb {
		width: 56px; height: 56px; border-radius: 8px;
		object-fit: cover; flex-shrink: 0;
		border: 1px solid #eee;
	}
	.hist-thumb-placeholder {
		width: 56px; height: 56px; border-radius: 8px;
		background: #f0f0f0; display: flex;
		align-items: center; justify-content: center;
		font-size: 1.4em; flex-shrink: 0;
	}
	/* 历史操作按鈕 */
	.hist-actions {
		display: flex; justify-content: flex-end;
		gap: 8px; margin-top: 10px;
	}
	.hist-action-btn {
		padding: 5px 16px; border-radius: 20px;
		font-size: 0.76em; cursor: pointer;
		transition: opacity 0.15s; user-select: none;
	}
	.hist-action-btn:active { opacity: 0.65; }
	.hist-view-btn {
		border: 1px solid #f7971e; color: #f7971e;
		background: rgba(247,151,30,0.06);
	}
	.hist-del-btn {
		border: 1px solid #e05252; color: #e05252;
		background: rgba(224,82,82,0.06);
	}

	/* 详情弹窗：画布图片区 */
	.detail-img-wrap {
		background: #f8f8f8; border-radius: 12px;
		padding: 8px; margin-bottom: 14px;
		display: flex; align-items: center; justify-content: center;
	}
	.detail-img {
		width: 100%; max-height: 220px;
		border-radius: 8px; display: block;
	}
</style>
