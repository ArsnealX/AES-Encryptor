//
//  EncrypteOutputHelper.h
//  Encryptor
//
//  Created by Joshua Xiong on 9/18/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncrypteOutputHelper : NSObject
+ (NSInteger)encrypteFiles:(NSArray <NSURL *> *)fileURLs withKey:(NSString *)key;
+ (NSURL *)getOutputFolderURL;
@end
