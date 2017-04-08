function runningLogger() {
    console.log("I am running");
}
runningLogger();
function multiplyBy10(num) {
    if(typeof(num) == "number") {
        return num*10;
    }
}

function stringReturnOne() {
    return "string1"
}

function stringReturnTwo() {
    return "string2"
}

function myFunctionRunner(param) {
    if (typeof(param) == "function") {
        param();
    }
}

myFunctionRunner(stringReturnOne);


function myDoubleConsoleLog(param1, param2) {
    if (typeof(param1) ==  "function" && typeof(param2) == "function") {
        console.log(param1(),param2());
    }
}

myDoubleConsoleLog(stringReturnOne,stringReturnTwo);

function caller2(param) {
    console.log("Starting...");
    var x = setTimeout(function() {
        if (typeof(param)=="function"){
            param(stringReturnOne,stringReturnTwo);
        }
    }, 2000);
    console.log("ending");
    return "interesting";
}

caller2(myDoubleConsoleLog);
