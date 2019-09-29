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
    //console.log(c.cartoon_sort);
    }
    //console.log(c.cartoon_sort);
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
     var offsetTop=$(fs[i]).offset().top;
			$("html,body").stop(true).animate({
				scrollTop:offsetTop
      },500)
  })
  // 页面滚动事件
  window.onscroll=function(){
    var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
    console.log(innerHeight)//返回窗口的文档显示区的高度
    // console.log(parseInt($(fs[1]).css("height")));
    //console.log(fs);
    
    $(fs).each(function(i,f){
        //console.log(parseInt($(fs[i]).css("height")));//755 516 503 577 580 522 755
        var offsetTop=$(f).offset().top;
      $(box).children("li:eq('+i+')").addClass("active").siblings().removeClass("active")
    })
  }
  
  
})