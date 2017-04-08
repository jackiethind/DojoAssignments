var math= require('./mathlib')();     //notice the extra invocation parentheses!


num1 = 2;
num2 = 4;

console.log(math.add(num1,num2));
console.log(math.multiply(num1,num2));
console.log(math.square(num1));
console.log(math.random(num1,num2));
