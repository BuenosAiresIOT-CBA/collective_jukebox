'use strict';

/* Controllers */

angular.module('collectiveApp.controllers').
	controller('roomController', function($scope,$location, $rootScope) {
		
		$scope.newsong = $rootScope.currentSong;
		$scope.room  = {
				    "connectedUsers": 10,
				    "playlist": [
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
		        },
		        {
		            "popularity": 76,
		            "starred": false,
		            "album": {
		                "link": "spotify:album:0lw68yx3MhKflWFqCsGkIs",
		                "name": "Black Holes And Revelations"
		            },
		            "artists": [
		                {
		                    "link": "spotify:artist:12Chz98pHFMPJEknJQMWvI",
		                    "name": "Muse"
		                }
		            ],
		            "duration": 243,
		            "link": "spotify:track:3skn2lauGk7Dx6bVIt5DVj",
		            "name": "Starlight"
		        },
		        {
		            "popularity": 74,
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
		            "duration": 236,
		            "link": "spotify:track:0It6VJoMAare1zdV2wxqZq",
		            "name": "Undisclosed Desires"
		        },
		        {
		            "popularity": 74,
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
		            "duration": 184,
		            "link": "spotify:track:1tjHKKI0r82IB5KL29whHs",
		            "name": "Panic Station"
		        },
		        {
		            "popularity": 73,
		            "starred": false,
		            "album": {
		                "link": "spotify:album:0HcHPBu9aaF1MxOiZmUQTl",
		                "name": "Absolution"
		            },
		            "artists": [
		                {
		                    "link": "spotify:artist:12Chz98pHFMPJEknJQMWvI",
		                    "name": "Muse"
		                }
		            ],
		            "duration": 237,
		            "link": "spotify:track:2takcwOaAZWiXQijPHIx7B",
		            "name": "Time Is Running Out"
		        },
		        {
		            "popularity": 73,
		            "starred": false,
		            "album": {
		                "link": "spotify:album:0lw68yx3MhKflWFqCsGkIs",
		                "name": "Black Holes And Revelations"
		            },
		            "artists": [
		                {
		                    "link": "spotify:artist:12Chz98pHFMPJEknJQMWvI",
		                    "name": "Muse"
		                }
		            ],
		            "duration": 367,
		            "link": "spotify:track:7ouMYWpwJ422jRcDASZB7P",
		            "name": "Knights Of Cydonia"
		        },
		        {
		            "popularity": 71,
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
		            "duration": 295,
		            "link": "spotify:track:40pPI2TbaYSZlKfV44HRjn",
		            "name": "Supremacy"
		        }
		    ],
		    "junkebox": {
		        "name": "SUMA Junkebox! #MDQ!"
		    },
		    "nextFreeSpot": {
		        "number": 10,
		        "measure": "minutes"
		    }
		};


	});