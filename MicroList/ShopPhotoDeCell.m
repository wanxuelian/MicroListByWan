//
//  TableViewCell.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ShopPhotoDeCell.h"

@implementation ShopPhotoDeCell

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
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 200, 45)];
        nameLabel.text = @"请选择要上传的图片:";
        [self addSubview:nameLabel];
        
        
        UIImageView *imageShops = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(nameLabel.frame), 70, 50)];
        imageShops.image = [UIImage imageNamed:@"1"];
        [self addSubview:imageShops];
        
        UIImageView *imageShopTwo = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageShops.frame), CGRectGetMaxY(nameLabel.frame), 70, 50)];
        imageShopTwo.backgroundColor = [UIColor colorWithRed:0.746 green:1.000 blue:0.967 alpha:1.000];
        [self addSubview:imageShopTwo];
        
        
  
    }
    return self;
}


@end
