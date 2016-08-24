window.addEventListener("load", function(){

  var modalWrapper = document.getElementsByClassName("modal-wrapper");
  var add = document.getElementById("addAlbum");

  add.addEventListener("click", function(){

    modalWrapper.style.display = "flex";

    var close = document.getElementById("close");

    close.addEventListener("click", function(){

    modalWrapper.style.display = "none";

    });

  });

});