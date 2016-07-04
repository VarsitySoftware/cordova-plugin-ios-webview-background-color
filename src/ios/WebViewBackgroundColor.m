#import "WebViewBackgroundColor.h"
#import <objc/runtime.h>
#import <Cordova/CDVViewController.h>

@implementation WebViewBackgroundColor

- (void)pluginInitialize
{
    //BOOL isiOS7 = (IsAtLeastiOSVersion(@"7.0"));

    self.webView.backgroundColor = [UIColor greenColor]; // Set background to a colour of your choosing
    self.webView.opaque = NO; // This makes the view transparent, you may not need this.

}

- (void)onReset {
    _eventsCallbackId = nil;
}

- (void) _ready:(CDVInvokedUrlCommand*)command
{
    _eventsCallbackId = command.callbackId;
}

@end
