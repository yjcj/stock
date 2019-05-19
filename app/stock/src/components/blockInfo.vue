<template>
  <div class = "center">
    <el-scrollbar style="height: 600px;"> <!-- 滚动条 -->

      <el-menu
      :default-active="activeIndex"
      class="el-menu-demo"
      mode="horizontal"
      @select="handleSelect"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b"
    >
      <el-menu-item index="1">板块</el-menu-item>
      <el-menu-item index="2">龙头股</el-menu-item>

    </el-menu>
    <div class="charts" :style="{height:'400px'}">
      <div id="myChart1" :style="{width:'600px', height:'300px'}" class="chart1"></div>
    </div>
    <el-table
      :data="stocks"
      style="width: 100%">
      <el-table-column
        label="代码"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.id }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="名称"
        width="100">
        <template slot-scope="scope">
          <div style="margin-left: 10px"  @click="getStockInfo(scope.$index, scope.row)">{{ scope.row.name }}</div>
        </template>
      </el-table-column>

      <el-table-column
        label=""现价
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.current }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="涨跌幅(%)"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.percent }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="涨跌"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.chg }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="涨速(%)"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.speed }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="换手(%)"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.changehand }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="量比"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.amountratio }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="振幅(%)"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.amplitude }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="成交额"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.volume }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="流通股"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.flow }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="流通市值"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.flowmarket }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="市盈率"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.pe }}</span>
        </template>
      </el-table-column>
    </el-table>
    </el-scrollbar>
  </div>
</template>

<script>
  export default {
      name: "blockInfo",
      data(){
        return{
          stocks:[],
          kLine:[],
          activeIndex : '1',
          resData: [],
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

      created() {
        this.getStocks();
      },

      mounted() {
        this.drawKLine();
      },

      methods: {
        getStocks() {
          let blockId = localStorage.getItem("blockId");
          this.$axios("http://127.0.0.1:5000/getStockByBlock?blockId=" + blockId)
            .then(res => {
              console.log(res);
              this.stocks = res.data.data
            })
            .catch(err => {
              console.log(err)
            });
        },

        getStockInfo(index, row) {
         localStorage.setItem("stockId", row.id);
          console.log(localStorage.getItem("stockId"));
          this.$router.push({path:'/stockInfo'})
        },

        drawKLine(){
          let myChart = this.$echarts.init(document.getElementById("myChart1"));


          let blockId = localStorage.getItem("blockId");
          this.$axios("http://127.0.0.1:5000/getBlockKLine?blockId=" + blockId)
            .then(res => {
              console.log(res);
             /* for (let i = 0; i < res.data.length; i++) {
                this.resData[i]  = res.data[i];
               // console.log(this.resData[i])
              }*/
             this.resData = res.data.data;
              console.log(this.resData);
              this.resData = splitData(this.resData);

              this.echartsOption.xAxis.data = this.resData.categoryData;
              this.echartsOption.series[0].data = this.resData.values;
              console.log(this.echartsOption.xAxis.data);
              console.log(this.echartsOption.series[0].data);

              myChart.setOption(this.echartsOption)

            })
            .catch(err => {
              console.log(err)
            });



          function splitData (rawData) {
            let categoryData = [];
            let values = [];
            for (let i = 0; i < rawData.length; i++) {
              console.log(rawData[i])
              categoryData.push(rawData[i].date);
              values.push([rawData[i].open, rawData[i].close, rawData[i].lowest, rawData[i].highest]);
              // console.log(categoryData);
            }
            console.log(values)
            console.log(categoryData);

            return {
              categoryData: categoryData,
              values: values
            }
          }
// 启用配置
        },

        handleSelect(key, keyPath) {
          console.log(key, keyPath);
          if (key === "1") {
            localStorage.clear();
            this.$router.push({path: '/block'})
          }
          if (key === "2"){
            this.$router.push({path: '/leadingStock'})
          }
        },
      }
    }
</script>

<style scoped>
  .center{
    position: fixed;
    top:0;
    width: 100%;
  }
  .chart1{
    position: fixed;
    right:25%;
    left: 25%;
    top: 5%;
  }
</style>
