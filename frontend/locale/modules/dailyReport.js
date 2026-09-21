// 日常状态填报模块双语词典
export const zhDailyReport = {
	title: '日常状态',
	prompt: '请结合自身情况回答下列问题',
	prev: '上一题',
	next: '下一题',
	submit: '提交',
	submitSuccess: '提交成功',
	submitFailed: '提交失败',
	requiredToast: '请填写该问题',
	timeWarning: '未到填报时间，请在晚上8点到次日凌晨5点之间填写',
	questions: [
		'1、今天早晨醒来后，你的状态是？',
		'2、今天是否规划了时间？',
		'3、你今天是否与他人有交流？',
		'4、你今天与他人交流的时长共计？',
		'5、今天的工作或学习中，你的专注度如何？',
		'6、你今天学习或工作的时长共计？',
		'7、今天的空闲时间，你主要做了什么？',
		'8、在空闲时，你是否出现过下列情况？',
		'9、今天玩手机的时长共计？',
		'10、整体来看，你今天的食欲如何？',
		'11、睡觉前通常会做些什么来放松自己？',
		'12、整体来看，你对今天的感受是？'
	],
	options: {
		weakupStatus: [
			'立刻起床，精神不错',
			'起床前稍作休息',
			'赖床刷手机或社交媒体',
			'感到没有动力起床',
			'继续睡了一会儿'
		],
		timeManagement: [
			'制定了清晰的计划并基本执行',
			'制定了计划但有所调整',
			'有大致计划但不明确',
			'没有计划，随心而行',
			'不清楚如何安排时间'
		],
		socialExpression: [
			'积极参与交流，享受互动时光',
			'积极参与交流，但稍感吃力',
			'尝试与他人进行交流，享受互动时光',
			'尝试与他人进行交流，但稍感吃力',
			'较少参与交流，更喜欢独处',
			'抵触交流，不愿与人接触'
		],
		communicateTime: [
			'少于30分钟',
			'30分钟-1小时',
			'1-1.5小时',
			'1.5-2小时',
			'超过2小时'
		],
		studyOrWorkState: [
			'未工作或学习',
			'持续专注且高效',
			'大多数时候能集中注意力且高效',
			'大多数时候能集中注意力，但效率一般',
			'难以集中注意力，容易分心',
			'自身原因，不想工作或学习',
			'外部环境影响，几乎无法工作或学习'
		],
		studyOrWorkTime: [
			'少于1小时',
			'1-3小时',
			'3-5小时',
			'5-8小时',
			'超过8小时'
		],
		free: [
			'参加喜欢的社交活动',
			'休息或简单娱乐',
			'感到无聊或空虚，不知如何打发时间',
			'几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧'
		],
		freeSymptom: [
			'都没有',
			'有些心神不宁',
			'明显心神不宁或小动作多',
			'极度焦虑不安，难以放松'
		],
		phonePlayTime: [
			'少于30分钟',
			'30分钟-1小时',
			'1-1.5小时',
			'1.5-2小时',
			'超过2小时'
		],
		dietInfo: [
			'按时吃饭，食欲正常',
			'偶尔漏餐，但总体还好',
			'经常忘记吃饭或吃得少',
			'几乎不想吃东西',
			'完全没有食欲'
		],
		yesterdayNight: [
			'阅读或学习',
			'听音乐、看电影等放松活动',
			'与家人朋友聊天',
			'上网或玩游戏',
			'感到焦虑或不安，难以放松',
			'直接睡觉'
		],
		yesterdayEndFeel: [
			'感到充实和满足',
			'一般，但还可以',
			'有些许沮丧或失望',
			'感到绝望，对明天没有期待'
		]
	}
};

export const enDailyReport = {
	title: 'Daily Check-in',
	prompt: 'Please answer the following questions based on your situation',
	prev: 'Previous',
	next: 'Next',
	submit: 'Submit',
	submitSuccess: 'Submitted Successfully',
	submitFailed: 'Submission Failed',
	requiredToast: 'Please answer this question',
	timeWarning: 'Check-in is available between 20:00 and 05:00 next day',
	questions: [
		'1. How did you feel upon waking up this morning?',
		'2. Did you plan your time today?',
		'3. Did you communicate with others today?',
		'4. What was the total time you spent communicating with others today?',
		'5. How was your focus during work or study today?',
		'6. What was the total time you spent studying or working today?',
		'7. What did you mainly do during your free time today?',
		'8. Did you experience any of the following during your free time?',
		'9. What was your total screen time on mobile phone today?',
		'10. Overall, how was your appetite today?',
		'11. What did you usually do before bedtime to unwind?',
		'12. Overall, how did you feel about today?'
	],
	options: {
		weakupStatus: [
			'Got up immediately, felt energized',
			'Rested in bed briefly before getting up',
			'Stayed in bed browsing phone or social media',
			'Felt unmotivated to get out of bed',
			'Slept in a little longer'
		],
		timeManagement: [
			'Made a clear plan and largely executed it',
			'Made a plan with slight adjustments',
			'Had a rough plan but rather vague',
			'No plan, went with the flow',
			'Unsure how to organize schedule'
		],
		socialExpression: [
			'Actively communicated and enjoyed interactions',
			'Actively communicated, but felt slightly strained',
			'Attempted to communicate and enjoyed it',
			'Attempted to communicate, but felt slightly strained',
			'Communicated rarely, preferred being alone',
			'Resistant to communication, avoided contact'
		],
		communicateTime: [
			'Under 30 minutes',
			'30 mins - 1 hour',
			'1 - 1.5 hours',
			'1.5 - 2 hours',
			'Over 2 hours'
		],
		studyOrWorkState: [
			'Did not work or study',
			'Consistently focused and productive',
			'Mostly focused and efficient',
			'Mostly focused, but moderate efficiency',
			'Hard to concentrate, easily distracted',
			'Unmotivated to work/study due to personal state',
			'Severely disrupted by external environment'
		],
		studyOrWorkTime: [
			'Under 1 hour',
			'1 - 3 hours',
			'3 - 5 hours',
			'5 - 8 hours',
			'Over 8 hours'
		],
		free: [
			'Attended enjoyable social activities',
			'Rested or light entertainment',
			'Felt bored or empty, unsure how to pass time',
			'Hardly allowed free time; downtime made me more depressed'
		],
		freeSymptom: [
			'None of these',
			'Slightly restless',
			'Noticeably restless or fidgety',
			'Extremely anxious and hard to relax'
		],
		phonePlayTime: [
			'Under 30 minutes',
			'30 mins - 1 hour',
			'1 - 1.5 hours',
			'1.5 - 2 hours',
			'Over 2 hours'
		],
		dietInfo: [
			'Ate on schedule, normal appetite',
			'Occasionally skipped a meal, overall okay',
			'Often forgot to eat or ate very little',
			'Hardly felt like eating',
			'Completely lost appetite'
		],
		yesterdayNight: [
			'Reading or studying',
			'Listening to music, watching movies, or relaxing',
			'Chatting with family or friends',
			'Surfing the internet or playing games',
			'Felt anxious or uneasy, hard to relax',
			'Went straight to sleep'
		],
		yesterdayEndFeel: [
			'Felt fulfilled and satisfied',
			'Ordinary, but okay',
			'Slightly depressed or disappointed',
			'Felt hopeless with no expectations for tomorrow'
		]
	}
};
