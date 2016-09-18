//
//  EncrypteOutputHelper.m
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "EncrypteOutputHelper.h"
#import "NSData+Encryption.h"

#define kDefaultEncryptKey @"87A68CD13A84EAF8EC39539F55EE89CE"

@implementation EncrypteOutputHelper
+ (NSInteger)encrypteFiles:(NSArray <NSURL *> *)fileURLs withKey:(NSString *)key {
    NSInteger successCount = 0;
    NSString *outputFolderPath = [[self class] getOutputFolderPath];
    for (NSURL *fileURL in fileURLs) {
        NSData *fileData = [NSData dataWithContentsOfURL:fileURL];
        NSData *encryptData = [fileData AES256EncryptWithKey:(key.length > 0 ? key : kDefaultEncryptKey)];
        NSString *outputFilePath = [outputFolderPath stringByAppendingPathComponent:fileURL.lastPathComponent];
        if ([encryptData writeToFile:outputFilePath atomically:YES]) {
            successCount ++;
            NSLog(@"file %@ encrypted, output path : %@", fileURL.lastPathComponent, outputFilePath);
        }
    }
    return successCount;
}

+ (NSURL *)getOutputFolderURL {
    return [NSURL fileURLWithPath:[[self class] getOutputFolderPath]];
}

+ (NSString *)getOutputFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSString *desktopPath = [paths objectAtIndex:0];
    NSString *outputFolderPath = [desktopPath stringByAppendingPathComponent:@"encryptor_output"];
    [[self class] createFolderIfNeeded:outputFolderPath];
    return outputFolderPath;
}

+ (BOOL)createFolderIfNeeded:(NSString *)folderPath {
    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
        NSError *error;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:folderPath
                                                 withIntermediateDirectories:YES
                                                                  attributes:nil
                                                                       error:&error];
        if (error) {
            NSLog(@"creating folder error : %@", error);
        }
        return success;
    }
    return YES;
}
@end
