//var async = require("async");

var fs = require('fs');
var MOCK_SEARCH = 'services/mock/spotify.search.json';
var spotify = require('spotify')({ appkeyFile: './spotify_appkey.key' });
var username = "11122869937";
var password = "hotdog1234";
spotify.login(username, password, true, false);


exports.playlist = function(success){
	fs.readFile(MOCK_SEARCH, 'utf8', function (err, data) {
	  if (err) {
	    console.log('Error: ' + err);
	    return;
	  }
	  data = JSON.parse(data);

	  success(data);
	});
};

exports.add = function(song,success){
	var playlist =[];
	playlist.push(song);
	
	console.log("about to play:" +  JSON.stringify(song));
	spotify.ready( function() {
		
		spotify.player.play(song);
		console.log("playing:" + JSON.stringify(song));
		var result = {
	      success: true,
	      isNext: true,
	      when : 0,
	      how: "minutes",
	      toWait: 0,
	      room:{
	        playlist: playlist
	      }
		};
		success(result);
	});
};



