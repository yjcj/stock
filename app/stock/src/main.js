import router from './router'
import Vue from 'vue';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue';
import axios from 'axios'
import echarts from 'echarts'

Vue.use(ElementUI);
Vue.prototype.$http = axios;
Vue.prototype.$axios = axios;
Vue.prototype.$echarts = echarts;



Vue.config.productionTip = false;

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
