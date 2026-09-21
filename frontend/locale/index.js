import Vue from 'vue';
import zh from './zh';
import en from './en';
import { updateTabBarLanguage } from './tabbar';

const STORAGE_KEY = 'mindapp_locale';
const messages = { zh, en };

let initialLang = 'zh';
try {
	if (typeof uni !== 'undefined' && uni.getStorageSync) {
		initialLang = uni.getStorageSync(STORAGE_KEY) || 'zh';
	}
} catch (e) {
	initialLang = 'zh';
}

// 利用 Vue.observable 构建全局响应式核心，确保所有组件模板与计算属性能够自动追踪和响应
export const state = Vue.observable({
	currentLang: initialLang
});

// 解析 "index.dailyReportTitle" 深层属性路径
function getNestedValue(obj, path) {
	if (!obj || !path) return '';
	const keys = path.split('.');
	let current = obj;
	for (let i = 0; i < keys.length; i++) {
		if (current && typeof current === 'object' && keys[i] in current) {
			current = current[keys[i]];
		} else {
			return path;
		}
	}
	return current !== undefined ? current : path;
}

export const i18n = {
	get currentLang() {
		return state.currentLang;
	},
	set currentLang(val) {
		state.currentLang = val;
		try {
			if (typeof uni !== 'undefined') {
				uni.setStorageSync(STORAGE_KEY, val);
				updateTabBarLanguage(val);
				uni.$emit('localeChanged', val);
			}
		} catch (e) {
			console.error('Storage or TabBar sync error:', e);
		}
	},
	t(key) {
		// 显式访问 state.currentLang 触发 Vue 响应式依赖收集
		const lang = state.currentLang;
		const dict = messages[lang] || messages.zh;
		return getNestedValue(dict, key);
	},
	switchLang(targetLang) {
		const nextLang = targetLang || (state.currentLang === 'zh' ? 'en' : 'zh');
		this.currentLang = nextLang;
		return nextLang;
	}
};

export default i18n;
