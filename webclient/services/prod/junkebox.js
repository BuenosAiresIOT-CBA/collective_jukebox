//var async = require("async");

var fs = require('fs');
var MOCK_SEARCH = 'services/mock/spotify.search.json';
var spotify = require('spotify')({ appkeyFile: './spotify_appkey.key' });
var username = "11122869937";
var password = "hotdog1234";

var db = require("../junkeboxdb").db;


spotify.login(username, password, true, false);


exports.search = function(q,success){
  var search = new spotify.Search(q);
  search.execute( function(err, searchResult) {
    success(searchResult.tracks);  
  });
};


exports.checkStart = function(){
	  db.get('room', function (err, jsonRoom) {
	  	
    	if(!err || !jsonRoom){
	    	var room = JSON.parse(jsonRoom);
				if (room.playlist)
				{
					if (room.playlist.length > 0)
					{
						var next = room.playlist[0];
						console.log(next);
						var search = new spotify.Search('Muse');
						search.execute(function(err,s) {
							exports.play(next, function(){});
						});
						
					}
				}
	        }
    });

};
exports.add = function(song,success){
	
	db.get('room', function (err, room) {
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
	         
			console.log('post list status: ', newRoom.playlist);
			
			db.put('room', JSON.stringify(newRoom), function (err) {
			  if (err) return console.log('Ooops!', err); // some kind of I/O error
			  	exports.play(song, function(){});
			  	success(newRoom);
			});
        }else {
	        var jsonRoom = JSON.parse(room);
			console.log(spotify.player.currentSecond);
	        if (spotify.player.currentSecond <= 0 && jsonRoom.playlist.length > 0){
	        	exports.play(jsonRoom.playlist[0], function(){});
			}

	        jsonRoom.playlist.push(song);
	        if (jsonRoom.playlist.length === 1){
				exports.play(song, function(){});
			}
	        
	        
	        db.put('room', JSON.stringify(jsonRoom), function (err) {
	          if (err) return console.log('Ooops!', err); // some kind of I/O error
	          success(JSON.stringify(jsonRoom));
	        });
    	}

        
        
      });
	

};

exports.subscribeToPlaylist = function(observer){
	
	spotify.player.on("player_end_of_track", function(err, player) {
		console.log("Finished and: ", err);
		observer.onTrackFinished();
	});
	
};

var reproudceNextSong = {
		onTrackFinished: function() { 
			db.get('room', function (err, jsonRoom) {
        		if (err) console.log('Ooops! likely the key was not found', err); 
        		if (jsonRoom)
        		{
        			var room = JSON.parse(jsonRoom);
			        room.playlist = room.playlist.splice(1);
			        db.put('room', JSON.stringify(room), function (err) {
			          if (err) return console.log('Ooops!', err); // some kind of I/O error
			        });
        			if (room.playlist)
        			{
        				if (room.playlist.length > 0)
        				{
        					var next = room.playlist[0];
        					exports.play(next, function(){});
        				}
        			}
        		}

        	 });
		}	
};

exports.subscribeToPlaylist(reproudceNextSong);



exports.play = function(song, success){
	
	var search = new spotify.Search('Muse');
		search.execute( function(err, searchResult) {
		spotify.player.stop();
		track = spotify.createFromLink(song.link);
		spotify.player.play(track);
		console.log("playing:" + JSON.stringify(track));		
	});
	var result = {};
	success(result);
	
};

exports.stop = function(success){
	
	// var search = new spotify.Search('Muse');
	// 	search.execute( function(err, searchResult) {
	spotify.player.stop();
	// 	track = spotify.createFromLink(song.link);
	// 	spotify.player.play(track);
	// 	console.log("playing:" + JSON.stringify(track));		
	// });
	var result = {success:true};
	success(result);	
};
exports.clear = function(success){

    db.get('room', function (err, jsonRoom) {
    	if (jsonRoom){
    	  var room = JSON.parse(jsonRoom);
		  room.playlist = []
	        db.put('room', JSON.stringify(room), function (err) {
	          if (err) return console.log('Ooops!', err); // some kind of I/O error
	        });
	        var result = {success:true};
  			success(result);
  		}
  		else {
  			var result = {success:true};
  			success(result);
  		}
    });
};


exports.playlist = function(success){

    db.get('room', function (err, jsonRoom) {
    	if (jsonRoom){
    	  var room = JSON.parse(jsonRoom);
		  
	      	success(room);
  		}
  		else {
  			var result = {playlist:[]};
  			success(result);
  		}
    });
};


exports.resumePlaylist = function(ready){

	console.log(ready);
    db.get('room', function (err, jsonRoom) {
        		if (err) console.log('Ooops! likely the key was not found', err); 
        		if (jsonRoom)
        		{
        			var room = JSON.parse(jsonRoom);
        			if (room.playlist)
        			{
        				if (room.playlist.length > 0)
        				{
        					var next = room.playlist[0];
        					exports.play(next, function(){});
        					var result = {success:true};
        					ready(result);
        				}
        			}
        		}
        		var result = {success:true};
        		ready(result);

        	 });
};
exports.skip = function(ready){

	reproudceNextSong.onTrackFinished();
	var result = {success:true};
	ready(result);
};


//autoinit ?
// setTimeout(function(){exports.checkStart();}, 5000);