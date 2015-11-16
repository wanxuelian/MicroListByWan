//
//  BuildTableViewCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/21.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BuildTableViewCell.h"

@implementation BuildTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)dealloc
{
    self.classLabelArray = nil;
  
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
//趣玩的分类下的黄色
        self.labelClass = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 25)];
        self.labelClass.font = [UIFont boldSystemFontOfSize:20];
//        self.labelClass.backgroundColor = [UIColor redColor];
        [self addSubview:self.labelClass];
        
        //测试使用5；非测试使用self.classLabelArray.count
//         int x = 0;
        
        for (int i  = 0; i < 5; i++) {
            
            
            UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + (34 + 5) * i , CGRectGetMaxY(self.labelClass.frame) + 2, 34, 20)];
            subLabel.text =self.classLabelArray[i];
//            x = x + 40;
            subLabel.backgroundColor = [UIColor yellowColor];
            [self addSubview:subLabel];
            
        }
        
        UIImageView *imageblock = [[UIImageView alloc] initWithFrame:CGRectMake(rect.size.width * 5 / 6, 10, 50, 50)];
        imageblock.backgroundColor = [UIColor yellowColor];
        [self addSubview:imageblock];
        
          }
    return self;
}



@end
