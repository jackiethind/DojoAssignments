var x = [3,5,"Dojo", "rocks", "Michael", "Sensei"];
x.push(100);
x.push(["hello", "world", "JavaScript is Fun"]);
for (var i = 0; i < x.length; i++) {
  console.log(x[i]);
}

var sum = 0;
for (var i = 1; i <= 500; i++) {
    sum += i;
}
console.log(sum);

var arr = [1, 5, 90, 25, -3, 0];
var min = arr[0];
var avg = 0;
var sum = 0;
for (var i = 1 ; i<arr.length ;i++ ) {
    if (arr[i] < min) {
        min = arr[i]
    }
}
console.log("min is " + min);
for (var i = 0; i < arr.length; i++) {
    sum += arr[i];
}
console.log(sum);
avg = sum/arr.length;
console.log(avg);

var newNinja = {
 name: 'Jessica',
 profession: 'coder',
 favorite_language: 'JavaScript', //like that's even a question!
 dojo: 'Dallas'
}

for (var key in newNinja) {
    console.log(key + ":" + newNinja[key]);
}
