$(function(){
  $.ajax({
    url:"footer.html",
    type:"get",
    success: function(result) {
      //console.log(result)
      $(result).replaceAll("#footer");
      $(`<link rel="stylesheet" href="../CSS/footer.css">`).appendTo("head")
    }
  })
})