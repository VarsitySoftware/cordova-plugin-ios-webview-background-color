#import <Cordova/CDV.h>

@interface WebViewBackgroundColor()
	- (void)parseOptions:(NSDictionary *) options type:(NSString *) type;
@end

@implementation StreamingMedia {
	NSString* callbackId;
	UIColor *backgroundColor;
}

-(void)parseOptions:(NSDictionary *)options type:(NSString *) type {
	// Common options
	if (![options isKindOfClass:[NSNull class]] && [options objectForKey:@"color"]) {
		[self setBackgroundColor:[options objectForKey:@"bgColor"]];
	} else {
		backgroundColor = [UIColor blackColor];
	}
}

-(void)setColor:(CDVInvokedUrlCommand *) command type:(NSString *) type {
	callbackId = command.callbackId;
	
	[self parseOptions:[command.arguments objectAtIndex:1] type:type];

  self.webView.backgroundColor = backgroundColor; // Set background to a colour of your choosing
	self.webView.opaque = NO; // This makes the view transparent, you may not need this.
}

-(void) setBackgroundColor:(NSString *)color {
	if ([color hasPrefix:@"#"]) {
		// HEX value
		unsigned rgbValue = 0;
		NSScanner *scanner = [NSScanner scannerWithString:color];
		[scanner setScanLocation:1]; // bypass '#' character
		[scanner scanHexInt:&rgbValue];
		backgroundColor = [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
	} else {
		// Color name
		NSString *selectorString = [[color lowercaseString] stringByAppendingString:@"Color"];
		SEL selector = NSSelectorFromString(selectorString);
		UIColor *colorObj = [UIColor blackColor];
		if ([UIColor respondsToSelector:selector]) {
			colorObj = [UIColor performSelector:selector];
		}
		backgroundColor = colorObj;
	}
}

@end
