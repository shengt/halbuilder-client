# utils.coffee
define ['underscore'], (_) ->
	getState: (halObj, state) ->
		states = _.omit halObj, ['_links', '_embedded']
		return states if !state
		return states[state]

	getLinkHref: (halObj, linkName) ->
		halObj._links[linkName].href

	getEmbeddedResource: (halObj, embeddedRes) ->
		halObj._embedded[embeddedRes]
