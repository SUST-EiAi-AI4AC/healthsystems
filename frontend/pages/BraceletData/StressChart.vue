<template>
  <view class="total">
    <div class="title">
      最近{{this.period}}天的最大压力
    </div>
    <div class="sportshour-wrapper">
      <l-echart class="sportshour" ref="maxStress" @finished="initDrawMaxStress"></l-echart>
    </div>
	<p class="note">
	<b>注：</b>
	<b style="color: rgb(218, 165, 32)">最大压力</b>是一天中记录的最高压力值，<b>持续高压力</b>可能对<b style="color: rgb(85, 156, 255)">身体健康和情绪状态</b>产生负面影响。
	</p>

    <div class="title">
      最近{{this.period}}天的平均压力
    </div>
    <div class="sportshour-wrapper">
      <l-echart class="sportshour" ref="avgStress" @finished="initDrawAvgStress"></l-echart>
    </div>
	<p class="note">
	<b>注：</b>
	<b style="color: rgb(218, 165, 32)">平均压力</b>反映一天中的整体压力水平，<b>保持适度压力</b>有助于提高效率，<b style="color: rgb(85, 156, 255)">过度压力或高压力</b>都需要关注。
	</p>
  </view>
</template>

<script>
import { router } from '@/nxTemp/router/index.js'
import http from '@/nxTemp/config/requestConfig'
import config from "@/nxTemp/config/index.config.js";
import * as echarts from '@/uni_modules/lime-echart/static/echarts.min'

export default {
  data() {
    return {
      dataGeted: false,
      period: 7,
      stressData: [], // 压力原始数据
      dateList: [], // 日期列表
      
      // 压力数据数组
      maxStressData: [],
      avgStressData: [],
      
      // 异常数据标记
      extremMaxStress: [],
      extremAvgStress: []
    }
  },
  onLoad() {
    this.getStressHistory();
  },
  methods: {
    // 获取压力历史数据
    getStressHistory() {
      let _this = this;
      if (this.dataGeted) return;

      http.get("/healthInfo/getStressHistory?period=" + _this.period).then(response => {
        this.stressData = response.result;
        console.log("压力历史数据:", this.stressData);

        // 按日期排序（升序）
        this.stressData.sort((a, b) => Date.parse(a.calendarDate) - Date.parse(b.calendarDate));

        // 处理数据
        this.processStressData();
        this.dataGeted = true;
      }, err => {
        console.error("获取压力数据失败：", err);
      });
    },

    // 处理压力数据
    processStressData() {
      // 清空数据
      this.dateList = [];
      this.maxStressData = [];
      this.avgStressData = [];
      this.extremMaxStress = [];
      this.extremAvgStress = [];

      for (let i = 0; i < this.stressData.length; i++) {
        const item = this.stressData[i];
        const date = this.formatDate(item.calendarDate);
        this.dateList.push(date);

        // 处理最大压力
        if (item.maxStressLevel && item.maxStressLevel > 0) {
          this.maxStressData.push(item.maxStressLevel);
        } else {
          this.maxStressData.push(-0.01);
          this.extremMaxStress.push({xAxis: date, yAxis: -0.01});
        }

        // 处理平均压力
        if (item.avgStressLevel && item.avgStressLevel > 0) {
          this.avgStressData.push(item.avgStressLevel);
        } else {
          this.avgStressData.push(-0.01);
          this.extremAvgStress.push({xAxis: date, yAxis: -0.01});
        }
      }
    },

    // 格式化日期为 MM-DD 格式
    formatDate(dateStr) {
      const date = new Date(dateStr);
      const month = date.getMonth() + 1;
      const day = date.getDate();
      return `${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;
    },

    // 最大压力图表初始化
    async initDrawMaxStress() {
      if (!this.dataGeted) {
        setTimeout(this.initDrawMaxStress, 500);
      } else {
        const charts = await this.$refs.maxStress.init(echarts);
        this.drawStressChart(charts, '最大压力', this.maxStressData, this.extremMaxStress, 0, 100);
      }
    },

    // 平均压力图表初始化
    async initDrawAvgStress() {
      if (!this.dataGeted) {
        setTimeout(this.initDrawAvgStress, 500);
      } else {
        const charts = await this.$refs.avgStress.init(echarts);
        this.drawStressChart(charts, '平均压力', this.avgStressData, this.extremAvgStress, 0, 100);
      }
    },

    // 绘制压力图表通用方法
    drawStressChart(charts, title, data, extremData, minY, maxY) {
      charts.setOption({
        title: {
          text: title,
          textStyle: {
            color: "white",
          }
        },
        color: ["#ffffff"],
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: "line"
          },
          formatter: (param) => {
            param = param[0];
            if (param.value === -0.01) {
              return [
                '日期:' + param.name + '\n',
                "无数据"
              ].join('');
            } else {
              return [
                '日期:' + param.name + '\n',
                title + ':' + param.value
              ].join('');
            }
          }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        legend: {
          left: 'right',
          data: [title],
          textStyle: {
            color: "white",
          },
          selectedMode: false
        },
        xAxis: {
          name: "日期",
          data: this.dateList,
          axisLabel: {
            interval: 0,
            rotate: -60,
            color: "white",
          },
          axisTick: {
            alignWithLabel: true,
          },
          axisLine: {
            lineStyle: {
              color: "white",
            }
          }
        },
        yAxis: {
          name: "压力值",
          min: minY,
          max: maxY,
          axisLabel: {
            color: "white",
          },
          axisLine: {
            lineStyle: {
              color: "white",
            }
          },
          splitLine: {
            show: true,
            lineStyle: {
              color: 'rgba(255, 255, 255, 0.2)'
            }
          }
        },
        series: [{
          name: title,
          type: 'line',
          smooth: true,
          markPoint: {
            symbol: 'triangle',
            symbolSize: 15,
            itemStyle: {
              color: 'rgb(234, 129, 87)',
              borderWidth: 0,
            },
            label: {
              formatter: "无数据",
              fontSize: 10,
              color: 'white',
              textBorderWidth: 2
            },
            data: extremData
          },
          data: data
        }]
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.total {
  width: 100%;
  height: 100%;
  padding-bottom: 10px;
}

.title {
  font-size: 1.2em;
  color: rgb(40, 40, 40);
  padding: 2px 0 2px 5px;
  margin: 10px auto;
  border-left: 8px solid rgb(199, 188, 35); /* 压力用红色系标识 */
}

.sportshour-wrapper {
  padding-top: 10px;
  margin: 10px auto;
  height: 100%; /* 固定图表高度 */
  border-radius: 10px;
  background: rgb(199, 188, 35); /* 压力图表用紫色背景 */
  margin-left: 10rpx;
  margin-right: 10rpx;
  padding-bottom: 20px;
}

.sportshour {
  width: 96%;
  height: 260px;
  margin: 0 auto;
}

.note {
		margin-top: 5px;
		margin-left: 5px;
		font-size: 1em;
		color: rgb(100, 100, 100);
	}
</style>