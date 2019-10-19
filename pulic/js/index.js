$(function(){
  $.ajax({
    url:"http://localhost:3030/index/v1",
    type:"get",
    dataType:"json"
  }).then(result=>{
    //console.log(result);
    /*[
    {cid: 1, cartoon_url: "upload/201905/1557138120.jpg", cartoon_desc: "", cartoon_sort: 0}
    {cid: 2, cartoon_url: "upload/201905/1557138159.jpg", cartoon_desc: "", cartoon_sort: 1}
    {cid: 3, cartoon_url: "upload/201905/1557138229.jpg", cartoon_desc: "", cartoon_sort: 2}
    {cid: 4, cartoon_url: "upload/201905/1557138878.jpg", cartoon_desc: "", cartoon_sort: 3}
    ]*/
    var cs=result;
    var html="";
    for(var i=0;i<cs.length;i++){
      //console.log(i)
      html+=`
      <div class="carousel-item">
      <img class="w-100"src="${cs[i].cartoon_url}" />
      </div>
      `
    }
    document.querySelector("#demo>div.carousel-inner").innerHTML=html;
    document.querySelector(".carousel-item").className="carousel-item"+" "+"active";
  });
  $.ajax({
    url:"http://localhost:3030/index/v2",
    type:"get",
    dataType:"json"
  }).then(result=>{
    //console.log(result) 
    var v2=result;
    var html="";
    for(var item of v2){
      html+=`
      <div class="price-bin " >
        <a href="product-details.html">
          <div class="bin">
            <img class="w-100 " src="${item.pimg}"/>
          </div>
          <b>${item.pname}</b>
        </a>
      </div>
      `
    }
    document.querySelector(".price-box").innerHTML=html;
  });
  $.ajax({
    url:"http://localhost:3030/index/v3",
    type:"get",
    dataType:"json"
  }).then(result=>{
    //console.log(result);
    var v3 = result;
    var html = "";
    for(var item of v3){
      html += `
      <div class="service-bin" >
        <a href="javascript:;">
          <img src="${item.cimg}" />
          <i>${item.cid}</i>
          <b class=" h5">${item.cname}</b>
          <p>${item.cdesc}</p>
          <span>MORE <em>></em></span>
        </a>
      </div>
      `
      document.querySelector(".service-cut").innerHTML=html;
    }
  })
  //产品箭头点击事件
  var i = 0;//位置
  $(".f3 .ctrl-right").on('click',function(){
      var n=$(".service-cut .service-bin").length;//4
      if(i< n-3){
      $(`.service-cut .service-bin:eq(${i})`).css("margin-left",'-270px');
      // console.log($(`.service-cut .service-bin:eq(${i})`))
      //console.log(i);
      // i++;
      }
  })
  $(".f3 .ctrl-left").on('click',function(){
    $(`.service-cut .service-bin:eq(${i})`).css("margin-left","0px");
    //console.log($(`.service-cut .service-bin:eq(${i})`))
  })
  //新闻箭头点击事件
  var n = 0;//位置
  $(".f5 .ctrl-right").on('click',function(){
    
      //var n=$(".info-cut .info-bin").length;//4
      //if(i< n-3){
      $(`.info-cut .info-bin:eq(${n})`).css("margin-left",'-476px');
      // console.log($(`..info-cut .info-bin:eq(${i})`))
      //console.log(i);
      // i++;
      //}
  })
  $(".f5 .ctrl-left").on('click',function(){
    $(`.info-cut .info-bin:eq(${n})`).css("margin-left","0px");
    //console.log($(`..info-cut .info-bin:eq(${i})`))
  })
  //联系 表单验证
  $(":input").on("blur",function(){
    if($(this).val() == ""){
      $(this).val("不能为空").css("color","red")
    }
    
  })
  $(":input").on("focus",function(){
    console.log(1)
    if($(this).val() == "不能为空"){
      $(this).val("").css("color","white")
    }
  })
  //导航栏点击事件
  $(".area-box").on("click",".area-cut",function(){
     var $div=$(this);
     var i=$div.attr("data-index");//0 1 2 3 4 5
     //console.log(i);
      $(".window-cut").css("transform",`translateY(-${$cHeight*i}px)`);
      $(".area-cut").eq(i).addClass("active").siblings().removeClass("active");
  })
   // 页面滚动事件
   document.documentElement.style.overflow = "hidden";
   var $cHeight = $(window).height();
    //console.log($cHeight)//657
    //console.log(window.innerHeight)//657
   var setTime = null;
   var pmoved = 0; //页面移动的单位值
   var $floor = $(".window-bin");
   //console.log($floor);
   $floor.css = $({height: $cHeight });
   var $plength = $floor.length;
   //console.log($plength);//6
   $(".window-cut").on("mousewheel", function (e,deltaY){
    //deltaY：值为负的（-1），则表示滚轮向下滚动。值为正的（1），则表示滚轮向上滚动
    if(setTime!=null){
      clearTimeout(setTime);
      setTime = null ;
    }
    setTime=setTimeout(() => {
      if(deltaY<0){//页面向上滚动
        pmoved++;
        if(pmoved==$plength){
          pmoved--;
          return;
        }
      }else if(deltaY>0){//页面向下滚动
        pmoved--;
        if(pmoved<0){
          pmoved = 0;
          return;
        }
      }
      $(".window-cut").css("transform",`translateY(-${$cHeight*pmoved}px)`);
      $(".area-cut").eq(pmoved).addClass("active").siblings().removeClass("active");
    },200)
  })
})