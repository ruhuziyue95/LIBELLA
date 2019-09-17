const express=require("express");
const bodyParser=require("body-parser");
const index=require("./routes/index");
// const details=require("./ruters/product");
// const cors=require("cors");
var app=express();
//设置跨域访问
app.all('*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By",' 3.2.1');
  res.header("Content-Type", "application/json;charset=utf-8");
  next();})
// var server=
app.listen(3030,function(){console.log("创建成功")});
// app.use(cors({
//   origin:"http://127.0.0.1:5501"//不能用*
// }));//从此所有响应，自动带Access-Control-Allow-Origin:http://127.0.0.1:5500
//万一客户端浏览器地址发生变化，只改这里origin一处即可！
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/index",index);
// app.use("/details",details);