<template>
	<view class="publish-container">
		<view class="input-group">
			<text class="label">标题：</text>
			<input type="text" class="input" v-model="news.title" maxlength="-1" placeholder="请输入新闻标题" />
		</view>
		<view class="input-group">
			<text class="label">来源：</text>
			<input type="text" class="input" v-model="news.source" maxlength="-1" placeholder="请输入新闻来源" />
		</view>
		<view class="input-group">
			<view class="label">选择图片：</view>
			<view class="input-image-box">
				<view class="image-item" v-for="(item, index) in news.photo" :key="index">
					<view class="close-icon" @click="deleteImage(index)">
						<uni-icons type="closeempty" size="18" color="#fff"></uni-icons>
					</view>
					<view class="image-box">
						<image :src="item.url" mode="aspectFill"></image>
					</view>
				</view>
				<view v-if="news.photo.length < 9" class="image-item" @click="addImage">
					<view class="image-box">
						<uni-icons type="plusempty" size="50" color="#eee"></uni-icons>
					</view>
				</view>
			</view>
		</view>
		<view class="input-group">
			<text class="label">内容：</text>
			<textarea class="textarea" v-model="news.content" maxlength="-1" placeholder="请输入新闻内容"></textarea>
		</view>
		<button class="publish-button" @click="publishNews">发布</button>
	</view>
</template>

<script>
	import http from '@/nxTemp/config/requestConfig'
	import config from "@/nxTemp/config/index.config.js";

	export default {
		data() {
			return {
				news: {
					newsId: 0,
					logDate: '',
					title: '',
					source: '',
					photo: [],
					content: '',
					userId: ''
				}
			}
		},

		methods: {
			deleteImage(index) {
				this.news.photo.splice(index, 1);
			},

			addImage() {
				const maxImages = 9 - this.news.photo.length;
				uni.chooseImage({
					count: maxImages,
					sizeType: ['original', 'compressed'],
					sourceType: ['album', 'camera'],
					success: (res) => {
						const tempFilePaths = res.tempFilePaths;
						tempFilePaths.forEach((item, index) => {
							if (index < maxImages) {
								this.news.photo.push({
									url: item
								})
							}
						})
						console.log(res);
					}
				})
			},

			async publishNews() {
				uni.showLoading();

				const imageFileIDs = await Promise.all(this.news.photo.map(async (item, index) => {
					const result = await this.uploadFiles(item.url, `image_${Date.now() + index}.jpg`);
					return result.fileID;
				}));

				this.news.photo = imageFileIDs.map(fileID => ({
					url: fileID
				}));

				const newsData = {
					photo: imageFileIDs,
				};

				this.news.photo = this.news.photo.map(item => item.url).join(',');
				http.post(`${config.baseUrl}/news/add`, this.news).then((res) => {
					uni.hideLoading();
					console.log(res.data);
					if (res.code === 200) {
						uni.showToast({
							title: "提交成功"
						});
						setTimeout(() => {
							uni.navigateTo({
								url: '/pages/news/news'
							});
						}, 700);
					} else {
						uni.showToast({
							title: "提交失败",
							icon: 'error'
						});
					}
				}).catch((error) => {
					console.error('提交新闻时发生错误:', error);
					uni.showToast({
						title: "网络请求失败",
						icon: 'none'
					});
				});
			},

			async uploadFiles(filePath, cloudPath) {
				const result = await uniCloud.uploadFile({
					filePath: filePath,
					cloudPath: cloudPath
				});
				return result;
			}
		}
	}
</script>

<style>
	.publish-container {
		padding: 20px;
	}

	.input-group {
		margin-bottom: 8px;
	}

	.label {
		display: block;
		margin-bottom: 5px;
		font-weight: bold;
		font-size: 1.2em;
	}

	.input,
	.textarea {
		width: 100%;
		padding: 8px;
		border: 1px solid #ddd;
		border-radius: 4px;
	}

	.input {
		height: 45px;
	}

	.textarea {
		height: 400px;
	}

	.input-image-box {
		display: flex;
		flex-wrap: wrap;
		padding: 10px;
	}

	.image-item {
		position: relative;
		width: 33.33%;
		height: 0;
		box-sizing: border-box;
		padding-top: 33.33%;
	}

	.close-icon {
		display: flex;
		justify-content: center;
		align-items: center;
		position: absolute;
		right: 0;
		top: 0;
		width: 22px;
		height: 22px;
		border-radius: 50%;
		background-color: #ff5a5f;
		z-index: 2;
	}

	.image-box {
		display: flex;
		justify-content: center;
		align-items: center;
		position: absolute;
		top: 5px;
		right: 5px;
		bottom: 5px;
		left: 5px;
		border: 1px #eee soild;
		border-radius: 5px;
		overflow: hidden;

		image {
			width: 100%;
			height: 100%;
		}
	}

	.publish-button {
		width: 100%;
		padding: 5px;
		background-color: #007AFF;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	.publish-button:hover {
		background-color: #0056b3;
	}
</style>