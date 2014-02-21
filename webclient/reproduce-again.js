
'use strict';
 
console.log("Loading modules...");
 
var sp = require('libspotify');
var Speaker = require('speaker');
var cred = require('spotify_cred');
 
function prettyPopularity(popularity, width) {
        var output = "";
        var fill = "#";
        var unfill = "-";
        var ratio = popularity/100;
        for (var i = 0; i < width; i++) {
                if (i < ratio*width) {
                        output += fill;
                } else {
                        output += unfill;
                }
        }
        return output;
}
 
console.log("Logging in as "+cred.login+"...");
 
var session = new sp.Session({
        applicationKey: __dirname + '/node_modules/libspotify/spotify_appkey.key'
});
 
session.login(cred.login, cred.password);
session.once('login', function (err) {
        if (err) {
                console.log(err.toString());
                session.close();
                return;
        }
 
        var player = session.getPlayer();
        var speaker = new Speaker();
        player.pipe(speaker);
       
        var searchTerms = process.argv.slice(2);
       
        var foundTracks = [];
 
        searchNext();
       
        function searchNext() {
                var searchTerm = searchTerms.shift();
                if (!searchTerm) {
                        playLoop();
                        return;
                }
 
                var search = new sp.Search(searchTerm);
                search.trackCount = 1;
                search.execute();
                search.once('ready', function (search) {
                        if (!search.tracks.length) {
                                console.log('No search result for "'+searchTerm+'"');
                        } else {
                                var track = search.tracks[0];
                                foundTracks.push(track);
                                console.log("Added "+track.title+" by "+track.artist+" to queue ("+searchTerm+")");
                        }
 
                       
                        searchNext();
                       
                });
        }
       
        function playLoop() {
                if (foundTracks.length === 0) {
                        player.stop();
                        session.logout();
                        session.close();
                        return;
                }
               
                var track = foundTracks.shift();
                player.load(track);
                player.play();
                var st = Date.now();
               
                console.log(' > '+track.title+' by '+track.artist+' ('+track.album+', '+track.album.year+') '+track.humanDuration+' ['+prettyPopularity(track.popularity, 10)+'] '+track.getHttpUrl());
               
                player.once('track-end', function() {
                        //console.log('Track finished buffering, '+Math.round(((Date.now()-st)/track.duration)*100)+"% into the song");
                        player.stop();
                        if (foundTracks.length === 0) {
                                session.logout();
                                session.close();
                        }
                });
 
                if (foundTracks.length > 0) {
                        setTimeout(function () {
                                playLoop();
                        }, track.duration);
                }
        }
});