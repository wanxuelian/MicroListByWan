//
//  BaseJsonData.h
//  MicroList
//
//  Created by Mac on 15/11/9.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReturnBlock)(id);

@interface BaseJsonData : NSObject


- (void)GETData:(NSString *)urlStr and:(NSDictionary *)params and:(ReturnBlock)block;
- (void)POSTData:(NSString *)urlStr and:(NSDictionary *)params and:(ReturnBlock)block;



@end
