//
//  GroupListModel.h
//  MicroList
//
//  Created by Mac on 15/11/16.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupListModel : NSObject

@property(nonatomic,copy)NSString *gid;//群ID
@property(nonatomic,copy)NSString *groupName;//群组名
@property(nonatomic,copy)NSString *headPath;//头像地址
@property(nonatomic,copy)NSString *nickName;//用户别名

@end
