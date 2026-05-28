import request from "@/nxTemp/request";
import store from '@/nxTemp/store';
import config from '@/nxTemp/config/index.config.js';

//可以new多个request来支持多个域名请求
let $http = new request({
	//接口请求地址
	baseUrl: config.baseUrl,
	//服务器本地上传文件地址
	fileUrl: config.baseUrl,
	// 服务器上传图片默认url
	defaultUploadUrl: "api/common/v1/upload_image",
	//设置请求头（如果使用报错跨域问题，可能是content-type请求类型和后台那边设置的不一致）
	header: {
		'Content-Type': 'application/json;charset=UTF-8',
		// Authorization: "Bearer " + localStorage.getItem("token"),
		// 'project_token': config.projectToken, //项目token（可删除）
	}
});
// 添加获取七牛云token的方法
$http.getQnToken = function(callback) {
	//该地址需要开发者自行配置（每个后台的接口风格都不一样）
	$http.get("api/common/v1/qn_upload").then(data => {
		/*
		 *接口返回参数：
		 *visitPrefix:访问文件的域名
		 *token:七牛云上传token
		 *folderPath:上传的文件夹
		 *region: 地区 默认为：SCN
		 */
		callback({
			visitPrefix: data.visitPrefix,
			token: data.token,
			folderPath: data.folderPath
		});
	});
}
//请求开始拦截器
$http.requestStart = function(options) {
	console.log("请求开始", options);
	if (options.load) {
		//打开加载动画
		store.commit("setLoadingShow", true);
	}
	// 图片上传大小限制
	if (options.method == "FILE" && options.maxSize) {
		// 文件最大字节: options.maxSize 可以在调用方法的时候加入参数
		let maxSize = options.maxSize;
		for (let item of options.files) {
			if (item.size > maxSize) {
				setTimeout(() => {
					uni.showToast({
						title: "图片过大，请重新上传",
						icon: "none"
					});
				}, 500);
				return false;
			}
		}
	}

	if (options.url) {
		//请求前加入token
		const urlWithoutQuery = String(options.url).split('?')[0];
		let url = urlWithoutQuery.substring(urlWithoutQuery.lastIndexOf('/') + 1);
		// 不需要 token 的白名单接口
		const noAuthUrls = ['login', 'get-pub-key', 'register', 'checkInviteCode'];
		if (!noAuthUrls.includes(url)) {
			let token = uni.getStorageSync('token');
			if (!token) {
				store.dispatch('reLogin', '');
			} else {
				console.log("请求头加入jwt")
				options.header['Authorization'] = uni.getStorageSync('token');
			}
		}
	}


	return options;
}
//请求结束
$http.requestEnd = function(options) {
	//判断当前接口是否需要加载动画
	if (options.load) {
		// 关闭加载动画
		store.commit("setLoadingShow", false);
	}
}
//所有接口数据处理（此方法需要开发者根据各自的接口返回类型修改，以下只是模板）
$http.dataFactory = async function(res) {
	console.log("接口请求数据", {
		url: res.url,
		resolve: res.response,
		header: res.header,
		data: res.data,
		method: res.method,
	});
	if (res.response.statusCode && res.response.statusCode == 401) {
		let httpData = res.response.data;
		if (typeof(httpData) == "string") {
			try { httpData = JSON.parse(httpData); } catch (e) {}
		}
		uni.showToast({
			title: "登录状态失效请重新登录",
			icon: "none"
		});
		uni.setStorageSync('token', '');
		uni.setStorageSync('userInfo', {})
		store.dispatch('reLogin', '');
		return Promise.reject({
			statusCode: 401,
			errMsg: (httpData && (httpData.info || httpData.msg || httpData.result || httpData.message)) || "您没有权限访问！",
			data: res.data
		});
	}
	if (res.response.statusCode && res.response.statusCode == 200) {
		let httpData = res.response.data;
		if (typeof(httpData) == "string") {
			httpData = JSON.parse(httpData);
		}
		httpData.header = res.response.header;
		/*********以下只是模板(及共参考)，需要开发者根据各自的接口返回类型修改*********/

		//判断数据是否请求成功
		if (httpData.code == 200 || httpData.success) {
			// 返回正确的结果(then接受数据)
			return Promise.resolve(httpData);
		} else if (httpData.code != 200 && (httpData.data === 'PleaseLoginAgain' || httpData.data ===
				'MustHaveToken')) {
			uni.showToast({
				title: "登录状态失效请重新登录",
				icon: "none"
			});
			uni.setStorageSync('token', '');
			uni.setStorageSync('userInfo', {})
			store.dispatch('reLogin', '');

			console.log(JSON.stringify(httpData));
			httpData.message = "登录状态失效请重新登录";
			return Promise.resolve(httpData);
		} else { //其他错误提示
			if (res.isPrompt) {
				uni.showToast({
					title: httpData.info || httpData.msg || httpData.result || httpData.message,
					icon: "none",
					duration: 3000
				});
			}
			// 返回错误的结果(catch接受数据)
			return Promise.reject({
				statusCode: 0,
				errMsg: (httpData.info || httpData.msg || httpData.result || httpData.message),
				data: res.data
			});
		}

		/*********以上只是模板(及共参考)，需要开发者根据各自的接口返回类型修改*********/

	} else {
		// 返回错误的结果(catch接受数据)
		return Promise.reject({
			statusCode: res.response.statusCode,
			errMsg: "【request】错误",
			data: res.data
		});
	}
};
// 错误回调
$http.requestError = function(e) {
	// e.statusCode === 0 是参数效验错误抛出的
	if (e.statusCode === 0) {
		throw e;
	} else {
		// 在前端打印
		// console.log(e);
		// uni.showToast({
		// 	title: "网络错误，请检查一下网络",
		// 	icon: "none"
		
		// 仅在控制台打印网络错误信息
		console.error('网络错误，请检查网络：', e);
}
}
export default $http;
