'use strict';

/* Controllers */

angular.module('collectiveApp.controllers').
	controller('searchController', function($scope,$location, $rootScope) {
		$scope.resultCache = [
	    {
	        "popularity": 83,
	        "starred": false,
	        "album": {
	            "link": "spotify:album:3KuXEGcqLcnEYWnn3OEGy0",
	            "name": "The 2nd Law"
	        },
	        "artists": [
	            {
	                "link": "spotify:artist:12Chz98pHFMPJEknJQMWvI",
	                "name": "Muse"
	            }
	        ],
	        "duration": 280,
	        "link": "spotify:track:0c4IEciLCDdXEhhKxj4ThA",
	        "name": "Madness"
	    },
	    {
	        "popularity": 80,
	        "starred": false,
	        "album": {
	            "link": "spotify:album:0eFHYz8NmK75zSplL5qlfM",
	            "name": "The Resistance"
	        },
	        "artists": [
	            {
	                "link": "spotify:artist:12Chz98pHFMPJEknJQMWvI",
	                "name": "Muse"
	            }
	        ],
	        "duration": 305,
	        "link": "spotify:track:4VqPOruhp5EdPBeR92t6lQ",
	        "name": "Uprising"
	    }];

	    $scope.searchOn = false;
		
		$scope.searchNow= function(){
			$scope.searchOn = true;
			$scope.results = $scope.resultCache;
		};
		$scope.play = function(song){
			$rootScope.currentSong = song;
			$location.path( "/room" );
		}
  });