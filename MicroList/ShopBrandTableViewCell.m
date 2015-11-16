//
//  ShopBrandTableViewCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/24.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ShopBrandTableViewCell.h"

@implementation ShopBrandTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        CGRect rect = [[UIScreen mainScreen] bounds];

        UILabel *cheakBrand = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, rect.size.width * 1 / 4, 28)];
        cheakBrand.text = @"入驻品牌";
        cheakBrand.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:cheakBrand];
        
        
        
        UIScrollView *scrollImage = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cheakBrand.frame), rect.size.width, 100)];
        scrollImage.contentSize = CGSizeMake(rect.size.width * 2 , 40);
//        scrollImage.background®Color = [UIColor redColor];
        
        [self addSubview:scrollImage];

        for(int i = 0 ; i < 6; i++) {
            UIImageView *imageScroll = [[UIImageView alloc] initWithFrame:CGRectMake(5+ rect.size.width * 1 / 3 * i, 5, (rect.size.width - 20)* 1 / 3, 100)];
            imageScroll.image = [UIImage imageNamed:@"1"];
            [scrollImage addSubview:imageScroll];
            
           
        }
             
    }
    return self;
    
    
    
}

@end
