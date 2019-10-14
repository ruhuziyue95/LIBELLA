$(function(){
  var imgl = document.querySelectorAll(".imgLg>img");
  var imgs = document.querySelectorAll(".ad-thumbs>ul li a img");
  var i = 0;//记录位置
  $(".ctrl-right").on("click",function(){
    //console.log($(imgl[i]))
    i++;
    $(imgl[i]).addClass("active").siblings().removeClass("active");
    console.log(imgs[i])
    $(imgs[i]).addClass("active")
    $(imgs[i-1]).removeClass("active");
  })
  $(".ctrl-left").on("click",function(){
       i--;
      $(imgl[i]).addClass("active").siblings().removeClass("active");
      //console.log(imgs[i])
      $(imgs[i]).addClass("active")
      $(imgs[i+1]).removeClass("active");
  })
  $(imgs).on("click",function(){
    var i = $(imgs).index(this);
    //console.log(i)
    $(imgs).removeClass("active")
    $(this).addClass("active")
    $(imgl[i]).addClass("active").siblings().removeClass("active");
  })
})