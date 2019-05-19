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

      <br>
      <div>预测</div>
      <el-table
        :data="predict"
        style="width: 100%">
        <el-table-column
          label="时间"
        >
          <template slot-scope="scope">
            <span style="margin-left: 10px">{{ scope.row.time }}</span>
          </template>
        </el-table-column>

        <el-table-column
          label="内容"
            >
            <template slot-scope="scope">
              <span style="margin-left: 10px">{{ scope.row.text }}</span>
          </template>
        </el-table-column>
      </el-table>

      <br>
      <div>新闻</div>
    <el-table
      :data="news"
      style="width: 100%">
      <el-table-column
        label="时间"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.time }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="标题"
        >
        <template slot-scope="scope">
          <div style="margin-left: 10px"  @click="getConcreteNews(scope.$index, scope.row)">{{ scope.row.title }}</div>
        </template>
      </el-table-column>
    </el-table>

      <br>
      <div>公告</div>
      <el-table
      :data="announcements"
      style="width: 100%">
      <el-table-column
        label="时间"
      >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.time }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="标题"
      >
        <template slot-scope="scope">
          <div style="margin-left: 10px"  @click="getConcreteAnnouncement(scope.$index, scope.row)">{{ scope.row.title }}</div>
        </template>
      </el-table-column>
    </el-table>

      <br>
      <div>评论</div>
      <el-table
      :data="comments"
      style="width: 100%">
      <el-table-column
        label="用户id"
      >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.user_id }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="用户名"
      >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.user.screen_name }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="内容"
      >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.text }}</span>
        </template>
      </el-table-column>
    </el-table>
    </el-scrollbar>
  </div>
</template>

<script>
  export default {
    name: "stockInfo",
    data(){
      return{
        predict:[],
        news:[],
        announcements:[],
        comments:[],
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
      this.getPredicts();
      this.getNews();
      this.getAnnouncements();
      this.getComments();
    },

    mounted() {
      this.drawKLine();
    },

    methods: {
      getPredicts(){
        let stockId = localStorage.getItem("stockId");
        this.$axios.get("http://127.0.0.1:5000/getStockPrediction?stockId=" + stockId)
          .then(res => {
            // console.log(res);
            this.predict = res.data.data
          })
          .catch(err => {
            console.log(err)
          });
      },


      getNews(){
        let stockId = localStorage.getItem("stockId");
        this.$axios.get("http://127.0.0.1:5000/getStockNews?stockId=" + stockId)
          .then(res => {
            // console.log(res);
            this.news = res.data.data
          })
          .catch(err => {
            console.log(err)
          });
      },

      getAnnouncements(){
        let stockId = localStorage.getItem("stockId");
        this.$axios.get("http://127.0.0.1:5000/getPubNote?stockId=" + stockId)
          .then(res => {
            // console.log(res);
            this.announcements = res.data.data
          })
          .catch(err => {
            console.log(err)
          });
      },

      getComments(){
        let stockId = localStorage.getItem("stockId");
        this.$axios.get("http://127.0.0.1:5000/getStockComment?stockId=" + stockId + "&page=" + 1)
          .then(res => {
            res = JSON.parse(res.data)
            console.log("print:");
            console.log(res);

            this.comments = res.list;
            let maxxPage = res.maxPage;
            for (let i = 2; i <= maxxPage; i++){
              this.$axios.get("http://127.0.0.1:5000/getStockComment?stockId=" + stockId + "&page=" + i)
                .then(res => {
                  this.comments.push(res.list);
                })
                .catch(err => {
                  console.log(err)
                });
            }
          })
          .catch(err => {
            console.log(err)
          });
      },

      getConcreteNews(index, row) {
        // console.log(row.url);
        window.open(row.url);
      },

      getConcreteAnnouncement(index, row) {
/*
        console.log(row.url);
*/
        window.open(row.url);
      },

      drawKLine(){
        let myChart = this.$echarts.init(document.getElementById("myChart1"));


        let stockId = localStorage.getItem("stockId");
        // console.log(stockId);
        this.$axios.get("http://127.0.0.1:5000/getStockKLine?stockId=" + stockId)
          .then(res => {
            console.log(res);
            /* for (let i = 0; i < res.data.length; i++) {
               this.resData[i]  = res.data[i];
              // console.log(this.resData[i])
             }*/
            this.resData = res.data.data;
            // console.log(this.resData);
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
            // console.log(rawData[i])
            categoryData.push(rawData[i].date);
            values.push([rawData[i].open, rawData[i].close, rawData[i].lowest, rawData[i].highest]);
            // console.log(categoryData);
            ;          }
/*          console.log(values)
          console.log(categoryData)*/

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
