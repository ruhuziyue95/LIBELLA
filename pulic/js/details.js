$(function(){
  var imgl = document.querySelectorAll(".imgLg>img");
  var imgs = document.querySelectorAll(".ad-thumbs>ul li a img");
  var i = 0;//记录img位置
  $(".ctrl-right").on("click",function(){//右箭头
    if(i<imgl.length-1&&i>=0){//5
      i++;
      $(imgl[i]).addClass("active").siblings().removeClass("active");
      $(imgs[i]).addClass("active")
      $(imgs[i-1]).removeClass("active");
    }
  })
  $(".ctrl-left").on("click",function(){//左箭头
    if(i>0){
      i--;
      $(imgl[i]).addClass("active").siblings().removeClass("active");
      $(imgs[i]).addClass("active")
      $(imgs[i+1]).removeClass("active");
    }
  })
  $(imgs).on("click",function(){//小图片
    i = $(imgs).index(this);
    console.log(i)
    $(imgs).removeClass("active")
    $(this).addClass("active")
    $(imgl[i]).addClass("active").siblings().removeClass("active");
  })
})