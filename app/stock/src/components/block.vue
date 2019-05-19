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
    <el-table
      :data="test"
      style="width: 100%">
      <el-table-column
        label="板块id"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.blockid }}</span>
        </template>

      </el-table-column>
      <el-table-column
        label="板块"
       >
        <template slot-scope="scope">
          <div style="margin-left: 10px"  @click="getBlockInfo(scope.$index, scope.row)">{{ scope.row.name }}</div>
        </template>
      </el-table-column>
      <el-table-column
        label="涨跌幅"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.percent }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="总成交量（万手）"
      >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.volume }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="总成交额（亿元）"
       >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.account }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="净流入（亿元）"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.input }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label=""今开
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.begin }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="昨收"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.end }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="最高"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.max }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="最低"
       >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.min }}</span>
        </template>
      </el-table-column>
      <el-table-column
      label="涨幅排名"
       >
        <template slot-scope="scope">
      <span style="margin-left: 10px">{{ scope.row.rank }}</span>
      </template>
      </el-table-column>
    </el-table>
    </el-scrollbar>
  </div>
</template>

<script>
    export default {
      name: "block",
      data(){
        return{
          activeIndex : '1',
          blockForm:{
            id:'',
            name:'',
            beginPrice:'',
            endPrice:'',
            maxPrice:'',
            minPrice:'',
            tradingVolume: ''
          },
          test:[]
        }
      },

      created() {
        this.getBlocks();
      },

      methods: {
        getBlocks() {
          /*let username = localStorage.getItem("username")
          let http = new XMLHttpRequest();
          let path = 'http://localhost:8080/user/findUserByUsername?username=' + username
          http.open('GET', path, true)
          http.setRequestHeader('Content-type', 'application/json; charset=utf-8')
          http.send(null)
          http.onreadystatechange = function () {
            if (http.readyState === 4 && http.status === 200) {
              this.userForm = JSON.parse(http.responseText)
              console.log(http.responseText)
            }
          }.bind(this)*/
          this.$axios("http://127.0.0.1:5000/getAllBlock")
            .then(res => {
              console.log(res);
              this.test = res.data.data
            })
            .catch(err => {
              console.log(err)
            });
        },

        getBlockInfo(index, row) {
          localStorage.setItem("blockId", row.blockid);
          console.log(localStorage.getItem("blockId"));
          this.$router.push({path:'/blockInfo'})
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
</style>
