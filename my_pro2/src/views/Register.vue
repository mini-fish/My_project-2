<template>
  <div id="login">
    <div class="login_title">
      <img src="img/login.png" alt />
      <span>新用户注册</span>
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
       class="input_1" 
       type="text" 
       placeholder="手机号码" 
       maxlength="11"
       v-model="phone"
       @blur="checkPhone"/>
       <span v-show="success2">
        <img src="../assets/success.png" />
      </span>
      <span v-show="error2">
        <img src="../assets/error.png" />手机号格式不对
      </span>
      <br />
      <input
       type="passward" 
       placeholder="密码" 
       maxlength="20" 
       v-model="upwd" 
       @blur="checkUpwd" />
       <span v-show="success3">
        <img src="../assets/success.png" />
      </span>
      <span v-show="error3">
        <img src="../assets/error.png" />8~20位字母或数字
      </span>
      <input
       type="passward" 
       placeholder="确认密码" 
       maxlength="20"
       v-model="conupwd"
       @blur="checkReupwd"/>
       <span v-show="success4">
        <img src="../assets/success.png" />
      </span>
      <span v-show="error4">
        <img src="../assets/error.png" />两次密码不一致
      </span>
    </div>
    <div class="login_foot">
      <div>
        <input type="checkbox" />我已同意并阅读会员注册协议和隐私保护政策
      </div>
    </div>
    <button @click="register">注册</button>
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

.login_center input {
  width: 330px;
  height: 18px;
  padding: 16px 20px;
  color: #8d6a54;
  border: 1px solid #eee;
  position: relative;
}
.login_center span{
    position: absolute;
    margin-left: 5px;
    margin-top: 15px;
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
      phone:"",
      conupwd:"",
      success1: false,
      error1: false,
      success2: false,
      error2: false,
      success3: false,
      error3: false,
      success4: false,
      error4: false
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
    //校验手机号
    checkPhone() {
      let unameRegExp = /^1[3-9]\d{9}$/;
      if (unameRegExp.test(this.phone)) {
        this.success2 = true;
        this.error2 = false;
      } else {
        this.success2 = false;
        this.error2 = true;
      }
    },
    //校验密码
    checkUpwd() {
      let upwdRegExp = /^[0-9a-zA-Z]{8,20}$/;
      if (upwdRegExp.test(this.upwd)) {
            this.success3 = true;
            this.error3 = false;
      } else {
          this.success3 = false;
          this.error3 = true;
      }
    },
    //确认密码
    checkReupwd() {
      if (this.conupwd==this.upwd) {
            this.success4 = true;
            this.error4 = false;
      } else {
          this.success4 = false;
          this.error4 = true;
      }
    },
    register() {
      this.axios.post("/pro/reg","uname=" + this.uname + "&phone=" + this.phone + "&upwd=" + this.upwd)
        .then(res => {
          if (res.data.code == 0) {
                alert("该用户已存在");
              } else {
                this.$router.push("/login");
              }
        });
    }
  }
};
</script>