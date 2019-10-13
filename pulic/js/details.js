$(function(){
  var url = location.url;
  console.log(url)
  var ctrlRight = document.querySelector(".ctrl-right");
  var imgl = document.querySelectorAll(".imgLg>img");
  var ctrlLeft = document.querySelector(".ctrl-left");
  var imgs = document.querySelectorAll(".ad-thumbs>ul li a img");
  // var ul = document.querySelector(".ad-thumbs>ul")
  //console.log(ul)
  //console.log(imgs)//0 1 2 3 4
  //var is = imgs.length;//5
  //console.log(ctrlRight);
  //console.log(imgs);
  //console.log(ctrlLeft);
  //console.log(is)
  var i = 0;
  ctrlRight.addEventListener("click",function(){
    //console.log($(imgl[i]))
    i++;
    $(imgl[i]).addClass("active").siblings().removeClass("active");
    console.log(imgs[i])
    $(imgs[i]).addClass("active")
    $(imgs[i-1]).removeClass("active");
  })
  ctrlLeft.addEventListener(
    "click",
    function(){
       i--;
      $(imgl[i]).addClass("active").siblings().removeClass("active");
      console.log(imgs[i])
      $(imgs[i]).addClass("active")
      $(imgs[i+1]).removeClass("active");
  })
  // $(imgs).on("click",function(){
  //   console.log(this)}
  // )
})