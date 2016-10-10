//
//  ViewController.m
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "ViewController.h"
#import "KeyContainerView.h"
#import "DropContainerView.h"

#import "EncrypteOutputHelper.h"

@interface ViewController () <DropContainerViewDelegate>
@property (weak) IBOutlet DropContainerView *dropContainerView;
@property (weak) IBOutlet NSTextField *keyTextField;
@property (weak) IBOutlet NSTextField *fileCountTextField;
@property (weak) IBOutlet NSSegmentedControl *modeSegmentedControl;

@property (nonatomic, assign) NSInteger fileCount;
@property (nonatomic, assign) EncryptorActionMode mode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    _fileCount = 0;
    _dropContainerView.delegate = self;
    _mode = EncryptorActionModeEncryption;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)dropContainerViewDidEnterDragging:(DropContainerView *)dropContainerView {

}

- (void)dropContainerView:(DropContainerView *)dropContainerView didAcceptFiles:(NSArray<NSURL *> *)fileURLs {
    NSInteger successCount = [EncrypteOutputHelper processFiles:fileURLs withKey:[_keyTextField stringValue] mode:_mode];
    _fileCount += successCount;
    [_fileCountTextField setStringValue:[NSString stringWithFormat:@"%ld", (long)_fileCount]];
}

- (IBAction)showOutputFolder:(NSButton *)sender {
    [[NSWorkspace sharedWorkspace] openURL:[EncrypteOutputHelper getOutputFolderURL]];
}

- (IBAction)changeMode:(NSSegmentedControl *)sender {
    _mode = sender.selectedSegment;
}
@end
