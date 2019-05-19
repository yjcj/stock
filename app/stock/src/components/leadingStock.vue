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
      :data="leadingStocks"
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
          <div style="margin-left: 10px"  @click="getBlockInfo(scope.$index, scope.row)">{{ scope.row.blockname }}</div>
        </template>
      </el-table-column>
      <el-table-column
        label="股票代码"
        >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.stockid }}</span>
        </template>

      </el-table-column>
      <el-table-column
        label="股票名称"
        >
        <template slot-scope="scope">
          <div style="margin-left: 10px"  @click="getStockInfo(scope.$index, scope.row)">{{ scope.row.stockname }}</div>
        </template>
      </el-table-column>
    </el-table>
    </el-scrollbar>
  </div>
</template>

<script>
  export default {
    name: "leadingStock",
    data(){
      return{
        activeIndex : '1',
        leadingStocks:[]
      }
    },

    created() {
      this.getLeadingStocks();
    },

    methods: {
      getLeadingStocks() {
        this.$axios("http://127.0.0.1:5000/getMainStock")
          .then(res => {
            console.log(res);
            this.leadingStocks = res.data.data
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

      getStockInfo(index, row) {
        localStorage.setItem("stockId", row.stockid);
        console.log(localStorage.getItem("stockId"));
        this.$router.push({path:'/stockInfo'})
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
