//
//  TableHeaderView.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/19.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//




#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians)*(180.0/M_PI))


#import "TableHeaderView.h"
//#import "DropDownListView.h"

@interface TableHeaderView()

@property (nonatomic, retain)NSMutableArray *chooseArray;


@end
@implementation TableHeaderView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.userInteractionEnabled = YES;
        
        
        self.rect = [[UIScreen mainScreen] bounds];
        UIButton *gongTopB = [UIButton buttonWithType:UIButtonTypeSystem];
        gongTopB.frame = CGRectMake(5, 0, (self.rect.size.width - 14) / 3, 35);
        [gongTopB setTitle:@"红榜" forState:UIControlStateNormal];
        [self addSubview:gongTopB];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(gongTopB.frame.size.width + 5, 0, 2, 35)];
        line.backgroundColor = [UIColor yellowColor];
        [self addSubview:line];
        
        
        UIButton *roastB = [UIButton buttonWithType:UIButtonTypeSystem];
        roastB.frame = CGRectMake(CGRectGetMinX(line.frame) + 10, 0, (self.rect.size.width - 14) / 3, 35);
        [roastB setTitle:@"吐槽榜" forState:UIControlStateNormal];
        [self addSubview:roastB];
        
        UILabel *lineSend = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(roastB.frame), 0, 2, 35)];
        lineSend.backgroundColor = [UIColor yellowColor];
        [self addSubview:lineSend];
      
        
        
 
    }
      return self;
}

@end
