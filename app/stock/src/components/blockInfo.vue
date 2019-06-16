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
      :data="leadingStock"
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
        label="近10日涨停数"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.recent10LimitUp }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="近10日涨幅"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.recent10Gains }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="近10日交易量"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.recent10Amount }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="近一年领涨次数"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.leadingTimes }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="流通盘数"
        width="100">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.circulationNumber }}</span>
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
          leadingStock:[],
          stocks:[],
          kLine0:[],
          kLine1:[],
          activeIndex : '1',
          resData: [],
        }
      },

      created() {
        this.getLeadingStock();
        this.getStocks();
      },

      mounted() {
        this.drawKLine();
      },

      methods: {
        getLeadingStock() {
          let blockId = localStorage.getItem("blockId");
          this.$axios("http://127.0.0.1:5000/getLeadingStockByBlock?blockId=" + blockId)
            .then(res => {
              console.log(res);
              this.leadingStock = res.data.data
            })
            .catch(err => {
              console.log(err)
            });
        },

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

        getLeadingStockKLine(){
          let stockId = this.leadingStock.data.data.id;
          this.$axios.get("http://127.0.0.1:5000/getStockKLine?stockId=" + stockId)
            .then(res => {
              console.log(res);
              this.kLine1 = res.data.data
            })
            .catch(err => {
              console.log(err)
            });
        },

        drawKLine(){
          //从后端获取数据
          this.getLeadingStockKLine();
          let blockId = localStorage.getItem("blockId");
          this.$axios("http://127.0.0.1:5000/getKLineByBlock?blockId=" + blockId)
            .then(res => {
              console.log(res);
              this.kLine0 = res.data.data;
              let data0 = splitData(this.kLine0);
              let data1 = splitData(this.kLine1);

              let upColor = '#ec0000';
              let upBorderColor = '#8A0000';
              let downColor = '#00da3c';
              let downBorderColor = '#008F28';

              /*基于准备好的dom，初始化echarts实例*/
              let myChart = this.$echarts.init(document.getElementById('myChart1'));

              //切割数组，把数组中的日期和数据分离，返回数组中的日期和数据
              function splitData(rawData) {
              let categoryData = [];
              let values = [];

              for (let i = 0; i < rawData.length; i++) {
                //splice 返回每组数组中被删除的第一项，即返回数组中被删除的日期
                //alert(rawData[i].splice(0, 1)[0]);
                //categoryData  日期  把返回的日期放到categoryData[]数组中
                categoryData.push(rawData[i].splice(0, 1)[0]);
                //alert(categoryData);

                //数据数组，即数组中除日期外的数据
                // alert(rawData[i]);
                values.push(rawData[i])
              }
              return {
                categoryData: categoryData, //数组中的日期 x轴对应的日期
                values: values              //数组中的数据 y轴对应的数据
              };
            }

              //计算MA平均线，N日移动平均线=N日收盘价之和/N  dayCount要计算的天数(5,10,20,30)
              function calculateMA(data, dayCount) {
                let result = [];
                for (let i = 0, len = data.values.length; i < len; i++) {
                  if (i < dayCount) {
                    result.push('-');
                    //alert(result);
                    continue;   //结束单次循环，即不输出本次结果
                  }
                  let sum = 0;
                  for (let j = 0; j < dayCount; j++) {
                    //收盘价总和
                    sum += data.values[i - j][1];
                    //alert(sum);
                  }
                  result.push(sum / dayCount);
                  // alert(result);
                }
                return result;
              }

              let option = {
                title: {    //标题
                  text: '上证指数',
                  left: 0
                },
                tooltip: {  //提示框
                  trigger: 'axis',    //触发类型：坐标轴触发
                  axisPointer: {  //坐标轴指示器配置项
                    type: 'cross'   //指示器类型，十字准星
                  }
                },
                legend: {   //图例控件，点击图例控制哪些系列不现实
                  data: ['板块日K', '龙头股日K', '板块MA5', '龙头股MA5']
                },
                grid: {     //直角坐标系
                  show:true,
                  left: '10%',    //grid组件离容器左侧的距离
                  right: '10%',
                  bottom: '15%',
                  //backgroundColor:'#ccc'
                },
                xAxis: {
                  type: 'category',   //坐标轴类型，类目轴
                  data: data0.categoryData,
                  //scale: true,  //只在数字轴中有效
                  boundaryGap : false,    //刻度作为分割线，标签和数据点会在两个刻度上
                  axisLine: {onZero: false},
                  splitLine: {show: false},   //是否显示坐标轴轴线
                  //splitNumber: 20,    //坐标轴的分割段数，预估值，在类目轴中无效
                  min: 'dataMin', //特殊值，数轴上的最小值作为最小刻度
                  max: 'dataMax'  //特殊值，数轴上的最大值作为最大刻度
                },
                yAxis: [{
                  scale: true,    //坐标刻度不强制包含零刻度
                  splitArea: {
                    show: true  //显示分割区域
                  }
                },
                {
                  scale: true,    //坐标刻度不强制包含零刻度
                  splitArea: {
                    show: true  //显示分割区域
                  }
                },
                ],
                dataZoom: [     //用于区域缩放
                {
                  filterMode:'filter',    //当前数据窗口外的数据被过滤掉来达到数据窗口缩放的效果  默认值filter
                  type: 'inside', //内置型数据区域缩放组件
                  start: 50,      //数据窗口范围的起始百分比
                  end: 100        //数据窗口范围的结束百分比
                },
                {
                  show: true,
                  type: 'slider', //滑动条型数据区域缩放组件
                  y: '90%',
                  start: 50,
                  end: 100
                }
                ],
                series: [   //图表类型
                {
                  name: '板块日K',
                  type: 'candlestick',    //K线图
                  data: data0.values,     //y轴对应的数据
                  yAxisIndex: 0,
                },

                {
                  name: '龙头股日K',
                  type: 'candlestick',    //K线图
                  data: data1.values.reverse(),     //y轴对应的数据
                  yAxisIndex: 1,
                  itemStyle: {
                    normal: {
                      color: upColor,
                      color0: downColor,
                      borderColor: upBorderColor,
                      borderColor0: downBorderColor
                    }
                  },
                  ////////////////////////图标标注/////////////////////////////

                },
                {   //MA5 5天内的收盘价之和/5
                  name: '板块MA5',
                  type: 'line',
                  data: calculateMA(data0, 5),
                  smooth: true,
                  lineStyle: {
                    normal: {opacity: 0.5}
                  }
                },
                {   //MA5 5天内的收盘价之和/5
                  name: '龙头股MA5',
                  type: 'line',
                  data: calculateMA(data1, 5),
                  smooth: true,
                  lineStyle: {
                    normal: {opacity: 0.5}
                  }
                },
                ]
              };

              // 使用刚指定的配置项和数据显示图表
              myChart.setOption(option);
            })
            .catch(err => {
              console.log(err)
            });
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
