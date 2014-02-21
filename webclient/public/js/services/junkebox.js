'use strict';
var collectiveApp = angular.module('collectiveApp.services');


collectiveApp.service('junkeboxService', function($http) {
    return {
        search: function(q,callback){
            var url = "api/v1/search/" + q.toLowerCase();
            $http.get(url).success(function(data) {
                 callback(data);
            });
        },
        room: function(callback){
            var url = "api/v1/room/";
            $http.get(url).success(function(data) {
                 callback(data);
            });
        },
        add: function(song,callback){
            var url = "api/v1/room/playlist/add";
            $http.post(url, song).success(function(data){
  					callback(data);
			});
        },
         stop: function(callback){
            var url = "api/v1/room/playlist/stop";
            $http.post(url, {}).success(function(data){
                    callback(data);
            });
        },
        play: function(callback){
            var url = "api/v1/room/playlist/play";
            $http.post(url, {}).success(function(data){
                    callback(data);
            });
        },
         clear: function(callback){
            var url = "api/v1/room/playlist/clear";
            $http.post(url, {}).success(function(data){
                    callback(data);
            });
        },
        skip: function(callback){
            var url = "api/v1/room/playlist/skip";
            $http.post(url, {}).success(function(data){
                    callback(data);
            });
        }
    };
});