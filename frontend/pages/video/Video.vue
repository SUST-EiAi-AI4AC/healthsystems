<template>
	<view>
		<web-view :src="websrc" @message="handlePostMessage"></web-view>
	</view>
</template>

<script>
	import {
		router
	} from '@/nxTemp/router/index.js'
	export default {
		data() {
			return {
				websrc: ""
			}
		},

		onShow() {
			//加载
			this.websrc = "/hybrid/html/video/video_new.html?token=" + uni.getStorageSync('token');
		},
		methods: {
			handlePostMessage: function(data) {
				if (data.detail.data[0].action == "upping") {
					uni.showLoading({
						title: '正在上传',
						mask: true
					});

					setTimeout(function() {
						uni.hideLoading();
					}, 120000);
				}
				if (data.detail.data[0].action == "upsuc") {
					uni.hideLoading();
					uni.showToast({
						title: "已上传视频！"
					});
					uni.reLaunch({
						url: "/pages/home/home"
					});
				}

				if (data.detail.data[0].action == "uperror") {
					uni.hideLoading();
					uni.showToast({
						title: data.detail.data[0].message.message,
						icon: 'error'
					});
				}

				if (data.detail.data[0].action == "updone") {
					uni.hideLoading();
				}

				if (data.detail.data[0].action == "saveVideo") {
					var base64Str = data.detail.data[0].data;
					var fileName = data.detail.data[0].fileName;
					var index = base64Str.indexOf(',')
					base64Str = base64Str.slice(index + 1, base64Str.length)
					index = base64Str.indexOf(',')
					base64Str = base64Str.slice(index + 1, base64Str.length)
					uni.showLoading({
						title: '正在保存',
						mask: true
					});
					plus.io.requestFileSystem(plus.io.PRIVATE_DOC, function(fs) {
						fs.root.getFile(fileName, {
							create: true
						}, function(entry) {
							// 获得本地路径URL，file:///xxx/doc/1663062980631.xlsx  
							var fullPath = entry.fullPath;

							console.log(fullPath);

							let platform = uni.getSystemInfoSync().platform;
							if (platform == 'android') {

								var FileOutputStream = plus.android.importClass(
									"java.io.FileOutputStream");
								try {
									function base64ToByteArray(base64Str) {
										const binaryString = atob(base64Str);
										const uint8Array = new Uint8Array(binaryString.length);

										for (let i = 0; i < binaryString.length; i++) {
											uint8Array[i] = binaryString.charCodeAt(i);
										}
										let arr = []
										Array.from(uint8Array).map(num => {
											arr.push(num >= 128 ? (num - 256) : num)
										})
										return arr;
									}
									var out = new FileOutputStream(fullPath);
									let bytes = base64ToByteArray(base64Str);
									console.log(bytes.length);

									if (bytes == null || bytes.length == 0) {

										out.close();
										uni.hideLoading();
										uni.showModal({
											title: "生成失败",
											content: "nativeJS限制参数长度无法获取文件！",
											showCancel: false
										})
										return
									} else {

										out.write(bytes);
										out.close();
										// 回调    
										//callback && callback(entry.toLocalURL());  
										uni.hideLoading();
										//保存到相册
										uni.saveVideoToPhotosAlbum({
											filePath: fullPath,
											success: function() {
												uni.$u.toast("视频已保存到相册！");
											}
										});
										return
									}
								} catch (e) {
									uni.hideLoading();
									console.log(e.message);
								}
							} else if (platform == 'ios') {
								var NSData = plus.ios.importClass('NSData');
								var nsData = new NSData();
								nsData = nsData.initWithBase64EncodedStringoptions(base64Str, 0);
								if (nsData) {
									nsData.plusCallMethod({
										writeToFile: fullPath,
										atomically: true
									});
									plus.ios.deleteObject(nsData);
								}
								uni.hideLoading();
								// 回调    
								// callback && callback(entry.toLocalURL());  
							} else {
								uni.hideLoading();
							}
						})
					})
				}
			},
			
			requestPerm() {
				// #ifdef APP-PLUS
				plus.android.requestPermissions(['android.permission.CAMERA', 'android.permission.RECORD_AUDIO'], function(
					e) {
					if (e.deniedAlways.length > 0) { //权限被永久拒绝
						// 弹出提示框解释为何需要定位权限，引导用户打开设置页面开启
						console.log('Always Denied!!! ' + e.deniedAlways.toString());
					}
					if (e.deniedPresent.length > 0) { //权限被临时拒绝
						// 弹出提示框解释为何需要定位权限，可再次调用plus.android.requestPermissions申请权限
						console.log('Present Denied!!! ' + e.deniedPresent.toString());
					}
					if (e.granted.length > 0) { //权限被允许
						//调用依赖获取定位权限的代码
						console.log('Granted!!! ' + e.granted.toString());
					}
				}, function(e) {
					console.log('Request Permissions error:' + JSON.stringify(e));
				});
				// #endif
			}
		},
		
		onLoad(parms) {
			this.requestPerm();
		},
	}
</script>

<style>

</style>