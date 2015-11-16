//
//  AESData.h
//  MicroList
//
//  Created by Mac on 15/11/10.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSRange.h>
@interface AESData : NSObject

- (NSData *)AES256EncryptWithKey:(NSData *)key;
- (NSData *)AES256DecryptWithKey:(NSData *)key;


+ (NSString*) AES128Encrypt:(NSString *)plainText;

+ (NSString*) AES128Decrypt:(NSString *)encryptText;


@end
