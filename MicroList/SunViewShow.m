//
//  SunViewShow.m
//  MicroList
//
//  Created by sks on 15/11/12.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "SunViewShow.h"

@implementation SunViewShow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        CGRect rect = [[UIScreen mainScreen] bounds];
       self.imageSun = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 150)];
//        self.imageSun.alpha = 0.5;
        self.imageSun.image = [UIImage imageNamed:@"picture12"];
        [self addSubview:self.imageSun];
        
        
        self.buttonAvatat = [UIButton buttonWithType:UIButtonTypeSystem];
        self.buttonAvatat.frame = CGRectMake(rect.size.width * 3 /4 , 55, rect.size.width * 1 /4 ,  rect.size.width * 1 /4 );
//        self.buttonAvatat.alpha = 0.7;//透明度
        [self.imageSun addSubview:self.buttonAvatat];
        
    }
    return self;
}


@end
