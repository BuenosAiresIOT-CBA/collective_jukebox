var  levelup       = require('levelup')
   , db            = levelup('./junkeboxdb');

exports.db = db;