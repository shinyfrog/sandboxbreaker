//
//  AppDelegate.m
//  sandboxbreaker
//
//  Created by Matteo Rattotti on 12/12/12.
//  Copyright (c) 2012 Shiny Frog. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
}

- (void)application:(NSApplication*)app openFiles:(NSArray*)someFiles
{

    [self openAndLogFilePaths:someFiles];
    
}

- (void) openAndLogFileURLs: (NSArray *) files
{
    for (NSURL *fileURL in files) {
        NSImage *i = [[NSImage alloc] initWithContentsOfURL:fileURL];
        
        if (i != nil) {
            self.numberOfFiles++;
            [self.numberOfFilesTextField setStringValue:[NSString stringWithFormat:@"%ld", self.numberOfFiles]];
        } else {
            BOOL isReadable = [[NSFileManager defaultManager] isReadableFileAtPath:[fileURL path]];
            
            NSLog(@"can't open %@ file is readable %d", fileURL, isReadable);
        }
        
        [i release];

    }
    
}

- (void) openAndLogFilePaths: (NSArray *) files
{
    for (NSString *path in files) {
        
        NSImage *i = [[NSImage alloc] initWithContentsOfFile:path];

        if (i != nil) {
            self.numberOfFiles++;
            [self.numberOfFilesTextField setStringValue:[NSString stringWithFormat:@"%ld", self.numberOfFiles]];
        } else {

            BOOL isReadable = [[NSFileManager defaultManager] isReadableFileAtPath:path];
            
            NSLog(@"can't open %@ file is readable %d", path, isReadable);
        }
        
        [i release];
        
    }
}

- (IBAction)openWithOpenPanel:(id)sender
{

    NSOpenPanel *op = [[NSOpenPanel alloc] init];
    [op setAllowsMultipleSelection:YES];
    
    [op beginWithCompletionHandler:^(NSInteger result) {
        if (result) {
            
            [self openAndLogFileURLs:[op URLs]];
            
        }
    }];

}

@end
