console.log('future routes');
// require the friends controller
var friends = require('../controllers/friends');
// have routes call the proper friends db methods
module.exports = function(app) {
    // retrieve all friends
    app.get('/friends', friends.index);
    // create one friend
    app.post('/friends', friends.create);
    // update one friend by id
    app.put('/friends/:id', friends.update);
    // show one friend by id
    app.get('/friends/:id', friends.show);
    // delete one friend by id
    app.delete('/friends/:id', friends.delete);
};
