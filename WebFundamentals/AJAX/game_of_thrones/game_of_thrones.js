
$(document).ready(function(){
houseClick();
});
function houseClick () {
    $('img').click(function(){
        // console.log("img clicked");
        var housePic = $(this).attr('id');
        // console.log(housePic);
        var name = "<h4>Name:</h4>";
        var words = "<h4>Words:</h4>";
        var region = "<h4>Region:</h4>";
        var titles = "<h4>Titles:</h4>";
        var coatOfArms= "<h4>Coat of Arms:</h4>";
        if (housePic == 'stark'){
            // console.log("this is stark");
            $.get("https://www.anapioficeandfire.com/api/houses?name=House%20Stark%20of%20Winterfell", function(res) {
                name += res[0].name;
                words += res[0].words;
                region += res[0].region;
                coatOfArms += res[0].coatOfArms;
                titles += res[0].titles;
                $(".description").html(name + region+ coatOfArms + words + titles);
            })
        }
        else if (housePic == 'baratheon'){
            // console.log("this is baratheon");
            $.get("http://www.anapioficeandfire.com/api/houses?name=House%20Baratheon%20of%20Storm%27s%20End", function(res) {
                name += res[0].name;
                words += res[0].words;
                region += res[0].region;
                coatOfArms += res[0].coatOfArms;
                titles += res[0].titles;
                $(".description").html(name + region+ coatOfArms + words + titles);
            })
        }
        else if (housePic == 'lannister'){
            // console.log("this is lannister");
            $.get("http://www.anapioficeandfire.com/api/houses?name=House%20Lannister%20of%20Casterly%20Rock", function(res) {
                name += res[0].name;
                words += res[0].words;
                region += res[0].region;
                coatOfArms += res[0].coatOfArms;
                titles += res[0].titles;
                $(".description").html(name + region+ coatOfArms + words + titles);
            })
        }
        else {
            // console.log("this is targaryen");
            $.get("http://www.anapioficeandfire.com/api/houses?name=House%20Targaryen%20of%20King%27s%20Landing", function(res) {
                name += res[0].name;
                words += res[0].words;
                region += res[0].region;
                coatOfArms += res[0].coatOfArms;
                titles += res[0].titles;
                $(".description").html(name + region+ coatOfArms + words + titles);
            })
        }

    });
}
