//
//  FirstCell.h
//  MicroList
//
//  Created by Mac on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectModel;
@interface FirstCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *user;

@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;


@property(nonatomic,strong)SelectModel *model;

@end
