window.addEventListener("load", function() {


    var addAlbumMultiStepForm = function(){
        var currentPage = 1;

        var showPage = function(pageNum){
            $(".newAlbumPage").hide();
            $("#newAlbumPage" + pageNum).show();
        }

        var disableAdvancing = function(){
            console.log("End of pages; disabling advancing.");
            $("#addAlbumNext").addClass("disabled");
            $("#addAlbumNext").off("click", advancePage);
        }

        var disableBackingUp = function(){
            console.log("Start of pages; disabling backing up.");
            $("#addAlbumPrev").addClass("disabled");
            $("#addAlbumPrev").off("click", backUpPage);
        }

        var endOfForm = function(){
            $("#addAlbumSaveButton").prop("disabled", false)
            .removeClass("addAlbumSaveButton--disabled");
        }

        var advancePage = function(e){
            currentPage++;
            console.log("Advancing to page " + currentPage);
            showPage(currentPage);

            var nextPage = currentPage + 1;
            
            if ($("#newAlbumPage" + nextPage).length < 1){
                disableAdvancing();
                endOfForm();
            }

            if ($("#addAlbumPrev").hasClass("disabled")){
                console.log("Re-enabling 'Previous' button.");
                $("#addAlbumPrev").removeClass("disabled");
                $("#addAlbumPrev").on("click", backUpPage);
            }
        }

        var backUpPage = function(e){
            currentPage--;
            console.log("Moving back to page " + currentPage);
            showPage(currentPage);
            
            var previousPage = currentPage - 1;

            if ($("#newAlbumPage" + previousPage).length < 1){
                disableBackingUp();
            }

            if ($("#addAlbumNext").hasClass("disabled")){
                console.log("Re-enabling 'Next' button.");
                $("#addAlbumNext").removeClass("disabled");
                $("#addAlbumNext").on("click", advancePage);
            }
        }

        // Toggle the form modal as needed.
        $("#addAlbumLink").on("click", function(e){
            $(".modal-wrapper").show();
            showPage(1);
            $("#album_name").focus();
            e.preventDefault();
        });

        // Close the form modal.
        $("#addAlbumClose").on("click", function(e){
            $(".modal-wrapper").hide();
            e.preventDefault();
        });

        // Clicking 'Next' advances pages.
        $("#addAlbumNext").on("click", advancePage);

        // Clicking 'Previous' goes back pages.
        $("#addAlbumPrev").on("click", backUpPage);

        // Handle pages with 'Add Another' buttons.
        $(".newAlbumAdditionalFieldsContainer__addButton").on("click", function(e){
            var pages = $(this).prev(".newAlbumAdditionalFieldsContainer__pages");

            var currentSubPage = pages.find(".newAlbumAdditionalFieldsContainer__page:visible");
            var nextSubPage = currentSubPage.next();

            currentSubPage.hide();
            nextSubPage.show();

            if (nextSubPage.next().length < 1){
                console.log("No more sub-pages; disabling addButton.");
                $(this).addClass("disabled");
                $(this).off("click");
            }
        });
    }

    addAlbumMultiStepForm();

    // var modalWrapper = document.getElementsByClassName("modal-wrapper");
    // var add = document.getElementsByClassName("addAlbum");
    // var close = document.getElementsByClassName("close");
    // var next = document.getElementsByClassName("next");
    // var previous = document.getElementsByClassName("previous");
    // var albumTitle = document.getElementById("albumTitle");
    // var artistName = document.getElementById("artistName");
    // var comment = document.getElementById("comment");
    // var memberName = document.getElementById("memberName");
    // var memberInstrument = document.getElementById("memberInstrument");
    // var comment2 = document.getElementById("comment2");
    // var addAnother = document.getElementsByClassName("addAnother");
    // var artistCity = document. getElementById("artistCity");
    // var albumGenre = document.getElementById("albumGenre");
    // var albumDate = document.getElementById("albumDate");
    // var albumFormat = document.getElementById("albumFormat");

    // for(i=0; i<next.length; i++){
    //     next[i].style.display = "none";
    // }

    // for(i=0; i<previous.length; i++){
    //     previous[i].style.display = "none";
    // }

    // for (i = 0; i < add.length; i++) {
    //     add[i].addEventListener("click", function() {

    //         modalWrapper[0].style.display = "flex";
    //         next[0].style.display = "block";
    //         $("#album_name").focus();
    //     });
    // }

    // for (i = 0; i < close.length; i++) {
    //     close[i].addEventListener("click", function() {
    //         modalWrapper[0].style.display = "none";
    //     });
    // }



    // next[0].addEventListener("click", function() {
    //     var validate = new XMLHttpRequest();

    //     validate.addEventListener("loadstart", function() {

    //         document.body.style.cursor = "wait";

    //     });

    //     validate.addEventListener("load", function(e) {

    //         var r = e.target.response;
    //         var response = JSON.parse(r);

    //         var albumInput = document.forms["new_album"]["album[name]"].value;
    //         var artistInput = document.forms["new_album"]["artistNames"].value;

    //         var breakCheck = false;

    //         for (i = 0; i < response.albums.length; i++) {
    //             for (x = 0; x < response.artists.length; x++) {
    //                 if (response.albums[i].name == albumInput && artistInput == response.artists[x].name) {
    //                     breakCheck = true;
    //                     alert("Nope");
    //                     break;

    //                 }
    //             }
    //             if (breakCheck)
    //               {break;}
    //         }

    //         document.body.style.cursor = "default";

    //     });

    //     validate.open("get", "/api");
    //     validate.send();

    //     albumTitle.style.display = "none";
    //     artistName.style.display = "none";
    //     comment.style.display = "none";
    //     memberName.style.display = "flex";
    //     memberInstrument.style.display = "flex";
    //     comment2.style.display = "block";
    //     next[0].style.display = "none";
    //     next[1].style.display = "block";
    //     addAnother[0].style.display = "block";
    //     previous[0].style.display = "block";


    // });

    // next[1].addEventListener("click", function(){
    //     artistCity.style.display = "flex";
    //     memberName.style.display = "none";
    //     memberInstrument.style.display = "none";
    //     comment2.style.display = "none";
    //     next[1].style.display = "none";
    //     next[2].style.display = "block";
    //     addAnother[0].style.display = "none";
    //     previous[1].style.display = "block";
    //     previous[0].style.display = "none";


    // });

    // next[2].addEventListener("click", function(){
    //     addAnother[1].style.display = "block";
    //     artistCity.style.display = "none";
    //     next[2].style.display = "none";
    //     next[3].style.display = "block";
    //     previous[2].style.display = "block";
    //     previous[1].style.display = "none";

    // });

    // next[3].addEventListener("click", function(){
    //     addAnother[1].style.display = "none";
    //     albumGenre.style.display = "flex";
    //     albumDate.style.display = "flex";
    //     albumFormat.style.display = "flex";
    //     next[3].style.display = "none";
    //     next[4].style.display = "block";
    //     previous[3].style.display = "block";
    //     previous[2].style.display = "none";
    // });

});