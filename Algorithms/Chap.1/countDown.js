
 var arr = [];
 var num1=12;
function countDown() {
  for (var i =num1; i>=0; i--) {
    arr.push(i);
  }
  console.log(arr.length);
  return arr;
}

countDown (num1);
console.log(arr);
