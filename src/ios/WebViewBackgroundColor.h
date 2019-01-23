#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>

@interface WebViewBackgroundColor : CDVPlugin{
    @protected
    UIColor* _statusBarBackgroundColor;
    NSString* _eventsCallbackId;
}

-(void)change:(CDVInvokedUrlCommand *)command;

@end
