//
//  TopCoilTableViewCell.m
//  MicroList
//
//  Created by sks on 15/11/2.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopCoilTableViewCell.h"

@interface TopCoilTableViewCell()

@property(nonatomic,weak)UIImageView *coilImageView;

@property(nonatomic,weak)UILabel *nameTopLabel;

@property(nonatomic,weak)UILabel *depict;



@end


@implementation TopCoilTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self _CreatsubView];
        
    }
    return self;
}


-(void)setGroupListModel:(GroupListModel *)groupListModel
{
    _groupListModel = groupListModel;
    
    NSString *url1 = _groupListModel.headPath;
    NSURL *url = [NSURL URLWithString:url1];
    
    [self.coilImageView sd_setImageWithURL:url];
    
    self.nameTopLabel.text = _groupListModel.groupName;
    _depict.text = _groupListModel.groupNote;
    
}


- (void)_CreatsubView{

    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat padding = 5.0f;
    
    
     UIImageView *imageview= [[UIImageView alloc] initWithFrame:CGRectMake(padding, padding, 100,100)];
    [self.contentView addSubview:imageview];
    self.coilImageView = imageview;
    
    
    
    
    
//    coilImageView.image = [UIImage imageNamed:@"1"];
    
    
    UILabel *nameTopLabelTemp = [[UILabel alloc] initWithFrame:CGRectMake(padding * 2 + imageview.frame.size.width, 5, rect.size.width * 1 / 4, 35)];
    [self.contentView addSubview:nameTopLabelTemp];
    self.nameTopLabel = nameTopLabelTemp;
    
    
    UILabel *depictTemp = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_coilImageView.frame), CGRectGetMaxY(nameTopLabelTemp.frame) + 10, rect.size.width * 1 / 4, 35)];
    [self.contentView addSubview:depictTemp];


    _depict = depictTemp;

}


@end
