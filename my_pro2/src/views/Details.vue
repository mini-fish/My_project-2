<template>
  <div class="details">
    <div class="nav">
      <ul>
        <li>首页 &gt;</li>
        <li>蛋糕配件 &gt;</li>
        <li>Bill of lading 1磅蛋糕提货卡套餐</li>
      </ul>
    </div>
    <div class="content">
      <div class="left">
        <div class="left_top">
          <img :src="img_info[i].src"/>
          <div class="shade" :class="{'d-none':hide}" :style="shadeStyle"></div>
          <div class="super_shade" @mouseover="toggle" @mouseout="toggle" @mousemove="move"></div>
        </div>
        <div class="img_large" :class="{'d-none':hide}" :style="{'background-image':`url(/${img_info[i].src})`,'background-position':`-${parseInt(shadeStyle.left)*2}px -${parseInt(shadeStyle.top)*2}px`}"></div>
        <ul class="left_foot" @mouseover="changei">
          <li v-for="(item,i) of img_info" :key="i">
            <img :src="item.src" :data-i="i" />
          </li>
        </ul>
      </div>
      <div class="right">
        <div class="title">{{info.info_title}}</div>
        <div class="price">
          <span class="span1">
            价格:￥
            <span class="span2">{{info.info_price}}</span>
          </span>
          <span class="span1">￥{{info.info_price}}/磅</span>
        </div>
        <div class="pound" v-html="info.info_pound"></div>
        <div class="cake_detail">
          <div class="cake_detail_top">
            <span>
              <img src="../assets/Resize.png" />
              {{info.info_size}}
            </span>
            <span>
              <img src="../assets/person-stalker.png" />
              {{info.info_share}}
            </span>
          </div>
          <div class="cake_detail_floot">
            <span>
              <img src="../assets/plates.png" />
              {{info.info_cutlery}}
            </span>
            <span>
              <img src="../assets/time.png" />
              {{info.info_order}}
            </span>
          </div>
        </div>
        <div class="add">
          <div class="add_left">
            <button>＋</button>
            <input type="text" value="1" />
            <button>－</button>
          </div>
          <div>查看配送时间</div>
        </div>
        <div class="btn">
          <button>立即购买</button>
          <button>查看购物车</button>
        </div>
        <div class="compose">{{info.info_compose}}</div>
        <div class="remark">{{info.info_remark}}</div>
      </div>
    </div>
  </div>
</template>
<style>
.nav {
  width: 100%;
  height: 30px;
  padding-left: 60px;
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
.content {
  display: flex;
  margin: 0 auto;
  width: 70%;
  margin-top: 40px;
}
.content .left{
  position: relative;
}
.content .left .d-none{
  display: none;
}
 .content .left_top .shade{
   width: 200px;
   height: 200px;
   background-color: #000;
   position: absolute;
   top:0px;
   left: 0px;
  opacity: 0.2;
 }
  .content .left_top .super_shade{
   width: 500px;
   height: 500px;
   background-color: #ddd;
   position: absolute;
   top:0px;
   left: 0px;
   z-index: 100;
   background-color: transparent;
 }
 .content .left_top img{
   display: flex;
 }
.content .left .img_large{
  width: 500px;
  height: 500px;
  margin-left: 60px;
  position: absolute;
  z-index: 100;
  top: 0px;
  left: 500px;
  overflow: hidden;
  background-size: 1000px 1000px;
  background-repeat:no-repeat;
}
.content .left .img_large img{
  width: 1000px;
  height: 1000px;
}
.content .left .left_foot {
  width: 610px;
  height: 120px;
  display: flex;
  margin-top: 20px;
}
.content .left .left_foot img {
  width: 120px;
  height: 110px;
  border: 1px solid #ddd;
  margin-right: 10px;
}
.content .right {
  margin-left: 150px;
}
.content .right .title {
  font-size: 18px;
  color: #604136;
  border-bottom: 1px solid #ddd;
  width: 370px;
  height: 32px;
  text-align: left;
}
.details .content .right .price {
  margin-top: 15px;
  text-align: left;
  margin-bottom: 15px;
}
.content .right .price span:nth-child(2) {
  margin-left: 25px;
}
.content .right .price .span1 {
  font-size: 14px;
  color: #8e6a55;
}
.content .right .price .span2 {
  font-size: 18px;
  color: #8e6a55;
}
.content .right .pound {
  display: flex;
  position: relative;
  height: 90px;
}
/* .content .right .p_1,.p_2,.p_3,.p_4:active{
  border: 1px solid #4A1A04;
} */
.content .right .p_1,
.p_2 {
  width: 110px;
  height: 32px;
  font-size: 12px;
  color: #8e6a55;
  border: 1px solid #d5c2b9;
  line-height: 32px;
  text-align: left;
  padding-left: 5px;
  margin-right: 10px;
}
.content .right .p_3,
.p_4 {
  width: 110px;
  height: 32px;
  font-size: 12px;
  color: #8e6a55;
  border: 1px solid #d5c2b9;
  line-height: 32px;
  text-align: left;
  padding-left: 5px;
  margin-right: 10px;
  position: absolute;
  margin-top: 40px;
}
.details .cake_detail {
  text-align: left;
  margin-bottom: 20px;
  font-size: 12px;
  color: #8e6a55;
}
.cake_detail img {
  width: 12px;
  height: 12px;
  margin-right: 5px;
}
.details .cake_detail .cake_detail_top {
  margin-bottom: 15px;
}
.cake_detail .cake_detail_top span:nth-child(1) {
  margin-right: 50px;
}
.cake_detail .cake_detail_floot span:nth-child(1) {
  margin-right: 30px;
}
.details .content .add {
  display: flex;
  align-items: center;
  color: #8e6a55;
  margin-bottom: 25px;
}
.content .add .add_left {
  width: 150px;
  height: 26px;
  display: flex;
  justify-content: space-around;
}
.content .add button {
  width: 26px;
  height: 26px;
  background-color: #fff;
  line-height: 26px;
  border: 1px solid #8e6a55;
  font-weight: bold;
}
.content .add input {
  width: 50px;
  height: 23px;
  text-align: center;
  padding: 0;
}
.content .add div:nth-child(2) {
  margin-left: 40px;
  font-size: 12px;
}
.details .content .btn {
  padding-bottom: 15px;
  border-bottom: 1px solid #ddd;
  margin-bottom: 25px;
  width: 370px;
  display: flex;
}
.content .btn button {
  width: 150px;
  height: 50px;
  background-color: #432818;
  color: #fff;
}
.content .btn button:nth-child(2) {
  margin-left: 15px;
}
.content .compose {
  font-size: 12px;
  color: #8e6a55;
  line-height: 20px;
}
.content .remark {
  font-size: 12px;
  color: #8e6a55;
  line-height: 20px;
}
</style>

<script>
export default {
  data() {
    return {
      info: {},
      img_info: {},
      i:0,
      //动态控制遮罩层
      hide:true,
      //修改遮罩层位置
      shadeStyle:{
        left:0,
        top:0
      },
    };
  },
  methods:{
    move(e){
      // console.log(e.offsetX,e.offsetY);
      var left=e.offsetX-100
      var top=e.offsetY-100;
      if(left<0) left=0;else if(left>300) left=300;
      if(top<0) top=0;else if(top>300) top=300;
      this.shadeStyle={
        left:left+"px",
        top:top+"px"
      }
    },
    toggle(){
      this.hide=!this.hide;
    },
    changei(e){
      if(e.target.nodeName=="IMG"){
        this.i=e.target.dataset.i;
      }
      
    }
  },
  mounted() {
    //1.获取地址栏中的ID
    let lid = this.$route.params.lid;
    //2.向WEB服务器发送请求
    this.axios.get("/pro/details?lid=" + lid).then(res => {
      this.info = res.data.result;
      console.log(res.data.result);
    });
    //2.向WEB服务器发送请求,请求详情页对应的图片
    this.axios.get("/pro/img?list_id=" + lid).then(res => {
      this.img_info = res.data.result;
      console.log(res.data.result);
    });
  }
};
</script>