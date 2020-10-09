const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const r=express.Router();

//------开始写项目--------
//1.用户登录
r.get('/login/:uname&:upwd',(req,res)=>{
	var uname=req.params.uname;
	var upwd=req.params.upwd;
	var sql='select * from user where uname=? and upwd=?';
	pool.query(sql,[uname,upwd],(err,result)=>{
		if(err) throw err;
		console.log(result);
		if(result.length==0){
            res.send({message:'登录失败',code:0})
        }else{
            res.send({message:'登录成功',code:1})
        }
	})
})

//2.根据uname查询用户,注册之前验证用户名是否存在,存在就不能注册 
// get    /select/:uname   返回1和0    无请求主体
r.get("/select/:uname",(req,res) => {
	let _uname = req.params.uname;
	let sql = "select * from user where uname = ?";
	pool.query(sql,[_uname],(err,result) => {
		if(err) throw err;
		console.log(result);
		if(!result.length){
			res.send("0")
		}else{
			res.send(result)
		}
	})
})

//3.用户注册
r.post('/reg',(req,res)=>{
	var obj=req.body;
	var sql="select * from user where uname=?";
	pool.query(sql,[obj.uname],(err,result)=>{
				if(err) throw err;
				if(result.length>0){
					res.send('0')
				}else{
					var sql="insert into user set ?";
					pool.query(sql,[obj],(err,result)=>{
						if(err) throw err;
						if(result.affectedRows>0){
							res.send({message:'注册成功！',code:1});
						}
				})
			}
	})
})
//4.查询所有商品列表
r.get('/list',(req,res)=>{
	var obj=req.body;
	var sql="select * from list";
	pool.query(sql,[obj],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
})

//5.查询商品详细信息
r.get('/details',(req,res)=>{
	var lid = req.query.lid;
	var sql="select * from details_info where lid=?";
	pool.query(sql,[lid],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({result:result[0]});
		}else{
			res.send('0');
		}
	});
})
//6.查询商品详细信息页的图片
r.get('/img',(req,res)=>{
	var list_id = req.query.list_id;
	var sql="select * from details_img where list_id=?";
	pool.query(sql,[list_id],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({result:result});
		}else{
			res.send('0');
		}
	});
})
//7.轮播图
r.get('/carousel',(req,res)=>{
	var obj=req.body;
	var sql="select * from carousel";
	pool.query(sql,[obj],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
})
//导出路由器对象
module.exports=r;