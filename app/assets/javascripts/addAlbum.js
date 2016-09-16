window.addEventListener("load", function() {

    var modalWrapper = document.getElementsByClassName("modal-wrapper");
    var add = document.getElementsByClassName("addAlbum");
    var close = document.getElementsByClassName("close");
    var next = document.getElementsByClassName("next");
    var previous = document.getElementsByClassName("previous");
    var albumTitle = document.getElementById("albumTitle");
    var artistName = document.getElementById("artistName");
    var comment = document.getElementById("comment");
    var memberName = document.getElementById("memberName");
    var memberInstrument = document.getElementById("memberInstrument");
    var comment2 = document.getElementById("comment2");
    var addAnother = document.getElementsByClassName("addAnother");
    var artistCity = document. getElementById("artistCity");
    var albumGenre = document.getElementById("albumGenre");
    var albumDate = document.getElementById("albumDate");
    var albumFormat = document.getElementById("albumFormat");

    for(i=0; i<next.length; i++){
        next[i].style.display = "none";
    }

    for(i=0; i<previous.length; i++){
        previous[i].style.display = "none";
    }

    for (i = 0; i < add.length; i++) {
        add[i].addEventListener("click", function() {

            modalWrapper[0].style.display = "flex";
            next[0].style.display = "block";
            $("#album_name").focus();
        });
    }

    for (i = 0; i < close.length; i++) {
        close[i].addEventListener("click", function() {
            modalWrapper[0].style.display = "none";
        });
    }



    next[0].addEventListener("click", function() {
        var validate = new XMLHttpRequest();

        validate.addEventListener("loadstart", function() {

            document.body.style.cursor = "wait";

        });

        validate.addEventListener("load", function(e) {

            var r = e.target.response;
            var response = JSON.parse(r);

            var albumInput = document.forms["new_album"]["album[name]"].value;
            var artistInput = document.forms["new_album"]["artistNames"].value;

            var breakCheck = false;

            for (i = 0; i < response.albums.length; i++) {
                for (x = 0; x < response.artists.length; x++) {
                    if (response.albums[i].name == albumInput && artistInput == response.artists[x].name) {
                        breakCheck = true;
                        alert("Nope");
                        break;

                    }
                }
                if (breakCheck)
                  {break;}
            }

            document.body.style.cursor = "default";

        });

        validate.open("get", "/api");
        validate.send();

        albumTitle.style.display = "none";
        artistName.style.display = "none";
        comment.style.display = "none";
        memberName.style.display = "flex";
        memberInstrument.style.display = "flex";
        comment2.style.display = "block";
        next[0].style.display = "none";
        next[1].style.display = "block";
        addAnother[0].style.display = "block";
        previous[0].style.display = "block";


    });

    next[1].addEventListener("click", function(){
        artistCity.style.display = "flex";
        memberName.style.display = "none";
        memberInstrument.style.display = "none";
        comment2.style.display = "none";
        next[1].style.display = "none";
        next[2].style.display = "block";
        addAnother[0].style.display = "none";
        previous[1].style.display = "block";
        previous[0].style.display = "none";


    });

    next[2].addEventListener("click", function(){
        addAnother[1].style.display = "block";
        artistCity.style.display = "none";
        next[2].style.display = "none";
        next[3].style.display = "block";
        previous[2].style.display = "block";
        previous[1].style.display = "none";

    });

    next[3].addEventListener("click", function(){
        addAnother[1].style.display = "none";
        albumGenre.style.display = "flex";
        albumDate.style.display = "flex";
        albumFormat.style.display = "flex";
        next[3].style.display = "none";
        next[4].style.display = "block";
        previous[3].style.display = "block";
        previous[2].style.display = "none";
    });

});