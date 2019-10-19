$(function(){
  $.ajax({
    url:"header.html",
    type:"get",
    success: function(result) {
      //console.log(result);
      $(result).replaceAll("#header");
      $(`<link rel="stylesheet" href="css/heard.css">`).appendTo("head")//引入css文件
      var url = window.location.href;
      // 跳转后导航栏发生激活样式
      $("header .navbar-nav .nav-item>a").each(function(i,elem){
        console.log($(elem).prop("href"))
        $(elem).parent().children().removeClass("active")
        if($(elem).prop("href")==url){
          $(elem).addClass("active")
        }
      })
    }
  })
})