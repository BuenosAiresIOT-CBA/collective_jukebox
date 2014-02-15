'use strict';


// Declare app level module which depends on filters, and services
angular.module('collectiveApp', [
  'ngRoute',
  'collectiveApp.filters',
  'collectiveApp.services',
  'collectiveApp.directives',
  'collectiveApp.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/', {templateUrl: 'partials/start.html', controller: 'startController'});
  $routeProvider.when('/instructions', {templateUrl: 'partials/instructions.html', controller: 'instructionsController'});
  $routeProvider.when('/search', {templateUrl: 'partials/search.html', controller: 'searchController'});
  $routeProvider.when('/room', {templateUrl: 'partials/room.html', controller: 'roomController'});
  $routeProvider.otherwise({redirectTo: '/'});
}]);

angular.module('collectiveApp.controllers', []);