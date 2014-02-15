
//var async = require("async");
var http = require("http");
var junkebox = require("../services/mock/junkebox");
var spotify = require("../services/mock/spotify");
var db = require("../services/junkeboxdb").db;

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

    // junkebox.playlist(function(data){
    //   var result = {
    //     connectedUsers: 10,
    //     playlist: data,
    //     junkebox: {
    //       name: "SUMA Junkebox! #MDQ!"
    //     },
    //     nextFreeSpot:  {
    //       number: 10,
    //       measure: "minutes"   
    //     }
    //   };
    //   response.json(result);
    //   response.end();  
    // });

    db.get('list', function (err, result) {
      response.json(result);
      response.end();  
    });

};

exports.add = function(request,response){
    var song = request.body;
    junkebox.add(song, function(result){
      db.get('list', function (err, result) {
        console.log('adding song', JSON.stringify(result));
        if (err) console.log('Ooops! likely the key was not found', err); // likely the key was not found

        //if (result === undefined) {
          var result = {
            connectedUsers: 10,
            playlist: [],
            junkebox: {
              name: "SUMA Junkebox! #MDQ!"
            },
            nextFreeSpot:  {
              number: 10,
              measure: "minutes"   
            }
          };
        //}
        console.log('previous list status: ', result.playlist);
        result.playlist.push(song);
        console.log('post list status: ', result.playlist);
        db.put('list', result, function (err) {
          if (err) return console.log('Ooops!', err); // some kind of I/O error
        });
      });
      response.json(result);
      response.end();  
    });
  
};


