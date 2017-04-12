var express = require("express");

var app = express();

var bodyParser = require("body-parser");

var mongoose = require('mongoose');

app.use(bodyParser.urlencoded({extended: true}));

var path = require("path");

app.use(express.static(path.join(__dirname, './static')));

app.set('views', path.join(__dirname,'./views'));

app.set('view engine', 'ejs');

app.get('/', function(req,res) {
    User.find({}, function (err,users) {
        console.log(users);
        if(err){
            console.log("something went wrong");
        }
        else {
            console.log("successfully got to index!");
             res.render('index', {users:users});
        }
    })
})

// This is the route that we already have in our server.js
// When the user presses the submit button on index.ejs it should send a post request to '/users'.  In
//  this route we should add the user to the database and then redirect to the root route (index view).
app.post('/users', function(req, res) {
    console.log("POST DATA", req.body);
 // This is where we would add the user from req.body to the database.
 // create a new User with the name and age corresponding to those from req body
    var user = new User({name: req.body.name, age: req.body.age});
 // try to save that new user(this is the method taht actually inserts into the db) and run a callback function with an error (ir any) from the operation.
    user.save(function (err) {
        // if there is an error log that something went wrong!
        if(err){
            console.log("something went wrong");
        }
        else {
            console.log("successfully added a user!");
             res.redirect('/');
        }
    })

})


app.listen(8000, function () {
    console.log('listening on port 8000');
})

// MONGOOSE STUFF
// This is how we connect to the mongodb database using mongoose -- "basic_mongoose" is the name of
//   our db in mongodb -- this should match the name of the db you are going to use for your project.
mongoose.connect('mongodb://localhost/basic_mongoose');

mongoose.Promise = global.Promise;

var UserSchema = new mongoose.Schema({
    name: String,
    age: Number
})
mongoose.model('User', UserSchema); // We are setting this Schema in our Models as 'User'
var User = mongoose.model('User') // We are retrieving this Schema from our Models, named 'User'
