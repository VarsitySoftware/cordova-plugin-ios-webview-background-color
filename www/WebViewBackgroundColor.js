"use strict";
function WebViewBackgroundColor() {
}

WebViewBackgroundColor.prototype.setColor = function (url, options) {
	options = options || {};
	cordova.exec(options.successCallback || null, options.errorCallback || null, "WebViewBackgroundColor", "setColor", [url, options]);
};

WebViewBackgroundColor.install = function () {
	if (!window.plugins) {
		window.plugins = {};
	}
	window.plugins.webViewBackgroundColor = new WebViewBackgroundColor();
	return window.plugins.webViewBackgroundColor;
};

cordova.addConstructor(WebViewBackgroundColor.install);
