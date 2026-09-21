import Vue from "vue";
import App from "./App";
import {
	router,
	RouterMount
} from "@/nxTemp/router";
import store from "@/nxTemp/store";
import nxTemp from "@/nxTemp";
import uView from '@/uni_modules/uview-ui'
import i18n from '@/locale'

Vue.prototype.$t = function(key) {
	return i18n.t(key);
};
Vue.prototype.$i18n = i18n;

async function bootstrap() {
	App.mpType = "app";
	//引入路由
	Vue.use(router);
	// 加载nxTemp
	Vue.use(nxTemp);
	Vue.use(uView);

	const app = new Vue({
		store,
		...App
	});
	// #ifdef H5
	RouterMount(app, router, "#app");
	// #endif
	// #ifndef H5
	app.$mount();
	// #endif
}

bootstrap();
