//
//  BuildTableViewCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/21.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BuildTableViewCell.h"

@implementation BuildTableViewCell

static int a = 0;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setClassLabelArray:(NSArray *)classLabelArray {
    if (_classLabelArray != classLabelArray) {
        _classLabelArray = classLabelArray;
        
    }
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
//趣玩的分类下的黄色
        self.labelClass = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 25)];
        self.labelClass.font = [UIFont boldSystemFontOfSize:20];
        NSLog(@"%@",self.labelClass.text);
//        self.labelClass.backgroundColor = [UIColor redColor];
        [self addSubview:self.labelClass];
        
        
        
        //测试使用5；非测试使用self.classLabelArray.count
//         int x = 0;
        NSLog(@"classLabelArray%@",self.classLabelArray);
        NSArray *subArrayClass = @[@[@"家电", @"厨具", @"卫浴", @"餐具", @"装饰"], @[@"穿戴", @"装备", @"器械", @"运动", @"周边"], @[@"口腔", @"头发", @"身体", @"保健", @"母婴"], @[@"智能", @"掌设", @"手机", @"网络", @"配件"], @[@"模型", @"创意", @"收藏", @"乐器", @"萌物"], @[@"笔", @"本子", @"背包", @"桌面", @"工具"], @[@"耳机", @"音箱", @"电视", @"投影", @"盒子"], @[@"代步", @"旅行", @"户外", @"电源", @"背包"], @[@"相机", @"镜头", @"配件", @"无人机", @"摄影机"] ];
        for (int i  = 0; i < 5; i++) {
            
            
            UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake( 10 + (55 + 5) * i , CGRectGetMaxY(self.labelClass.frame) + 2, 55, 20)];
            subLabel.text = subArrayClass[a][i];
//            x = x + 40;
            subLabel.textColor = [UIColor colorWithWhite:0.000 alpha:0.530];
            [self addSubview:subLabel];
            
        }
        a++;
        
        UIImageView *imageblock = [[UIImageView alloc] initWithFrame:CGRectMake(rect.size.width * 5 / 6, 10, 50, 50)];
        imageblock.backgroundColor = [UIColor yellowColor];
        [self addSubview:imageblock];
        
          }
    return self;
}



@end
