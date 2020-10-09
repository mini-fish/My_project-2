<template>
  <div class="index">
    <div>
      <carousel></carousel>
    </div>
    <div class="recommendation">
      <h3>33CAKE-产品推荐 Recommendation</h3>
      <div class="recommend" v-for="(item,i) of list" :key="i">
        <router-link :to="`/details/${item.href}`">
          <div v-if="i>5" class="recommend_img">
            <img :src="item.src" />
            <span v-html="item.title"></span>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>
<style>
.index .recommendation {
  width: 80%;
  height: 340px;
  margin: 0 auto;
}
.index .recommendation h3 {
  text-align: left;
  color: #8e6a55;
  line-height: 50px;
}
.index .recommend {
  float: left;
  justify-content: space-around;
}
.index .recommend img {
  width: 285px;
  height: 285px;
  margin-left: 15px;
}
.index .recommend .recommend_img {
  position: relative;
}
.index .recommend span {
  width: 285px;
  height: 40px;
  background: #000;
  display: inline-block;
  opacity: 0.4;
  color: #fff;
  line-height: 40px;
  position: absolute;
  z-index: 100;
  bottom: 0px;
  left: 0px;
  margin-left: 15px;
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
      console.log(res.data);
    });
  }
};
</script>>