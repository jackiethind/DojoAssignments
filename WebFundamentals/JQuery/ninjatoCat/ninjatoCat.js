$(document).ready(function(){
            $('img').click(function() {
                console.log('alt value is', $(this).attr('alt'));
            });
            $('img').click(function () {
                    var temp = $(this).attr('src');
                    $(this).attr('src',$(this).attr('alt'));
                    $(this).attr('alt',temp);
                    console.log( "You clicked an image!" );
                });
        });
