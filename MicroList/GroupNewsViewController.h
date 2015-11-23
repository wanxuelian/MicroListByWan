//
//  GroupNewsViewController.h
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupListModel.h"
@interface GroupNewsViewController : UIViewController

@property (nonatomic,strong) GroupListModel *group;


-(GroupNewsViewController *) initWithGroupModel:(GroupListModel *) group;

-(GroupNewsViewController *) initWithGroupId:(NSString *) groupId;
@end
