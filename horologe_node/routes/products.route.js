const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get('/',(req,res)=>{
  console.log(req.query);
  //let sql="select pid,price,title,img from products  ";
  let sql="select * from products  ";

  let needWhere=true;
  
  if(req.query.brand!==undefined){
	  let obj=strSpilte(sql,needWhere,req.query.brand,1);
	  needWhere = obj.needWhere;
	  sql = obj.sql+')';
  }

  if(req.query.classify!==undefined){
	  let obj=strSpilte(sql,needWhere,req.query.classify,2);
	  needWhere = obj.needWhere;
	  sql = obj.sql+')'
  }

  if(req.query.style!==undefined){
	  let obj=strSpilte(sql,needWhere,req.query.style,3);
	  needWhere = obj.needWhere;
	  sql = obj.sql+')'
  }

  if(req.query.fun!==undefined){
	  let obj=strSpilte(sql,needWhere,req.query.fun,4);
	  needWhere = obj.needWhere;
	  sql = obj.sql+')'
  }

  if(req.query.water!==undefined){
	  let obj=strSpilte(sql,needWhere,req.query.water,5);
	  needWhere = obj.needWhere;
	  sql = obj.sql+')'
  }

  if(req.query.start!==undefined){
	 if(needWhere){
		sql+=' where ';
		needWhere=false;
	 }else{
		sql+=' and';
	 }
	 sql+=' price>='+parseInt(req.query.start);
  }
  if(req.query.end!==undefined){
	 if(needWhere){
		sql+=' where ';
		needWhere=false;
	 }else{
		sql+=' and';
	 }
	 sql+=' price<='+parseInt(req.query.end);
  }
  if(req.query.kword!==undefined){//关键字查找
	sql+=" where kwords like '%"+req.query.kword+"%'";
  }
  console.log(sql);

  
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    //res.send(result);
    //包含
    res.send(JSON.stringify(result));
  })
})

function strSpilte(sql,needWhere,arr,type){
	for(let i=0;i<arr.length;i++){
		if(needWhere && i==0){
		sql+=' where (';
		needWhere = false;
		}else if(i==0){
			sql+=' and (';
		}else{
			sql+=' or';
		}
		switch(type){
			case 1:	sql+=" family='"+arr[i]+"'";
				break;
			case 2:	sql+=" classification='"+arr[i]+"'";
				break;
			case 3:	sql+=" find_in_set('"+arr[i]+"',style)";
				break;
			case 4:	sql+=" find_in_set('"+arr[i]+"',function)";
				break;
			case 5:	sql+=" waterproof='"+arr[i]+"'";
				break;
		}
	}
	return {needWhere,sql};
}

module.exports=router;