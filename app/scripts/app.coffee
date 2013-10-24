# The entry of the app
define [
	'jquery'
	'cs!views/orderView'
	'cs!utils'
], ($, OrderView, utils) ->
	apiUrl = '/api'
	apiOrderUrl = ''

	$.get(apiUrl).done((resp) =>
		apiOrderUrl = utils.getLinkHref resp, 'orders'

		console.log 'api orders url:', apiOrderUrl

		app = new OrderView
			el: $ '#order-list'
			apiUrl: apiOrderUrl

	).fail((err) =>
		alert 'api is not available.'
	)
