// Always start with your server.js file
// The server.js file acts as the home base for your application. This is where you require the routes and the mongoose configurations
// The server.js also creates the express application, loads configurations onto it, and then tells it to listen!


var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var mongoose = require('mongoose');
app.use(bodyParser.urlencoded({extended:true}));
var path = require('path');
app.use(express.static(path.join(__dirname, './client/static')));
app.set('views',path.join(__dirname,'./client/views'));
app.set('view engine', 'ejs');

require('./server/config/mongoose.js');

var routes_setter = require('./server/config/routes.js');
// invoke the function stored in routes_setter and pass it the "app" variable
routes_setter(app);

// MONGOOSE STUFF
// require the mongoose configuration file which does the rest for us


app.listen(8000, function () {
    console.log("listening on port 8000");
})
