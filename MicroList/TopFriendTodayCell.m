//
//  TopFriendTodayCell.m
//  MicroList
//
//  Created by sks on 15/11/3.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopFriendTodayCell.h"

@implementation TopFriendTodayCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UIButton *avaterImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        avaterImageButton.frame = CGRectMake(5, 5, rect.size.width * 1 / 6, rect.size.width * 1 / 6);
    
        [avaterImageButton setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//        avaterImageButton.backgroundColor = [UIColor redColor];
        [self addSubview:avaterImageButton];
        
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avaterImageButton.frame), 5, rect.size.width * 4 / 5, 35)];
        nameLabel.text = @"名字";
        [self addSubview:nameLabel];
        
        UILabel *presentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avaterImageButton.frame), CGRectGetMaxY(nameLabel.frame), rect.size.width * 1 / 5, 35)];
        presentLabel.text = @"介绍";
        
        [self addSubview:presentLabel];
        
        
//        UIImageView *imagePubls = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(presentLabel.frame), rect.size.width * 1 / 6, rect.size.height * 1 / 6)];
//        imagePubls.image = [UIImage imageNamed:@"1"];
//        [self addSubview:imagePubls];
//        
        
    }
    return self;
    
}

@end
