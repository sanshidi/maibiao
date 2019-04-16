const express=require("express");
const router=express.Router();
const pool=require("../pool");
//http://localhost:3000/index
router.get("/lunbo",(req,res)=>{
  var sql="select * from lunbo";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    //res.send(result);
    //包含了
    res.send(JSON.stringify(result));
  })
})
router.get("/products",(req,res)=>{//获得商品列表
  var sql="select pid,price,title,img from products limit 0,8";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    //res.send(result);
    //包含
    res.send(JSON.stringify(result));
  })
})

router.get("/news",(req,res)=>{//获得新闻列表
  var sql="select * from news  order by time desc limit 2,4";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    //res.send(result);
    //包含了
    res.send(JSON.stringify(result));
  })
})
module.exports=router;