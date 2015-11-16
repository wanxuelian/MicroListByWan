//
//  HotTopCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/15.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "HotTopCell.h"

@implementation HotTopCell

- (void)awakeFromNib {
    
    [self.fourTopFive setBackgroundImage:[UIImage imageNamed:@"picture2"] forState:UIControlStateNormal];
    [self.fourCellOneB setBackgroundImage:[UIImage imageNamed:@"picture3"] forState:UIControlStateNormal];
    [self.fourTopFourB setBackgroundImage:[UIImage imageNamed:@"picture4"] forState:UIControlStateNormal];
    [self.fourTopFriendB setBackgroundImage:[UIImage imageNamed:@"picture5"] forState:UIControlStateNormal];
    [self.fourTopThreeFriendB setBackgroundImage:[UIImage imageNamed:@"picture6"] forState:UIControlStateNormal];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
