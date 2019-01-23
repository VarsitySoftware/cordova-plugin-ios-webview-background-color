#import "WebViewBackgroundColor.h"

@implementation WebViewBackgroundColor

- (id)settingForKey:(NSString*)key
{
    return [self.commandDelegate.settings objectForKey:[key lowercaseString]];
}

- (void)pluginInitialize
{   
	NSString* setting;

    setting  = @"WebViewBackgroundColor";

    if ([self settingForKey:setting]) {
        
		unsigned int rgbValue = 0;
		NSScanner* scanner = [NSScanner scannerWithString:[self settingForKey:setting]];
		[scanner setScanLocation:1];
		[scanner scanHexInt:&rgbValue];

		UIColor* backgroundColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
				
		self.webView.backgroundColor = backgroundColor; 
		self.webView.opaque = NO; // This makes the view transparent, you may not need this.
    }   
}

- (void) change:(CDVInvokedUrlCommand *)command {
    
    	NSDictionary *options = [command.arguments objectAtIndex: 0];
  
	NSString* strColor = [options objectForKey:@"color"];

    	NSLog(@"ALERT: CHANGING BACKGROUND COLOR!");
	NSLog(@"color: %@", strColor);	
	
}

@end
