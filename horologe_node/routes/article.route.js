const express = require('express');
const router = express.Router();
const pool = require('../pool');

router.get('/',(req,res)=>{
	if(!req.query.aid){
		res.send('aid is need');
	}
	let aid = req.query.aid;
	let sql=`select title,nid from news where time<(select time from news where nid=${aid}) order by time desc limit 0,1`;
	let output ={
		current:[],
		next:[],
		prev:[],
	};

	function getPrev(){
		return new Promise(function(open){
			pool.query(sql,(err,result)=>{
				if(err) throw err;
				output.prev=JSON.stringify(result);
				open();
			})
		})
	}
	function getCur(){
		return new Promise(function(open){
			sql = 'select * from news where nid=?';
				pool.query(sql,[aid],(err,result)=>{
				if(err) throw err;
				output.current=JSON.stringify(result);
				open();
			})
		})
	}
	function getNext(){
		return new Promise(function(open){
			sql=`select title,nid from news where time>(select time from news where nid=${aid}) order by time asc limit 0,1`;
			pool.query(sql,(err,result)=>{
				if(err) throw err;
				output.next=JSON.stringify(result);
				res.send(output);
			})
		})
	}
	getPrev().then(getCur).then(getNext);
})

router.get('/all',(req,res)=>{
	let sql = 'select nid,title,time from news order by time desc limit 0,6';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		result = JSON.stringify(result);
		res.send(result);
	})
})

module.exports=router;