const express = require('express');
const router = express.Router();
const pool = require('../pool');

router.get("/",(req,res)=>{//新闻列表
  let did = req.query.did;
  if(!did){
	did='全部资讯'
  }
  var sql="select nid,title,img,time,type from news where find_in_set('"+did+"',type)";
  pool.query(sql,(err,result)=>{
    if(err) console.log(err);
    //res.send(result);
    //包含
    res.send(JSON.stringify(result));
  })
})

router.get("/pros",(req,res)=>{//新闻列表
  let pid = req.query.pid;
  if(!pid){
	res.send({code:-1,msg:'pid is need'})
	return
  }
  var sql="select pid,title,img,price from products where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) console.log(err);
    res.send(JSON.stringify(result));
  })
})


module.exports=router;