// standard angular module
var app = angular.module("app", ["ngRoute"]);

app.config(function($routeProvider){
   $routeProvider
      .when("/users", {
         templateUrl: "static/partials/customizeUsers.html"
      })
      .when("/list", {
         templateUrl: "static/partials/userList.html"
      })
      .otherwise({
         redirectTo: "/users"
      });
})

app.factory('userFactory', [function () {
    var factory = {};

    var users = [
        {first_name: 'Jackie', last_name: 'Thind', language: 'Swift'},
        {first_name: 'Gurparsad', last_name: 'Thind', language: 'C++'},
        {first_name: 'Jon', last_name: 'Scott', language: 'Ruby'}
    ]
    factory.index = function (callback) {
        callback(users);
    }

    factory.create = function (user) {
        users.push(user);
    }

    factory.delete = function (object) {
        users.splice(object,1);
    }

    return factory;
}])

app.controller("CustomizeUsersController", ['$scope','userFactory', function($scope, userFactory) {
    function grabUsers(data) {
        $scope.users = data;
        $scope.newUser = {};
    }
    $scope.users = [];

    userFactory.index(grabUsers);

    $scope.create = function () {
        userFactory.create($scope.newUser)
        $scope.newUser = {};
    }

    $scope.delete = function (object) {
        userFactory.delete(object);
    }

}])

app.controller("UsersListsController", ['$scope', 'userFactory', function ($scope, userFactory) {
    function grabUsers(data) {
        $scope.users = data;
    }
    $scope.users = [];

    userFactory.index(grabUsers);
}])
