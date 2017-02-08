var arr = ["James", "Jill", "Jane", "Jack"];
var style = "::";
var reversed = false;
// console.log(arr);
// console.log(style);
fancyArray (arr);
function fancyArray() {
    if (reversed === false){
    for (var i=0; i<=arr.length-1; i++){
        console.log(i +" "+ style + " " + arr[i]);
    }
    }
    else {
        for (var i=0; i<=arr.length-1; i++){
            console.log(i +" "+ style + " " + arr[arr.length-1-i]);
        }
    }
}
