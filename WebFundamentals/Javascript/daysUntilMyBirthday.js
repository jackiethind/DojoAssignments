var daysUntilMyBirthday = 0;

function birthdayCountdown (){
    for (var i = daysUntilMyBirthday; i >= 0; i = i-1) {
        if (i >= 30)
        {
            console.log(i + " days until my birthday. Such a long time...:(");
            break;
        }
        else if (i < 30 && i!=0)
        {
            console.log(i + " DAYS UNTIL MY BIRTHDAY!!!");
            break;
        }
        else
        {
            console.log("♪ღ♪*•.¸¸¸.•*¨¨*•.¸¸¸.•*•♪ღ♪¸.•*¨¨*•.¸¸¸.•*•♪ღ♪•*♪ღ♪░H░A░P░P░Y░ B░I░R░T░H░D░A░Y░░♪ღ♪*•♪ღ♪*•.¸¸¸.•*¨¨*•.¸¸¸.•*•♪¸.•*¨¨*•.¸¸¸.•*•♪ღ♪•«");
            break;
        }
    }
}

birthdayCountdown();
