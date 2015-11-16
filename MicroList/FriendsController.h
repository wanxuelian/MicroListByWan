//
//  FriendsController.h
//  MicroList
//
//  Created by Mac on 15/10/31.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *showView;
@property (retain, nonatomic) IBOutlet UIView *myGive;



@property (weak, nonatomic) IBOutlet UIScrollView *showScrollerView;

@property (weak, nonatomic) IBOutlet UIScrollView *myGiveScrollerView;



@property (retain, nonatomic) IBOutlet UIButton *btn1;
@property (retain, nonatomic) IBOutlet UIButton *btn2;
@property (retain, nonatomic) IBOutlet UIButton *btn3;


@property (retain, nonatomic) IBOutlet UIButton *btn4;
@property (retain, nonatomic) IBOutlet UIButton *btn5;
@property (retain, nonatomic) IBOutlet UIButton *btn6;
@property (retain, nonatomic) IBOutlet UIButton *btn7;
@property (retain, nonatomic) IBOutlet UIButton *btn8;
@property (retain, nonatomic) IBOutlet UIButton *btn9;

@property(nonatomic,copy)NSString *fdata;

- (IBAction)chat:(UIButton *)sender;


@end
