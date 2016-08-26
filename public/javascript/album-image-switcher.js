window.addEventListener("load", function(){
	var image = document.getElementsByClassName("albumArt--sm");


	for(i=0; i < image.length; i++){
		image[i].addEventListener("click", function(){
			var cp = document.getElementsByClassName("albumArt--big");
			var current = cp[0].getAttribute("src");
			var clicked = this.getAttribute("src");

			cp[0].setAttribute("src", clicked);
			this.setAttribute("src", current);
		});
	}
});