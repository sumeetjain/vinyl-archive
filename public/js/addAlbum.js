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
  var comment2 = document.getElementById("comment2");

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

      validate.addEventListener("load", function(e) {

        var r = e.target.response;
        var response = JSON.parse(r);

        var albumInput = document.forms["new_album"]["album[name]"].value;
        var artistInput = document.forms["new_album"]["artistNames"].value;

        for (i = 0; i < response.albums.length; i++) {
            for (x = 0; x < response.artists.length; x++) {
            debugger;
                if (response.albums[i].name == albumInput && artistInput == response.artists[x].name) {
                    debugger;
                    alert("Nope");
                    break;
                    // error.style.display = "block";
                // } else if (apiResponse.blah.albums[i].albumTitle != albumInput && artistInput == apiResponse.blah.artist) {
                //     albumArtistDiv.style.display = "none";
                //     albumImagesText.style.display = "block";
                //     submit4.style.display = "block";

                //     var selectAlbumArt = document.createElement("select");
                //     selectAlbumArt.setAttribute("value", "Album Cover");
                //     selectAlbumArt.id = "albumArt";
                //     document.getElementById("wrapper").appendChild(selectAlbumArt);

                // } else {
                //     albumArtistDiv.style.display = "none";
                //     addMembersText.style.display = "block";
                //     submit2.style.display = "block";

                //     var addMember = document.createElement("input");
                //     addMember.setAttribute("type", "text");
                //     addMember.setAttribute("placeholder", "Name");
                //     addMember.setAttribute("name", "member");
                //     addMember.id = "newMember" + memberNumber;
                //     addMember.className = "memberInput";
                //     document.getElementById("wrapper").appendChild(addMember);

                //     var addInstrument = document.createElement("input");
                //     addInstrument.setAttribute("type", "text");
                //     addInstrument.setAttribute("placeholder", "Instrument(s)");
                //     addInstrument.setAttribute("name", "instrument");
                //     addInstrument.id = "newInstrument" + memberNumber;
                //     addInstrument.className = "memberInput";
                //     document.getElementById("wrapper").appendChild(addInstrument);

                //     addMembersNote.style.display = "block";
                  }
                }
            }

        document.body.style.cursor = "default";
        alert("Done");

      });

      validate.open("get", "/api");
      validate.send();

    albumTitle.style.display = "none";
    artistName.style.display = "none";
    comment.style.display = "none";
    memberName.style.display = "flex";
    memberInstrument.style.display = "flex";
    comment2.style.display = "block";

  });

});