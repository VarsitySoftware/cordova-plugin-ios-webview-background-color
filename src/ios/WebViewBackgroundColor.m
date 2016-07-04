#import "WebViewBackgroundColor.h"
#import <objc/runtime.h>
#import <Cordova/CDVViewController.h>

@implementation WebViewBackgroundColor

- (id)settingForKey:(NSString*)key
{
    return [self.commandDelegate.settings objectForKey:[key lowercaseString]];
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if ([keyPath isEqual:@"statusBarHidden"]) {
        NSNumber* newValue = [change objectForKey:NSKeyValueChangeNewKey];
        [self updateIsVisible:![newValue boolValue]];
    }
}

- (void)pluginInitialize
{
    BOOL isiOS7 = (IsAtLeastiOSVersion(@"7.0"));

    
    self.webView.backgroundColor = [UIColor greenColor]; // Set background to a colour of your choosing
    self.webView.opaque = NO; // This makes the view transparent, you may not need this.

}

- (void)onReset {
    _eventsCallbackId = nil;
}

- (void) _ready:(CDVInvokedUrlCommand*)command
{
    _eventsCallbackId = command.callbackId;
    [self updateIsVisible:![UIApplication sharedApplication].statusBarHidden];
    NSString* setting = @"StatusBarOverlaysWebView";
    if ([self settingForKey:setting]) {
        self.statusBarOverlaysWebView = [(NSNumber*)[self settingForKey:setting] boolValue];
        if (self.statusBarOverlaysWebView) {
            [self resizeWebView];
        }
    }
}


@end
