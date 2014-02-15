'use strict';

/* Controllers */

angular.module('collectiveApp.controllers').
	controller('roomController', function($scope,$location,$rootScope, junkeboxService) {

	$scope.newsong = $rootScope.currentSong;
	junkeboxService.room(function(data){
		$scope.room = data;
	});

	
	// var socket = new io.connect();
	// socket.on('message', function (data) {
	// 	console.log(data);
	// });
			
		  
		

	

});