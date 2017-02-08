$("button").click(function () {
    $("tbody").after("<tr><td id='1'></td><td id= '2'></td><td id= '3'></td><td id= '4'></td></tr>");
    test();
});
function test() {
        var col1 = $("#FirstName").val();
        var col2 = $("#LastName").val();
        var col3 = $("#Email").val();
        var col4 = $("#Contact_No").val();
        $("#1").append(col1);
        $("#2").append(col2);
        $("#3").append(col3);
        $("#4").append(col4);
        $("td").removeAttr("id");
}
