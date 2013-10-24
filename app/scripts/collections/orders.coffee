# Order collection
# - model: Order

define [
	'backbone'
	'cs!models/order'
], (Backbone, Order) ->
	Backbone.Collection.extend
		model: Order
