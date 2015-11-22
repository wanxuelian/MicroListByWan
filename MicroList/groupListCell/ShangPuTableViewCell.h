//
//  ShangPuTableViewCell.h
//  MyDemos
//
//  Created by Michael on 15-11-9.
//  Copyright (c) 2015年 liguilong. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ShangPuFrame.h"

@interface ShangPuTableViewCell : UITableViewCell


@property (nonatomic,strong) ShangPuFrame *shangPuFrame;





 + (ShangPuTableViewCell*)cellWithTableView:(UITableView *)tableView;
@end
