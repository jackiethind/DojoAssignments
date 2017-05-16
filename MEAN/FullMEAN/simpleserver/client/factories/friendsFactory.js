console.log('Friends Factory');
app.factory('friendsFactory', ['$http', function($http) {
  var factory = {};
  var friends = [];
  var friend = {};
  // index populates the friends array from the db and then sends to the controller
  factory.index = function(callback) {
      //call this method if you want to update or set the friends variable
      $http.get('/friends').then(function(returned_data){
        console.log(returned_data.data);
        friends = returned_data.data;
        callback(friends);
      });
  }
  // show finds the single user in the db and returns it to the controller
  factory.show = function(id, callback) {
      $http.get('/friends/' +id).then(function (returned_data) {
          if (typeof(callback) == 'function') {
              callback(returned_data.data);
          }
      });
  }
  // adds a single user to the db and then returns it to the controller, callback does nothing with the data passed
  factory.create = function(newfriend, callback) {
    //   CREATE Step 2: A request was made to your server to POST /friends from your factory with the following data:newfriend
      $http.post('/friends', newfriend).then(function(returned_data){
        // CREATE Step 3: Your server has completed the request (wih a response) and gave you back this data:returned_data
        console.log('this is the returned data', returned_data.data);
        // CREATE Step 4: The data from the server was set to a private variable to store in the factory with friend
        if (typeof(callback) == 'function'){
          callback(returned_data.data);
        }
      });
  }
  // finds one user with the id and updates the specified fields and returns the user to the controller, this callback does nothing with the data passed
  factory.update = function(id, callback) {
    $http.put('/friends/' +id, {name:updatefriend.name}).then(function(returned_data) {
        console.log(returned_data.data);
        if (typeof(callback) == 'function'){
          callback(returned_data.data);
        }
    });
  }
  // deletes one user from the db with the matching id
  factory.delete = function(id, callback) {
      $http.delete('/friends/' + id).then(function (returned_data) {
          console.log(returned_data.data);
          if (typeof(callback) == 'function') {
              callback();
          }
      });
  }
  return factory;
}]);
