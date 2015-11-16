//
//  PhotoTableViewCell.h
//  MicroList
//
//  Created by 黄相杰 on 15/10/15.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *carImage;
@property (weak, nonatomic) IBOutlet UIButton *allTop;

@end
