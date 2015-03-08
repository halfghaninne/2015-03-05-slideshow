var currentSlide = 0

/////////////////////////////////////
// loads first slide on the homepage
/////////////////////////////////////

window.onload = function() { //think i might factor this function out eventually
  
  var request = new XMLHttpRequest;
  
  request.open("post", "/slide/" + currentSlide);
  
  request.send();
    
  request.addEventListener("load", singleSlideParse);

} // end of window.onload

/////////////////////////////////////
// formats each slide to HTML file
/////////////////////////////////////

  function singleSlideParse() {
    var slideObject = JSON.parse(this.response);

    document.getElementById("title").innerHTML = slideObject.title;
    document.getElementById("body").innerHTML = slideObject.body;

    }
 
/////////////////////////////////////
// Previous and Next functionality
/////////////////////////////////////
        
window.onload = function() {    //this notation may be problematic later
  
  var getNext = document.getElementById("next"); //=>HTML element
  var getPrevious = document.getElementById("previous");
  
  var slideCountString = getNext.getAttribute("value");
  
  var slideCount = parseInt(slideCountString, 10); //=>number
  
  getNext.addEventListener("click", getNextPage); //runs function on click of HTML anchor element
  getPrevious.addEventListener("click", getPreviousPage);

  function getNextPage() {
    currentSlide ++
    if (currentSlide > slideCount) {
      currentSlide = 1
    } //end of if loop

    var request = new XMLHttpRequest;

    request.open("post", "/slide/" + currentSlide);

    request.send();

    request.addEventListener("load", singleSlideParse);

  } //end of getNextPage
  
  function getPreviousPage() {
    currentSlide --
    if (currentSlide < 1) {
      currentSlide = slideCount
    } //end of if loop

    var request = new XMLHttpRequest;

    request.open("post", "/slide/" + currentSlide);

    request.send();

    request.addEventListener("load", singleSlideParse);

  } //end of getPreviousPage
  
} //end of second window.onload