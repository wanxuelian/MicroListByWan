//
//  ShopHouNameCell.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ShopHouNameCell.h"

@implementation ShopHouNameCell

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
        
        UILabel *shopNameL = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 80, 35)];
        shopNameL.text = @"商户名字:";
        [self addSubview:shopNameL];
        
        self.shopText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shopNameL.frame), 0, rect.size.width - 100, 35)];
        self.shopText.placeholder = @"请输入商户的名字";
        [self addSubview:self.shopText];
    }
    return self;
}


@end
