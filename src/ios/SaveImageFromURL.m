/**
 *  SaveImageFromURL.m
 *  Cordova Save Image Plugin
 *
 *  Created by Ronald Klip (github.com/RonaldPK) on 22-08-2013.
 *  Copyright 2013 Ronald Klip. All rights reserved.
 *  MIT licensed
 */

#import "SaveImageFromURL.h"

@implementation SaveImageFromURL

@synthesize cbMethod;

- (void) saveImage:(CDVInvokedUrlCommand*)command
{
	NSDictionary *options = command.arguments[0];
	NSString *url = [options objectForKey:@"url"];
	self.cbMethod=[[options objectForKey:@"cbMethod"] description];
	
	UIImage *pic = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
	
	UIImageWriteToSavedPhotosAlbum(pic, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
	
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
	NSString* jsString = [NSString stringWithFormat:@"%@(\"%i\");", self.cbMethod, error ? 0 : 1];
	[super writeJavascript:jsString];
	
}

@end