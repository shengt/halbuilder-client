# Order collection
# - model: Order

define [
	'backbone'
	'cs!models/order'
	'cs!utils'
], (Backbone, Order, utils) ->
	Orders = Backbone.Collection.extend
		model: Order

		parse: (resp, options) ->
			resp = resp.toJSON() if resp.toJSON
			orders = utils.getEmbeddedResource resp, 'order'

	new Orders
