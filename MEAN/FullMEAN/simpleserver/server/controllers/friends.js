console.log('friends controller');
// require mongoose to use the schema
var mongoose = require('mongoose');
// use the schema
var Friend = mongoose.model('Friend');


module.exports = {
  index: function(req,res){
    //your code here
    Friend.find({}, function (err, friends) {
        if(err){
            console.log('something went wrong finding the friends', err);
            res.json({errors:err});
        }
        else {
            res.json(friends);
        }
    })
  },
  create: function(req,res){
    //your code here
    console.log(req.body);
    var friend = new Friend({name: req.body.name, favoriteLanguage: req.body.favoriteLanguage});
    friend.save(function (err) {
        if(err) {
            console.log("something went wrong saving the friend", err);
            res.json(err);
        }
        else {
            console.log("Made it to the server");
            res.redirect('/friends');
        }
    })
  },
  update: function(req,res){
    //your code here
    Friend.update({name:req.params.name},{
        name: req.params.updatedname
    }, function (err) {
        if (err) {
            console.log("something went wrong with editing", err);
            res.json(err);
        }
        else {
            res.redirect('/friends');
        }
    });
  },
  delete: function(req,res){
    //your code here
    console.log(req.params);
    Friend.remove({_id:req.params.id}, function(err) {
        if(err) {
            console.log('something went wrong with deleting', err);
            res.json(err);
        }
        else {
            res.json({successMessage: "Object deleted"});
        }
    });
  },
  show: function(req,res){
    //your code here
    Friend.findOne({name:req.params.name}, function (err, friend) {
        if(err) {
            console.log('something went wrong finding the friend', err);
            res.json(err)
        }
        else {
            res.json(friend);
        }
    });
  }
}
