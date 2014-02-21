'use strict';

/* Controllers */

angular.module('collectiveApp.controllers').
	controller('roomController', function($scope,$location,$rootScope, junkeboxService, $interval) {

	$scope.newsong = $rootScope.currentSong;
	junkeboxService.room(function(data){
		$scope.room = data;
	});

	$scope.isNowPlaying = function(song){
		if (!$scope.room.playlist){
			return false;
		}
		else if ($scope.room.playlist.length === 0){
			return false;
		}
		else if ($scope.room.playlist[0].link === song.link){
			return true;
		}
	};
	$scope.isSecondPlaying = function(song){
		if (!$scope.room.playlist){
			return false;
		}
		else if ($scope.room.playlist.length < 2){
			return false;
		}
		else if ($scope.room.playlist[1].link === song.link){
			return true;
		}
	};
	$scope.stop = function(){
		junkeboxService.stop(function(){
			$scope.stopped = true;
		});
		
	};
	$scope.play = function(){
		junkeboxService.play(function(){
			$scope.stopped = false;
		});
		
	};	
	$scope.clear = function(){
		junkeboxService.clear(function(){});
		junkeboxService.room(function(data){
			$scope.room = data;
		});
	};	
	$scope.reload = function(){
		junkeboxService.room(function(data){
			$scope.room = data;
		});
	};	
	$scope.skip = function(){
		junkeboxService.skip(function(){
			
		});

	};	

	$interval(function(){
		junkeboxService.room(function(data){
			$scope.room = data;
		});
	}, 1000 *60 * 3);


});