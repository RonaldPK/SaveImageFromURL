/**
 *  SaveImageFromURL.h
 *  Cordova Save Image Plugin
 *
 *  Created by Ronald Klip (github.com/RonaldPK) on 22-08-2013.
 *  Copyright 2013 Ronald Klip. All rights reserved.
 *  MIT licensed
 */


#import <Cordova/CDV.h>

@interface SaveImageFromURL : CDVPlugin

@property (nonatomic, copy) NSString *cbMethod;

// Saves an image from URL to the 'Saved Photos' album
- (void)saveImage:(CDVInvokedUrlCommand*)command;

@end