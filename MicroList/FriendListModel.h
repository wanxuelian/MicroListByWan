//
//  FriendListModel.h
//  MicroList
//
//  Created by Mac on 15/11/11.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendListModel : NSObject


@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *headPath;
@property(nonatomic,assign)NSString *count;
@property(nonatomic,copy)NSString *fdata;

@property(nonatomic,copy)NSString *cid;

@end
