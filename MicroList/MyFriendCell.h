//
//  MyFriendCell.h
//  MicroList
//
//  Created by Mac on 15/10/30.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendListModel;
@interface MyFriendCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headPath;

@property (weak, nonatomic) IBOutlet UILabel *nikeName;

@property (weak, nonatomic) IBOutlet UILabel *count;


@property (nonatomic,strong)FriendListModel *model;

@end
