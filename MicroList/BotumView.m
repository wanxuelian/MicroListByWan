//
//  BotumView.m
//  MicroList
//
//  Created by sks on 15/10/25.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BotumView.h"

@implementation BotumView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];

        
        UIButton *recomB = [UIButton buttonWithType:UIButtonTypeCustom];
        recomB.frame = CGRectMake(rect.size.width * 1 / 2 - 27.5, 0, 55, 55);
        recomB.layer.cornerRadius = 27.5;
        recomB.backgroundColor = [UIColor blueColor];
        [recomB setTitle:@"推荐" forState:UIControlStateNormal];
        [self addSubview:recomB];
        
        
        UIButton *zamB = [UIButton buttonWithType:UIButtonTypeSystem];
        zamB.frame = CGRectMake(recomB.frame.origin.x - 40, 10, 40, 30);
        
        zamB.backgroundColor = [UIColor redColor];
        [self addSubview:zamB];
        
        
      
        
        
        
        UIButton *badB = [UIButton buttonWithType:UIButtonTypeSystem];
        badB.frame = CGRectMake(CGRectGetMaxX(recomB.frame), 10 , 40, 28);
        badB.backgroundColor = [UIColor blackColor];
        [self addSubview:badB];
    }
    return self;
}



@end
