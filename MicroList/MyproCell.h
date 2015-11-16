//
//  MyproCell.h
//  MicroList
//
//  Created by Mac on 15/10/27.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectModel.h"
@interface MyproCell : UITableViewCell

{

    UIImageView *_imgView;
    UILabel     *_titleLable;
    UILabel     *_detailLable;
    UIImageView *_personImg;

}

@property(nonatomic,strong,readonly)UIImageView *imgView;
@property(nonatomic,strong,readonly)UILabel     *titleLable;
@property(nonatomic,strong,readonly)UILabel     *detailLable;
@property(nonatomic,strong,readonly)UIImageView *personImg;

@property(nonatomic,strong)SelectModel *model;

@end
