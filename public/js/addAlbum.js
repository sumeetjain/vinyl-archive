window.addEventListener("load", function(){

  var modal = document.getElementById("modal");
  var modalWrapper = document.getElementById("modal-wrapper");
  var add = document.getElementById("addAlbum");

  add.addEventListener("click", function(){

  	modal.style.display = "flex";
    modalWrapper.style.display = "flex";

    var close = document.getElementById("close");

    close.addEventListener("click", function(){

    modal.style.display = "none";
    modalWrapper.style.display = "none";

    });

  });

});