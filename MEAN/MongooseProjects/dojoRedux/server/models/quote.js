// This is the file that specifies the schema to be loaded by mongoose.
// This file is required by mongoose.js.
// We do not need to require this file in the controller, instead, the model itself is loaded from mongoose.
// There can be many models in the server/models folder.


var mongoose = require("mongoose");

var QuoteSchema = new mongoose.Schema({
    name: {type: String,required:[true, "You must fill out a name!"], minLength:6},
    quote: {type: String, required:[true, "You must fill out a quote!"], minLength:10}
}, {timestamps:true})

var Quote = mongoose.model('Quote', QuoteSchema);
