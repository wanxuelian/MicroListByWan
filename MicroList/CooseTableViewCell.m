//
//  CooseTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CooseTableViewCell.h"

@implementation CooseTableViewCell
//我的推荐
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
        UILabel *choseLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, rect.size.width * 1 /5, rect.size.height * 1 / 4)];
        choseLabel.text = @"我的推荐";
        [self addSubview:choseLabel];
    
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(choseLabel.frame) + (rect.size.width * 1 / 5 + 20) *i, 5, rect.size.width * 1 / 5, rect.size.width * 1 / 5)];
            imageView.image = [UIImage imageNamed:@"1"];
            [self addSubview:imageView];
            
            UIImageView *thiredImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(choseLabel.frame) + (rect.size.width * 1 / 5 + 20) *i, CGRectGetMaxY(imageView.frame), rect.size.width * 1 / 5, rect.size.width * 1 / 5)];
            
            thiredImage.image = [UIImage imageNamed:@"1"];

            [self addSubview:thiredImage];
            
            
        }
        
      
        
        
        
        
    }
    return self;
}


@end
