//
//  BuildTableViewCell.h
//  MicroList
//
//  Created by 黄相杰 on 15/10/21.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuildTableViewCell : UITableViewCell

@property (nonatomic, retain)NSArray *classLabelArray;

@property (nonatomic, retain)UILabel *labelClass;

@property (nonatomic, assign)NSInteger cellCount;

@end
