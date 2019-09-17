(function(){
  ajax({
    url:"http://localhost:3030/index",
    type:"get",
    dataType:"json"
  }).then(result=>{
    //console.log(result);
    var cs=result;
    var html="";
    for(var c of cs){
      //console.log(c)
      html+=`
      <div class="carousel-item">
      <img class="w-100"src="${c.cartoon_url}" />
      </div>
      `
    //console.log(c.cartoon_sort);
    }
    //console.log(c.cartoon_sort);
    document.querySelector("#demo>div.carousel-inner").innerHTML=html;
    document.querySelector(".carousel-item").className="carousel-item"+" "+"active";
  })
})()