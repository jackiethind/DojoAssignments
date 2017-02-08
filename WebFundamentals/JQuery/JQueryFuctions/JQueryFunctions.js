$(document).ready(function(){
            $('#click').click(function(){
                console.log('The Button was clicked.');
            });
            $('#hide').click(function(){
                $('h1').hide(function () {
                    console.log('The Title was hidden.');
                })
            });
            $('#show').click(function(){
                $('h1').show(function () {
                    console.log('The Title was shown.');
                })
            });
            $('#toggle').click(function () {
                $('h1').toggle(function() {
                    console.log( "The Title was toggled." );
                    })
            });
            $('#slidedown').click(function () {
                $('h1').slideDown("slow", function() {
                    console.log( "The Title was slid down." );
                    })
            });
            $('#slideup').click(function () {
                $('h1').slideUp("slow", function() {
                    console.log( "The Title was slid Up." );
                    })
            });
            $('#slidetoggle').click(function () {
                $('h1').slideToggle("slow", function() {
                    console.log( "The Title was slide toggled." );
                    })
            });
            $('#fadein').click(function () {
                $('h1').fadeIn("slow", function() {
                    console.log( "The Title was faded in." );
                    })
            });
            $('#fadeout').click(function () {
                $('h1').fadeOut("slow", function() {
                    console.log( "The Title was faded out." );
                    })
            });
            $('#addclass').click(function () {
                $('h1').addClass("blue");
            });
            $('#before').click(function () {
                $('h1').before("haha");
            });
            $('#after').click(function () {
                $('h1').after("haha");
            });
            $('#append').click(function () {
                $('h1').append("haha");
            });
            $('#html').click(function () {
                $('h1').html("haha");
            });
            $('#attr').click(function () {
                $('img').attr("width", "500");
            });
            $('#val').click(function () {
                $('input:text').val("Boo");
            });
            $('#text').click(function () {
                $('h1').text("haha");
            });
        });
