//
//  AppDelegate.h
//  sandboxbreaker
//
//  Created by Matteo Rattotti on 12/12/12.
//  Copyright (c) 2012 Shiny Frog. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic) NSInteger numberOfFiles;
@property (assign) IBOutlet NSTextField *numberOfFilesTextField;

- (IBAction)openWithOpenPanel:(id)sender;

@end
