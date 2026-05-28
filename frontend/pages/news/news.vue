<template>
	<view class="wrap">
		<view class="menu">
			<image class="add-icon" src="/static/images/mine/add.png" @click="goToPublishPage" />
		</view>
		<view class="news-list">
			<navigator :url="'/pages/news/detail?newsId=' + news.newsId" class="news-item"
				v-for="(news, index) in newsList" :key="index">
				<view class="news-title">{{ news.title }}</view>
				<view class="news-info">
					<view class="news-user-date">发布者: {{ news.username }} | 发布日期: {{ news.logDate }}</view>
					<view class="news-photos">
						<image v-for="(photoUrl, photoIndex) in getPhotos(news.photo)" :key="photoIndex" :src="photoUrl"
							class="news-photo" v-if="photoIndex < 3" />
					</view>
					<view class="news-source">来源: {{ news.source }}</view>
				</view>
				<view class="news-separator"></view>
			</navigator>
		</view>
	</view>
</template>

<script>
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {
				newsList: []
			}
		},
		onPullDownRefresh() {
			uni.showNavigationBarLoading();
			this.fetchNewsList().then(() => {
				uni.hideNavigationBarLoading();
				uni.stopPullDownRefresh();
			}).catch(err => {
				console.error('Failed to refresh news list:', err);
				uni.hideNavigationBarLoading();
				uni.stopPullDownRefresh();
			});
		},

		onLoad() {
			this.fetchNewsList();
		},
		methods: {
			fetchNewsList() {
				return new Promise((resolve, reject) => {
					uni.request({
						url: `${config.baseUrl}/news/getNewsList`,
						method: 'GET',
						success: (res) => {
							if (res.statusCode === 200 && res.data.code === 0) {
								this.newsList = res.data.result.data || [];
								resolve();
							} else {
								reject(new Error('Failed to fetch news list: ' + (res.data.message ||
									'Unknown error')));
							}
							console.log(this.newsList);
						},

						fail: (err) => {
							reject(err);
						}
					});
				});
			},

			goToPublishPage() {
				uni.navigateTo({
					url: "/pages/news/publish"
				});
			},

			getPhotos(photoString) {
				return photoString.split(',').filter(url => url.trim() !== '');
			}
		}
	}
</script>

<style>
	.wrap {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		justify-content: flex-start;
		width: 100%;
		position: relative;
		min-height: 100vh;
	}

	.menu {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		width: 100%;
		border-bottom: 1px solid #C8C7CC;
		height: auto;
		padding: 5px;
	}

	.news-list {
		flex: 1;
		width: 100%;
		overflow-y: auto;
		padding: 20px;
	}

	.news-item {
		border-bottom: 1px solid #C8C7CC;
		padding-bottom: 10px;
		margin-bottom: 10px;
	}

	.news-title {
		font-size: 1.3em;
		font-weight: bold;
		margin-bottom: 5px;
	}

	.news-user-date {
		font-size: 1.0em;
		color: #666;
		margin-bottom: 5px;
	}

	.news-photo {
		width: 31.2%;
		height: 100px;
		margin-right: 8px;
	}

	.news-separator {
		height: 1px;
		background-color: #C8C7CC;
		width: 100%;
		margin-top: 5px;
	}

	.news-info {
		flex: 1;
		margin-right: 5px;
	}

	.news-user,
	.news-source,
	.news-logDate {
		font-size: 1.0em;
		color: #666;
	}

	.add-icon {
		width: 30px;
		height: 30px;
	}
</style>