//
//  LoginViewController.h
//  MicroList
//
//  Created by Mac on 15/11/3.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *userName;

@property (retain, nonatomic) IBOutlet UITextField *passWord;
@property (retain, nonatomic) IBOutlet UIButton *registerButton;
@property (retain, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginIn:(UIButton *)sender;
- (IBAction)registerIn:(UIButton *)sender;





@end
