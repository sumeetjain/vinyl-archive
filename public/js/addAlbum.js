window.addEventListener("load", function(){

  var add = document.getElementById("addAlbum");

  add.addEventListener("click", function(){

  	var modal = document.getElementById("modal");
    var modalWrapper = document.getElementById("modal-wrapper");

  	modal.style.display = "flex";
    modalWrapper.style.display = "flex";
  });

});