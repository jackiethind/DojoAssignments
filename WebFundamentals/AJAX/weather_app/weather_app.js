$(document).ready(function() {
    $('form').submit(function() {
        var city = $('input:text[name=city]').val();
        var url = 'http://api.openweathermap.org/data/2.5/weather?q=';
        var id = '&&appid=d7024ac03768f80e090968a255ee6608';
        var name = "<h4>City Name:</h4>";
        var weather = "<h4>Weather:</h4>";
        // your code here (build up your url)
        $.get(url + city + id, function(res) {
            name += res.name;
            weather += res.weather[0].description;
            console.log(name);
            console.log(weather);
            $(".description").html(name + weather);
            // your code here
        }, 'json');
        // don't forget to return false so the page doesn't refresh
        return false;
    });
});
