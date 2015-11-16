//
//  MyBaskTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MyBaskTableViewCell.h"
//晒榜
@implementation MyBaskTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UILabel *basklabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, rect.size.width * 1 / 5, 35)];
        basklabel.text = @"晒榜";
        [self addSubview:basklabel];
        
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(basklabel.frame) + i *(rect.size.width * 1 / 5 + 20), 0, rect.size.width * 1 /  5, rect.size.width * 1 / 5)];
            imageView.image = [UIImage imageNamed:@"1"];
            [self addSubview:imageView];
            
        }
        
    
    }
        return self;
    
}

@end
