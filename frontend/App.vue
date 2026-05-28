<style lang="scss">
	/* 注意要写在第一行，同时给style标签加入lang="scss"属性 */
	@import "@/uni_modules/uview-ui/index.scss";
</style>

<script>
	// #ifdef APP-PLUS
	var jpushModule = null;
	// #endif
	var pushInited=-1;
	import {
		init
	} from "@/nxTemp";
	export default {
		methods: {
			// #ifdef APP-PLUS
			getRegistrationID() { //获取registerID
				jpushModule.getRegistrationID(result => {
					let registerID = result.registerID
					console.log(registerID)
					this.registrationID = registerID
					uni.setStorageSync("registerID", registerID)
				})
			},
			getNotificationEnabled() {
				if (uni.getSystemInfoSync().platform == "ios") {
					jpushModule.requestNotificationAuthorization((result) => {
						let status = result.status
						if (status < 2) {
							this.noticMsgTool()
						}
					})
				} else {
					jpushModule.isNotificationEnabled((result) => { //判断android是否打开权限
						if (result.code == 0) { //如果为0则表示 未打开通知权限 
							this.noticMsgTool()
						}
					})
				}
			},
			noticMsgTool() {
				if (uni.getSystemInfoSync().platform == "ios") {
					//苹果打开对应的通知栏
					uni.showModal({
						title: '通知权限开启提醒',
						content: '您还没有开启通知权限，无法接受到消息通知，请前往设置！',
						showCancel: false,
						confirmText: '去设置',
						success: function(res) {
							if (res.confirm) {
								var app = plus.ios.invoke('UIApplication', 'sharedApplication');
								var setting = plus.ios.invoke('NSURL', 'URLWithString:', 'app-settings:');
								plus.ios.invoke(app, 'openURL:', setting);
								plus.ios.deleteObject(setting);
								plus.ios.deleteObject(app);
							}
						}
					});
				} else {
					//android打开对应的通知栏
					var main = plus.android.runtimeMainActivity();
					var pkName = main.getPackageName();
					var uid = main.getApplicationInfo().plusGetAttribute("uid");
					uni.showModal({
						title: '通知权限开启提醒',
						content: '您还没有开启通知权限，无法接受到消息通知，请前往设置！',
						showCancel: false,
						confirmText: '去设置',
						success: function(res) {
							if (res.confirm) {
								var Intent = plus.android.importClass('android.content.Intent');
								var Build = plus.android.importClass("android.os.Build");
								//android 8.0引导  
								if (Build.VERSION.SDK_INT >= 26) {
									var intent = new Intent('android.settings.APP_NOTIFICATION_SETTINGS');
									intent.putExtra('android.provider.extra.APP_PACKAGE', pkName);
								} else if (Build.VERSION.SDK_INT >= 21) { //android 5.0-7.0  
									var intent = new Intent('android.settings.APP_NOTIFICATION_SETTINGS');
									intent.putExtra("app_package", pkName);
									intent.putExtra("app_uid", uid);
								} else { //(<21)其他--跳转到该应用管理的详情页  
									intent.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
									var uri = Uri.fromParts("package", mainActivity.getPackageName(), null);
									intent.setData(uri);
								}
								// 跳转到该应用的系统通知设置页  
								main.startActivity(intent);
							}
						}
					});
				}
			}
			// #endif
		},
		onLaunch(options) {
			console.log('App onLaunch')

			init(options);
			// #ifdef APP-PLUS
			plus.screen.lockOrientation("portrait-primary");
			let _this=this;
			uni.$on('userLogoutEvent', (connectStatus) => {
					jpushModule.setAlias({
						'alias': 'noLoginAlias',
						'sequence': 1
					});
			})
			uni.$on('userLoginEvent', () => {
				if(pushInited==-1){
					pushInited=0;
					try{
						jpushModule = uni.requireNativePlugin("JG-JPush");
						jpushModule.initJPushService();
						jpushModule.setLoggerEnable(true);
						
						//监听 极光推送连接状态
						_this.getNotificationEnabled();
						jpushModule.addConnectEventListener(result => {
							let connectEnable = result.connectEnable
							uni.$emit('connectStatusChange', connectEnable)
						});
						jpushModule.addNotificationListener(result => { //极光推送的消息通知回调
							jpushModule.setBadge(0);
							plus.runtime.setBadgeNumber(0);
							let notificationEventType = result.notificationEventType
							// let woopId = result.extras && result.extras.dataType === 'woop' && result.extras.value;
							console.log("通知", result, notificationEventType)
							// 点击事件
							if (notificationEventType == 'notificationOpened') {
								uni.reLaunch({
									url: '/pages/home/home'
								});
							}
						});
						uni.$on('connectStatusChange', (connectStatus) => {
							var connectStr = ''
							if (connectStatus == true) {
								connectStr = '已连接'
								// this.getRegistrationID()
							} else {
								connectStr = '未连接'
							}
							console.log('监听到了连接状态变化 --- ', connectStr)
							_this.connectStatus = connectStr
						})
						jpushModule.isPushStopped(res => {
							// code   0已停止推送  1未停止推送
							const {
								code
							} = res
							console.log(res, '安卓连接状态');
						})
						pushInited=1;
					}catch(err){
						console.log(err);
					}
					if(pushInited==0){
						pushInited=-1;
					}
				}
				if(pushInited==1){
					let userInfo = uni.getStorageSync('userInfo');
					// 设置别名
					jpushModule.setAlias({
						'alias': userInfo.userId,
						'sequence': 1
					})
				}
			});
			let userInfo = uni.getStorageSync('userInfo');
			if (userInfo) { //没有登录信息执行登录操作
				uni.$emit('userLoginEvent', {});
				http.get("/user/pushConnected").then((res) => {})
				setTimeout(function() {
					uni.reLaunch({
						url: "/pages/index/index"
					});
				}, 500);
			}
			// #endif
			// // 新添加的本地定时提醒
			// let now = new Date();
			// let nine = new Date();
			// nine.setHours(21, 0, 0, 0);
			// if (now > nine) nine.setDate(nine.getDate() + 1);
			// let timeStamp = nine.getTime();
			
			// plus.push.scheduleLocalNotification({
			//   title: "填报提醒",
			//   content: "晚上9点啦，别忘了填写健康数据~",
			//   trigger: {
			//     type: "time",
			//     time: timeStamp
			//   },
			//   repeat: "daily",
			//   identifier: "health_report_reminder"
			// });
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide')
		}
	};
</script>

<style lang="scss">
	@import "static/style/base.scss";
</style>