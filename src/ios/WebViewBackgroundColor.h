#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface WebViewBackgroundColor : CDVPlugin

- (void)setColor:(CDVInvokedUrlCommand*)command;

@end
