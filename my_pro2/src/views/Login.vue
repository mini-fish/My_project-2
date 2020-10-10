<template>
  <div id="login">
    <div class="login_title">
      <img src="img/login.png" alt />
      <span>普通方式登录</span>
    </div>
    <div class="login_top">
      <a href="#">手机号快捷登录</a>
    </div>
    <div class="login_center">
      <input
        class="input_1"
        type="text"
        placeholder="用户名"
        maxlength="15"
        v-model="uname"
        @blur="checkUname"
      />
      <span v-show="success1">
        <img src="../assets/success.png" />
      </span>
      <span v-show="error1">
        <img src="../assets/error.png" />6~15位字母或数字
      </span>
      <br />
      <input
       type="passward" 
       placeholder="填写密码" 
       maxlength="20" 
       v-model="upwd" 
       @blur="checkUpwd" 
       />
      <span v-show="success2">
        <img src="../assets/success.png" />
      </span>
      <span v-show="error2">
        <img src="../assets/error.png" />8~20位字母或数字
      </span>
    </div>
    <div class="login_foot">
      <div>
        <input type="checkbox" />记住账号
      </div>
      <div>
        <span>忘记密码？</span>
      </div>
    </div>
    <button @click="login">登 录</button>
  </div>
</template>
<style scoped>
#login {
  width: 400px;
  margin: 0 auto;
  margin-top: 80px;
}
.login_title {
  font-size: 24px;
  height: 60px;
  color: #8d6a54;
  line-height: 60px;
  margin-bottom: 30px;
}
.login_title img {
  vertical-align: middle;
  margin-right: 10px;
  display: inline;
}
.login_title span {
  display: inline-block;
}
.login_top a {
  text-decoration: none;
  display: block;
  float: right;
  font-size: 12px;
  color: #70a4c1;
  margin-bottom: 15px;
}
.login_center input {
  width: 360px;
  height: 18px;
  padding: 16px 20px;
  color: #8d6a54;
  border: 1px solid #eee;
  position: relative;
}
.login_center span {
  position: absolute;
  margin-left: 5px;
  margin-top: 10px;
}
.login_center .input_1 {
  border-bottom: none;
}
.login_center input:focus {
  border: 1px solid #cfbbb0;
  outline: none;
}
.login_foot {
  display: flex;
  justify-content: space-between;
  margin: 20px 0;
  font-size: 12px;
  align-items: center;
}
.login_foot span {
  color: #70a4c1;
}
button {
  height: 50px;
  width: 400px;
  background-color: #432818;
  color: #fff;
  font-size: 20px;
}
</style>
<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      success1: false,
      error1: false,
      success2: false,
      error2: false,
    };
  },
  methods: {
    //校验用户名
    checkUname() {
      let unameRegExp = /^[0-9a-zA-Z]{6,15}$/;
      if (unameRegExp.test(this.uname)) {
        this.success1 = true;
        this.error1 = false;
      } else {
        this.success1 = false;
        this.error1 = true;
      }
    },
    //校验密码
    checkUpwd() {
      let upwdRegExp = /^[0-9a-zA-Z]{8,20}$/;
      if (upwdRegExp.test(this.upwd)) {
            this.success2 = true;
            this.error2 = false;
      } else {
          this.success2 = false;
          this.error2 = true;
      }
    },
    login() {
      this.axios.get("/pro/login/" + this.uname + "&" + this.upwd)
        .then(res => {
          if (res.data.code == 1) {
            this.$router.push("/");
          } else {
            console.log("账号或密码错误")
          }
        });
    }
  }
};
</script>