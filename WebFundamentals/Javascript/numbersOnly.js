var arr = [1,"apple", -3, "orange", 0.5];
numbersOnly (arr);

function numbersOnly() {
    var numbersOnly = [];
    for (var i =0; i <= arr.length -1; i++) {
        if (typeof arr[i] === "number") {
            numbersOnly.push(arr[i]);
        }
    }
    console.log(numbersOnly);
}
