//
//  TopCoilTableViewCell.m
//  MicroList
//
//  Created by sks on 15/11/2.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopCoilTableViewCell.h"




@implementation TopCoilTableViewCell



- (void)awakeFromNib {

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        
        UIImageView *coilImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, rect.size.width * 1 / 5 + 20, rect.size.width * 1 / 5 + 20)];
        coilImageView.image = [UIImage imageNamed:@"1"];
        [self addSubview:coilImageView];
        
        
        UILabel *nameTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(coilImageView.frame), 5, rect.size.width * 1 / 4, 35)];
        nameTopLabel.text = @"名字";
        [self addSubview:nameTopLabel];
        
        UILabel *depict = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(coilImageView.frame), CGRectGetMaxY(nameTopLabel.frame) + 10, rect.size.width * 1 / 4, 35)];
        depict.text = @"山东省考出现在北京出现在看";
        [self addSubview:depict];
    }
    return self;
}


@end
