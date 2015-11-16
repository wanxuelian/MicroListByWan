//
//  ChatViewController.h
//  MicroList
//
//  Created by Mac on 15/11/6.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol chatWithUserControllerDelegate <NSObject>

@optional
-(void)markTheMes;

@end


@interface ChatViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *inputView;

@property (weak, nonatomic) IBOutlet UITextField *textFile;


@property (nonatomic,copy)NSString * userName;

@property (nonatomic,assign) id<chatWithUserControllerDelegate> delegate;
@end
