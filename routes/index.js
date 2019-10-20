const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/v1",(req,res)=>{//轮播图
  var sql=`SELECT cid, cartoon_url, cartoon_desc, cartoon_sort FROM zy_cartoon ORDER BY cartoon_sort; `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
});
router.get("/v2",(req,res)=>{//婚纱新品
  var sql=`SELECT pid,pname,pimg FROM zy_product ORDER BY pid `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
})
router.get("/v3",(req,res)=>{//产品
  var sql=`SELECT cid,cname,cdesc,cimg FROM zy_category ORDER BY cid `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
})
router.get("/v4",(req,res)=>{
  var sql = ``
})
module.exports=router;