$(function(){
  $.ajax({
    url:"header.html",
    type:"get",
    success: function(result) {
      //console.log(result);
      $(result).replaceAll("#header");
      $(`<link rel="stylesheet" href="../CSS/heard.css">`).appendTo("head")
    }
  })
})