const express=require('express');
//引入body-parser模块
const bodyParser=require('body-parser');
//引入用户路由器
const pro=require('./router/pro.js');
//创建web服务器
const app=express();

//在路由器之前，应用body-parser中间件，将post请求的数据解析为对象
app.use( bodyParser.urlencoded({
  extended:false
}) );
//将路由器挂载到服务器下
app.use('/pro',pro)

//设置端口
app.listen(3000,()=>{
  console.log('app is running');
});
