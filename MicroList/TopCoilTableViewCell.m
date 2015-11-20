//
//  TopCoilTableViewCell.m
//  MicroList
//
//  Created by sks on 15/11/2.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopCoilTableViewCell.h"




@implementation TopCoilTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self _CreatsubView];
        
    }
    return self;
}



- (void)_CreatsubView{

    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIImageView *coilImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, rect.size.width * 1 / 5 + 20, rect.size.width * 1 / 5 + 20)];
    
    NSString *url1 = _groupListModel.headPath;
    NSURL *url = [NSURL URLWithString:url1];
    [coilImageView sd_setImageWithURL:url];
    
//    coilImageView.image = [UIImage imageNamed:@"1"];
    [self addSubview:coilImageView];
    
    
    UILabel *nameTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(coilImageView.frame), 5, rect.size.width * 1 / 4, 35)];
    nameTopLabel.text = _groupListModel.groupName;
    [self addSubview:nameTopLabel];
    
    UILabel *depict = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(coilImageView.frame), CGRectGetMaxY(nameTopLabel.frame) + 10, rect.size.width * 1 / 4, 35)];
    depict.text = _groupListModel.groupName;
//    [self addSubview:depict];



}


@end
