//
//  PresentTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "PresentTableViewCell.h"

@implementation PresentTableViewCell
//介绍
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style  reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UILabel *present = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, rect.size.width, 40)];
        present.text = @"食品";
        
        present.backgroundColor = [UIColor redColor];
        [self addSubview:present];

        
    }
    return self;
    
}


@end
