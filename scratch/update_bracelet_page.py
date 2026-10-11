# -*- coding: utf-8 -*-
import os

file_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystems\frontend\pages\BraceletData\BraceletData.vue"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. 替换 showReport 模板为 showHistoryModal
report_start = content.find('<!-- 健康数据报告弹窗 -->')
if report_start == -1:
    report_start = content.find('<view v-if="showReport"')

report_end = content.find('</view>\n	</view>\n</template>')
if report_end == -1:
    report_end = content.find('</view>\r\n	</view>\r\n</template>')
if report_end == -1:
    report_end = content.find('</view>\n</template>')

print(f"report_start: {report_start}, report_end: {report_end}")

history_template = """		<!-- 历史数据可视化弹窗 -->
		<view v-if="showHistoryModal" class="history-modal-mask" @click.self="closeHistoryModal">
			<view class="history-modal-dialog">
				<!-- 弹窗头部 -->
				<view class="history-modal-header">
					<view class="history-header-left">
						<text class="history-header-icon">📈</text>
						<view class="history-title-wrap">
							<text class="history-modal-title">{{ $t('bracelet.historyData') || '历史数据' }}</text>
							<text class="history-modal-sub">多维手环健康生理指标趋势与以往记录</text>
						</view>
					</view>
					<view class="history-close-btn" @click="closeHistoryModal">
						<text class="history-close-icon">✕</text>
					</view>
				</view>

				<!-- 时间范围切换 Tab -->
				<view class="period-tabs-bar">
					<view class="period-tab" :class="{ active: historyPeriod === 7 }" @click="switchPeriod(7)">
						近 7 天
					</view>
					<view class="period-tab" :class="{ active: historyPeriod === 14 }" @click="switchPeriod(14)">
						近 14 天
					</view>
					<view class="period-tab" :class="{ active: historyPeriod === 30 }" @click="switchPeriod(30)">
						近 30 天
					</view>
				</view>

				<!-- 指标分类横向切换 Tab -->
				<scroll-view scroll-x class="metric-tabs-scroll" :show-scrollbar="false">
					<view class="metric-tabs-track">
						<view class="metric-tab" :class="{ active: activeMetricTab === 'steps' }" @click="switchMetricTab('steps')">
							<text class="metric-tab-icon">🏃</text>
							<text class="metric-tab-title">步数运动</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'heartrate' }" @click="switchMetricTab('heartrate')">
							<text class="metric-tab-icon">❤️</text>
							<text class="metric-tab-title">心率</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'sleep' }" @click="switchMetricTab('sleep')">
							<text class="metric-tab-icon">🌙</text>
							<text class="metric-tab-title">睡眠</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'bodybattery' }" @click="switchMetricTab('bodybattery')">
							<text class="metric-tab-icon">⚡</text>
							<text class="metric-tab-title">身体电量</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'stress' }" @click="switchMetricTab('stress')">
							<text class="metric-tab-icon">🧘</text>
							<text class="metric-tab-title">压力</text>
						</view>
						<view class="metric-tab" :class="{ active: activeMetricTab === 'spo2' }" @click="switchMetricTab('spo2')">
							<text class="metric-tab-icon">🩸</text>
							<text class="metric-tab-title">血氧</text>
						</view>
					</view>
				</scroll-view>

				<!-- 弹窗可滚动展示区域 -->
				<scroll-view scroll-y class="history-scroll-content">
					<!-- KPI 汇总卡片 -->
					<view class="kpi-summary-card">
						<view class="kpi-item">
							<text class="kpi-label">{{ currentMetricSummary.kpi1Label }}</text>
							<view class="kpi-val-row">
								<text class="kpi-value" :style="{ color: currentMetricSummary.themeColor }">{{ currentMetricSummary.kpi1Val }}</text>
								<text class="kpi-unit">{{ currentMetricSummary.kpi1Unit }}</text>
							</view>
						</view>
						<view class="kpi-divider"></view>
						<view class="kpi-item">
							<text class="kpi-label">{{ currentMetricSummary.kpi2Label }}</text>
							<view class="kpi-val-row">
								<text class="kpi-value" :style="{ color: currentMetricSummary.themeColor }">{{ currentMetricSummary.kpi2Val }}</text>
								<text class="kpi-unit">{{ currentMetricSummary.kpi2Unit }}</text>
							</view>
						</view>
						<view class="kpi-divider"></view>
						<view class="kpi-item">
							<text class="kpi-label">{{ currentMetricSummary.kpi3Label }}</text>
							<view class="kpi-val-row">
								<text class="kpi-value" :style="{ color: currentMetricSummary.themeColor }">{{ currentMetricSummary.kpi3Val }}</text>
								<text class="kpi-unit">{{ currentMetricSummary.kpi3Unit }}</text>
							</view>
						</view>
					</view>

					<!-- 可视化趋势柱状图 -->
					<view class="chart-visual-card">
						<view class="chart-card-header">
							<view class="chart-header-left">
								<text class="chart-header-dot" :style="{ backgroundColor: currentMetricSummary.themeColor }"></text>
								<text class="chart-header-title">{{ currentMetricSummary.chartTitle }}</text>
							</view>
							<text class="chart-header-subtitle">单位: {{ currentMetricSummary.unit }}</text>
						</view>

						<!-- 柱状图主图 -->
						<view class="bar-chart-container" v-if="chartBars.length > 0">
							<view class="bars-flex-wrap">
								<view 
									v-for="(bar, index) in chartBars" 
									:key="index"
									class="bar-column-item"
									:class="{ active: selectedBarIndex === index }"
									@click="selectBar(index)"
								>
									<!-- 柱顶数值 -->
									<text class="bar-top-value">{{ bar.valueText }}</text>
									<!-- 柱体轨道与填充 -->
									<view class="bar-track">
										<view 
											class="bar-fill" 
											:style="{ 
												height: bar.heightPercent + '%', 
												background: currentMetricSummary.barGradient,
												boxShadow: bar.isPeak ? '0 0 10rpx ' + currentMetricSummary.themeColor : 'none'
											}"
										>
											<view v-if="bar.isPeak" class="peak-dot"></view>
										</view>
									</view>
									<!-- 底部日期标签 -->
									<text class="bar-date-label">{{ bar.dateLabel }}</text>
								</view>
							</view>
						</view>
						<view v-else class="chart-empty-placeholder">
							<text class="chart-empty-icon">📊</text>
							<text class="chart-empty-text">近 {{ historyPeriod }} 天暂未查询到该项走势数据</text>
						</view>
					</view>

					<!-- 历史详细记录列表 -->
					<view class="history-list-section">
						<view class="list-section-header">
							<text class="list-section-title">以往数据记录明细</text>
							<text class="list-section-count">共 {{ currentHistoryRecords.length }} 条记录</text>
						</view>

						<view v-if="currentHistoryRecords.length > 0" class="history-record-cards">
							<view 
								v-for="(rec, idx) in currentHistoryRecords" 
								:key="idx"
								class="history-rec-card"
							>
								<view class="rec-card-top">
									<view class="rec-date-pill">
										<text class="rec-cal-icon">📅</text>
										<text class="rec-date-text">{{ rec.dateStr }}</text>
									</view>
									<view :class="['rec-status-badge', rec.statusBadge.cls]">
										{{ rec.statusBadge.text }}
									</view>
								</view>

								<view class="rec-grid-metrics">
									<view v-for="(metric, mIdx) in rec.metrics" :key="mIdx" class="rec-metric-cell">
										<text class="cell-label">{{ metric.label }}</text>
										<view class="cell-val-row">
											<text class="cell-val" :style="{ color: metric.color || '#333' }">{{ metric.value }}</text>
											<text class="cell-unit">{{ metric.unit }}</text>
										</view>
									</view>
								</view>
							</view>
						</view>

						<view v-else class="history-empty-card">
							<text class="empty-icon">📂</text>
							<text class="empty-title">暂无以往历史记录</text>
							<text class="empty-desc">点击下方按钮可实时拉取当前账号在 Garmin Connect 平台的手环健康数据！</text>
							<button class="empty-sync-btn" @click="handleUpdateFromHistory">立即同步数据</button>
						</view>
					</view>

					<view class="history-footer-note">
						<text class="footer-note-text">数据来源：Garmin Connect 智能手环实时健康指标库</text>
					</view>
				</scroll-view>
			</view>
		</view>"""

if report_start != -1 and report_end != -1:
    content = content[:report_start] + history_template + "\n	" + content[report_end:]
    print("Successfully replaced report modal template with history modal template!")

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)
