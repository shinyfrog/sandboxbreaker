//
//  DroppableView.m
//  sandboxbreaker
//
//  Created by Matteo Rattotti on 12/12/12.
//  Copyright (c) 2012 Shiny Frog. All rights reserved.
//

#import "DroppableView.h"

@implementation DroppableView

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect]) != nil) {
		[self registerForDraggedTypes:[NSArray arrayWithObjects: NSFilenamesPboardType, nil]];
        
	}
	return self;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    
    NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
    
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
    
    
    if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
        if (sourceDragMask & NSDragOperationLink) {
            //return NSDragOperationLink;
			return NSDragOperationCopy;
        } else if (sourceDragMask & NSDragOperationCopy) {
            return NSDragOperationCopy;
        }
    }
    return NSDragOperationNone;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
    
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
    
	if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
        
        NSArray *files = [pboard propertyListForType:NSFilenamesPboardType];
        
        [[NSApp delegate] performSelector:@selector(openAndLogFilePaths:) withObject:files];
        
        return YES;
    }
    
    return NO;
    
}


- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor blueColor] set];
    NSRectFill([self bounds]);
}

@end
