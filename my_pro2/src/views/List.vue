<template>
  <div class="list">
    <div class="navbar">
      <div class="nav">
        <ul>
          <li>首页 &gt;</li>
          <li>蛋糕 &gt;</li>
          <li>不限</li>
        </ul>
      </div>
      <div class="sort">
        <ul>
          <li>蛋糕分类:</li>
          <li>不限</li>
          <li>乳脂奶油蛋糕</li>
          <li>慕斯蛋糕</li>
          <li>罐子蛋糕</li>
          <li>蛋糕配件</li>
          <li>蛋糕搭配-鲜花</li>
        </ul>
      </div>
    </div>
    <div class="list_content" v-for="(item,index) of list" :key="index">
      <div class="cake_list" >
        <div class="left">
          <img :src="item.src" />
        </div>
        <div class="center_left">
          <div v-html="item.title"></div>
          <div v-html="item.details"></div>
        </div>
        <div class="center_right">
          <p>{{item.price.toFixed(2)}}/磅</p>
          <p>{{item.time}}</p>
        </div>
        <div class="right">
          <p></p>
          <router-link :to="`/details/${item.href}`">
            <p><img src="../assets/right.png"/>查看详情</p>
          </router-link>
          <p><img src="../assets/add.png"/>加入购物车</p>
          <p></p>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
.navbar {
  display: flex;
  flex-direction: column;
  margin-left: 20px;
}
.nav ul {
  list-style: none;
  margin-top: 30px;
}
.nav ul li {
  float: left;
  font-size: 12px;
  color: #8e6a55;
}
.sort ul {
  margin-top: 15px;
  margin-left: 15px;
}
.sort ul li {
  float: left;
  font-size: 12px;
  color: #8e6a55;
  margin-left: 15px;
  padding: 5px;
}
.sort ul li:nth-child(2) {
  background-color: #491903;
  color: #fff;
}
.list_content {
  width: 90%;
  /* height: 400px; */
  margin-top: 20px;
}
.cake_list{
  display: flex;
  justify-content: space-around;
}
.list .center_left p{
 text-align: left;
 margin-bottom: -16px;
}
.list .center_left .p1{
  font-size: 16px;
  color: #8C6A55;
  margin: 10px 0;
}
.list .center_left .p2{
  font-size: 12px;
  color: #8C6A55;
  margin: 10px 0;
}
.list .center_left .p3{
  font-size: 12px;
  color: red;
}
.list .center_right p{
  font-size: 12px;
  line-height: 20px;
  color: #8E6A55;
  text-align: left;
}
.cake_list .left img {
  width: 200px;
  height: 200px;
}
.cake_list .right p{
  width: 172px;
  height: 52px;
  font-size: 16px;
  color: #8c6a55;
  border-bottom: 1px solid #fff;
  background-color: #FDF7F2;
  line-height: 52px;
  text-align: left;
}
.cake_list .right p img{
  margin-left: 20px;
  margin-right: 20px;
}
</style>
<script>
export default {
  data() {
    return {
      list: []
    };
  },
  mounted() {
    this.axios.get("/pro/list").then(res => {
      this.list = res.data;
      // console.log(res.data);
    });
  }
};
</script>>