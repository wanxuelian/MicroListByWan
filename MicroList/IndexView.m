//
//  IndexView.m
//  MicroList
//
//  Created by sks on 15/10/25.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "IndexView.h"

@implementation IndexView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

}
*/





- (instancetype)initWithFrame:(CGRect)frame
{ //微榜指数控件
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat a =arc4random()%(99 - 90) + 90;
        CGFloat b = 100;
        CGFloat c = a / b;
        
        CGRect rect = [[UIScreen mainScreen] bounds];
        
        UILabel *micrIndex = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, rect.size.width * 1 / 4 - 15, 20)];
//        micrIndex.backgroundColor = [UIColor redColor];
        micrIndex.text = @"微榜指数:";
        [self addSubview:micrIndex];
        
        UILabel *blackLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(micrIndex.frame) + 15, 10, rect.size.width * 3 / 5, 20)];
//        blackLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.452 blue:0.150 alpha:1.000];
        blackLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:blackLabel];
        
        
        
        UILabel *greenLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(micrIndex.frame) + 15, 10, blackLabel.frame.size.width * c, 20)];
        greenLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:greenLabel];
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(blackLabel.frame) + 20, 10, rect.size.width * 1 / 9, 20) ];
        numberLabel.text = [NSString stringWithFormat:@"%.2f",c * 100];
        numberLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:numberLabel];

    }
    return self;
}


@end
