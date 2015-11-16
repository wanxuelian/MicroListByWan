//
//  CommitShopCell.m
//  MicroList
//
//  Created by sks on 15/11/9.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CommitShopCell.h"

@implementation CommitShopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.buttonCommit = [UIButton buttonWithType:UIButtonTypeSystem];
        CGRect rect = [[UIScreen mainScreen] bounds];
        self.buttonCommit.frame = CGRectMake(0, 0, rect.size.width, self.frame.size.height);

//        self.buttonCommit.center = self.center;
        [self.buttonCommit setTitle:@"提交" forState:UIControlStateNormal];

        
        [self addSubview:self.buttonCommit];
        
    }
    return self;
    
}

@end
