//var async = require("async");

var fs = require('fs');
var MOCK_SEARCH = 'services/mock/spotify.search.json';

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
};



