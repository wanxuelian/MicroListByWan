//
//  FoodScrollView.m
//  MicroList
//
//  Created by sks on 15/11/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FoodScrollView.h"
#import "FoodTranslateCon.h"

#define button1Width (rect.size.width - 4 * 20) / 4



@implementation FoodScrollView




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
        
        
        
        CGRect rect = [[UIScreen mainScreen] bounds];
        
        self.classLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 100, 35)];
        self.classLabel.text = @"分类";
        [self addSubview:self.classLabel];
        
        self.allButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.allButton.frame = CGRectMake(rect.size.width - 100, 0, 100, 35);
        [self.allButton setTitle:@"全部" forState:UIControlStateNormal];
        [self addSubview:self.allButton];
        
        
        
        self.scrollNameButton = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.classLabel.frame), self.frame.size.width, 100)];
        self.scrollNameButton.contentSize = CGSizeMake(self.frame.size.width * 2, 100);
        [self addSubview:self.scrollNameButton];
        
//        for (int i = 0; i < 8; i++) {
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.frame = CGRectMake(i * (button1Width +20) + 15, 0 , button1Width, button1Width);
//            [button setBackgroundColor:[UIColor colorWithRed:0.752 green:1.000 blue:0.964 alpha:1.000]];
//            button.tag = 301 + 0;//设置tag值
//            [button addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
//            [self.scrollNameButton addSubview:button];
//            
//            UILabel *foodNamela = [[UILabel alloc] initWithFrame:CGRectMake(i * (button1Width +20) + 15, CGRectGetMaxY(button.frame), button1Width, 35)];
//            
//            foodNamela.text = self.array[i];
//            [self.scrollNameButton addSubview:foodNamela];
//            
//            
//        }

    }
    
    return self;
}
-(void)setArray:(NSArray *)array {
    NSLog(@"setarray%@",array);
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
            for (int i = 0; i < 8; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(i * (button1Width +20) + 15, 0 , button1Width, button1Width);
                [button setBackgroundColor:[UIColor colorWithRed:0.752 green:1.000 blue:0.964 alpha:1.000]];
                button.tag = 301 + 0;//设置tag值
                [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"fire%d",i]] forState:UIControlStateNormal];//改掉这段代码为一步解析图片代码
                [button addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.scrollNameButton addSubview:button];
    
                UILabel *foodNamela = [[UILabel alloc] initWithFrame:CGRectMake(i * (button1Width +20) + 15, CGRectGetMaxY(button.frame), button1Width, 35)];
    
                foodNamela.text = array[i];
                [self.scrollNameButton addSubview:foodNamela];
    
                
            }
}



//设置代理进行跳转
- (void)checkAction:(UIButton *)sender {
    NSLog(@"点击了%ld",(long)sender.tag);
    if ([_delegate respondsToSelector:@selector(choseTerm:)]) {
//        sender.tag = self.tag;
        [_delegate choseTerm:sender];
    }
}





@end
