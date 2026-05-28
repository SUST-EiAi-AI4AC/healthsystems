<template>
  <view class="total">
    <!-- 平均血氧饱和度图表及说明 -->
    <div class="title">
      最近{{this.period}}天的平均血氧饱和度
    </div>
    <div class="sportshour-wrapper">
      <l-echart class="sportshour" ref="avgSpO2" @finished="initDrawAvgSpO2"></l-echart>
    </div>
    <p class="note">
      <b>注：</b>
      <b style="color: rgb(80, 187, 61)">平均血氧饱和度</b>反映了血液中氧气的总体水平，正常范围一般在<b
				style="color: rgb(85, 156, 255)">95%-100%</b>。
    </p>

    <!-- 最低血氧饱和度图表及说明 -->
    <div class="title">
      最近{{this.period}}天的最低血氧饱和度
    </div>
    <div class="sportshour-wrapper">
      <l-echart class="sportshour" ref="minSpO2" @finished="initDrawMinSpO2"></l-echart>
    </div>
    <p class="note">
      <b>注：</b>
      <b style="color: rgb(80, 187, 61)">最低血氧饱和度</b>指监测期间血液中氧气的最低水平，若低于<b
				style="color: rgb(85, 156, 255)">90%</b>可能提示<b>身体存在缺氧</b>情况。
    </p>

    <!-- 睡眠期间平均血氧图表及说明 -->
    <div class="title">
      最近{{this.period}}天的睡眠期间平均血氧
    </div>
    <div class="sportshour-wrapper">
      <l-echart class="sportshour" ref="avgSleepSpO2" @finished="initDrawAvgSleepSpO2"></l-echart>
    </div>
    <p class="note">
      <b>注：</b>
      <b style="color: rgb(80, 187, 61)">睡眠期间平均血氧</b>反映睡眠过程中血液氧气的平均水平，其变化对<b
				style="color: rgb(85, 156, 255)">评估睡眠健康状况</b>有重要意义。睡眠期间平均血氧能反映<b>呼吸是否通畅</b>、<b>氧气供应是否充足</b>，若<b
				style="color: rgb(85, 156, 255)">水平过低或波动大</b>，可能提示存在<b>睡眠呼吸暂停</b>等问题，影响<b>睡眠质量及全身健康</b>；<b
				style="color: rgb(85, 156, 255)">正常且稳定</b>的水平则表明睡眠时<b>氧气供应良好</b>，利于<b>身体修复与功能恢复</b>。
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
      spo2Data: [], // 血氧原始数据
      dateList: [], // 日期列表
      
      // 血氧数据数组
      avgSpO2Data: [],
      minSpO2Data: [],
      avgSleepSpO2Data: [],
      
      // 异常数据标记
      extremAvgSpO2: [],
      extremMinSpO2: [],
      extremAvgSleepSpO2: []
    }
  },
  onLoad() {
    this.getSpO2History();
  },
  methods: {
    // 获取血氧历史数据
    getSpO2History() {
      let _this = this;
      if (this.dataGeted) return;

      http.get(`${config.baseUrl}/healthInfo/getSpO2History?period=${_this.period}`).then(response => {
        this.spo2Data = response.result;
        console.log("血氧历史数据:", this.spo2Data);

        // 按日期排序（升序）
        this.spo2Data.sort((a, b) => Date.parse(a.calendarDate) - Date.parse(b.calendarDate));

        // 处理数据
        this.processSpO2Data();
        this.dataGeted = true;
      }, err => {
        console.error("获取血氧数据失败：", err);
      });
    },

    // 处理血氧数据
    processSpO2Data() {
      // 清空数据
      this.dateList = [];
      this.avgSpO2Data = [];
      this.minSpO2Data = [];
      this.avgSleepSpO2Data = [];
      this.extremAvgSpO2 = [];
      this.extremMinSpO2 = [];
      this.extremAvgSleepSpO2 = [];

      for (let i = 0; i < this.spo2Data.length; i++) {
        const item = this.spo2Data[i];
        const date = this.formatDate(item.calendarDate);
        this.dateList.push(date);

        // 处理平均血氧饱和度 (使用averageSpO2字段)
        if (item.averageSpO2 && item.averageSpO2 > 0) {
          this.avgSpO2Data.push(item.averageSpO2);
        } else {
          this.avgSpO2Data.push(-0.01);
          this.extremAvgSpO2.push({xAxis: date, yAxis: -0.01});
        }

        // 处理最低血氧饱和度 (使用lowestSpO2字段)
        if (item.lowestSpO2 && item.lowestSpO2 > 0) {
          this.minSpO2Data.push(item.lowestSpO2);
        } else {
          this.minSpO2Data.push(-0.01);
          this.extremMinSpO2.push({xAxis: date, yAxis: -0.01});
        }

        // 处理睡眠期间平均血氧 (使用avgSleepSpO2字段)
        if (item.avgSleepSpO2 && item.avgSleepSpO2 > 0) {
          this.avgSleepSpO2Data.push(item.avgSleepSpO2);
        } else {
          this.avgSleepSpO2Data.push(-0.01);
          this.extremAvgSleepSpO2.push({xAxis: date, yAxis: -0.01});
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

    // 平均血氧饱和度图表初始化
    async initDrawAvgSpO2() {
      if (!this.dataGeted) {
        setTimeout(this.initDrawAvgSpO2, 500);
      } else {
        const charts = await this.$refs.avgSpO2.init(echarts);
        this.drawSpO2Chart(charts, '平均血氧饱和度', this.avgSpO2Data, this.extremAvgSpO2, 0, 100);
      }
    },

    // 最低血氧饱和度图表初始化
    async initDrawMinSpO2() {
      if (!this.dataGeted) {
        setTimeout(this.initDrawMinSpO2, 500);
      } else {
        const charts = await this.$refs.minSpO2.init(echarts);
        this.drawSpO2Chart(charts, '最低血氧饱和度', this.minSpO2Data, this.extremMinSpO2, 0, 100);
      }
    },

    // 睡眠期间平均血氧图表初始化
    async initDrawAvgSleepSpO2() {
      if (!this.dataGeted) {
        setTimeout(this.initDrawAvgSleepSpO2, 500);
      } else {
        const charts = await this.$refs.avgSleepSpO2.init(echarts);
        this.drawSpO2Chart(charts, '睡眠期间平均血氧', this.avgSleepSpO2Data, this.extremAvgSleepSpO2, 0, 100);
      }
    },

    // 绘制血氧图表通用方法
    drawSpO2Chart(charts, title, data, extremData, minY, maxY) {
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
                title + ':' + param.value + ' %'
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
          name: "%",
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
  border-left: 8px solid rgb(255, 99, 132); /* 血氧用红色系标识 */
}

.sportshour-wrapper {
  padding-top: 10px;
  margin: 10px auto;
  height: 100%; /* 固定图表高度 */
  border-radius: 10px;
  background: rgb(250, 117, 108); /* 血氧图表用紫色背景 */
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