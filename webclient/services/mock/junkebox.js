//var async = require("async");
'use strict';
var fs = require('fs');
var MOCK_SEARCH = 'services/mock/spotify.search.json';
var db = require("../junkeboxdb").db;

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
	db.get('list', function (err, room) {
        if (err) console.log('Ooops! likely the key was not found', err); // likely the key was not found
        var newRoom = {};
        if (err && err.type === 'NotFoundError') {
	           newRoom = {
	            connectedUsers: 10,
	            playlist: [],
	            junkebox: {
	              name: "SUMA Junkebox! #MDQ!"
	            }, 
	            nextFreeSpot:  {
	              number: 10,
	              measure: "minutes"   
	            }
	          }
	        newRoom.playlist.push(song);
	          console.log(newRoom);
	         
	          console.log('post list status: ', newRoom.playlist);
		        db.put('list', JSON.stringify(newRoom), function (err) {
		          if (err) return console.log('Ooops!', err); // some kind of I/O error
		          success(newRoom);
		        });
        }else {
	        var jsonRoom = JSON.parse(room);
	        jsonRoom.playlist.push(song);
	        console.log(jsonRoom.playlist);
	        db.put('list', JSON.stringify(jsonRoom), function (err) {
	          if (err) return console.log('Ooops!', err); // some kind of I/O error
	          success(JSON.stringify(jsonRoom));
	        });
    	}

        
        
      });
};



