//
//  DymnaicCell.h
//  MicroList
//
//  Created by 黄相杰 on 15/10/15.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NowShowDataModel;

@class APOpenTagView;

@interface DymnaicCell : UITableViewCell



@property (nonatomic, retain)UIButton *photoAvat;

@property (nonatomic, retain)UILabel *photoName;

@property (nonatomic, retain)UIButton *topTabel;

@property (nonatomic, strong)APOpenTagView *imageScenery;

@property (nonatomic, retain)UILabel *zambia;

@property (nonatomic, retain)UIButton *smallAvatar;

@property (nonatomic, retain)NSArray *avatArray;

@property (nonatomic, retain)UIButton *zamB;

@property (nonatomic, retain)UIButton *badB;


@property(nonatomic,strong)NowShowDataModel *modelNowShow;



@end
