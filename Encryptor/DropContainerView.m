//
//  DropContainerView.m
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "DropContainerView.h"

#warning ADD_ACCEPT_FILE_TYPE_HERE
#define ACCEPT_FILE_TYPES @[@"json"]

@implementation DropContainerView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self registerForDraggedTypes:@[NSFilenamesPboardType, NSURLPboardType]];
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
//    self.layer.backgroundColor = [NSColor colorWithRed:0.17 green:0.65 blue:0.88 alpha:1.00].CGColor;
    return YES;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    if ([self validateDraggingInfo:sender]) {
        return NSDragOperationGeneric;
    }
    return NSDragOperationNone;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender {
    
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    NSMutableArray *fileURLs = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray * propertyList = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    for (NSString *path in propertyList) {
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        NSString *fileExtension = [fileURL.pathExtension lowercaseString];
        if ([ACCEPT_FILE_TYPES containsObject:fileExtension]) {
            [fileURLs addObject:fileURL];
        }
    }

    if ([self.delegate respondsToSelector:@selector(dropContainerView:didAcceptFiles:)]) {
        [self.delegate dropContainerView:self didAcceptFiles:fileURLs];
    }
    
    return YES;
}

- (BOOL)validateDraggingInfo:(id<NSDraggingInfo>)draggingInfo {
    NSArray * propertyList = [[draggingInfo draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    for (NSString *path in propertyList) {
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        NSString *fileExtension = [fileURL.pathExtension lowercaseString];
        if ([ACCEPT_FILE_TYPES containsObject:fileExtension]) {
            return YES;
        }
    }
    return NO;
}

@end
