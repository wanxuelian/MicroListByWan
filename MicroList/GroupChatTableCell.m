//
//  GroupChatTableCell.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "GroupChatTableCell.h"
#import "GroupViewController.h"
@implementation GroupChatTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeSystem];
        chatButton.frame = CGRectMake(0, 0, rect.size.width, 40);
        chatButton.backgroundColor = [UIColor colorWithRed:0.874 green:0.857 blue:0.876 alpha:1.000];
        [chatButton setTitle:@"发送消息" forState:UIControlStateNormal];
        [self addSubview:chatButton];
        
    }
    return self;
}

@end
