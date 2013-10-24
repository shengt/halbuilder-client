# The entry of the app
define [
	'jquery'
	'cs!views/orderView'
], ($, OrderView) ->
	app = new OrderView
		el: $ '#order-list'
		apiUrl: '/api'
