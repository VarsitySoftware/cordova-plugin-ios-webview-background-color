var exec = require('cordova/exec');

//var WebViewBackgroundColor;

var WebViewBackgroundColor = function () {
};

WebViewBackgroundColor.prototype.change = function (success, fail, options) {
  if (!options) {
        options = {};
   }

    return cordova.exec(success, fail, "WebViewBackgroundColor", "change", [options]);
};

window.webViewBackgroundColor = new WebViewBackgroundColor();

//module.exports = WebViewBackgroundColor;
var webViewBackgroundColor = window.webViewBackgroundColor;

module.exports = webViewBackgroundColor;
