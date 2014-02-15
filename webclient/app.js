var express 		= require('express')
	, routes		= require('./routes')
	, user 			= require('./routes/user')
	, junkebox 		= require('./routes/junkebox')
	, http 			= require('http')
	, path 			= require('path');

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);


app.get('/api/v1/room', junkebox.room);
app.get('/api/v1/search/:q', junkebox.search);
app.post('/api/v1/room/playlist/add', junkebox.add);



http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});



//REMOVE TO ADD SOCKETS SUPPORT.
// var io = require('socket.io').listen(server);
// if (process.env.NODE_ENV ==='production'){
//   //For Heroku
//   io.configure(function () {
//       io.set("transports", ["xhr-polling"]);
//       io.set("polling duration", 10);
//       io.set("log level", 1);
//   });
// }

// io.sockets.on('connection', function(socket) {
//   socket.broadcast.emit("new-user", {});
//   socket.on('new-playlist', function(msg) {
//       console.log("new-playlist", msg);
//       socket.broadcast.emit("new-item", msg);
//   });

//   socket.on('room-ready', function(msg) {
//       socket.broadcast.emit('ready', {});
//   });
// });



