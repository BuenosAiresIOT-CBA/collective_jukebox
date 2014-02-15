
//var async = require("async");
var http = require("http");
var junkebox = require("../services/mock/junkebox");
var spotify = require("../services/mock/spotify");
var db = require("../services/junkeboxdb");

//UNCOMMENT WHEN IS READY! 
// var junkebox = require("../services/prod/junkebox");
//var spotify = require("../services/prod/spotify");

exports.search = function(request,response){

  var query = request.params.q ;
  spotify.search(query, function(result){
    response.json(result);
    response.end();  
  });
  
};

exports.room = function(request,response){

    junkebox.playlist(function(data){
      var result = {
        connectedUsers: 10,
        playlist: data,
        junkebox: {
          name: "SUMA Junkebox! #MDQ!"
        },
        nextFreeSpot:  {
          number: 10,
          measure: "minutes"   
        }
      };
      response.json(result);
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


