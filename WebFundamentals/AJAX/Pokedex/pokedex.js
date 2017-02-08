$(document).ready(function(){
  for(i = 1; i <= 500; i++){
  var http = "http://pokeapi.co/media/img/";
  var png = ".png";
  var img = http + i + png;
  $(".pokemon").append("<img id="+i+" src='" +img+ "' class=choose>");
  };
  pokeClick();
  }); // End of all Pokemon Generated
  function pokeClick () {
      $('.choose').click(function () {
          var pokeNum = $(this).attr('id');
          var pokePic = $(this).attr('src');
          $.get("http://pokeapi.co/api/v1/pokemon/" +pokeNum, function(res) {
              var name = "";
              name += "<h1>" +res.name + "</h1>";
              var height = "";
              height += res.height;
              var weight = "";
              weight += res.weight;
              var html_str = "";
              html_str += "<h4>Types</h4>";
              html_str += "<ul>"; //types list
              for(var i = 0; i < res.types.length; i++) {
                  html_str += "<li>" + res.types[i].name + "</li>";
              }
              html_str += "</ul>";
              var html_str2 = "<h4>Height</h4>";
              var html_str3 = "<h4>Weight</h4>";
              $(".pokedex").html(name + "<img src ="+pokePic+">" + html_str + html_str2 + height + html_str3+weight);
          }, "json");
      })
  }
