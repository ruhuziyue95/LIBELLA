const express=require("express");
const router=express.Router();
const pool=require("../pool");
// pool.connect();
// router.get("/",(req,res) => {
//   var sqls =['SELECT cid, cartoon_url, cartoon_desc, cartoon_sort from zy_cartoon order by cartoon_sort','SELECT pid,pname,pimg from zy_product order by pid ','SELECT cid,category_name,category_desc,category_img from zy_product order by cid ']
//   pool.query(sqls,[],(err,result)=>{
//     if(err){
//       res.send(err);
//       console.log(err);
//     }else{
//       console.log(result[0],result[1],result[2])
//       res.send(result[0],result[1],result[2]);
//     }
//   })
// })
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
  var sql=`SELECT cid,category_name,category_desc,category_img from zy_category order by cid `
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