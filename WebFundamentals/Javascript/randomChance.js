var numQtr= Math.trunc(Math.random()*100);
console.log("You used " + numQtr + " quarters");
var numUser = 82;
randomChance();
console.log("You have " + numQtr +" quarters! You're broke!");

function randomChance() {
    // numQtr -= 1;
    var total = 0;
    for (var i = numQtr; i > 0; --i) {
        var chance =  Math.trunc(Math.random()*100);// determines the winning number
        var win=Math.trunc(Math.random()*51)+50; // determines the winning amount
        if (chance === numUser) {
            console.log("Thanks for using 1 quarter! You currently have " + i + " quarters left");
            console.log("You entered " + numUser + " as your guess");
            console.log("The winning number was " + chance);
            console.log("You could have won " + win + " quarters");
            total = i + win;
            i = total;
            console.log("You WON! You now have a total of " + i + " quarters");
            }
        else {
            // console.log("Thanks for using 1 quarter! You currently have " + i + " quarters");
            // console.log("You entered " + numUser + " as your guess");
            // console.log("The winning number was " + chance);
            // console.log("You could have won " + win + " quarters");
            console.log("You lost!");
        }
    }
    return numQtr=0;
    }

//
