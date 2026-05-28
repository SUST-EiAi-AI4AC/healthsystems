<template>
	<view class="heal-page">
		<!-- Tab 标签栏 -->
		<view class="tab-bar">
			<view
				v-for="(tab, index) in tabs"
				:key="index"
				class="tab-item"
				:class="{ active: currentTab === index }"
				@click="switchTab(index)"
			>
				<text class="tab-text">{{ tab }}</text>
				<view class="tab-indicator" v-if="currentTab === index"></view>
			</view>
		</view>

		<!-- 滑动内容区 -->
		<swiper
			class="tab-content"
			:current="currentTab"
			@change="onSwiperChange"
			duration="300"
			:disable-touch="swiperDisableTouch"
		>
			<!-- 聊天页 -->
			<swiper-item class="swiper-item">
				<view class="chat-wrapper">
					<!-- 顶部横幅 -->
					<view class="chat-banner">
						<image class="chat-banner-avatar" src="https://www.keaitupian.cn/cjpic/frombd/1/253/56496682/3498759028.jpg" mode="aspectFill" />
						<view class="chat-banner-info">
							<view class="chat-banner-title-row">
								<text class="chat-banner-name">心晴</text>
								<view class="chat-banner-tag">AI 心理助手</view>
								<!-- 在线状态贴靠 AI 心理助手标签 -->
								<view class="chat-banner-status-inline">
									<view class="chat-banner-dot online"></view>
									<text class="chat-banner-online-text">在线</text>
								</view>
							</view>
							<text class="chat-banner-desc">24h专业倾听，温暖陪伴，随时为你解忧 🌸</text>
						</view>
						<!-- 历史对话入口按钮 -->
						<view class="history-entry-btn" @click="openHistoryPanel">
							<text class="history-entry-icon">🕐</text>
							<text class="history-entry-text">历史</text>
						</view>
					</view>

					<!-- 聊天记录滚动区 -->
					<scroll-view scroll-y class="chat-messages" :scroll-top="scrollTop" scroll-with-animation>
						<view
							v-for="(msg, idx) in chatMessages"
							:key="idx"
							class="message-row"
							:class="msg.role === 'user' ? 'message-right' : 'message-left'"
						>
							<!-- AI 头像（左侧） -->
							<image
								v-if="msg.role === 'ai'"
								class="avatar ai-avatar"
								src="https://www.keaitupian.cn/cjpic/frombd/1/253/56496682/3498759028.jpg"
								mode="aspectFill"
							/>
							<!-- 消息气泡 -->
							<view class="bubble" :class="msg.role === 'user' ? 'bubble-user' : 'bubble-ai'">
								<image v-if="msg.type === 'image'" class="msg-image" :src="msg.src" mode="widthFix" />
								<!-- AI 思考中：三点波浪动画 -->
								<view v-else-if="msg.isThinking" class="thinking-dots">
									<span class="dot"></span>
									<span class="dot"></span>
									<span class="dot"></span>
								</view>
								<!-- AI 打字中：文字 + 光标 -->
								<view v-else-if="msg.isTyping" class="typing-wrap">
									<text class="bubble-text">{{ msg.text }}</text><text class="cursor-blink">|</text>
								</view>
								<!-- 普通文字 -->
								<text v-else class="bubble-text">{{ msg.text }}</text>
							</view>
							<!-- 用户头像（右侧） -->
							<image
								v-if="msg.role === 'user'"
								class="avatar user-avatar"
								:src="userAvatar"
								mode="aspectFill"
							/>
						</view>
						<view class="msg-bottom-anchor"></view>
					</scroll-view>
							
					</view>
				</swiper-item>

				<!-- 日记页 -->
			<swiper-item class="swiper-item">
				<scroll-view :scroll-y="!diaryScrollLocked" class="game-page diary-page-scroll">
					<!-- 顶部日期 -->
					<view class="diary-header">
						<text class="diary-today-label">今天</text>
						<text class="diary-today-date">{{ todayStr }}</text>
					</view>

					<!-- 今日写日记入口 -->
					<view class="diary-write-card">
						<view class="diary-mood-row">
							<text class="diary-mood-label">今日心情</text>
							<view class="mood-selector">
								<text
									v-for="(m, idx) in moods"
									:key="idx"
									class="mood-emoji"
									:class="{ 'mood-selected': selectedMood === idx }"
									@click.stop="selectedMood = idx"
								>{{ m.emoji }}</text>
							</view>
						</view>
						<view class="diary-input-row">
							<view class="diary-placeholder" @click="showDiaryModal = true">
								<text class="diary-placeholder-text">{{ selectedDiaryText || '记录此刻的心情...' }}</text>
							</view>
						</view>
					</view>

					<!-- 日记列表 -->
					<view class="diary-list">
						<text class="section-title">往日记录</text>
						<!-- 左滑删除容器 -->
						<view
							v-for="(entry, idx) in diaryEntries"
							:key="idx"
							class="diary-swipe-wrap"
							@touchstart="onEntryTouchStart($event, idx)"
							@touchmove="onEntryTouchMove($event, idx)"
							@touchend="onEntryTouchEnd($event, idx)"
							@touchcancel="onEntryTouchEnd($event, idx)"
						>
							<!-- 滑动内容层 -->
							<view
								class="diary-entry diary-entry-slide"
								:style="{ transform: 'translateX(' + (swipeOffsets[idx] || 0) + 'px)' }"
								@click="onEntryClick(idx)"
							>
								<view class="diary-entry-left">
									<text class="diary-entry-emoji">{{ moods[entry.moodIndex].emoji }}</text>
								</view>
								<view class="diary-entry-body">
									<view class="diary-entry-top">
										<text class="diary-entry-date">{{ entry.date }}</text>
										<text class="diary-entry-mood-name">{{ moods[entry.moodIndex].label }}</text>
									</view>
									<text class="diary-entry-content">{{ entry.content }}</text>
									<!-- 图片预览行 -->
									<scroll-view scroll-x class="diary-img-row" v-if="entry.images && entry.images.length">
										<image
											v-for="(img, i) in entry.images"
											:key="i"
											class="diary-img-small"
											:src="img"
											mode="aspectFill"
										/>
									</scroll-view>
								</view>
							</view>
							<!-- 左滑露出的删除按钮 -->
							<view class="diary-swipe-del" @click.stop="deleteDiary(idx)">
								<text class="diary-swipe-del-text">删除</text>
							</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>

			<!-- 游戏页 -->
			<swiper-item class="swiper-item">
				<scroll-view scroll-y class="game-page">
					<!-- 顶部标题区 -->
					<view class="game-hero">
						<view class="game-hero-bg">
							<image class="game-hero-img" src="https://image.9game.cn/s/9game/g/2021/1/28/207154297.png" mode="aspectFill"></image>
						</view>
						<view class="game-hero-info">
							<text class="game-hero-title">神庙逃亡 2</text>
							<text class="game-hero-sub">Holi Festival · 跑酷闯关</text>
							<view class="game-hero-tags">
								<view class="game-tag">🎯 动作</view>
								<view class="game-tag">⚡ 跑酷</view>
								<view class="game-tag">🌈 节日</view>
							</view>
						</view>
					</view>
									
					<!-- 主启动按钮 -->
					<view class="game-launch-wrap">
						<view class="game-launch-btn" @click="openGameInBrowser">
							<text class="game-launch-icon">▶</text>
							<text class="game-launch-text">开始游戏</text>
						</view>
						<text class="game-launch-hint">将在浏览器中全屏运行</text>
					</view>

					<!-- 游戏介绍 -->
					<view class="game-desc-card">
						<text class="game-desc-title">🎮 游戏简介</text>
						<text class="game-desc-text">神庙逃亡 2 是一款经典无尽跑酷游戏。在 Holi Festival 节日版本中，奔跑在五彩缤纷的世界里，躲避障碍、转弯跳跃，释放压力，享受奔跑的快感！</text>
					</view>

					<!-- 操作指引 -->
					<view class="game-guide-card">
						<text class="game-desc-title">📱 操作说明</text>
						<view class="game-guide-list">
							<view class="game-guide-item">
								<text class="game-guide-icon">👆</text>
								<text class="game-guide-label">上滑 — 跳跃</text>
							</view>
							<view class="game-guide-item">
								<text class="game-guide-icon">👇</text>
								<text class="game-guide-label">下滑 — 下蹲</text>
							</view>
							<view class="game-guide-item">
								<text class="game-guide-icon">👈</text>
								<text class="game-guide-label">左滑 — 左转</text>
							</view>
							<view class="game-guide-item">
								<text class="game-guide-icon">👉</text>
								<text class="game-guide-label">右滑 — 右转</text>
							</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>
		</swiper>
		
				<!-- 输入区（固定定位在底部，位于 heal-page 直接子级以避免 overflow:hidden 破坏 fixed 定位） -->
			<view class="chat-input-area" v-show="currentTab === 0">
				<!-- 表情面板 -->
				<view class="emoji-panel" v-if="showEmojiPanel">
					<view class="emoji-grid">
						<text
							v-for="(e, i) in emojiList"
							:key="i"
							class="emoji-item"
							@click="insertEmoji(e)"
						>{{ e }}</text>
					</view>
				</view>
				<!-- 输入行 -->
				<view class="chat-input-row">
					<view
						class="chat-input-wrap"
						:class="{ 'input-wrap-recording': isRecording, 'input-wrap-transcribing': isTranscribing }"
						@touchstart="onInputTouchStart"
						@touchend="onInputTouchEnd"
						@touchcancel="onInputTouchCancel"
					>
						<!-- 录音状态指示条 -->
						<view class="voice-status-bar" v-if="isRecording || isTranscribing">
							<view v-if="isRecording" class="voice-wave-wrap">
								<view class="voice-wave-bar b1"></view>
								<view class="voice-wave-bar b2"></view>
								<view class="voice-wave-bar b3"></view>
								<view class="voice-wave-bar b4"></view>
								<view class="voice-wave-bar b5"></view>
							</view>
							<text class="voice-status-text">{{ isTranscribing ? '识别中...' : '松开结束 · 上滑取消' }}</text>
						</view>
						<!-- 正常输入框（录音时隐藏） -->
						<textarea
							v-if="!isRecording && !isTranscribing"
							class="chat-input"
							v-model="inputText"
							placeholder="说说你的感受，或长按语音输入..."
							placeholder-style="color:#b0bec5;font-size:0.88em;"
							:auto-height="false"
							maxlength="500"
						/>
						<!-- 表情按钮（输入框内右侧，录音时隐藏） -->
						<view
							v-if="!isRecording && !isTranscribing"
							class="emoji-inline-btn"
							:class="{ 'emoji-inline-active': showEmojiPanel }"
							@click.stop="toggleEmojiPanel"
						>
							<text class="emoji-inline-icon">😊</text>
						</view>
					</view>
					<!-- 语音按钮（发送按钮左侧） -->
					<!-- #ifdef H5 -->
					<view
						class="voice-btn"
						:class="{ 'voice-btn-recording': isRecording, 'voice-btn-pending': isVoicePending }"
						@click.stop="onVoiceClickH5"
					>
						<text class="voice-btn-icon">{{ isRecording ? '⏹' : (isVoicePending ? '⏳' : '🎤') }}</text>
					</view>
					<!-- #endif -->
					<!-- #ifndef H5 -->
					<view
						class="voice-btn"
						:class="{ 'voice-btn-recording': isRecording }"
						@touchstart.prevent="onVoiceTouchStart"
						@touchend.prevent="onVoiceTouchEnd"
						@touchcancel.prevent="onVoiceTouchCancel"
						@click="onVoiceClick"
					>
						<text class="voice-btn-icon">{{ isRecording ? '⏹' : '🎤' }}</text>
					</view>
					<!-- #endif -->
					<view class="send-btn" @click="sendMessage">
						<text class="send-icon">➤</text>
					</view>
				</view>
			</view>

		<!-- 日记页悬浮写日记按钮（右下角 FAB） -->
		<view class="diary-fab-fixed" v-show="currentTab === 1" @click="showDiaryModal = true">
			<text class="fab-icon">✏️</text>
		</view>

		<!-- 日记编辑弹窗 -->
		<view class="modal-mask" v-if="showDiaryModal" @click.self="showDiaryModal = false">
			<view class="modal-box">
				<view class="modal-header">
					<text class="modal-title">写日记</text>
					<text class="modal-close" @click="showDiaryModal = false">✕</text>
				</view>
				<view class="modal-mood-row">
					<text
						v-for="(m, idx) in moods"
						:key="idx"
						class="mood-emoji modal-mood"
						:class="{ 'mood-selected': selectedMood === idx }"
						@click="selectedMood = idx"
					>{{ m.emoji }}</text>
				</view>
				<textarea
					class="modal-textarea"
					v-model="newDiaryText"
					placeholder="今天发生了什么？有什么感受想记录下来？"
					placeholder-style="color:#b0bec5"
					maxlength="500"
				/>
				<!-- 图片上传区 -->
				<view class="modal-image-area">
					<view
						v-for="(img, i) in newDiaryImages"
						:key="i"
						class="modal-img-thumb-wrap"
					>
						<image class="modal-img-thumb" :src="img" mode="aspectFill" />
						<view class="modal-img-del" @click.stop="removeNewImage(i)">✕</view>
					</view>
					<view v-if="newDiaryImages.length < 9" class="modal-img-add" @click="chooseNewDiaryImage">
						<text class="modal-img-add-icon">+</text>
					</view>
				</view>
				<view class="modal-footer">
					<view class="modal-cancel-btn" @click="showDiaryModal = false">取消</view>
					<view class="modal-save-btn" @click="saveDiary">保存</view>
				</view>
			</view>
		</view>

		<!-- 编辑日记弹窗 -->
		<view class="modal-mask" v-if="showEditModal" @click.self="showEditModal = false">
			<view class="modal-box">
				<view class="modal-header">
					<text class="modal-title">编辑日记</text>
					<text class="modal-close" @click="showEditModal = false">✕</text>
				</view>
				<view class="modal-mood-row">
					<text
						v-for="(m, idx) in moods"
						:key="idx"
						class="mood-emoji modal-mood"
						:class="{ 'mood-selected': editMood === idx }"
						@click="editMood = idx"
					>{{ m.emoji }}</text>
				</view>
				<textarea
					class="modal-textarea"
					v-model="editDiaryText"
					placeholder="修改日记内容..."
					placeholder-style="color:#b0bec5"
					maxlength="500"
				/>
				<!-- 图片上传区 -->
				<view class="modal-image-area">
					<view
						v-for="(img, i) in editDiaryImages"
						:key="i"
						class="modal-img-thumb-wrap"
					>
						<image class="modal-img-thumb" :src="img" mode="aspectFill" />
						<view class="modal-img-del" @click.stop="removeEditImage(i)">✕</view>
					</view>
					<view v-if="editDiaryImages.length < 9" class="modal-img-add" @click="chooseEditDiaryImage">
						<text class="modal-img-add-icon">+</text>
					</view>
				</view>
				<view class="modal-footer">
					<view class="modal-cancel-btn" @click="showEditModal = false">取消</view>
					<view class="modal-save-btn" @click="saveEdit">保存修改</view>
				</view>
			</view>
		</view>

		<!-- 历史对话面板（fixed 浮层，挂在根节点避免 overflow 裁剪） -->
		<view class="history-panel-mask" v-if="showHistoryPanel" @click.self="showHistoryPanel = false">
			<view class="history-panel">
				<view class="history-panel-header">
					<text class="history-panel-title">历史对话</text>
					<view class="history-new-btn" @click="startNewSession">新对话</view>
					<text class="history-panel-close" @click="showHistoryPanel = false">✕</text>
				</view>
				<scroll-view scroll-y class="history-list">
					<view v-if="isLoadingHistory" class="history-loading">
						<text>加载中...</text>
					</view>
					<view v-else-if="historySessionList.length === 0" class="history-empty">
						<text>暂无历史对话</text>
						<text class="history-empty-hint">点击下方“保存当前对话”保存记录</text>
					</view>
					<view
						v-for="s in historySessionList"
						:key="s.id"
						class="history-item"
						:class="{ 'history-item-active': currentSessionId === s.id }"
						@click="loadSession(s.id)"
					>
						<view class="history-item-left">
							<text class="history-item-title">💬 {{ s.title }}</text>
							<text class="history-item-time">{{ formatHistoryTime(s.updatedAt) }}</text>
						</view>
						<text class="history-item-del" @click.stop="deleteSession(s.id)">🗑</text>
					</view>
				</scroll-view>
				<view class="history-panel-footer">
					<view class="history-save-btn" @click="saveCurrentSession">
						<text>💾 保存当前对话</text>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
import config from '@/nxTemp/config/index.config.js';
import http from '@/nxTemp/config/requestConfig';
export default {
	data() {
		const DEFAULT_USER_AVATAR = 'https://api.dicebear.com/7.x/lorelei/svg?seed=Alex&backgroundColor=c8f0d8';
		const now = new Date();
		const pad = n => String(n).padStart(2, '0');
		const todayStr = `${now.getFullYear()}年${pad(now.getMonth() + 1)}月${pad(now.getDate())}日`;
		return {
			tabs: ['聊天', '日记', '游戏'],
			currentTab: 0,

			// --- 聊天 ---
			inputText: '',
			scrollTop: 0,
			showEmojiPanel: false,
			isRecording: false,
			isVoicePending: false,   // H5等待麦克风权限中
			isTranscribing: false,   // 识别中状态
			voiceCancelled: false,   // 是否取消录音
			voiceTouchStartY: 0,     // 记录触摸起始 Y 坐标
			voiceMode: 'fill',       // 'fill'：识别后填入输入框 | 'send'：识别后直接发送
			recorderManager: null,
			typingTimer: null,  // 打字机定时器
			isSending: false,   // 防止重复发送
			userAvatar: uni.getStorageSync('userAvatar') || DEFAULT_USER_AVATAR,
			emojiList: [
				'🌸','🌿','🌙','✨','🌟','💫','🌈','✨️',
				'🧘','💪','💙','💚','💜','🤍','🧠','🏠',
				'🌻','🍊','🍜','☕','🍃','🌊','🕊','🐢',
				'😊','😄','😍','🤩','🙂','😐'
			],
			chatMessages: [
				{ role: 'ai', text: '你好呀 🌸 我是心晴，你的专属心理助手。今天感觉怎么样？有什么想聊的吗？' }
			],

			// --- 历史对话 ---
			showHistoryPanel: false,
			historySessionList: [],
			currentSessionId: null,
			isLoadingHistory: false,

			// --- 日记 ---
			todayStr,
			moods: [
				{ emoji: '😄', label: '开心' },
				{ emoji: '😊', label: '平静' },
				{ emoji: '😐', label: '一般' },
				{ emoji: '😔', label: '难过' },
				{ emoji: '😰', label: '焦虑' }
			],
			selectedMood: 1,
			showDiaryModal: false,
			newDiaryText: '',
			newDiaryImages: [],       // 新建日记时已选图片（tempFilePaths）
			selectedDiaryText: '',
			diaryEntries: [], // 数据从后端拉取，每条包含 id、date、moodIndex、content、images 字段
			// --- 编辑弹窗 ---
			showEditModal: false,
			editingIndex: -1,
			editDiaryText: '',
			editMood: 0,
			editDiaryImages: [],
			// --- 左滑删除 ---
			swipeOffsets: {},      // idx -> 当前 translateX 偏移量（负数）
			diaryScrollLocked: false, // 水平拖动时锁定 scroll-view 垂直滚动
			swiperDisableTouch: false, // 水平拖动时禁用 swiper 横向切换
			_swipeTouchStartX: 0, // 触摸起始X
			_swipeTouchStartY: 0, // 触摸起始Y
			_swipeActiveIdx: -1,  // 当前操作的条目索引
			_swipeIsDragging: false,
			_swipePassedThreshold: false // 是否判定为水平滑动
		};
	},

	onLoad(options) {
		if (options && options.tab !== undefined) {
			this.currentTab = parseInt(options.tab) || 0;
		}
		this.loadDiariesFromStorage();
	},

	onShow() {
		// 每次进入页面同步用户头像
		const saved = uni.getStorageSync('userAvatar');
		if (saved) this.userAvatar = saved;
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
		openGameInBrowser() {
			// #ifdef H5
			window.open('https://poki.com/zh/g/temple-run-2-holi-festival#fullscreen', '_blank');
			// #endif
			// #ifndef H5
			uni.navigateTo({
				url: '/pages/pagerouters/GameWebview?url=' + encodeURIComponent('https://poki.com/zh/g/temple-run-2-holi-festival#fullscreen')
			});
			// #endif
		},
		onSwiperChange(e) {
			this.currentTab = e.detail.current;
		},

		// 聊天
		async sendMessage() {
			const text = this.inputText.trim();
			if (!text || this.isSending) return;
			this.isSending = true;
			this.showEmojiPanel = false;
			this.chatMessages.push({ role: 'user', text });
			this.inputText = '';
			this.$nextTick(() => { this.scrollToBottom(); });
			
			// 展示思考动画气泡
			const thinkingMsgIndex = this.chatMessages.length;
			this.chatMessages.push({ role: 'ai', text: '', isThinking: true });
			this.$nextTick(() => { this.scrollToBottom(); });
			
			try {
				const aiResponse = await this.callMiniMaxAI(text);
				// 思考结束，切换成打字现场
				this.chatMessages[thinkingMsgIndex].isThinking = false;
				this.chatMessages[thinkingMsgIndex].isTyping = true;
				this.chatMessages[thinkingMsgIndex].text = '';
				await this.typewriterEffect(thinkingMsgIndex, aiResponse);
				// 如果当前已有保存的会话，自动将最新一问一答追加保存
				if (this.currentSessionId) {
					this.appendMessagesToSession([
						{ role: 'user', content: text, msgType: 'text' },
						{ role: 'ai', content: aiResponse, msgType: 'text' }
					]);
				}
			} catch (error) {
				console.error('AI 调用失败:', error);
				this.chatMessages[thinkingMsgIndex].isThinking = false;
				this.chatMessages[thinkingMsgIndex].isTyping = false;
				this.chatMessages[thinkingMsgIndex].text = '抱歉，我现在有些不舒服，稍后再聊好吗？🌸';
			} finally {
				this.isSending = false;
			}
			
			this.$nextTick(() => { this.scrollToBottom(); });
		},
		
		// 打字机效果：批量写入，速度 30ms/帧（约33字/秒），支持最多 200 字
		typewriterEffect(msgIndex, fullText) {
			return new Promise(resolve => {
				if (this.typingTimer) {
					clearInterval(this.typingTimer);
					this.typingTimer = null;
				}
				let charIndex = 0;
				const speed = 30; // ms 每帧间隔，约33字/秒
				// 根据文本长度动态调整每帧写入字数，保持流畅
				const batchSize = fullText.length > 100 ? 2 : 1;
				this.typingTimer = setInterval(() => {
					if (charIndex < fullText.length) {
						charIndex = Math.min(charIndex + batchSize, fullText.length);
						this.chatMessages[msgIndex].text = fullText.substring(0, charIndex);
						// 每输出 8 字滚动一次，减少重排频率
						if (charIndex % 8 === 0) {
							this.$nextTick(() => { this.scrollToBottom(); });
						}
					} else {
						clearInterval(this.typingTimer);
						this.typingTimer = null;
						// 打字完成，关闭光标
						this.chatMessages[msgIndex].isTyping = false;
						this.$nextTick(() => { this.scrollToBottom(); });
						resolve();
					}
				}, speed);
			});
		},
		
		// 调用 MiniMax-M2.5 AI 模型
		async callMiniMaxAI(userMessage) {
			const apiKey = 'ms-80675032-298f-41ee-a768-8b6e2be32c98';
			const apiUrl = 'https://api-inference.modelscope.cn/v1/chat/completions';

			const recentMessages = this.chatMessages
				.filter(msg => msg.role === 'user' || msg.role === 'ai')
				.slice(-6);

			const messages = [
				{
					role: 'system',
					content: '你是专业的心理健康助手心晴，擅长共情和安抚对话。回复要温暖贴心，带适当表情符号，控制在 200 字以内。理解用户的情感状态，给予支持和鼓励。'
				},
				...recentMessages.map(msg => ({
					role: msg.role === 'user' ? 'user' : 'assistant',
					content: msg.text
				})),
				{ role: 'user', content: userMessage }
			];

			try {
				const response = await fetch(apiUrl, {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json',
						'Authorization': `Bearer ${apiKey}`
					},
					body: JSON.stringify({
						model: 'MiniMax/MiniMax-M2.5',
						messages: messages,
						max_tokens: 300,
						temperature: 0.7,
						stream: false
					})
				});

				if (!response.ok) {
					const errorText = await response.text();
					console.error(`MiniMax API Error: ${response.status} - ${errorText}`);
					throw new Error(`HTTP error! status: ${response.status}`);
				}

				const data = await response.json();
				const aiContent = data.choices?.[0]?.message?.content || '我在听，请继续说 🌿';

				let cleanedContent = aiContent.trim();
				cleanedContent = cleanedContent.replace(/[\u{1F000}-\u{1FFFF}\u{2600}-\u{27BF}\u{FE00}-\u{FEFF}\u{1F300}-\u{1F9FF}\u{2300}-\u{23FF}]+$/u, '').trimEnd();
				if (cleanedContent.length > 200) {
					cleanedContent = cleanedContent.substring(0, 200) + '...';
				}

				return cleanedContent;
			} catch (error) {
				console.error('MiniMax API 调用错误:', error);
				throw error;
			}
		},
		scrollToBottom() {
			this.scrollTop = 99999;
		},

		// ================================================================
		// 历史对话功能
		// ================================================================

		// 获取后端 API 基址
		getApiBase() {
			return config.baseUrl;
		},
		// 获取登录 Token
		getToken() {
			return uni.getStorageSync('token') || '';
		},

		// 打开历史面板并拉取会话列表
		async openHistoryPanel() {
			this.showHistoryPanel = true;
			await this.fetchSessionList();
		},

		// 拉取当前用户的全部会话列表
		async fetchSessionList() {
			const token = this.getToken();
			if (!token) {
				uni.showToast({ title: '请先登录', icon: 'none' });
				return;
			}
			this.isLoadingHistory = true;
			try {
				const data = await this.uniRequest('GET', '/ai-chat/session/list', null);
				if (data.code === 200) {
					this.historySessionList = data.result || [];
				} else {
					uni.showToast({ title: data.message || '获取历史失败', icon: 'none' });
				}
			} catch (e) {
				console.error('[AiChat] fetchSessionList', e);
				uni.showToast({ title: '网络异常，请重试', icon: 'none' });
			} finally {
				this.isLoadingHistory = false;
			}
		},

		// 保存当前对话：先创建会话，再批量写入消息
		async saveCurrentSession() {
			const token = this.getToken();
			if (!token) {
				uni.showToast({ title: '请先登录', icon: 'none' });
				return;
			}
			// 过滤掉思考中 / 打字中的气泡
			const validMsgs = this.chatMessages.filter(
				m => !m.isThinking && !m.isTyping && (m.text || m.src)
			);
			if (validMsgs.length <= 1) {
				uni.showToast({ title: '还没有对话内容可保存，先老聊两句吧 🌸', icon: 'none', duration: 2000 });
				return;
			}
			uni.showLoading({ title: '保存中...' });
			try {
				// Step 1: 创建新会话
				const createData = await this.uniRequest('POST', '/ai-chat/session/create', null);
				if (createData.code !== 200) {
					uni.showToast({ title: createData.message || '创建会话失败', icon: 'none' });
					return;
				}
				const newSessionId = createData.result;
				// Step 2: 批量保存消息
				const messages = validMsgs.map(m => ({
					role: m.role,
					content: m.type === 'image' ? '[[图片]]' : (m.text || ''),
					msgType: m.type === 'image' ? 'image' : 'text'
				}));
				const saveData = await this.uniRequest('POST', '/ai-chat/message/save', { sessionId: newSessionId, messages });
				if (saveData.code !== 200) {
					uni.showToast({ title: saveData.message || '保存消息失败', icon: 'none' });
					return;
				}
				this.currentSessionId = newSessionId;
				// 刷新列表
				await this.fetchSessionList();
				uni.showToast({ title: '对话已保存 🌸', icon: 'success' });
			} catch (e) {
				console.error('[AiChat] saveCurrentSession', e);
				uni.showToast({ title: '网络异常，保存失败', icon: 'none' });
			} finally {
				uni.hideLoading();
			}
		},

		// 将新的消息批量追加到当前会话（内部方法，对用户沉默）
		async appendMessagesToSession(msgs) {
			const token = this.getToken();
			if (!token || !this.currentSessionId) return;
			try {
				await this.uniRequest('POST', '/ai-chat/message/save', { sessionId: this.currentSessionId, messages: msgs });
			} catch (e) {
				console.error('[AiChat] appendMessagesToSession', e);
			}
		},

		// 加载某会话的消息并替换当前聊天记录
		async loadSession(sessionId) {
			const token = this.getToken();
			if (!token) {
				uni.showToast({ title: '请先登录', icon: 'none' });
				return;
			}
			uni.showLoading({ title: '加载中...' });
			try {
				const data = await this.uniRequest('GET', `/ai-chat/message/list?sessionId=${sessionId}`, null);
				if (data.code !== 200) {
					uni.showToast({ title: data.message || '加载失败', icon: 'none' });
					return;
				}
				const rawMsgs = data.result || [];
				// 将数据库消息格式转换为前端 chatMessages 格式
				this.chatMessages = rawMsgs.map(m => ({
					role: m.role,
					text: m.content,
					type: m.msgType === 'image' ? 'image' : undefined,
					src: m.msgType === 'image' ? m.content : undefined
				}));
				if (this.chatMessages.length === 0) {
					this.chatMessages = [{ role: 'ai', text: '这条对话记录为空呢' }];
				}
				this.currentSessionId = sessionId;
				this.showHistoryPanel = false;
				this.$nextTick(() => { this.scrollToBottom(); });
				uni.showToast({ title: '对话已恢复 💬', icon: 'success' });
			} catch (e) {
				console.error('[AiChat] loadSession', e);
				uni.showToast({ title: '网络异常，加载失败', icon: 'none' });
			} finally {
				uni.hideLoading();
			}
		},

		// 新建对话：清空聊天记录，重置会话ID
		startNewSession() {
			this.currentSessionId = null;
			this.chatMessages = [
				{ role: 'ai', text: '好的，已开始新的对话 🌸 有什么想聊吗？' }
			];
			this.showHistoryPanel = false;
			this.$nextTick(() => { this.scrollToBottom(); });
		},

		// 删除指定会话
		async deleteSession(sessionId) {
			const token = this.getToken();
			if (!token) return;
			uni.showModal({
				title: '确认删除',
				content: '确定删除这条对话记录吗？删除后无法恢复',
				success: async (res) => {
					if (!res.confirm) return;
					try {
						const delData = await this.uniRequest('DELETE', `/ai-chat/session/${sessionId}`, null);
						if (delData.code === 200) {
							// 如果删除的是当前加载的会话，重置聊天
							if (this.currentSessionId === sessionId) {
								this.currentSessionId = null;
							}
							uni.showToast({ title: '已删除', icon: 'success' });
							await this.fetchSessionList();
						} else {
							uni.showToast({ title: delData.message || '删除失败', icon: 'none' });
						}
					} catch (e) {
						console.error('[AiChat] deleteSession', e);
						uni.showToast({ title: '网络异常', icon: 'none' });
					}
				}
			});
		},

		// 封装 uni.request 为 Promise（兼容 H5 / App / 小程序）
		uniRequest(method, path, data) {
			const token = this.getToken();
			const url = `${this.getApiBase()}${path}`;
			console.log('[AiChat] uniRequest', method, url, 'token=', token ? token.substring(0, 20) + '...' : '(empty)');
			return new Promise((resolve, reject) => {
				uni.request({
					url: url,
					method: method,
					header: {
						'Authorization': token,
						'Content-Type': 'application/json'
					},
					data: (data != null) ? data : undefined,
					success(res) {
						console.log('[AiChat] uniRequest success', method, path, 'statusCode=', res.statusCode, 'data=', JSON.stringify(res.data).substring(0, 200));
						if (res.statusCode === 200 && res.data && typeof res.data === 'object') {
							if (res.data.code === 200 || res.data.code === 400) {
								resolve(res.data);
								return;
							}
						}
						if (res.statusCode === 401 || res.statusCode === 403) {
							resolve({ code: res.statusCode, message: '登录状态已过期，请重新登录' });
						} else {
							resolve({ code: res.statusCode || 500, message: `服务器错误(${res.statusCode})` });
						}
					},
					fail(err) {
						console.error('[AiChat] uniRequest fail', method, path, err);
						reject(err);
					}
				});
			});
		},

		// 历史时间格式化
		formatHistoryTime(ts) {
			if (!ts) return '';
			const d = new Date(ts);
			const now = new Date();
			const pad = n => String(n).padStart(2, '0');
			const isSameDay = d.toDateString() === now.toDateString();
			if (isSameDay) {
				return `${pad(d.getHours())}:${pad(d.getMinutes())}`;
			}
			const yesterday = new Date(now);
			yesterday.setDate(now.getDate() - 1);
			if (d.toDateString() === yesterday.toDateString()) {
				return `昨天 ${pad(d.getHours())}:${pad(d.getMinutes())}`;
			}
			return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`;
		},

		chooseImage() {
			uni.chooseImage({
				count: 1,
				sizeType: ['compressed'],
				sourceType: ['album', 'camera'],
				success: (res) => {
					const src = res.tempFilePaths[0];
					this.chatMessages.push({ role: 'user', type: 'image', src });
					this.$nextTick(() => { this.scrollToBottom(); });
					
					// 展示思考动画气泡
					const thinkingMsgIndex = this.chatMessages.length;
					this.chatMessages.push({ role: 'ai', text: '', isThinking: true });
					this.$nextTick(() => { this.scrollToBottom(); });
					
					// AI 对图片的回复
					setTimeout(async () => {
						try {
							const aiResponse = await this.callMiniMaxAI('我分享了一张图片给你');
							this.chatMessages[thinkingMsgIndex].isThinking = false;
							this.chatMessages[thinkingMsgIndex].isTyping = true;
							this.chatMessages[thinkingMsgIndex].text = '';
							await this.typewriterEffect(thinkingMsgIndex, aiResponse);
						} catch (error) {
							this.chatMessages[thinkingMsgIndex].isThinking = false;
							this.chatMessages[thinkingMsgIndex].isTyping = false;
							this.chatMessages[thinkingMsgIndex].text = '我看到你分享的图片了 👀 有什么想说的吗？';
						}
						this.$nextTick(() => { this.scrollToBottom(); });
					}, 600);
				}
			});
		},
		toggleVoice() {
			if (this.isRecording) {
				this.stopVoice();
			} else {
				this.startVoice();
			}
		},
		startVoice() {
			// #ifdef H5
			this._startVoiceH5();
			// #endif
			// #ifndef H5
			this._startVoiceApp();
			// #endif
		},
		stopVoice() {
			// #ifdef H5
			this._stopVoiceH5();
			// #endif
			// #ifndef H5
			if (this.recorderManager) { this.recorderManager.stop(); }
			// #endif
		},

		// === App 平台录音 (uni.getRecorderManager) ===
		_startVoiceApp() {
			const rm = uni.getRecorderManager();
			this.recorderManager = rm;
			rm.onStart(() => { this.isRecording = true; });
			rm.onStop((res) => {
				this.isRecording = false;
				if (this.voiceCancelled) { this.voiceCancelled = false; return; }
				if (res.tempFilePath) { this.transcribeAudioApp(res.tempFilePath); }
			});
			rm.onError(() => {
				this.isRecording = false;
				uni.showToast({ title: '麦克风权限不足', icon: 'none' });
			});
			rm.start({ duration: 30000, sampleRate: 16000, numberOfChannels: 1, encodeBitRate: 48000, format: 'mp3' });
		},

		// === H5 平台录音 (MediaRecorder Web API) ===
		_startVoiceH5() {
			// 检测浏览器是否支持 MediaDevices API
			// 在HTTP环境（非localhost/127.0.0.1）下，navigator.mediaDevices 可能为 undefined
			const isLocalhost = location.hostname === 'localhost' || location.hostname === '127.0.0.1';
			const isSecure = location.protocol === 'https:';
			if (!isSecure && !isLocalhost) {
				uni.showToast({ title: '请使用HTTPS访问以启用录音', icon: 'none', duration: 2500 });
				return;
			}
			if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
				uni.showToast({ title: '当前浏览器不支持录音，请使用Chrome/Edge', icon: 'none', duration: 2500 });
				return;
			}
			// 标记等待权限状态
			this.isVoicePending = true;
			navigator.mediaDevices.getUserMedia({ audio: true })
				.then(stream => {
					this.isVoicePending = false;
					// 如果在等待权限期间用户已取消，则直接关闭流
					if (this.voiceCancelled) {
						stream.getTracks().forEach(t => t.stop());
						this.voiceCancelled = false;
						return;
					}
					this._h5Stream = stream;
					// 选择最佳音频格式
					let mimeType = '';
					if (MediaRecorder.isTypeSupported('audio/webm;codecs=opus')) {
						mimeType = 'audio/webm;codecs=opus';
					} else if (MediaRecorder.isTypeSupported('audio/webm')) {
						mimeType = 'audio/webm';
					} else if (MediaRecorder.isTypeSupported('audio/ogg;codecs=opus')) {
						mimeType = 'audio/ogg;codecs=opus';
					} else if (MediaRecorder.isTypeSupported('audio/mp4')) {
						mimeType = 'audio/mp4';
					}
					const mrOptions = mimeType ? { mimeType } : {};
					const mr = new MediaRecorder(stream, mrOptions);
					this._h5MediaRecorder = mr;
					this._h5Chunks = [];
					this._h5MimeType = mr.mimeType || mimeType || 'audio/webm';
					mr.ondataavailable = e => { if (e.data && e.data.size > 0) this._h5Chunks.push(e.data); };
					mr.onstop = () => {
						this.isRecording = false;
						// 停止麦克风流
						if (this._h5Stream) {
							this._h5Stream.getTracks().forEach(t => t.stop());
							this._h5Stream = null;
						}
						if (this.voiceCancelled) { this.voiceCancelled = false; return; }
						const finalMimeType = this._h5MimeType;
						const blob = new Blob(this._h5Chunks, { type: finalMimeType });
						if (blob.size > 0) { this.transcribeAudioH5(blob, finalMimeType); }
						else { uni.showToast({ title: '录音内容为空，请重试', icon: 'none' }); }
					};
					mr.onerror = (e) => {
						console.error('MediaRecorder error:', e);
						this.isRecording = false;
						this.isVoicePending = false;
						uni.showToast({ title: '录音出错，请重试', icon: 'none' });
					};
					mr.start(200); // 每 200ms 收集一次数据
					this.isRecording = true;
				})
				.catch(err => {
					this.isVoicePending = false;
					console.error('getUserMedia error:', err);
					if (err.name === 'NotAllowedError' || err.name === 'PermissionDeniedError') {
						uni.showToast({ title: '麦克风权限被拒绝，请在浏览器中授权', icon: 'none', duration: 2500 });
					} else if (err.name === 'NotFoundError') {
						uni.showToast({ title: '未找到麦克风设备', icon: 'none', duration: 2000 });
					} else {
						uni.showToast({ title: '无法访问麦克风：' + (err.message || err.name), icon: 'none', duration: 2000 });
					}
				});
		},
		_stopVoiceH5() {
			if (this._h5MediaRecorder && this._h5MediaRecorder.state !== 'inactive') {
				this._h5MediaRecorder.stop();
			}
		},
		// H5专用：点击切换录音开始/停止（避免touch与click事件冲突）
		onVoiceClickH5() {
			if (this.isVoicePending) return; // 等待权限中，防止重复点击
			if (!this.isRecording) {
				this.voiceCancelled = false;
				this.voiceMode = 'fill';
				this._startVoiceH5();
			} else {
				this._stopVoiceH5();
			}
		},

		// 输入框长按录音：onInputTouchStart / End / Cancel
		onInputTouchStart(e) {
			if (this.isRecording || this.isTranscribing) return;
			this._inputLongPressTimer = setTimeout(() => {
				this.voiceCancelled = false;
				this.voiceMode = 'send'; // 长按输入框：识别后直接发送
				this.voiceTouchStartY = e.touches ? e.touches[0].clientY : 0;
				this.startVoice();
			}, 400); // 400ms 判定为长按
		},
		onInputTouchEnd(e) {
			clearTimeout(this._inputLongPressTimer);
			if (!this.isRecording) return;
			const endY = e.changedTouches ? e.changedTouches[0].clientY : 0;
			if (this.voiceTouchStartY - endY > 60) {
				this.voiceCancelled = true;
				uni.showToast({ title: '已取消', icon: 'none', duration: 800 });
			}
			this.stopVoice();
		},
		onInputTouchCancel() {
			clearTimeout(this._inputLongPressTimer);
			if (this.isRecording) {
				this.voiceCancelled = true;
				this.stopVoice();
			}
		},

		// 长按语音按钮开始录音
		onVoiceTouchStart(e) {
			this.voiceCancelled = false;
			this.voiceMode = 'fill'; // 语音按钮：识别后填入输入框
			this.voiceTouchStartY = e.touches ? e.touches[0].clientY : 0;
			this.startVoice();
		},
		// 松开语音按钮停止录音并识别
		onVoiceTouchEnd(e) {
			const endY = e.changedTouches ? e.changedTouches[0].clientY : 0;
			if (this.voiceTouchStartY - endY > 60) {
				this.voiceCancelled = true;
				uni.showToast({ title: '已取消', icon: 'none', duration: 800 });
			}
			this.stopVoice();
		},
		// 触摸被取消（如电话来电）
		onVoiceTouchCancel() {
			this.voiceCancelled = true;
			this.stopVoice();
		},
		// 点击语音按钮（H5下点击切换，手机上主要用 touch 事件）
		onVoiceClick() {
			if (!this.isRecording) {
				this.voiceCancelled = false;
				this.voiceMode = 'fill'; // 语音按钮：识别后填入输入框
				this.startVoice();
			} else {
				this.stopVoice();
			}
		},

		// === App 平台：使用 uni.uploadFile 上传识别 ===
		async transcribeAudioApp(filePath) {
			this.isTranscribing = true;
			const apiKey = 'sk-pvwohrxnrbqyamwxabzjqsavprkherzqqwfkgpintrzoerxs';
			const apiUrl = 'https://api.siliconflow.cn/v1/audio/transcriptions';
			try {
				const uploadResult = await new Promise((resolve, reject) => {
					uni.uploadFile({
						url: apiUrl,
						filePath,
						name: 'file',
						header: { 'Authorization': `Bearer ${apiKey}` },
						formData: { model: 'FunAudioLLM/SenseVoiceSmall' },
						success: resolve,
						fail: reject
					});
				});
				if (uploadResult.statusCode !== 200) throw new Error(`HTTP ${uploadResult.statusCode}`);
				const data = JSON.parse(uploadResult.data);
				this._applyTranscription(data.text);
			} catch (err) {
				console.error('语音识别失败:', err);
				uni.showToast({ title: '识别失败，请重试', icon: 'none' });
			} finally {
				this.isTranscribing = false;
			}
		},

		// === H5 平台：使用 fetch + FormData 上传 Blob 识别 ===
		async transcribeAudioH5(blob, mimeType) {
			this.isTranscribing = true;
			const apiKey = 'sk-pvwohrxnrbqyamwxabzjqsavprkherzqqwfkgpintrzoerxs';
			const apiUrl = 'https://api.siliconflow.cn/v1/audio/transcriptions';
			try {
				const ext = (mimeType || '').includes('ogg') ? 'ogg' : (mimeType || '').includes('mp4') ? 'mp4' : 'webm';
				const form = new FormData();
				form.append('file', blob, `recording.${ext}`);
				form.append('model', 'FunAudioLLM/SenseVoiceSmall');
				const res = await fetch(apiUrl, {
					method: 'POST',
					headers: { 'Authorization': `Bearer ${apiKey}` },
					body: form
				});
				if (!res.ok) throw new Error(`HTTP ${res.status}`);
				const data = await res.json();
				this._applyTranscription(data.text);
			} catch (err) {
				console.error('语音识别失败:', err);
				uni.showToast({ title: '识别失败，请重试', icon: 'none' });
			} finally {
				this.isTranscribing = false;
			}
		},

		// 将识别结果填入输入框，或直接发送（根据 voiceMode）
		_applyTranscription(text) {
			const t = (text || '').trim();
			if (!t) {
				uni.showToast({ title: '未识别到内容', icon: 'none' });
				return;
			}
			if (this.voiceMode === 'send') {
				// 长按输入框模式：直接作为新消息发送
				this.inputText = t;
				this.$nextTick(() => { this.sendMessage(); });
			} else {
				// 语音按钮模式：填入输入框，用户可编辑后手动发送
				this.inputText = (this.inputText ? this.inputText + ' ' : '') + t;
				uni.showToast({ title: '识别成功 ✅', icon: 'none', duration: 1000 });
			}
		},
		toggleEmojiPanel() {
			this.showEmojiPanel = !this.showEmojiPanel;
		},
		insertEmoji(emoji) {
			this.inputText += emoji;
		},

		// 日记新建
		chooseNewDiaryImage() {
			const remain = 9 - this.newDiaryImages.length;
			if (remain <= 0) return;
			uni.chooseImage({
				count: remain,
				sizeType: ['compressed'],
				sourceType: ['album', 'camera'],
				success: (res) => {
					this.newDiaryImages = this.newDiaryImages.concat(res.tempFilePaths);
				}
			});
		},
		removeNewImage(index) {
			this.newDiaryImages.splice(index, 1);
		},
		async saveDiary() {
			if (!this.newDiaryText.trim()) {
				uni.showToast({ title: '请写点什么吧~', icon: 'none' });
				return;
			}
			const now = new Date();
			const pad = n => String(n).padStart(2, '0');
			const dateStr = `${now.getFullYear()}年${pad(now.getMonth() + 1)}月${pad(now.getDate())}日`;
			const logDate = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`;
			const moodLabel = this.moods[this.selectedMood].label;
			// 图片使用本地路径（实际项目中应先上传到文件服务器获取 URL）
			const imageUrls = JSON.stringify(this.newDiaryImages);

			const token = this.getToken();
			if (!token) {
				// 未登录时仅本地保存
				this.diaryEntries.unshift({
					id: null,
					date: dateStr,
					moodIndex: this.selectedMood,
					content: this.newDiaryText.trim(),
					images: [...this.newDiaryImages]
				});
				this.selectedDiaryText = this.newDiaryText.trim();
				this.newDiaryText = '';
				this.newDiaryImages = [];
				this.showDiaryModal = false;
				this.saveDiariesToStorage();
				uni.showToast({ title: '日记已保存（本地）📖', icon: 'none' });
				return;
			}

			uni.showLoading({ title: '保存中...' });
			try {
				const data = await http.post(`${config.baseUrl}/heal-diary/save`, {
					content: this.newDiaryText.trim(),
					moodScore: this.selectedMood + 1,
					moodLabel,
					imageUrls,
					logDate
				});
				if (data.code === 200) {
					const newId = data.result;
					this.diaryEntries.unshift({
						id: newId,
						date: dateStr,
						moodIndex: this.selectedMood,
						content: this.newDiaryText.trim(),
						images: [...this.newDiaryImages]
					});
					this.selectedDiaryText = this.newDiaryText.trim();
					this.newDiaryText = '';
					this.newDiaryImages = [];
					this.showDiaryModal = false;
					uni.showToast({ title: '日记已保存 📖', icon: 'none' });
				} else {
					uni.showToast({ title: data.message || '保存失败', icon: 'none' });
				}
			} catch (e) {
				console.error('[HealDiary] saveDiary 失败:', e);
				uni.showToast({ title: '网络异常，保存失败', icon: 'none' });
			} finally {
				uni.hideLoading();
			}
		},

		// 日记编辑
		openEditModal(idx) {
			const entry = this.diaryEntries[idx];
			this.editingIndex = idx;
			this.editDiaryText = entry.content;
			this.editMood = entry.moodIndex;
			this.editDiaryImages = entry.images ? [...entry.images] : [];
			this.showEditModal = true;
		},
		chooseEditDiaryImage() {
			const remain = 9 - this.editDiaryImages.length;
			if (remain <= 0) return;
			uni.chooseImage({
				count: remain,
				sizeType: ['compressed'],
				sourceType: ['album', 'camera'],
				success: (res) => {
					this.editDiaryImages = this.editDiaryImages.concat(res.tempFilePaths);
				}
			});
		},
		removeEditImage(index) {
			this.editDiaryImages.splice(index, 1);
		},
		async saveEdit() {
			if (!this.editDiaryText.trim()) {
				uni.showToast({ title: '请写点内容~', icon: 'none' });
				return;
			}
			const entry = this.diaryEntries[this.editingIndex];
			const moodLabel = this.moods[this.editMood].label;
			const imageUrls = JSON.stringify(this.editDiaryImages);

			const token = this.getToken();
			if (!token || !entry.id) {
				// 未登录或本地条目（无id），仅本地更新
				const updated = { ...entry, content: this.editDiaryText.trim(), moodIndex: this.editMood, images: [...this.editDiaryImages] };
				this.$set(this.diaryEntries, this.editingIndex, updated);
				this.showEditModal = false;
				this.saveDiariesToStorage();
				uni.showToast({ title: '修改已保存（本地）', icon: 'none' });
				return;
			}

			uni.showLoading({ title: '保存中...' });
			try {
				const data = await http.put(`${config.baseUrl}/heal-diary/${entry.id}`, {
					content: this.editDiaryText.trim(),
					moodScore: this.editMood + 1,
					moodLabel,
					imageUrls
				});
				if (data.code === 200) {
					const updated = { ...entry, content: this.editDiaryText.trim(), moodIndex: this.editMood, images: [...this.editDiaryImages] };
					this.$set(this.diaryEntries, this.editingIndex, updated);
					this.showEditModal = false;
					uni.showToast({ title: '修改已保存', icon: 'none' });
				} else {
					uni.showToast({ title: data.message || '保存失败', icon: 'none' });
				}
			} catch (e) {
				console.error('[HealDiary] saveEdit 失败:', e);
				uni.showToast({ title: '网络异常，保存失败', icon: 'none' });
			} finally {
				uni.hideLoading();
			}
		},

		// 日记删除
		deleteDiary(idx) {
			uni.showModal({
				title: '确认删除',
				content: '删除后无法恢复，是否继续？',
				confirmColor: '#e05252',
				success: async (res) => {
					if (!res.confirm) return;
					const entry = this.diaryEntries[idx];
					const removeLocal = () => {
						this.diaryEntries.splice(idx, 1);
						const newOffsets = {};
						Object.keys(this.swipeOffsets).forEach(k => {
							const ki = parseInt(k);
							if (ki < idx) newOffsets[ki] = this.swipeOffsets[k];
							else if (ki > idx) newOffsets[ki - 1] = this.swipeOffsets[k];
						});
						this.swipeOffsets = newOffsets;
					};
					const token = this.getToken();
					if (!token || !entry.id) {
						removeLocal();
						this.saveDiariesToStorage();
						uni.showToast({ title: '已删除', icon: 'none', duration: 1000 });
						return;
					}
					try {
						const data = await http.delete(`${config.baseUrl}/heal-diary/${entry.id}`);
						if (data.code === 200) {
							removeLocal();
							uni.showToast({ title: '已删除', icon: 'none', duration: 1000 });
						} else {
							uni.showToast({ title: data.message || '删除失败', icon: 'none' });
						}
					} catch (e) {
						console.error('[HealDiary] deleteDiary 失败:', e);
						uni.showToast({ title: '网络异常，删除失败', icon: 'none' });
					}
				}
			});
		},

		// 条目点击：尚未滑开则打开编辑，已滑开则复位
		onEntryClick(idx) {
			if (this.swipeOffsets[idx] && this.swipeOffsets[idx] < -10) {
				// 已滑开状态，点击复位
				this.$set(this.swipeOffsets, idx, 0);
			} else {
				// 未滑开，打开编辑弹窗
				this.openEditModal(idx);
			}
		},

		// 条目滑动事件
		onEntryTouchStart(e, idx) {
			const t = e.touches[0];
			this._swipeTouchStartX = t.clientX;
			this._swipeTouchStartY = t.clientY;
			this._swipeActiveIdx = idx;
			this._swipeIsDragging = false;
			this._swipePassedThreshold = false;
		},
		onEntryTouchMove(e, idx) {
			if (this._swipeActiveIdx !== idx) return;
			const t = e.touches[0];
			const dx = t.clientX - this._swipeTouchStartX;
			const dy = t.clientY - this._swipeTouchStartY;
			// 还未判定方向：用第一次移动判断
			if (!this._swipeIsDragging) {
				if (Math.abs(dx) < 5 && Math.abs(dy) < 5) return;
				if (Math.abs(dx) >= Math.abs(dy)) {
					this._swipeIsDragging = true;
					// 判定为水平滑动：禁用 swiper 切换 + 锁定 scroll-view 垂直滚动
					this.swiperDisableTouch = true;
					this.diaryScrollLocked = true;
					// H5 端阻止默认滚动行为
					e.preventDefault && e.preventDefault();
				} else {
					// 垂直滑动，不处理
					this._swipeActiveIdx = -1;
					return;
				}
			}
			// 持续阻止默认行为，防止页面上下滚动
			e.preventDefault && e.preventDefault();
			e.stopPropagation && e.stopPropagation();
			const DEL_WIDTH = 72; // 删除按钮宽度
			const baseOffset = this._swipePassedThreshold ? -DEL_WIDTH : 0;
			let offset = baseOffset + dx;
			// 限制范围：不能向右超出0，不能向左超出 DEL_WIDTH
			offset = Math.min(0, Math.max(-DEL_WIDTH, offset));
			this.$set(this.swipeOffsets, idx, offset);
		},
		onEntryTouchEnd(e, idx) {
			// 解锁 swiper 和 scroll-view
			this.swiperDisableTouch = false;
			this.diaryScrollLocked = false;
			if (this._swipeActiveIdx !== idx || !this._swipeIsDragging) return;
			const DEL_WIDTH = 72;
			const offset = this.swipeOffsets[idx] || 0;
			// 超过一半就展开，否则关闭
			if (offset < -DEL_WIDTH / 2) {
				this.$set(this.swipeOffsets, idx, -DEL_WIDTH);
				this._swipePassedThreshold = true;
			} else {
				this.$set(this.swipeOffsets, idx, 0);
				this._swipePassedThreshold = false;
			}
			this._swipeIsDragging = false;
			this._swipeActiveIdx = -1;
		},

		// 关闭其他所有已滑开的条目（可选：切换 Tab 时调用）
		resetAllSwipe() {
			this.swipeOffsets = {};
		},

		// 本地缓存
		// 写入本地缓存（仅用于未登录降级方案）
		saveDiariesToStorage() {
			try {
				uni.setStorageSync('diaryEntries', JSON.stringify(this.diaryEntries));
			} catch (e) {
				console.warn('日记缓存写入失败', e);
			}
		},
			// 从后端加载日记列表
		async loadDiariesFromStorage() {
			const token = this.getToken();
			if (!token) {
				// 未登录时降级读取本地缓存
				try {
					const raw = uni.getStorageSync('diaryEntries');
					if (raw) {
						const parsed = JSON.parse(raw);
						if (Array.isArray(parsed) && parsed.length > 0) {
							this.diaryEntries = parsed.map(e => ({ ...e, images: e.images || [] }));
						}
					}
				} catch (e) {
					console.warn('日记本地缓存读取失败', e);
				}
				return;
			}
			try {
				const data = await http.get(`${config.baseUrl}/heal-diary/list`);
				if (data.code === 200) {
					const pad = n => String(n).padStart(2, '0');
					this.diaryEntries = (data.result || []).map(item => {
						// 将后端 moodLabel 转换为本地 moodIndex
						const moodIndex = this.moods.findIndex(m => m.label === item.moodLabel);
						// 解析 logDate 为显示用字符串
						let dateStr = '';
						let rawDate = item.logDate || item.addTimestampMils || item.add_timestamp_mils;
						if (rawDate) {
							const d = new Date(rawDate);
							if (!isNaN(d.getTime())) {
								dateStr = `${d.getFullYear()}年${pad(d.getMonth() + 1)}月${pad(d.getDate())}日`;
							}
						}
						// 解析图片列表
						let images = [];
						try { images = JSON.parse(item.imageUrls || '[]'); } catch (e) { images = []; }
						return {
							id: item.id,
							date: dateStr,
							moodIndex: moodIndex >= 0 ? moodIndex : 1,
							content: item.content || '',
							images
						};
					});
				} else {
					console.warn('[HealDiary] 获取日记列表失败:', data.message);
				}
			} catch (e) {
				console.error('[HealDiary] 加载日记列表网络异常:', e);
			}
		}
	},

	beforeDestroy() {
		if (this.typingTimer) {
			clearInterval(this.typingTimer);
		}
	}
};
</script>

<style lang="scss" scoped>
.heal-page {
	display: flex;
	flex-direction: column;
	height: 100vh;
	background: linear-gradient(160deg, #e8f4fd 0%, #f0faf5 50%, #f5f0fb 100%);
	/* 不设 overflow:hidden / overflow-x:hidden，否则将创建 stacking context 导致 fixed 子元素定位容器变为此元素而非视口 */
}

/* ===== Tab 栏 ===== */
.tab-bar {
	display: flex;
	background: #fff;
	box-shadow: 0 1px 6px rgba(0, 0, 0, 0.06);
	position: relative;
	z-index: 10;
}
.tab-item {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 12px 0 8px;
	position: relative;
	cursor: pointer;
}
.tab-text {
	font-size: 1em;
	color: #999;
	transition: color 0.25s;
	font-weight: 500;
}
.tab-item.active .tab-text {
	color: #5b9cf6;
	font-weight: bold;
}
.tab-indicator {
	position: absolute;
	bottom: 0;
	width: 28px;
	height: 3px;
	border-radius: 2px;
	background: linear-gradient(to right, #a1c4fd, #5b9cf6);
	animation: slideIn 0.25s ease;
}
@keyframes slideIn {
	from { width: 0; opacity: 0; }
	to { width: 28px; opacity: 1; }
}

/* ===== Swiper ===== */
.tab-content {
	flex: 1;
	height: 0;
}
.swiper-item {
	height: 100%;
}

/* ===== 公共 ===== */
.section-title {
	font-size: 1em;
	font-weight: bold;
	color: #4a4c50;
	margin: 14px 0 8px 16px;
	display: block;
}

/* ===== 聊天 ===== */
.chat-wrapper {
	height: 100%;
	display: flex;
	flex-direction: column;
	background: linear-gradient(160deg, #edf4ff 0%, #f5f9ff 100%);
	overflow: hidden;
	position: relative;
}
.chat-banner {
	display: flex;
	align-items: center;
	background: linear-gradient(135deg, #ff5fa0 0%, #ff85bb 20%, #ffaad5 40%, #ffcce6 55%, #ffc0a8 70%, #ffb0c8 85%, #ee60b0 100%);
	border-radius: 0 0 22px 22px;
	margin: 0 0 4px;
	padding: 12px 16px 16px;
	box-shadow: 0 6px 22px rgba(230, 60, 140, 0.38);
	flex-shrink: 0;
	position: relative;
	overflow: hidden;
}
.chat-banner::before {
	content: '';
	position: absolute;
	top: -20px;
	right: -20px;
	width: 80px;
	height: 80px;
	border-radius: 50%;
	background: rgba(255,255,255,0.12);
}
.chat-banner::after {
	content: '';
	position: absolute;
	bottom: -30px;
	left: 30%;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background: rgba(255,255,255,0.08);
}
.chat-banner-avatar {
	width: 52px;
	height: 52px;
	border-radius: 50%;
	border: 2.5px solid rgba(255,255,255,0.8);
	box-shadow: 0 3px 10px rgba(0,0,0,0.15);
	margin-right: 12px;
	flex-shrink: 0;
	background: #fff;
}
.chat-banner-info {
	flex: 1;
	display: flex;
	flex-direction: column;
	z-index: 1;
}
.chat-banner-title-row {
	display: flex;
	align-items: center;
	gap: 8px;
	margin-bottom: 3px;
}
.chat-banner-name {
	font-size: 1.1em;
	font-weight: bold;
	color: #fff;
	letter-spacing: 0.5px;
	text-shadow: 0 1px 3px rgba(80,130,200,0.3);
}
.chat-banner-tag {
	background: rgba(255,255,255,0.28);
	border: 1px solid rgba(255,255,255,0.5);
	border-radius: 10px;
	padding: 1px 8px;
	font-size: 0.7em;
	color: #fff;
	letter-spacing: 0.5px;
}
.chat-banner-desc {
	font-size: 0.78em;
	color: rgba(255,255,255,0.9);
}
/* 在线状态标签：内嵌在标题行紧靠 AI 心理助手标签右侧 */
.chat-banner-status-inline {
	display: flex;
	align-items: center;
	gap: 3px;
}
.chat-banner-status {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 3px;
	z-index: 1;
}
.chat-banner-dot {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #52e76a;
	box-shadow: 0 0 8px rgba(82, 231, 106, 0.7);
}
.chat-banner-online-text {
	font-size: 0.68em;
	color: rgba(255,255,255,0.9);
}
/* 消息滚动区：flex:1 自动占满剩余空间，底部留出输入区高度 */
.chat-messages {
	flex: 1;
	overflow-y: auto;
	padding: 10px 12px 130px;
	min-height: 0;
}
.msg-bottom-anchor {
	height: 8px;
}
.message-row {
	display: flex;
	align-items: flex-end;
	margin-bottom: 14px;
}
.message-left {
	flex-direction: row;
	justify-content: flex-start;
}
.message-right {
	flex-direction: row;
	justify-content: flex-end;
}
.avatar {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	flex-shrink: 0;
	box-shadow: 0 2px 8px rgba(0,0,0,0.14);
	border: 2px solid #fff;
	background: #f0f5ff;
}
.ai-avatar { margin-right: 8px; }
.user-avatar { margin-left: 8px; }
.bubble {
	max-width: 66%;
	padding: 10px 14px;
	border-radius: 18px;
	line-height: 1.5;
}
.bubble-ai {
	background: #fff;
	border-radius: 4px 18px 18px 18px;
	box-shadow: 0 3px 10px rgba(161,196,253,0.18);
}
.bubble-user {
	background: linear-gradient(135deg, #5b9cf6, #a1c4fd);
	border-radius: 18px 4px 18px 18px;
	box-shadow: 0 3px 10px rgba(91,156,246,0.35);
}
.bubble-text {
	font-size: 0.92em;
	color: #333;
	line-height: 1.6;
}
.bubble-user .bubble-text {
	color: #fff;
}
.msg-image {
	max-width: 160px;
	border-radius: 10px;
}

/* ===== 思考动画：三点波浪 ===== */
.thinking-dots {
	display: flex;
	align-items: center;
	gap: 5px;
	padding: 4px 2px;
	height: 20px;
	.dot {
		width: 7px;
		height: 7px;
		border-radius: 50%;
		background: #a0b4d0;
		display: inline-block;
		animation: dotBounce 1.2s ease-in-out infinite;
		&:nth-child(1) { animation-delay: 0s; }
		&:nth-child(2) { animation-delay: 0.2s; }
		&:nth-child(3) { animation-delay: 0.4s; }
	}
}
@keyframes dotBounce {
	0%, 80%, 100% {
		transform: translateY(0);
		opacity: 0.4;
	}
	40% {
		transform: translateY(-6px);
		opacity: 1;
	}
}

/* ===== 打字中光标 ===== */
.typing-wrap {
	display: inline;
}
.cursor-blink {
	font-size: 0.92em;
	color: #7baee8;
	margin-left: 1px;
	font-weight: 300;
	animation: cursorFlash 0.8s step-start infinite;
}
@keyframes cursorFlash {
	0%, 100% { opacity: 1; }
	50% { opacity: 0; }
}

/* 表情面板 */
.emoji-panel {
	background: #fff;
	border-bottom: 1px solid #eef2f8;
	padding: 8px 10px;
	flex-shrink: 0;
}
.emoji-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 4px;
}
.emoji-item {
	font-size: 1.55em;
	width: calc(100% / 10 - 4px);
	text-align: center;
	padding: 4px 0;
	border-radius: 6px;
	transition: background 0.15s;
}
.emoji-item:active {
	background: #eef4ff;
}

/* 输入区：固定定位在底部导航菜单上方 */
.chat-input-area {
	position: fixed;
	left: 0;
	right: 0;
	width: 100%;
	box-sizing: border-box;
	bottom: 50px;
	background: #fff;
	border-top: 1px solid #eef2f8;
	padding: 10px 14px 14px;
	border-radius: 20px 20px 0 0;
	z-index: 100;
}
.chat-toolbar {
	display: none; /* 已删除工具栏，保留以防止编译报错 */
}
.chat-input-row {
	display: flex;
	align-items: center;
	gap: 8px;
}
/* 输入框外包层，用于表情按鈕定位 */
.chat-input-wrap {
	flex: 1;
	position: relative;
	display: flex;
	align-items: center;
}
.chat-input {
	flex: 1;
	background: #f0f5ff;
	border-radius: 22px;
	padding: 10px 44px 10px 16px; /* 右侧留出表情按鈕位置 */
	font-size: 0.92em;
	color: #333;
	border: 1.5px solid #d0e2ff;
	box-shadow: 0 2px 8px rgba(161,196,253,0.1);
	min-height: 40px;
	max-height: 40px;
	resize: none;
	line-height: 1.4;
	width: 100%;
	box-sizing: border-box;
}
/* 行内表情按鈕 */
.emoji-inline-btn {
	position: absolute;
	right: 10px;
	width: 28px;
	height: 28px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	transition: background 0.2s;
	cursor: pointer;
	z-index: 1;
}
.emoji-inline-active {
	background: rgba(161,196,253,0.3);
}
.emoji-inline-icon {
	font-size: 1.2em;
	line-height: 1;
}
.send-btn {
	width: 44px;
	height: 44px;
	border-radius: 14px;
	background: linear-gradient(135deg, #5b9cf6, #a1c4fd);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
	box-shadow: 0 4px 14px rgba(91,156,246,0.45);
	transition: transform 0.15s, box-shadow 0.15s;
	cursor: pointer;
}
.send-btn:active { transform: scale(0.90); box-shadow: 0 2px 6px rgba(91,156,246,0.3); }
.send-icon {
	color: #fff;
	font-size: 1em;
}

/* ===== 语音按钮 ===== */
.voice-btn {
	width: 44px;
	height: 44px;
	border-radius: 14px;
	background: linear-gradient(135deg, #f5f0fb, #e8e0f5);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
	border: 1.5px solid #d8c8f0;
	box-shadow: 0 2px 8px rgba(161,140,209,0.2);
	transition: all 0.2s;
	cursor: pointer;
	user-select: none;
}
.voice-btn-pending {
	background: linear-gradient(135deg, #e8e0f5, #d4c8f0);
	border-color: #c4b8e8;
	opacity: 0.7;
	cursor: wait;
}
.voice-btn:active,
.voice-btn-recording {
	background: linear-gradient(135deg, #a18cd1, #c4a8f0);
	border-color: #a18cd1;
	box-shadow: 0 4px 16px rgba(161,140,209,0.55);
	transform: scale(0.94);
}
.voice-btn-icon {
	font-size: 1.2em;
	line-height: 1;
}

/* ===== 输入框录音状态样式 ===== */
/* 录音中：边框变红紫 + 轻微背景 */
.input-wrap-recording {
	background: rgba(161,140,209,0.1);
	border-radius: 22px;
	border: 1.5px solid #a18cd1 !important;
	box-shadow: 0 0 0 3px rgba(161,140,209,0.18);
	min-height: 40px;
}
/* 识别中：边框变蓝 */
.input-wrap-transcribing {
	background: rgba(161,196,253,0.1);
	border-radius: 22px;
	border: 1.5px solid #5b9cf6 !important;
	box-shadow: 0 0 0 3px rgba(91,156,246,0.15);
	min-height: 40px;
}

/* 录音状态指示条 */
.voice-status-bar {
	display: flex;
	align-items: center;
	gap: 10px;
	flex: 1;
	padding: 0 16px;
	height: 40px;
}
.voice-status-text {
	font-size: 0.85em;
	color: #7b5ea7;
	font-weight: 500;
	letter-spacing: 0.3px;
}

/* 声波动画 */
.voice-wave-wrap {
	display: flex;
	align-items: center;
	gap: 3px;
	height: 20px;
}
.voice-wave-bar {
	width: 3px;
	border-radius: 2px;
	background: linear-gradient(180deg, #a18cd1, #c4a8f0);
	animation: voiceWave 0.9s ease-in-out infinite;
}
.voice-wave-bar.b1 { height: 8px;  animation-delay: 0s; }
.voice-wave-bar.b2 { height: 14px; animation-delay: 0.12s; }
.voice-wave-bar.b3 { height: 20px; animation-delay: 0.24s; }
.voice-wave-bar.b4 { height: 14px; animation-delay: 0.36s; }
.voice-wave-bar.b5 { height: 8px;  animation-delay: 0.48s; }
@keyframes voiceWave {
	0%, 100% { transform: scaleY(0.5); opacity: 0.5; }
	50%       { transform: scaleY(1.3); opacity: 1; }
}

/* ===== 日记 ===== */
.diary-page {
	height: 100%;
	position: relative;
}
.diary-page-scroll {
	background: linear-gradient(160deg, #edfaf3 0%, #f0faf5 50%, #e8f8ee 100%) !important;
}
.diary-header {
	display: flex;
	flex-direction: column;
	padding: 16px 16px 8px;
}
.diary-today-label {
	font-size: 0.8em;
	color: #96e6a1;
	font-weight: bold;
	letter-spacing: 1px;
}
.diary-today-date {
	font-size: 1.15em;
	font-weight: bold;
	color: #4a4c50;
	margin-top: 2px;
}
.diary-write-card {
	background: #fff;
	border-radius: 16px;
	margin: 0 12px 12px;
	padding: 14px 16px;
	box-shadow: 0 3px 12px rgba(150, 230, 161, 0.25);
	border: 1.5px solid rgba(150, 230, 161, 0.3);
}
.diary-mood-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
}
.diary-mood-label {
	font-size: 0.9em;
	font-weight: bold;
	color: #4a4c50;
}
.mood-selector {
	display: flex;
	gap: 6px;
}
.mood-emoji {
	font-size: 1.5em;
	opacity: 0.45;
	transition: all 0.2s;
}
.mood-selected {
	opacity: 1;
	transform: scale(1.2);
}
.diary-placeholder {
	flex: 1;
	min-height: 50px;
	border-radius: 10px;
	background: #f8fbf8;
	padding: 10px 12px;
	cursor: pointer;
}
.diary-placeholder-text {
	font-size: 0.88em;
	color: #b0bec5;
	line-height: 1.6;
}
/* 输入行内嵌布局 */
.diary-input-row {
	display: flex;
	align-items: center;
	gap: 10px;
}
/* 占位用，保留以防止其他引用 */
.fab-btn { display: none; }
.diary-list {
	padding: 0 12px 30px;
}

/* 日记页悬浮写日记按钮（右下角） */
.diary-fab-fixed {
	position: fixed;
	right: 22px;
	bottom: 145px;
	width: 56px;
	height: 56px;
	border-radius: 50%;
	background: linear-gradient(135deg, #96e6a1, #cef475);
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 6px 20px rgba(150, 230, 161, 0.6);
	z-index: 200;
	cursor: pointer;
	transition: transform 0.15s, box-shadow 0.15s;
}
.diary-fab-fixed:active {
	transform: scale(0.88);
	box-shadow: 0 3px 10px rgba(150, 230, 161, 0.4);
}
.diary-entry {
	display: flex;
	background: #fff;
	border-radius: 14px;
	padding: 12px 14px;
	box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}
.diary-entry-left {
	margin-right: 12px;
	display: flex;
	align-items: flex-start;
	padding-top: 2px;
}
.diary-entry-emoji {
	font-size: 1.8em;
}
.diary-entry-body {
	flex: 1;
}
.diary-entry-top {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 4px;
}
.diary-entry-date {
	font-size: 0.78em;
	color: #aaa;
}
.diary-entry-mood-name {
	font-size: 0.78em;
	color: #96e6a1;
	font-weight: bold;
}
.diary-entry-content {
	font-size: 0.88em;
	color: #555;
	line-height: 1.6;
}
.fab-btn {
	position: fixed;
	right: 22px;
	bottom: 170px;
	width: 52px;
	height: 52px;
	border-radius: 50%;
	background: linear-gradient(135deg, #96e6a1, #cef475);
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 4px 16px rgba(150, 230, 161, 0.5);
	z-index: 100;
}
.fab-icon {
	font-size: 1.4em;
}

/* ===== 游戏 ===== */
/* 神庙逃亡2主题：极光熔岩风格——深邃紫黑底 + 品红极光 + 燃烧橙火流，神庙魔法能量感 */
.game-page {
	height: 100%;
	background:
		/* 左下角品红极光来蝘 */
		radial-gradient(ellipse 60% 50% at 0% 100%, rgba(220, 20, 120, 0.22) 0%, transparent 60%),
		/* 右上角电蓝魔法光 */
		radial-gradient(ellipse 55% 45% at 100% 0%, rgba(60, 80, 255, 0.20) 0%, transparent 58%),
		/* 中心燃烧橙火爆发 */
		radial-gradient(ellipse 70% 55% at 50% 38%, rgba(255, 100, 10, 0.18) 0%, transparent 62%),
		/* 顶部深紫通道光 */
		radial-gradient(ellipse 85% 35% at 50% 0%, rgba(140, 20, 200, 0.16) 0%, transparent 55%),
		/* 主底色：深邃紫黑——类游戏屏幕质感 */
		linear-gradient(155deg, #1a1030 0%, #0f0820 40%, #130e28 70%, #1c1035 100%);
}
/* 顶部英雄区 */
.game-hero {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 40px 24px 18px;
	gap: 16px;
	/* 英雄区底部微光晕增强层次 */
	background: radial-gradient(ellipse 80% 60% at 50% 20%, rgba(255, 160, 40, 0.08) 0%, transparent 70%);
}
.game-hero-bg {
	width: 118px;
	height: 118px;
	border-radius: 28px;
	/* 中色调底座：深紫蓝，与背景拉开层次但不死黑 */
	background: linear-gradient(145deg, #3d2060 0%, #2e1550 55%, #231040 100%);
	border: 1.5px solid rgba(255, 255, 255, 0.14);
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow:
		/* 最内层：白色面板描边 */
		0 0 0 1px rgba(255, 255, 255, 0.08),
		/* 第一层霓虹：燃烧橙 */
		0 0 8px 2px rgba(255, 120, 20, 0.75),
		/* 第二层霓虹：品红极光 */
		0 0 18px 4px rgba(220, 20, 120, 0.45),
		/* 第三层霓虹：电蓝散晕 */
		0 0 36px 8px rgba(60, 80, 255, 0.22),
		/* 底部投影 */
		0 14px 32px rgba(0, 0, 20, 0.55);
}
.game-hero-img {
	width: 118px;
	height: 118px;
	border-radius: 28px;
	display: block;
}
.game-hero-info {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 6px;
}
.game-hero-title {
	font-size: 1.55em;
	font-weight: bold;
	color: #fff;
	letter-spacing: 3px;
	text-shadow:
		0 0 8px rgba(255, 160, 40, 0.90),
		0 0 20px rgba(255, 100, 10, 0.55),
		0 2px 4px rgba(0, 0, 0, 0.60);
}
.game-hero-sub {
	font-size: 0.82em;
	color: rgba(255, 200, 140, 0.75);
	letter-spacing: 1px;
}
.game-hero-tags {
	display: flex;
	gap: 8px;
	margin-top: 4px;
	flex-wrap: wrap;
	justify-content: center;
}
.game-tag {
	padding: 4px 13px;
	border-radius: 20px;
	background: rgba(255, 100, 20, 0.15);
	border: 1px solid rgba(255, 140, 40, 0.45);
	color: rgba(255, 200, 120, 0.95);
	font-size: 0.78em;
	font-weight: bold;
	letter-spacing: 0.5px;
	text-shadow: 0 0 6px rgba(255, 140, 40, 0.50);
}
/* 装饰分隔条已移除 */
/* 启动按钮 */
.game-launch-wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 12px;
	padding: 16px 24px 28px;
}
.game-launch-btn {
	display: flex;
	align-items: center;
	gap: 12px;
	padding: 18px 60px;
	border-radius: 50px;
	/* 极光火流：品红 → 燃烧橙 → 金 */
	background: linear-gradient(135deg, #e0108a 0%, #f54020 35%, #ff7820 65%, #ffb830 100%);
	box-shadow:
		0 0 0 1px rgba(255, 200, 100, 0.30),
		0 6px 30px rgba(220, 40, 80, 0.55),
		0 0 40px rgba(255, 80, 20, 0.28),
		inset 0 1px 0 rgba(255, 255, 200, 0.20);
	cursor: pointer;
	transition: transform 0.15s, box-shadow 0.15s;
}
.game-launch-btn:active {
	transform: scale(0.93);
	box-shadow: 0 3px 14px rgba(200, 30, 60, 0.50);
}
.game-launch-icon {
	color: #fff;
	font-size: 1.15em;
	text-shadow: 0 0 8px rgba(255, 255, 200, 0.60);
}
.game-launch-text {
	color: #fff;
	font-size: 1.1em;
	font-weight: bold;
	letter-spacing: 3px;
	text-shadow:
		0 0 8px rgba(255, 240, 180, 0.70),
		0 1px 4px rgba(100, 0, 0, 0.40);
}
.game-launch-hint {
	color: rgba(255, 180, 120, 0.65);
	font-size: 0.75em;
	letter-spacing: 0.5px;
}
/* 介绍卡片：半透明魔法玄色玻璃 */
.game-desc-card,
.game-guide-card {
	margin: 0 16px 14px;
	padding: 16px 18px;
	background: rgba(30, 15, 50, 0.62);
	border-radius: 18px;
	border: none;
	box-shadow:
		0 4px 22px rgba(0, 0, 20, 0.35),
		inset 0 1px 0 rgba(255, 160, 80, 0.12);
	backdrop-filter: blur(8px);
	-webkit-backdrop-filter: blur(8px);
}
.game-desc-title {
	font-size: 0.9em;
	font-weight: bold;
	color: rgba(255, 180, 80, 0.95);
	display: block;
	margin-bottom: 10px;
	text-shadow: 0 0 8px rgba(255, 140, 20, 0.50);
}
.game-desc-text {
	font-size: 0.84em;
	color: rgba(240, 210, 180, 0.88);
	line-height: 1.75;
	display: block;
}
.game-guide-list {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 8px;
}
.game-guide-item {
	display: flex;
	align-items: center;
	gap: 8px;
	padding: 9px 10px;
	background: rgba(255, 100, 20, 0.08);
	border-radius: 10px;
	border: 1px solid rgba(255, 120, 40, 0.18);
}
.game-guide-icon {
	font-size: 1.3em;
}
.game-guide-label {
	font-size: 0.8em;
	color: rgba(255, 210, 170, 0.90);
}

/* ===== 弹窗 ===== */
.modal-mask {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0,0,0,0.45);
	display: flex;
	align-items: flex-end;
	z-index: 999;
}
.modal-box {
	width: 100%;
	background: #fff;
	border-radius: 24px 24px 0 0;
	padding: 20px 16px 32px;
}
.modal-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 14px;
}
.modal-title {
	font-size: 1.1em;
	font-weight: bold;
	color: #333;
}
.modal-close {
	font-size: 1.1em;
	color: #aaa;
	padding: 4px 8px;
}
.modal-mood-row {
	display: flex;
	justify-content: center;
	gap: 14px;
	margin-bottom: 14px;
}
.modal-mood {
	font-size: 1.8em;
}
.modal-textarea {
	width: 100%;
	height: 130px;
	background: #f8fbf8;
	border-radius: 12px;
	padding: 12px;
	font-size: 0.9em;
	color: #333;
	border: 1px solid #e8efe8;
	line-height: 1.6;
}
.modal-footer {
	display: flex;
	gap: 12px;
	margin-top: 16px;
}
.modal-cancel-btn {
	flex: 1;
	text-align: center;
	padding: 12px;
	border-radius: 24px;
	background: #f0f4ff;
	color: #888;
	font-size: 0.95em;
}
.modal-save-btn {
	flex: 1;
	text-align: center;
	padding: 12px;
	border-radius: 24px;
	background: linear-gradient(135deg, #96e6a1, #5bc87a);
	color: #fff;
	font-size: 0.95em;
	font-weight: bold;
	box-shadow: 0 3px 10px rgba(91,200,122,0.4);
}

/* ===== 日记图片上传区 ===== */
.modal-image-area {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
	margin: 10px 0 4px;
}
.modal-img-thumb-wrap {
	position: relative;
	width: 70px;
	height: 70px;
	border-radius: 8px;
	overflow: hidden;
}
.modal-img-thumb {
	width: 70px;
	height: 70px;
	border-radius: 8px;
	object-fit: cover;
	display: block;
}
.modal-img-del {
	position: absolute;
	top: 3px;
	right: 3px;
	width: 18px;
	height: 18px;
	border-radius: 50%;
	background: rgba(220, 60, 60, 0.88);
	color: #fff;
	font-size: 0.65em;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	z-index: 1;
}
.modal-img-add {
	width: 70px;
	height: 70px;
	border-radius: 8px;
	border: 2px dashed #96e6a1;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #f4fdf5;
	cursor: pointer;
	transition: background 0.15s;
}
.modal-img-add:active {
	background: #e6f9ea;
}
.modal-img-add-icon {
	font-size: 1.6em;
	color: #5bc87a;
	line-height: 1;
	user-select: none;
}

/* ===== 日记条目图片预览行 ===== */
.diary-img-row {
	display: flex;
	white-space: nowrap;
	margin-top: 8px;
	gap: 6px;
}
.diary-img-small {
	width: 60px;
	height: 60px;
	border-radius: 6px;
	object-fit: cover;
	flex-shrink: 0;
	margin-right: 6px;
	display: inline-block;
}

/* ===== 日记条目操作按鈕（已改为左滑删除，保留类名防编译报错） ===== */
.diary-entry-actions { display: none; }
.diary-action-btn { display: none; }
.edit-btn { display: none; }
.del-btn { display: none; }

/* ===== 左滑删除容器 ===== */
.diary-swipe-wrap {
	position: relative;
	overflow: hidden;
	border-radius: 14px;
	margin-bottom: 10px;
}
/* 条目内容层：加载过渡动画，可点击编辑 */
.diary-entry-slide {
	position: relative;
	z-index: 1;
	transition: transform 0.2s ease;
	cursor: pointer;
	margin-bottom: 0; /* 外层 wrap 已有3 margin-bottom */
}
.diary-entry-slide:active {
	background: #f6fdf6;
}
/* 删除按钮：绝对定位在右侧，高度和内容层一致 */
.diary-swipe-del {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	width: 72px;
	background: linear-gradient(135deg, #ff6b6b, #e05252);
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 0 14px 14px 0;
	z-index: 0;
	cursor: pointer;
}
.diary-swipe-del-text {
	color: #fff;
	font-size: 0.9em;
	font-weight: bold;
	letter-spacing: 1px;
}

/* ================================================================
   历史对话 入口按钮（Banner 区域）
================================================================ */
.history-entry-btn {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 4px 10px;
	margin-left: 8px;
	background: rgba(255, 255, 255, 0.22);
	border-radius: 20px;
	cursor: pointer;
	gap: 2px;
}
.history-entry-btn:active {
	background: rgba(255, 255, 255, 0.38);
}
.history-entry-icon {
	font-size: 1.2em;
	line-height: 1;
}
.history-entry-text {
	font-size: 0.7em;
	color: #fff;
	opacity: 0.9;
}

/* ================================================================
   历史对话 面板（浮层抽屉）
================================================================ */
.history-panel-mask {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.45);
	z-index: 999;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}
.history-panel {
	width: 78%;
	max-width: 340px;
	height: 67%;
	max-height: 67vh;
	background: #fff;
	display: flex;
	flex-direction: column;
	border-radius: 20px 0 0 20px;
	box-shadow: -4px 0 24px rgba(0, 0, 0, 0.18);
	animation: slideInRight 0.28s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	overflow: hidden;
}
@keyframes slideInRight {
	from { transform: translateX(100%); opacity: 0; }
	to   { transform: translateX(0);    opacity: 1; }
}
.history-panel-header {
	display: flex;
	align-items: center;
	padding: 16px 16px 12px;
	border-bottom: 1px solid #f0f4f0;
}
.history-panel-title {
	flex: 1;
	font-size: 1.05em;
	font-weight: 700;
	color: #2e7d32;
}
.history-new-btn {
	padding: 4px 12px;
	background: linear-gradient(135deg, #66bb6a, #43a047);
	color: #fff;
	border-radius: 14px;
	font-size: 0.82em;
	cursor: pointer;
	margin-right: 10px;
}
.history-new-btn:active {
	opacity: 0.8;
}
.history-panel-close {
	font-size: 1.1em;
	color: #90a4ae;
	cursor: pointer;
	padding: 4px;
}
.history-list {
	flex: 1;
	padding: 10px 12px;
	overflow-y: auto;
}
.history-loading,
.history-empty {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 40px 16px;
	gap: 8px;
	color: #90a4ae;
	font-size: 0.88em;
}
.history-empty-hint {
	font-size: 0.8em;
	color: #b0bec5;
	text-align: center;
}
.history-item {
	display: flex;
	align-items: center;
	padding: 12px 10px;
	border-radius: 12px;
	margin-bottom: 6px;
	background: #f8fdf8;
	cursor: pointer;
	transition: background 0.18s;
}
.history-item:active {
	background: #e8f5e9;
}
.history-item-active {
	background: #e8f5e9;
	border-left: 3px solid #66bb6a;
}
.history-item-left {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 3px;
	overflow: hidden;
}
.history-item-title {
	font-size: 0.9em;
	color: #37474f;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.history-item-time {
	font-size: 0.75em;
	color: #90a4ae;
}
.history-item-del {
	padding: 4px 8px;
	color: #ef9a9a;
	font-size: 1.1em;
	cursor: pointer;
}
.history-item-del:active {
	color: #e53935;
}
.history-panel-footer {
	padding: 12px 16px 20px;
	border-top: 1px solid #f0f4f0;
}
.history-save-btn {
	width: 100%;
	padding: 12px 0;
	background: linear-gradient(135deg, #66bb6a, #43a047);
	color: #fff;
	border-radius: 14px;
	text-align: center;
	font-size: 0.95em;
	font-weight: 600;
	cursor: pointer;
	box-shadow: 0 3px 10px rgba(102, 187, 106, 0.35);
}
.history-save-btn:active {
	opacity: 0.85;
}
</style>
