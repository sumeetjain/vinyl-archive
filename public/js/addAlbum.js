window.addEventListener("load", function(){

  var add = document.getElementById("addAlbum");

  add.addEventListener("click", function(){

      var modal = document.getElementById("modal");
  var modalWrapper = document.getElementById("modal-wrapper");
  /**
 * Like jQuery's slideDown function - uses CSS3 transitions
 * @param  {Node} elem Element to show and hide
 */
function slideDown(modalWrapper) {
  modalWrapper.style.maxHeight = "1000px";
  // We're using a timer to set opacity = 0 because setting max-height = 0 doesn't (completely) hide the element.
  modalWrapper.style.opacity   = "1";
}

  	modal.style.display = "flex";
    modalWrapper.style.display = "flex";

    var close = document.getElementById("close");

    close.addEventListener("click", function(){

    modal.style.display = "none";
    modalWrapper.style.display = "none";

    });

  });

});