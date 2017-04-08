function sumXY(x,y) {
    var sum = 0;
    for (var i =x; i< y +1 ;i++) {
        sum += i;
    }
    return sum;
}
var sum = sumXY(1,8);
console.log(sum);


function findMin(arr) {
    if (arr) {
        var min = arr[0];
        for (var i = 1; i < arr.length;i++) {
            if(arr[i] < min) {
                min = arr[i];
            }
        }
        return min;
    }
}

var arr = [1,3,4,5,32,-4];
var minArr = findMin(arr);
console.log(minArr);

function findAvg(arr) {
    var sum = 0;
    for (var i = 0; i <arr.length; i++) {
        sum += arr[i];
    }
    return sum/arr.length;
}

var avgArr = findAvg(arr);
console.log(avgArr);

var sumXY = function(x,y) {
    var sum = 0;
    for (var i = x; i< y+1; i++) {
        sum += i;
    }
    return sum;
};

var findMin = function findMin(arr) {
    if (arr) {
        var min = arr[0];
        for (var i = 1; i < arr.length;i++) {
            if(arr[i] < min) {
                min = arr[i];
            }
        }
        return min;
    }
};

var findAvg = function findAvg(arr) {
    var sum = 0;
    for (var i = 0; i <arr.length; i++) {
        sum += arr[i];
    }
    return sum/arr.length;
};

var myObject = {
    sumXY: function (x,y) {
        var sum = 0;
        for (var i = x; i< y+1; i++) {
            sum += i;
        }
        return sum;
    },
    findAvg: function () {
        var sum = 0;
        for (var i = 0; i <arr.length; i++) {
            sum += arr[i];
        }
        return sum/arr.length;
    },
    findMin: function () {
        if (arr) {
            var min = arr[0];
            for (var i = 1; i < arr.length;i++) {
                if(arr[i] < min) {
                    min = arr[i];
                }
            }
            return min;
        }
    }
}

var person = {
    name: "Jackie",
    distance_traveled: 0,
    say_name: function () {
        console.log(person.name);
    },
    say_something : function(phrase) {
        console.log(person.name + " says:" + phrase);
    },
    walk : function(){
        console.log(person.name + " is walking!");
        person.distance_traveled += 3;
        return person;
    },
    run: function () {
        console.log(person.name + " is running!");
        person.distance_traveled += 10;
        return person;
    },
    crawl: function () {
        console.log(person.name + " is crawling!");
        person.distance_traveled += 1;
        return person;
    },
    chewGum: function () {
        console.log("I can walk and chew gum, but I can't chew gum and walk...");
    }
}

person.walk().chewGum();
person.name = "Mike";
console.log(person.name);
