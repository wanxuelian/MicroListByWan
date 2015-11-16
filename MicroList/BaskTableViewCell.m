//
//  BaskTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/26.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BaskTableViewCell.h"

@implementation BaskTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        self.heBask = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width * 1 / 3, 30)];
        self.heBask.text = @"他的晒榜";
        [self addSubview:self.heBask];
        
        UIButton *hotButton = [UIButton buttonWithType:UIButtonTypeSystem];
        if (rect.size.width == 375) {
              hotButton.frame = CGRectMake( CGRectGetMaxX(self.heBask.frame) + rect.size.width * 1 / 3, 0, rect.size.width * 1 / 6, 30);
        }else {
             hotButton.frame = CGRectMake( CGRectGetMaxX(self.heBask.frame) + rect.size.width * 1 / 5, 0, rect.size.width * 1 / 6, 30);
        }
        [hotButton setTitle:@"最新" forState:UIControlStateNormal];
        [self addSubview:hotButton];
        
        
        UIButton *indexButton = [UIButton buttonWithType:UIButtonTypeSystem];
        if (rect.size.width == 375) {
            indexButton.frame = CGRectMake( CGRectGetMaxX(hotButton.frame), 0, rect.size.width * 1 / 6, 30);
        }else {
            indexButton.frame = CGRectMake( CGRectGetMaxX(hotButton.frame), 0, rect.size.width * 2 / 6, 30);
        }
        [indexButton setTitle:@"指数最高" forState:UIControlStateNormal];
        [self addSubview:indexButton];
        
        
        
        for (int i = 0; i < 3; i++) {
            UIButton *baskOneB = [UIButton buttonWithType:UIButtonTypeSystem];
            baskOneB.frame = CGRectMake((47 + (rect.size.width - 30) * 1 / 4) * i + 5, 35 ,(rect.size.width - 30) * 1 / 4, (rect.size.width - 30) * 1 / 4 );
//            (rect.size.width - 30) * 1 / 4, (rect.size.width - 30) * 1 / 4
            baskOneB.backgroundColor = [UIColor redColor];
            [self addSubview:baskOneB];
        }
        
        
        
        for (int i  = 0; i < 3; i ++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((47 +(rect.size.width - 30) * 1 / 4)* i + 5, 40 + (rect.size.width - 30) * 1 / 4, (rect.size.width - 30) * 1 / 4,25)];
            label.text = @"saa";
            label.textAlignment = NSTextAlignmentCenter;
//            label.backgroundColor = [UIColor colorWithRed:0.403 green:1.000 blue:0.980 alpha:1.000];
            label.backgroundColor = [UIColor yellowColor];
            [self addSubview:label];
            
        }
        

    }
   
            return self;
}

@end
