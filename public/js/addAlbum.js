window.addEventListener("load", function(){

  var modalWrapper = document.getElementsByClassName("modal-wrapper");
  var add = document.getElementsByClassName("addAlbum");
  var close = document.getElementsByClassName("close");

  for(i=0; i < add.length; i++){
	  add[i].addEventListener("click", function(){

		 modalWrapper[0].style.display = "flex";
		
	    });
  }

  for(i=0; i < close.length; i++){
  	close[i].addEventListener("click", function(){
  		modalWrapper[0].style.display = "none";
  	});
  }

});