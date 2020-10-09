<template>
  <div
    id="demo"
    class="carousel"
    :style="{ width: innerWidth + 'px' }"
    @mouseenter="stop"
    @mouseleave="start"
  >
    <!-- 轮播图片 -->
    <div class="carousel-inner" :class="ulClass" :style="ulStyle">
      <div v-for="(img, i) of imgs" :key="i" class="carousel-item" :style="{ width:innerWidth + 'px' }">
        <router-link :to="img.href">
          <img :src="img.src" :style="{ width: innerWidth + 'px' }" />
        </router-link>
        <router-link :to="img.href"></router-link>
      </div>
      <div class="carousel-item" :style="{ width: innerWidth + 'px' }">
        <router-link :to="imgs[0].href">
          <img :src="imgs[0].src" :style="{ width: innerWidth + 'px' }" />
        </router-link>
        <router-link :to="imgs[0].href"></router-link>
      </div>
    </div>
    <!-- 左右箭头 -->
    <a href="javascript:;" @click="move(1)" class="carousel-control-next">
      <span class="carousel-control-next-icon"></span>
    </a>
    <a href="javascript:;" @click="move(-1)" class="carousel-control-prev">
      <span class="carousel-control-prev-icon"></span>
    </a>
    <!-- 轮播指示符（小圆点） -->
    <ul class="carousel-indicators">
      <li
        v-for="(img, idx) of imgs"
        :key="idx"
        :class="idx == i ? 'active' : ''"
        @click="moveTo(idx)"
      ></li>
    </ul>
  </div>
</template>
<script>
export default {
  data() {
    return {
      innerWidth: window.innerWidth,
      ulClass: { hasTrans: true },
      i: 0, //保存当前播放的是第几张图片
      imgs: [],
      canClick: true,//用户是否能点击
      timer: null
    };
  },
  created() {
    //使得轮播图片根据窗口大小动态变化
    window.addEventListener("resize", () => {
      this.innerWidth = window.innerWidth;
    });
    this.start();
  },
  mounted() {
    this.axios.get("/pro/carousel").then(result => {
      this.imgs = result.data;
    });
  },
  methods: {
    stop() {//鼠标进入，停止移动
      clearInterval(this.timer);
    },
    start() {//每隔3s移动
      this.timer = setInterval(() => {
        this.move(1);
      }, 3000);
    },
    move(i) {
      if (this.canClick) {
        this.canClick = false;
        if (i == -1 && this.i == 0) {//如果向右移动，且正在显示第一张图片
          this.ulClass.hasTrans = false;//去掉父级div上的transtion样式
          setTimeout(() => {// 防抖/节流，防止用户快速点击
            this.i = this.imgs.length;
            setTimeout(() => {
              this.ulClass.hasTrans = true;//打开父级div上的transtion样式
              this.i += i;
              setTimeout(() => {
                this.canClick = true;//允许单击
              }, 200);
            }, 50);
          }, 50);
        } else if (i == 1 && this.i == this.imgs.length - 1) {//如果左移，且已经是最后一张图片
          this.i += i;//带transtion效果左移
          setTimeout(() => {
            this.ulClass.hasTrans = false;
            setTimeout(() => {
              this.i = 0;
              setTimeout(() => {
                this.ulClass.hasTrans = true;
                setTimeout(() => {
                  this.canClick = true;
                });
              }, 50);
            }, 50);
          }, 200);
        } else {//如果不是两端点击移动的情况，则保持原来逻辑
          this.i += i;
          setTimeout(() => {
            this.canClick = true;
          }, 300);
        }
      }
    },
    moveTo(i) {//点第几个小圆点，就跳到第几张图片
      if (this.canClick) {
        this.i = i;
        this.canClick = false;
        setTimeout(() => {
          this.canClick = true;
        }, 300);
      }
    }
  },
  computed: {
    //网页宽度变化或i变化，自动重新计算ul的大小
    ulStyle() {
      //修饰所有图片的父元素
      var width = this.innerWidth * (this.imgs.length + 1) + "px";
      var marginLeft = -this.i * this.innerWidth + "px"; //控制图片左移的距离
      return { width, marginLeft };
    }
  }
};
</script>
<style scoped>
#demo{
    height: 600px;
}
section > .carousel {
  margin-top:60px;
  overflow: hidden;
}
section > .carousel:after {
  content: "";
  display: block;
  clear: both;
}
section > .carousel > .carousel-inner .hasTrans {
  transition: all 0.2s linear;
}
section > .carousel > .carousel-inner > .carousel-item {
  display: block;
  float: left;
}

/*x小圆点样式  */
section > .carousel > .carousel-inner > .carousel-item > a:last-child {
  display: block;
  height: 50px;
  color: #fff;
  text-align: center;
  font-size: 15px;
  line-height: 50px;
  text-decoration: none;
  background-color: #f68cc6;
}
section
  > .carousel
  > .carousel-inner
  > .carousel-item:nth-child(2)
  > a:last-child {
  background-color: #fa9c77;
}


/*重写指示符的样式*/
.carousel-indicators {
  bottom: 130px;
}
.carousel-indicators li {
  width: 15px;
  height: 15px;
  background-color: #fff;
  margin-left: 6px;
  margin-right: 6px;
  border-radius: 50%;
  top: 60px;
}

/* 小圆点访问样式 */
.carousel-indicators > li:hover,
.carousel-indicators > li.active {
  transform: scale(1.3);
}
.carousel-indicators > li:first-child {
  background-color: #f68cc6;
}
.carousel-indicators > li:nth-child(2) {
  background-color: #fa9c77;
}

/*重写左右箭头的样式*/
.carousel-control-prev,
.carousel-control-next {
  width: 40px;
  height: 100px;
  background-color: rgba(95, 95, 92, 0.3);
  top: 40%;
  margin-left: 40px;
  border-radius: 0.25rem;
}
.carousel-control-next {
  margin-right: 40px;
}
</style>