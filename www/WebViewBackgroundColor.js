"use strict";
function WebViewBackgroundColor() {
}

WebViewBackgroundColor.install = function () {
	if (!window.plugins) {
		window.plugins = {};
	}
	window.plugins.webViewBackgroundColor = new WebViewBackgroundColor();
	return window.plugins.webViewBackgroundColor;
};

cordova.addConstructor(WebViewBackgroundColor.install);
