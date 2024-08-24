// https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/webRequest/onHeadersReceived
browser.webRequest.onHeadersReceived.addListener(
	({ responseHeaders }) => {
		responseHeaders = responseHeaders.filter( ({ name }) => !(/content-disposition/i.test(name)))

		return { responseHeaders: responseHeaders }
	},
	{ urls: [ "<all_urls>" ] },
	[ "blocking", "responseHeaders" ],
)
