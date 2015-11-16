//
//  MyFriendCell.m
//  MicroList
//
//  Created by Mac on 15/10/30.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MyFriendCell.h"
#import "FriendListModel.h"
@implementation MyFriendCell

- (void)setModel:(FriendListModel *)model{

    if (_model != model) {
        
        _model = model;
        
    }
    
    //姓名
    _nikeName.text = model.nickName;
    _count.text = model.count;
    NSString *img = model.headPath;
    NSURL *url = [NSURL URLWithString:img];
    
    [_headPath sd_setImageWithURL:url];

}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
