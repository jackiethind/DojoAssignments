// $("button").click(function () {
//     $("tbody").after("<tr><td id='1'></td><td id= '2'></td><td id= '3'></td></tr>");
//     test();
// });
// function test() {
//         var col1 = $("#FirstName").val();
//         var col2 = $("#LastName").val();
//         var col3 = $("textarea").val();
//         // var col4 = $("#Contact_No").val();
//         $("#1").append(col1);
//         $("#2").append(col2);
//         $("#3").append(col3);
//         // $("#3").hide();
//         // $("#4").append(col4);
//         $("td").removeAttr("id");
// }

$('button').click(function () {
    test2();
    $(".card_holder").append("<div class='parent'><div class='seen' id='1'></div><div class='magic' id='2'></div></div>");
        // $(".card_holder").append("hello");
    $('.magic').hide();
    console.log('it happened');
    test();
    test2();
});

function test() {
    var col1 = $("#FirstName").val();
    var col2 = $("#LastName").val();
    var col3 = $("textarea").val();

    $("#1").append(col1);
    $("#1").append(" "+col2);
    $("#2").append(col3);
    $("div").removeAttr("id");


    $("div").css('color','white');

}

function test2 () {
$('.parent').click(function () {
    $(this).children().toggle();
    console.log('child was touched');

});
}
