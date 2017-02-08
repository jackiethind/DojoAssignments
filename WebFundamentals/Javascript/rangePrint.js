var range = [2];

function printRange () {
    var start = range[0];
    var end = range[1];
    var skipAmount = range[2];
    if (range.length === 2) {
        console.log("length is 2");
        for (var i = start; i<end; i=i+1) {
            console.log(i);
        }
    }
    else if (range.length === 1)
    {
        for (var i = 0; i<start; i=i+1) {
            console.log(i);
        }
    }
    else
    {
        for (var i = start; i<end; i=i+skipAmount) {
        console.log(i);
        }
    }
}
printRange ();
