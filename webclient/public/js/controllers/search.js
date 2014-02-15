'use strict';

/* Controllers */

angular.module('collectiveApp.controllers').
	controller('searchController', function($scope,$location, $rootScope, junkeboxService) {
	
	    $scope.searchOn = false;
		
		$scope.searchNow= function(){
			$scope.searchOn = true;
			junkeboxService.search($scope.query, function(data){
				$scope.results = data;
			});
		};
		$scope.play = function(song){
			$rootScope.currentSong = song;
			$location.path( "/room" );
		}
  });