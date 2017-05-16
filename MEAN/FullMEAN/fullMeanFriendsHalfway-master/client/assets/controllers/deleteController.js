app.controller('deleteController', function($scope, FriendFactory, $routeParams, $location){
  console.log("Delete controller loaded")
  console.log($routeParams.id);
  FriendFactory.show($routeParams.id, function(data){
      console.log("data from friends factory:",data);
      if(!data){
        $scope.errormessage = "Could not find the friend in the database."
      }
      else {
        $scope.friend = data;
      }
    })
  $scope.delete = function() {
    console.log("I clicked the delete button");
    FriendFactory.delete($scope.friend, function(data) {
      if (data) {
        $location.url('/');
      } else {
        $scope.errormessage = "Cannot delete friend."
      }
    })
  }
})
