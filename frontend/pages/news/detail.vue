<template>
	<view class="detail">
		<view v-if="newsData && newsData.length > 0" class="news-item">
			<view class="detail-header">
				<view class="detail-title">{{ newsData[0].title }}</view>
			</view>
			<view class="detail-body">
				<view class="detail-user-data">发布者：{{ newsData[0].username }} | 发布日期：{{ newsData[0].logDate }}</view>
				<view class="detail-photos">
					<image v-for="(photoUrl, photoIndex) in getPhotos(newsData[0].photo)" :key="photoIndex" :src="photoUrl"
						class="detail-photo"/>
				</view>
				<view class="detail-content">{{ newsData[0].content }}</view>
				<view class="detail-source">来源：{{ newsData[0].source }}</view>
			</view>
		</view>
		<view v-else class="no-data">暂无数据</view>
	</view>
</template>

<script>
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {
				newsData: []
			}
		},
		
		methods: {
			getPhotos(photoString) {
				return photoString.split(',').filter(url => url.trim() !== '');
			}
		},
		
		onLoad(option) {
			if (option.newsId) {
				uni.request({
					url: `${config.baseUrl}/news/getContentById?newsId=${option.newsId}`,
					method: 'GET',
					success: (res) => {
						if (res.data.code === 200) {
							this.newsData = res.data.result.data;
						} else {
							uni.showToast({
								title: res.data.message,
								icon: 'none'
							});
						}
					},
					fail: (err) => {
						uni.showToast({
							title: '请求失败',
							icon: 'none'
						});
					}
				});
			}
		}
	}
</script>

<style>
	.detail {
		padding: 20px;
	}
	
	.detail-title{
		font-weight: bold;
		font-size: 1.5em;
		text-align: center;
	}

	.detail-user-data {
		font-size: 16px;
		color: #666;
		margin-bottom: 20px;
		text-align: center;
	}

	.detail-body {
		margin-top: 10px;
	}
	
	.detail-photo {
		width: 31%;
		height: 100px;
		margin-right: 8px;
	}
	
	.detail-content {
		font-size: 18px;
		margin-top: 30px;
	}
	
	.detail-source {
		font-size: 15px;
		color: #666;
		margin-top: 5px;
	}
	
	.no-data {
		text-align: center;
		color: #999;
		padding: 20px;
	}
</style>