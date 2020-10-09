import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: '首页',
    component: Index
  },
  {
    path: '/list',
    name: '列表页',
    component: () => import(/* webpackChunkName: "list" */ '../views/List.vue'),
    props:true
  },
  {
    path: '/details/:lid',
    name: '详情页',
    // props:true,
    component: () => import(/* webpackChunkName: "details" */ '../views/Details.vue')
  },
  {
    path: '/login',
    name: '登录页',
    component: () => import(/* webpackChunkName: "login" */ '../views/Login.vue')
  },
  {
    path:'/register',
    name: '注册页',
    component: () => import(/* webpackChunkName: "register" */ '../views/Register.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
