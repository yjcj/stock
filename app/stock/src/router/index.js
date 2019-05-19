import Vue from 'vue'
import Router from 'vue-router'
import block from "@/components/block";
import HelloWorld from "@/components/HelloWorld";
import blockInfo from "@/components/blockInfo";
import kline from "@/components/kline";
import leadingStock from "@/components/leadingStock";
import stockInfo from "@/components/stockInfo";

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/block',
      name: 'block',
      component: block
    },
    {
      path: '/blockInfo',
      name: 'blockInfo',
      component: blockInfo
    },
    {
      path: '/kline',
      name: 'kline',
      component: kline
    },
    {
      path: '/leadingStock',
      name: 'leadingStock',
      component: leadingStock
    },
    {
      path: '/stockInfo',
      name: 'stockInfo',
      component: stockInfo
    }
  ]
})
