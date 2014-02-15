//var async = require("async");

var fs = require('fs');
var MOCK_SEARCH = 'services/mock/spotify.search.json';
var spotify = require('spotify')({ appkeyFile: './spotify_appkey.key' });
var username = "11122869937";
var password = "hotdog1234";

spotify.login(username, password, true, false);

exports.search = function(q,success){
  var search = new spotify.Search(q);
  search.execute( function(err, searchResult) {
    success(searchResult);  
  });
};
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

	
	var search = new spotify.Search('Muse');
	search.execute( function(err, searchResult) {
		console.log("error", err);
		spotify.player.stop();
		track = spotify.createFromLink(song.link);
		spotify.player.play(track);
		console.log("playing:" + JSON.stringify(track));		
	});
	var result = {};
	success(result);
	
};



