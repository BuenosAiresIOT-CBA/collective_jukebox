  
//var async = require("async");
var http = require("http");
var junkebox = require("../services/prod/junkebox");
//var spotify = require("../services/prod/spotify");

//UNCOMMENT WHEN IS READY! 
// var junkebox = require("../services/prod/junkebox");
// var spotify = require("../services/prod/spotify");




exports.search = function(request,response){

var query = request.params.q ;
  junkebox.search(query, function(result){
    response.json(result);
    response.end();  
  });
  
};


exports.room = function(request,response){

   junkebox.playlist(function(data){
      response.json(data);
      response.end();  
    });
};




exports.add = function(request,response){
    var song = request.body;
	
	
    junkebox.add(song, function(result){
      response.json(result);
      response.end();  
    });
  
};


exports.stop = function(request,response){
   junkebox.stop(function(result){
      response.json(result);
      response.end();  
    });
  
};

exports.play = function(request,response){
   junkebox.resumePlaylist(function(result){
      response.json(result);
      response.end();  
    });
  
};

exports.clear = function(request,response){
    junkebox.clear(function(result){
      response.json(result);
      response.end();  
    });
  
};

exports.skip = function(request,response){
    junkebox.skip(function(result){
      response.json(result);
      response.end();  
    });
  
};

