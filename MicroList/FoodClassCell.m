//
//  FoodClassCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/16.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FoodClassCell.h"

@implementation FoodClassCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.foodClassB setBackgroundImage:[UIImage imageNamed:@"pictImage1"] forState:UIControlStateNormal];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    
    
    // Configure the view for the selected state
}


@end
