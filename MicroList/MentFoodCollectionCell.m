//
//  MentFoodCollectionCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/16.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MentFoodCollectionCell.h"

@implementation MentFoodCollectionCell



-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    //食品分类
        
//        CGRect rect = [[UIScreen mainScreen] bounds];
        self.foodB = [UIButton buttonWithType:UIButtonTypeSystem];

        self.foodB.frame = CGRectMake(0, 0, 60, 25);
        self.foodB.backgroundColor = [UIColor colorWithRed:0.579 green:0.997 blue:1.000 alpha:1.000];
        [self addSubview:self.foodB];
        

        
    }
    return self;
}


//-(void)setFoodName:(NSString *)foodName {
//    if (_foodName != foodName) {
//        [_foodName release];
//        _foodName = [foodName retain];
//    }
//    [self.foodB setTitle:foodName forState:UIControlStateNormal];
//    
//}



@end
