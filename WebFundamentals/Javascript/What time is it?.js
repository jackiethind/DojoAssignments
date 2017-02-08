var HOUR = 7;
var MINUTE = 15;
var PERIOD = "PM";

function whatTimeIsIt () {

    if (MINUTE < 30)
    {
        MINUTE = " just after";
    }
    else
    {
        MINUTE = " almost";
        HOUR++;
    }
    if (PERIOD == "AM")
    {
        PERIOD = " in the morning.";
    }
    else
    {
        PERIOD = " in the evening.";
    }
    console.log("It's" + MINUTE + " "+ HOUR + PERIOD)
}

whatTimeIsIt(HOUR, MINUTE, PERIOD);
