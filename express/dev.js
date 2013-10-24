var express = require('express'),
	path = require('path'),
	server = express(),
	port = 3000;


var orders = [{
	name: 'Tim',
	drink: 'Mocha'
}, {
	name: 'David',
	drink: 'Latte'
}];

server.configure(function() {

	// static files
	server.use(express.static(path.join(__dirname, '../app')));
	server.use(express.static(path.join(__dirname, '../.tmp')));

	// dynamic content

	// GET /api
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

	// GET /api/orders
	server.get('/api/orders', function (req, res) {
		var result = {
		  "_links": {
		    "self": {
		      "href": "/restbucks/api/orders"
		    },
		    "twitter": {
		      "href": "http://twitter.com/shengt"
		    }
		  },
		  "name": "RestBucks Store",
		  "project": "restbucks",
		  "version": "0.0.1",
		  "_embedded": {
		    "order": orders.map(function (order) {
		    	return {
		    		"_links": {
		    			"self": {
		    				"href": "/api/orders/" + order.name
		    			}
		    		},
		    		"drink": order.drink,
		    		"name": order.name
		    	};
		    })
		  }
		};

		res.json(result);
	});

	// POST /api/orders
	server.post('/api/orders', function (req, res) {

	})
});

server.listen(port);
console.log('Listening on port ' + port);
