//
//  PhotoSelect.m
//  MicroList
//
//  Created by sks on 15/11/17.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "PhotoSelect.h"

@implementation PhotoSelect

#define tabBarHeight 49
#define buttonHight (rect.size.height - 64 - 49) * 1 / 4
#define buttonWidth rect.size.width * 1 / 3


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        self.imageTop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, buttonHight)];
        for (int i = 0; i < 10; i++) {
            self.imageTop.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
            }
        [self addSubview:self.imageTop];
        self.buttonSelect = [UIButton buttonWithType:UIButtonTypeSystem];
        self.buttonSelect.frame = CGRectMake(buttonWidth * 4 / 5 , 0, 25, 25);
        [self.buttonSelect setBackgroundImage:[UIImage imageNamed:@"icon_image_no@2x"] forState:UIControlStateNormal];
        [self addSubview:self.buttonSelect];
        
        
    }
    return self;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
