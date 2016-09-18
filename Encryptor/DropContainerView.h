//
//  DropContainerView.h
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol DropContainerViewDelegate;

@interface DropContainerView : NSView
@property (nonatomic, weak) id<DropContainerViewDelegate> delegate;
@end

@protocol DropContainerViewDelegate <NSObject>
- (void)dropContainerViewDidEnterDragging:(DropContainerView *)dropContainerView;
- (void)dropContainerView:(DropContainerView *)dropContainerView didAcceptFiles:(NSArray<NSURL *> *)fileURLs;
@end
