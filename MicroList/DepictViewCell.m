//
//  DepictViewCell.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "DepictViewCell.h"

@implementation DepictViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UILabel *introLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 35)];
        introLabel.text = @"请填写描述:";
        [self addSubview:introLabel];
        
        
        self.shopDesc = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(introLabel.frame), rect.size.width, 100)];
        self.shopDesc.backgroundColor = [UIColor colorWithRed:0.622 green:1.000 blue:0.989 alpha:1.000];
//        shopDesc.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.shopDesc.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.shopDesc];
        
    }
    return self;
}

@end
