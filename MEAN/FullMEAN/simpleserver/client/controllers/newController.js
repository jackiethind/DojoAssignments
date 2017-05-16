

app.controller('newController', ['$scope', 'friendsFactory', '$location', function($scope, friendsFactory, $location) {
    console.log("newController loaded");
    function grabFriends(data) {
        $scope.friends = data;
        $scope.newFriend = {};
    }

    $scope.friends = [];

    friendsFactory.index(grabFriends);

    $scope.create = function () {
        console.log("create friend clicked");
        friendsFactory.create($scope.newFriend, function (data) {
            $scope.newFriend = {}; // clear form fields
            $location.url('/') // redirect to main page
        });
    }

    $scope.delete = function (friend) {
        $scope.friends.splice($scope.friends.indexOf(friend), 1)
        friendsFactory.delete(friend._id, function (data) {
            // this line deletes the friend from the temp array friends, but he is already out of the array

        });
    }

    // $scope.edit = function (friend) {
    //     friendsFactory.update(friend._id, function (data) {
    //     })
    // }

}]);
