// require mongoose to set model
var mongoose = require('mongoose');
// make the schema
var FriendSchema = new mongoose.Schema({
    first_name: {type: String, required: true},
    last_name: {type: String, required: true},
    birthday: {type: Date, required: true}
}, {timestamps: true});
// set the schema
mongoose.model('Friend', FriendSchema);
