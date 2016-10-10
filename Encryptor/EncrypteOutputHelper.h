//
//  EncrypteOutputHelper.h
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EncryptorActionMode) {
    EncryptorActionModeEncryption,
    EncryptorActionModeDecryption
};

@interface EncrypteOutputHelper : NSObject
+ (NSInteger)processFiles:(NSArray <NSURL *> *)fileURLs
                  withKey:(NSString *)key
                     mode:(EncryptorActionMode)mode;
+ (NSInteger)encrypteFiles:(NSArray <NSURL *> *)fileURLs
                   withKey:(NSString *)key;
+ (NSInteger)decrypteFiles:(NSArray <NSURL *> *)fileURLs
                   withKey:(NSString *)key;
+ (NSURL *)getOutputFolderURL;
@end
