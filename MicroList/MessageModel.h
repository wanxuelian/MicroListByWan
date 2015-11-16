//
//  MessageModel.h
//  WeChat
//
//  Created by mac on 15-8-11.
//  Copyright (c) 2015年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(nonatomic,copy) NSString *content; //现实的内容
@property(nonatomic,copy) NSString *icon;    //图像
@property(nonatomic,copy) NSString *time;    //时间
@property(nonatomic,assign) BOOL     isSelf;   //判断是否是自己

@end
