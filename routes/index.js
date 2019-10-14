const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/v1",(req,res)=>{
  var sql=`SELECT cid, cartoon_url, cartoon_desc, cartoon_sort from zy_cartoon order by cartoon_sort; `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
});
router.get("/v2",(req,res)=>{
  var sql=`SELECT pid,pname,pimg from zy_product order by pid `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
})
router.get("/v3",(req,res)=>{
  var sql=`SELECT cid,cname,cdesc,cimg from zy_category order by cid `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
})
module.exports=router;