//var async = require("async");

var spotify = require('spotify')({ appkeyFile: './spotify_appkey.key' });
var username = "11122869937";
var password = "hotdog1234";
spotify.login(username, password, true, false);


exports.play = function(spotifyTrack){
	return { success:true };
};

exports.search = function(q,success){
	
	var search = new spotify.Search(q);
	search.execute( function(err, searchResult) {
		success(searchResult);	
	});
};



