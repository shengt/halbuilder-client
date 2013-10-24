# The main view of the application
define [
	'underscore'
	'jquery'
	'backbone'
	'cs!collections/orders'
	'text!templates/orderList.htm'
], (_, $, Backbone, orders, orderTemplate) ->
	Backbone.View.extend
		initialize: (options) ->
			orders.url = options.apiUrl

		render: () ->
			orders.fetch
				success: (orders) =>
					@$el.html _.template orderTemplate,
						orders: _.map orders.models, (order) ->
							name: order.get 'name'
							drink: order.get 'drink'
						_: _

				error: (err) =>
					console.error err

		# info : {success | info | warning | danger}
		showMessage: (msg, type) ->
			alertDiv = @$('.alert')
			if msg then alertDiv.show() else alertDiv.hide()

			type = type or 'info'
			alertDiv.text(msg).attr('class', 'alert').addClass "alert-#{type}"
