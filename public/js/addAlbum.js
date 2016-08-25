window.addEventListener("load", function(){

  var modalWrapper = document.getElementsByClassName("modal-wrapper");
  var add = document.getElementsByClassName("addAlbum");
  var close = document.getElementsByClassName("close");
  var next = document.getElementById("next");
  var albumTitle = document.getElementById("albumTitle");
  var artistName = document.getElementById("artistName");
  var comment = document.getElementById("comment");
  var memberName = document.getElementById("memberName");
  var memberInstrument = document.getElementById("memberInstrument"); 

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

  next.addEventListener("click", function(){

    var validate = new XMLHttpRequest();

      validate.addEventListener("loadstart", function() {

        document.body.style.cursor = "wait";

      });

      validate.addEventListener("load", function() {

        document.body.style.cursor = "default";

        alert("Done");

      });

      validate.open("get", "test.txt");
      validate.send();

    albumTitle.style.display = "none";
    artistName.style.display = "none";
    comment.style.display = "none";
    memberName.style.display = "flex";
    memberInstrument.style.display = "flex";

  });

});