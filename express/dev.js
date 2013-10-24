var express = require('express'),
	path = require('path'),
	server = express(),
	port = 3000;

var orders = [];

server.configure(function() {

	// static files
	server.use(express.static(path.join(__dirname, '../app')));
	server.use(express.static(path.join(__dirname, '../.tmp')));

	// dynamic content

	// api
	server.get('/api', function (req, res) {
		res.json({
		   "_links":{
		      "self":{
		         "href":"/api"
		      },
		      "orders":{
		         "href":"/api/orders"
		      }
		   },
		   "name":"RestBucks Store",
		   "project":"restbucks",
		   "version":"0.0.1"
		});
	});

	server
});

server.listen(port);
console.log('Listening on port ' + port);
