//
//  LikeStyleTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "LikeStyleTableViewCell.h"

@implementation LikeStyleTableViewCell
//喜好
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ) {
        int x = 0;
        NSArray *array = @[@"美食", @"运动", @"电影", @"活动", @"平台"];
        
        UILabel *likeStyleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 40, 35)];
        likeStyleLabel.text = @"喜好:";
        likeStyleLabel.backgroundColor = [UIColor redColor];
        [self addSubview:likeStyleLabel];
        for (int i ; i < 5; i++) {
            
            UILabel *likeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(likeStyleLabel.frame) + 5 + x, 20, 34, 20)];
            likeLabel.text = array[i];
            x = x + 40;
            likeLabel.backgroundColor = [UIColor yellowColor];
            [self addSubview:likeLabel];
            
        }

    }
    
    return self;
}

@end
