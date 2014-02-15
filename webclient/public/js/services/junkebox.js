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
        }
    };
});