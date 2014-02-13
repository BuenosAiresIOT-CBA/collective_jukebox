
/**
 * Module dependencies.
 */
(function(){
    "use strict";
    var express = require('express'),
    conf = require(__dirname + '/config')(),
    http = require('http'),
    path = require('path'),
    publicUrl = '/public';

    var app = express();

    // all environments
    app.set('port', process.env.PORT || 3000);

    app.use(express.static(path.join(__dirname, publicUrl)));

    app.use(express.compress());
    app.use(express.favicon());
    app.use(express.logger('dev'));
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.cookieParser(conf.coockiesecret));

    http.createServer(app).listen(app.get('port'), function(){
        console.log('Collective Junkebox ' + app.get('port'));
    });

})();
