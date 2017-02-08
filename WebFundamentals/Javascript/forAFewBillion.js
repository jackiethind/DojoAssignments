function forAFewBillionDays () {
    if (days===0) {
        return console.log("That is not a valid day!");;
    }
    var doubled=0.01;
    var sum=0.01;
    for (var i=2;i<=days;i++) {
        doubled = doubled*2;
        sum = sum + doubled;
        // console.log("this is the doubled value for that day " + doubled);
        // console.log("the sum thus far " + sum);
        // if (doubled >= amount) {
        //     console.log(i + " days to make at least $" + amount);
        //     break;
        // }
    }
    console.log("Earned $" + doubled + " on day " + days);
    console.log("Earned a total sum of $" + sum + " in " + days + " days.");

}

var days=30;
// var amount=10000;
forAFewBillionDays(days);
