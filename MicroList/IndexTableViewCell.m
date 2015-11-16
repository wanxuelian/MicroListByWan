//
//  IndexTableViewCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/23.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "IndexTableViewCell.h"

@implementation IndexTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    //微榜指数
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat a =arc4random()%(99 - 90) + 90;
        CGFloat b = 100;
        CGFloat c = a / b;
        
        CGRect rect = [[UIScreen mainScreen] bounds];
        
        UILabel *micrIndex = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, rect.size.width * 1 / 4 - 15, 20)];
        micrIndex.backgroundColor = [UIColor yellowColor];
        micrIndex.text = @"微榜指数:";
        [self addSubview:micrIndex];
        
        UILabel *blackLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(micrIndex.frame) + 15, 10, rect.size.width * 3 / 5, 20)];
//        blackLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.452 blue:0.150 alpha:1.000];
        blackLabel.backgroundColor  = [UIColor yellowColor];
        [self addSubview:blackLabel];
        
        
        
        UILabel *greenLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(micrIndex.frame) + 15, 10, blackLabel.frame.size.width * c, 20)];
        greenLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:greenLabel];
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(blackLabel.frame) + 20, 10, rect.size.width * 1 / 9, 20) ];
            numberLabel.text = [NSString stringWithFormat:@"%.2f",c * 100];
        numberLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:numberLabel];
        
        UIImageView *liftImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(micrIndex.frame) + 5, (rect.size.width - 25) / 2, 120)];
        liftImage.image = [UIImage imageNamed:@"1"];
        [self addSubview:liftImage];
        
        UIImageView *rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(liftImage.frame) + 5, CGRectGetMaxY(micrIndex.frame) + 5, (rect.size.width - 25) / 2, 120)];
        rightImage.image = [UIImage imageNamed:@"1"];
        [self addSubview:rightImage];
        
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(liftImage.frame) + 5, rect.size.width, 40) ];
        nameLabel.font = [UIFont boldSystemFontOfSize:22];
        nameLabel.text = @"名字";
        [self addSubview:nameLabel];
        
     
    }
    return self;
}

@end
