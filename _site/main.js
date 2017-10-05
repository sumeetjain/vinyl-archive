// sort bar functionality----------------------------


function myFunction() {
    var x = document.getElementById("mySelect");
    var i = x.selectedIndex;
    document.getElementById("demo").innerHTML = x.options[i].text;
}
