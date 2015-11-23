//
//  SelectModel.h
//  MicroList
//
//  Created by Mac on 15/11/9.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDef.h"
@interface SelectModel : NSObject

@property(nonatomic,copy)NSString *myPhoto;
@property(nonatomic,copy)NSString *name;
@property(nonatomic)Sex sex;
@property(nonatomic,copy) NSString *nickName;
@property(nonatomic,copy)NSString *area;//地区
@property(nonatomic,copy)NSString *signature;//个性签名


@end
