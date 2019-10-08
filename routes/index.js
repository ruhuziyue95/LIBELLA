const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/",(req,res)=>{
  var sql=`select cid, cartoon_url, cartoon_desc, cartoon_sort from zy_cartoon order by cartoon_sort; `
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      res.send(result);
    }
  })
});
router.get("/f2",(req,res)=>{
  var sql=`SELECT pid,pname,pimg from zy_product`
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