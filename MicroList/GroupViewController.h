//
//  GroupViewController.h
//  MicroList
//
//  Created by Mac on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet UITextField *text;

@end
