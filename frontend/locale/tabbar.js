// TabBar 国际化联动更新工具（独立零依赖，杜绝循环引用）
import zh from './zh';
import en from './en';

const messages = { zh, en };
const STORAGE_KEY = 'mindapp_locale';

export function updateTabBarLanguage(lang) {
	let current = lang;
	if (!current) {
		try {
			if (typeof uni !== 'undefined' && uni.getStorageSync) {
				current = uni.getStorageSync(STORAGE_KEY) || 'zh';
			}
		} catch (e) {
			current = 'zh';
		}
	}
	const dict = messages[current] || messages.zh;
	const tabList = [
		{ index: 0, text: dict.tabbar.home },
		{ index: 1, text: dict.tabbar.aiassess },
		{ index: 2, text: dict.tabbar.heal },
		{ index: 3, text: dict.tabbar.mine }
	];

	tabList.forEach(item => {
		try {
			if (typeof uni !== 'undefined' && uni.setTabBarItem) {
				uni.setTabBarItem({
					index: item.index,
					text: item.text
				});
			}
		} catch (e) {
			// 在非 TabBar 页面或启动阶段偶发异常做安全容错
		}
	});
}

export default updateTabBarLanguage;
