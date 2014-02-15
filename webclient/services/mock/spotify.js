//var async = require("async");

var fs = require('fs');
var MOCK_SEARCH = 'services/mock/spotify.search.json';

exports.play = function(spotifyTrack){
	return { success:true };
};

exports.search = function(q,success){
	fs.readFile(MOCK_SEARCH, 'utf8', function (err, data) {
	  if (err) {
	    console.log('Error: ' + err);
	    return;
	  }
	  data = JSON.parse(data);

	  success(data);
	});
};



