console.log("future routes");
////require the friends controller
var friends = require('../controllers/friends');
//have routes call the properc friends db methods
module.exports = function(app){
  app.get('/', function(req, res) {
    res.render('index')
  });
  app.get('/friends', function(req, res) {
    friends.index(req, res);
  });
  app.post('/friends', function(req, res){
     friends.create(req,res);
 });
  app.get('/friends/:name', function(req, res) {
    friends.show(req, res);
  });
  app.get('/update/:name/:updatedname', function(req,res){
    friends.update(req, res)
  });
  app.delete('/friends/:id', function(req,res){
      friends.delete(req,res)
  });
};

// app.put('/friends/:id', function(req, res) {
//   friends.update(req, res);
// });
// }
// this adds route listeners to friends for 5 of the 7 RESTful routes, excluding new and edit.
