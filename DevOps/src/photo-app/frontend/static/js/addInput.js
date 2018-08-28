var counter = 1;
var limit = 3;
function addInput(divName){
    if (counter == limit)  {
        alert("You have reached the limit of adding " + counter + " inputs");
    }
    else {
        var newdiv = document.createElement('div');
        newdiv.innerHTML = "<label for='interest'> Interest " + (counter + 1) + " : </label> <input type='test' name='interests[]'>";
        document.getElementById(divName).appendChild(newdiv);
        counter++;
    }
}
