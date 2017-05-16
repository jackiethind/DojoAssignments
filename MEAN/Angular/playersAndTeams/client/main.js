// standard angular module
var app = angular.module("app", ['ngRoute', 'ngMessages']);

app.config(function($routeProvider){
   $routeProvider
      .when("/players", {
         templateUrl: "static/partials/players.html"
      })
      .when("/teams", {
         templateUrl: "static/partials/teams.html"
      })
      .when("/associations", {
          templateUrl: "static/partials/associations.html"
      })
      .when("/:teamname", {
          templateUrl: "static/partials/team.html"
      })
      .otherwise({
         redirectTo: "/players"
      });
})

app.factory('playerFactory', function () {
    var factory = {};

    var players = [
        {name:'Jackie', team: ""},
        {name:'Gurparsad', team: ""},
        {name:'Meenu', team: ""}
    ]

    factory.index = function (callback) {
        callback(players);
    }

    factory.create = function(player) {
        players.push(player);
    }

    factory.delete = function (object) {
        players.splice(players.indexOf(object),1);
    }
    factory.addPlayerToTeam = function (playerData, teamData) {
        playerData.team = teamData.name;
    }
    factory.removePlayerFromTeam = function (player) {
        player.team = "";
    }
    return factory;
})

app.factory('teamFactory', function () {
    var factory = {};

    var teams = [
        {name:'Bhangra Empire'},
        {name:'Cal Bhangra'},
        {name:'Da Real Punjabiz'}
    ];

    factory.index = function (callback) {
        callback(teams);
    }

    factory.create = function(team) {
        teams.push(team);
    }

    factory.delete = function (object) {
        teams.splice(teams.indexOf(object),1);
    }
    return factory;
})

app.controller('playerController', ['$scope','playerFactory', function ($scope, playerFactory) {
    function grabPlayers(data) {
        $scope.players = data;
        $scope.newPlayer = {};
    }
    $scope.players = [];

    playerFactory.index(grabPlayers);

    $scope.create = function () {
        playerFactory.create($scope.newPlayer)
        $scope.newPlayer = {};
    }

    $scope.delete =function (object) {
        playerFactory.delete(object);
    }
}]);
app.controller('teamController', ['$scope','teamFactory', function ($scope, teamFactory, $routeParams) {
    console.log($routeParams);
    function grabTeams(data) {
        $scope.teams = data;
        $scope.newTeam = {};
    }
    $scope.teams = [];

    teamFactory.index(grabTeams);

    $scope.create = function () {
        teamFactory.create($scope.newTeam)
        $scope.newTeam = {};
    }

    $scope.delete =function (object) {
        teamFactory.delete(object);
    }
}]);

app.controller('associationsController', ['$scope','playerFactory', 'teamFactory', function ($scope, playerFactory, teamFactory) {
    function grabPlayers(data) {
        $scope.players = data;
        $scope.newPlayer = {};
    }
    $scope.players = [];
    function grabTeams(data) {
        $scope.teams = data;
        $scope.newTeam = {};
    }
    $scope.teams = [];

    playerFactory.index(grabPlayers);
    teamFactory.index(grabTeams);

    $scope.removePlayerFromTeam = function (object) {
        playerFactory.removePlayerFromTeam(object);

    }

    $scope.addPlayerToTeam =function (playerData, teamData) {
        playerFactory.addPlayerToTeam(playerData, teamData);
    }
}]);
