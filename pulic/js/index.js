$(function(){
  $.ajax({
    url:"http://localhost:3030/index",
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
  //点击事件
  var box=document.getElementsByClassName("area-box")[0];
  var fs=document.getElementsByClassName("window-bin");
  //console.log(box)
  $(box).on("click",".area-cut",function(e){
     var $div=$(this);
     var i=$div.attr("data-index");
     //console.log(i);
     var offsetTop=$(fs[i]).offset().top-60;
			$("html,body").stop(true).animate({
        scrollTop:offsetTop
      },500)
      $(".area-cut").eq(i).addClass("active").siblings().removeClass("active");
  })
   // 页面滚动事件
   document.documentElement.style.overflow = "hidden";
   var $cHeight = $(window).height();
    //console.log($cHeight)
    //console.log(window.innerHeight)
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