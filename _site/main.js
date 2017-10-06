// sort bar functionality----------------------------


function myFunction() {
    var x = document.getElementById("mySelect");
    var i = x.selectedIndex;
    document.getElementById("demo").innerHTML = x.options[i].text;
}


//active page link highlight-------------------------

 var currentURL = $(location).attr("href");

$( document ).ready(function() {
   if ( currentURL = '/list.html') {
    $(".listactive").addClass("active");
  };
});






