//
//  FirstCell.m
//  MicroList
//
//  Created by Mac on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FirstCell.h"
#import "SelectModel.h"
#import "UIImageView+WebCache.h"

@implementation FirstCell



- (void)setModel:(SelectModel *)model{
    
    if (_model != model) {
        
        _model = model;
        
        _user.text = _model.nickName;
        
        NSString *img = _model.myPhoto;
        NSURL *url = [NSURL URLWithString:img];
        [_userPhoto sd_setImageWithURL:url];
        
        
    }
    
}




- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
