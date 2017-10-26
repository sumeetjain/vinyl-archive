

//active page link highlight-------------------------

 var currentURL = $(location).attr("href");

$( document ).ready(function() {
   if ( currentURL = '/list.html') {
    $(".listactive").addClass("active");
  };
});

//mobile filters dropdown----------------------------

function filters() {
    var x = document.getElementById("filters");
    	if (x.style.display === "none") {
        	x.style.display = "block";
    	} 	
    	else {
        x.style.display = "none";
    	}
}

var $window = $(window);
$window.on('resize', function (){
	var x = document.getElementById("filters");
        if ($window.width() > 655){
            x.style.display = "block";
        }
		else {
        x.style.display = "none";
    	}
    });

//animate vinyl logo--------------------------------

$(document).ready(function()
{
    $("#logoAnimate").hover(
        function()
        {
            $(this).attr("src", "/images/vinyl.gif");
        },
        function()
        {
            $(this).attr("src", "/images/vinyl.png");
        });
});



