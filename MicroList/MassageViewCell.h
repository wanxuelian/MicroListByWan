//
//  MassageViewCell.h
//  WeChat
//
//  Created by mac on 15-8-11.
//  Copyright (c) 2015年 wxhl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;
@interface MassageViewCell : UITableViewCell
@property(nonatomic,strong) MessageModel *model;
@end
