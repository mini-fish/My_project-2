<template>
  <div id="nav">
    <div class="nav_top">
      <ul>
        <li>
          <router-link to="/login">登录</router-link>
        </li>
        <li>
          <router-link to="/register">注册</router-link>
        </li>
        <li>订单</li>
        <li>
          <img src="img/index/shop.png" alt />
          <span>0</span>
        </li>
      </ul>
    </div>
    <div class="fl">
      <div class="nav_left">
        <img src="img/index/logo.jpg" alt />
      </div>
      <div class="nav_center">
        <div class="nav_tab">
          <ul>
            <li>
              <router-link to="/">
                <p class="p1">Home</p>
                <p class="p2">首页</p>
              </router-link>
            </li>
            <li>
              <router-link to="/list">
                <p class="p1">Cake List</p>
                <p class="p2">蛋糕名录</p>
              </router-link>
            </li>
            <li>
              <router-link to="">
                <p class="p1">New Activity</p>
                <p class="p2">最新活动</p>
              </router-link>
            </li>
            <li>
              <router-link to="">
                <p class="p1">Brand Story</p>
                <p class="p2">品牌故事</p>
              </router-link>
            </li>
            <li>
              <router-link to="">
                <p class="p1">33 Members</p>
                <p class="p2">33会员</p>
              </router-link>
            </li>
          </ul>
        </div>
      </div>
      <div class="nav_right">
        <p>
          <img src="img/index/phone.png" alt />
          <span class="p3">4000-968-3133</span>
        </p>
        <p>
          <img src="img/index/delivery.png" alt />
          <span class="p4">市区范围内免费配送</span>
        </p>
      </div>
    </div>
  </div>
</template>
<style scoped>
#nav {
  height: 150px;
  padding: 5px 0;
  border-bottom: 1px solid #ccc;
  box-sizing: border-box;
  box-shadow: 1px 2px 10px -5px #000;
}
.fl {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
/* 顶部导航栏 */
.nav_top {
  height: 30px;
  border-bottom: 1px solid #bbb;
  padding-right: 200px;
}
.nav_top ul {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
  float: right;
  height: 30px;
  font-size: 12px;
  color: #8e6a55;
  align-items: center;
}
.nav_top ul li {
  margin: 0 5px;
  padding-bottom: 10px;
}
.nav_top ul li a {
  color: #8e6a55;
  text-decoration: none;
  display: block;
}
.nav_top ul li a:hover {
  color: #ff8a81;
  text-decoration: underline;
}
.nav_left {
  height: 80px;
}
.nav_center {
  margin-bottom: 5px;
}
.nav_tab ul {
  list-style: none;
  color: #8e6a55;
}
.nav_tab ul li {
  float: left;
  margin: 0 20px;
  width: 110px;
  padding: 10px;
}
.nav_tab ul li a {
  text-decoration: none;
  color: #8e6a55;
  display: block;
  padding-bottom: 10px;
}
.nav_tab ul li a:hover {
  color: #432818;
  border-bottom: 2px solid #bbb;
  cursor: pointer;
  text-decoration: underline;
  padding-bottom: 8px;

}
.nav_tab ul li a::after {
  color: #432818;
  border-bottom: 2px solid #bbb;
}
.nav_tab .p1 {
  font-size: 16px;
  margin-bottom: 10px;
}
.nav_tab .p2 {
  font-size: 14px;
}

.nav_right img {
  float: left;
  margin-right: 10px;
}
.nav_right .p3 {
  font-size: 16px;
  color: #999;
}
.nav_right .p4 {
  font-size: 12px;
  color: #999;
}
</style>