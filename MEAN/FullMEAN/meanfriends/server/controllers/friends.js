// require mongoose to use the schema
var mongoose = require('mongoose');
// use the schema
var Friend = mongoose.model('Friend');
console.log('friends controller');
// export db queries and actions

module.exports = {
    // find all return all
    index: function (req, res) {
        Friend.find({}, function (err, friends) {
            if (err) {
                console.log('something went wrong finding the friends', err);
            }
            else {
                res.json(friends);
            }
        });
    }
}
