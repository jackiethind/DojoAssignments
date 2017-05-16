app.controller('showController', function($scope, FriendFactory, $routeParams){
  console.log("show controller loaded!");
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
})
