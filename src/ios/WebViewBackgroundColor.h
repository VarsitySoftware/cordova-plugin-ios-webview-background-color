#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>

@interface WebViewBackgroundColor : CDVPlugin{
    @protected
    UIColor* _statusBarBackgroundColor;
    NSString* _eventsCallbackId;
}

- (void) backgroundColorByHexString:(CDVInvokedUrlCommand*)command;

- (void) _ready:(CDVInvokedUrlCommand*)command;

@end
