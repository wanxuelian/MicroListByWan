//
//  AvatarTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "AvatarTableViewCell.h"

@implementation AvatarTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//头像
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UIImageView *avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, rect.size.width * 1 / 4, rect.size.width * 1 / 4)];
        avatarImage.image = [UIImage imageNamed:@"1"];
        [self addSubview:avatarImage];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avatarImage.frame) + 5, 5, (rect.size.width - 20) * 2 / 3, 35)];
        nameLabel.text = @"用户名";
        nameLabel.backgroundColor = [UIColor redColor];
        [self addSubview:nameLabel];
        
        UILabel *ConcrnLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avatarImage.frame) + 5, CGRectGetMaxY(nameLabel.frame), (rect.size.width - 20) * 2 / 3, 35)];
        ConcrnLabel.text = @"关注数量";
        [self addSubview:ConcrnLabel];
        
        
        
    }
    return self;
}

@end
