var rescueApp = angular.module('rescueApp', ['ngRoute']);

rescueApp.config(['$routeProvider', '$httpProvider',
  function($routeProvider, $httpProvider) {
    $routeProvider.
      when('/members', {
        templateUrl: 'views/members.html',
        controller: 'MemberListCtrl'
      }).
      when('/members/:memberID', {
        templateUrl: 'views/member.html',
        controller: 'MemberCtrl'
      }).
      when('/stream', {
        templateUrl: 'views/stream.html',
        controller: 'StreamCtrl'
      }).
			otherwise({
			  redirectTo: '/stream'
			});
}]);

rescueApp.controller('MemberListCtrl', ['$scope','$rootScope','$http',function ($scope,$rootScope,$http) {
  $rootScope.pageTitle = 'Members';
  $http.get('model/members.cfc?method=get').success(function(data) {
    $scope.members = data.members;
  });
}]);


rescueApp.controller('MemberCtrl', ['$scope','$rootScope','$http','$routeParams',function ($scope,$rootScope,$http,$routeParams) {
  $http.get('model/members.cfc?method=getByID&ID='+ $routeParams.memberID).success(function(data) {
    $scope.member = data.member;
    $rootScope.pageTitle = data.member.fullname;
  });
  $http.get('model/stream.cfc?method=get').success(function(data) {
    $scope.stream = data.stream;
  });
  $scope.checkBoxClass = function(complete){
     if(complete==true)
            return "glyphicon-check"
     else
         return "glyphicon-unchecked";
    };
  $scope.checklistClass = function(complete){
     if(complete==true)
            return "completed"
     else
         return "";
    };
  $scope.completedStepsCount = function(steps){ 
    var completed = 0;
    $.each(steps,function(n, step){
	    if (step.complete==true) completed++;
     
    });
    return completed;
  };
}]);

rescueApp.controller('StreamCtrl', ['$scope','$rootScope','$http',function ($scope,$rootScope,$http) {
  $rootScope.pageTitle = 'Stream';
  $http.get('model/stream.cfc?method=get').success(function(data) {
    $scope.stream = data.stream;
  });
}]);