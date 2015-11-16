//
//  ListAlertCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/24.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ListAlertCell.h"

@implementation ListAlertCell



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
        UILabel *cellName = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, rect.size.width, 35)];
        cellName.text = @"打榜语";
        [self addSubview:cellName];

        
        UILabel *labelComment = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(cellName.frame), rect.size.width - 10, 40)];
        labelComment.backgroundColor = [UIColor greenColor];
        
//        labelComment.numberOfLines = 0;
        [self addSubview:labelComment];
        
        
        self.modifyB = [UIButton buttonWithType:UIButtonTypeSystem];
        self.modifyB.frame = CGRectMake(rect.size.width * 2 / 3, CGRectGetMaxY(labelComment.frame), 80, 37);
        [self.modifyB setTitle:@"我要修改" forState:UIControlStateNormal];
//        [self.modifyB addTarget:self action:@selector(popAlartView) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.modifyB];
        
        
        UIButton *zamB = [UIButton buttonWithType:UIButtonTypeSystem];
        zamB.frame = CGRectMake(10,  CGRectGetMaxY(labelComment.frame) + 5 , 40, 28);
        zamB.backgroundColor = [UIColor redColor];
        [self addSubview:zamB];
        
        
        UIButton *badB = [UIButton buttonWithType:UIButtonTypeSystem];
        badB.frame = CGRectMake(zamB.frame.size.width + 15, CGRectGetMaxY(labelComment.frame) + 5, 40, 28);
        badB.backgroundColor = [UIColor blackColor];
        [self addSubview:badB];
        
    }
    return self;
    
    
}




@end
