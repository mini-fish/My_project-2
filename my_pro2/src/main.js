import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from "axios"
//页头组件
import MyHeader from "./components/MyHeader"
Vue.component("my-header",MyHeader);
//页脚组件
import MyFooter from './components/MyFooter'
Vue.component("my-footer",MyFooter)
//轮播图组件
import Carousel from "./components/Carousel"
Vue.component("carousel",Carousel)
//配置axios
// axios.defaults.baseURL=""; //数据库地址
axios.defaults.baseURL="/api";
Vue.prototype.axios=axios; //加入原型对象当中

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
