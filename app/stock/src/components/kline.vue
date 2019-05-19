<template>
  <div id="main">
    <button>我是按钮</button>
    <div id='myChart'
         ref="myChart"
    >
    </div>
  </div>
</template>
<script>
  import echarts from 'echarts'

  export default {
    name: 'kline',
    data () {
      return {
        resData: '',
        echartsOption: {
          title: {
            text: '上证指数',
            left: 0
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross'
            }
          },
          legend: {
            data: ['日K', 'MA5', 'MA10', 'MA20', 'MA30']
          },
          grid: {
            left: '10%',
            right: '10%',
            bottom: '15%'
          },
          xAxis: {
            type: 'category',
            data: [],
            scale: true,
            boundaryGap: false,
            axisLine: { onZero: false },
            splitLine: { show: false },
            splitNumber: 20,
            min: 'dataMin',
            max: 'dataMax'
          },
          yAxis: {
            scale: true,
            splitArea: {
              show: true
            }
          },
          dataZoom: [
            {
              type: 'inside',
              start: 30,
              end: 70
            },
            {
              show: true,
              type: 'slider',
              y: '90%',
              start: 0,
              end: 75
            }
          ],
          series: [
            {
              name: '日K',
              type: 'k',
              data: [],
              itemStyle: {
                normal: {
                  color: '#ec0000',
                  color0: '#00da3c',
                  borderColor: '#8A0000',
                  borderColor0: '#008F28'
                }
              },
              markPoint: {
                label: {
                  normal: {
                    formatter: function (param) {
                      return param != null ? Math.round(param.value) : ''
                    }
                  }
                },
                data: [
                  {
                    name: 'highest value',
                    type: 'max',
                    valueDim: 'highest'
                  },
                  {
                    name: 'lowest value',
                    type: 'min',
                    valueDim: 'lowest'
                  },
                  {
                    name: 'average value on close',
                    type: 'average',
                    valueDim: 'close'
                  }
                ],
                tooltip: {
                  formatter: function (param) {
                    return param.name + '<br>' + (param.data.coord || '')
                  }
                }
              },
              markLine: {
                symbol: ['none', 'none'],
                data: [
                  [
                    {
                      name: 'from lowest to highest',
                      type: 'min',
                      valueDim: 'lowest',
                      symbol: 'circle',
                      symbolSize: 10,
                      label: {
                        normal: { show: false },
                        emphasis: { show: false }
                      }
                    },
                    {
                      type: 'max',
                      valueDim: 'highest',
                      symbol: 'circle',
                      symbolSize: 10,
                      label: {
                        normal: { show: false },
                        emphasis: { show: false }
                      }
                    }
                  ]
                ]
              }
            }
          ]
        }
      }
    },
    created () {
      // this.setEchartOption()
    },
    mounted () {
      this.setEchartOption()
      this.myChart = echarts.init(document.getElementById('myChart'))
      this.myChart.setOption(this.echartsOption)
    },
    methods: {
      setEchartOption () {
        // 数据意义：开盘(open)，收盘(close)，最低(lowest)，最高(highest)
        this.resData = splitData([
          ['2013/1/24', 2320.26, 2320.26, 2287.3, 2362.94],
          ['2013/1/25', 2300, 2291.3, 2288.26, 2308.38],
          ['2013/1/28', 2295.35, 2346.5, 2295.35, 2346.92]
        ])
        this.echartsOption.xAxis.data = this.resData.categoryData
        this.echartsOption.series[0].data = this.resData.values
        console.log(this.echartsOption.xAxis.data)
        console.log(this.echartsOption.series[0].data)

        function splitData (rawData) {
          var categoryData = []
          var values = []
          for (var i = 0; i < rawData.length; i++) {
            categoryData.push(rawData[i].splice(0, 1)[0])
            values.push(rawData[i])
          }
          console.log(values)
          console.log(categoryData)

          return {
            categoryData: categoryData,
            values: values
          }
        }
      }
    }
  }
</script>
<style scoped>
  #myChart{
    width: 70%;
    height: 500px;
    margin: 0 auto;
  }

</style>
