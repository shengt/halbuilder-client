# The entry of the app
define [
	'jquery'
	'cs!views/orderView'
	'cs!collections/orders'
	'cs!utils'
], ($, OrderView, orders, utils) ->

	apiUrl = '/api'
	apiOrderUrl = ''
	app = null

	error = () ->
		alert 'api is not available. Try reload the page.'
		$('#order-form :input').prop('disabled', true)

	# initial orders
	$.get(apiUrl).done((resp) =>
		apiOrderUrl = utils.getLinkHref resp, 'orders'

		if apiOrderUrl
			$('#order-form :input').prop('disabled', false)

			app = new OrderView
				el: $('#order-list').get()
				apiUrl: apiOrderUrl

			app.render()
		else
			error()
	).fail((err) =>
		error()
	)

	# input form
	$('#order-form').submit (evt) ->
		evt.preventDefault()
		nameInput = $('#name')
		drinkInput = $('#drink')

		name = nameInput.val()
		drink = drinkInput.val()

		orders.create {
			"name": name
			"drink": drink
		}, {
			wait: true
		}

		app.render()

		orders.on 'sync', () ->
			nameInput.val('')
			drinkInput.val('')

