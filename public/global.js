var currentSlide = 1

// loads first slide on the homepage

window.onload = function() { //think i might factor this function out eventually
  
  var request = new XMLHttpRequest;
  
  request.open("post", "/slide/" + currentSlide);
  
  request.send();
    
  request.addEventListener("load", singleSlideParse);

} // end of window.onload

// formats initial slide

  function singleSlideParse() {
    var slideObject = JSON.parse(this.response);

    document.getElementById("title").innerHTML = slideObject.title;
    document.getElementById("body").innerHTML = slideObject.body;

    }
   
    // skeleton for the next click:
//////////////////////////////////////////////////////////////
    
window.onload = function() {    //this notation may be problematic later
  
  var getNext = document.getElementById("next"); //=>HTML element
  
  var slide_count_string = getNext.getAttribute("value");
  
  var slide_count = parseInt(slide_count_string, 10); //=>number
  
  getNext.addEventListener("click", getNextPage); //runs function on click of HTML anchor element

  function getNextPage() {
    currentSlide ++
    // if currentSlide > slide_count {
    //   currentSlide = 1
    // } //end of if loop

    var request = new XMLHttpRequest;

    request.open("post", "/slide/" + currentSlide);

    request.send();

    request.addEventListener("load", singleSlideParse);

  } //end of getNextPage
  

} //end of second window.onload






//////////////////////////////////////////////////////////////










  //
  // funtion goBack {
  //
  // }
  //
  // var slideView = document.getElementById("slide_view");
  //
  // slideView.addEventLister("click", fetchInfo);
  //
  // function fetchInfo(id) {
  //   var request = new XMLHttpRequest;
  //   var idString = id.toString();
  //
  //   var path = "http:/localhost:4567/students" + id
  //
  //   request.open("get", path);
  //   request.send();
  //
  //   request.addEventListener("load", function(){
  //     var result = JSON.parse(request.response);
  //     var title = result.title;
  //     var body = result.body;
  //
  //     alert( title + "\n" + body );
  //   })// end of function within addEventListener
  //
  // } //end of fetchInfo function
  //
  //
