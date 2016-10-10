//
//  KeyContainerView.m
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "KeyContainerView.h"

@implementation KeyContainerView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.wantsLayer = YES;
}

- (BOOL)wantsUpdateLayer {
    return YES;
}

- (void)updateLayer {
    self.layer.backgroundColor =[NSColor colorWithRed:0.30 green:0.63 blue:0.98 alpha:1.00].CGColor;
}
@end
