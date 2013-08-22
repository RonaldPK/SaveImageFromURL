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
	// UIImageWriteToSavedPhotosAlbum(shot, nil, nil, nil);
	
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
	NSString* jsString = [NSString stringWithFormat:@"%@(\"%i\");", self.cbMethod, error ? 0 : 1];
	[super writeJavascript:jsString];
	
	// [self.webView stringByEvaluatingJavaScriptFromString:jsString];
	
	
	
	/*
	UIAlertView *alert;
    
    if (error) // Unable to save the image
        alert = [[UIAlertView alloc] initWithTitle:@"Problem"
                                           message:@"Please allow this app to access your photos.\n Settings > Privacy > Photos"
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    else // All is well
        alert = [[UIAlertView alloc] initWithTitle:@"Success" 
                                           message:@"Saved image to your photos." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    [alert show];
    */
}

@end