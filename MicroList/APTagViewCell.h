//
//  APTagViewCell.h
//  HiPhotoSample
//
//  Created by JerryChui on 5/30/15.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APTagViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *) tableView;


@property (nonatomic, copy) NSString *imgID;


@end
