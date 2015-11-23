//
//  CommentTableViewController.h
//  MicroList
//
//  Created by sks on 15/11/4.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NowShowDataModel;

@interface CommentTableViewController : UITableViewController

@property(nonatomic,copy)NSString *sid;

@property (nonatomic, strong)NowShowDataModel *commentNowData;


@end
