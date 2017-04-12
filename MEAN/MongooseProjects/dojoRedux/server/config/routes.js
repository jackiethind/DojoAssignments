// This is the file that specifies which routes will be handled and by which controller methods.
// From routes.js we require the controller file (or files).

var mongoose = require('mongoose');
var Quote = mongoose.model('Quote');
var quotes  = require("../controllers/quotes.js");
module.exports = function (app) {
    app.get('/', function (req,res) {
        res.render('index');
    })
    app.get('/showQuotes', function(req, res) {
        quotes.show(req,res)
    })

    app.post('/quotes', function(req,res) {
        quotes.create(req,res)
    })
}
