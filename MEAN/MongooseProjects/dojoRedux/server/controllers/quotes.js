// This is the file that handles all of the server-side logic. The controller is called upon by the routes.
// The controller interacts with preloaded models to run database commands.
// The controller sends the response to the client.
// There can be many controllers in the server/controllers folder.


var mongoose = require("mongoose");
var Quote = mongoose.model("Quote");
module.exports = {
    show: function(req, res) {
        Quote.find({}, function(err,quotes){
            if(err){
                console.log("Something went wrong!");
            }
            else {
            console.log(quotes);
            for (var i=0; i < quotes.length; i++) {
                if(quotes[i].createdAt) {
                    console.log("**********CONVERTING DATE**********");
                    // console.log(quotes[i].createdAt);
                    quotes[i].stamp = quotes[i].createdAt.toLocaleString();
                    console.log(quotes[i].stamp);
                }
            }
            console.log("Successfully got to results");
            res.render('results', {quotes:quotes});
            }
        });
    },
    create: function (req,res) {
        console.log("POST DATA", req.body);
        var quote = new Quote({name:req.body.name, quote: req.body.quote});
        quote.save(function (err) {
            if(err){
                console.log("Something went wrong!");
                res.render('index', {title: 'you have errors!', errors: quote.errors})
            }
            else {
                console.log("Successfully added a quote");
                res.redirect('/showQuotes');
            }
        });
    }
}
