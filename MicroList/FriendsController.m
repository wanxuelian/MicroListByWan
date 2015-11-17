//
//  FriendsController.m
//  MicroList
//
//  Created by Mac on 15/10/31.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FriendsController.h"
#import "ShowFriendController.h"
#import "MygiveController.h"
#import "ChatViewController.h"
@interface FriendsController ()

@end

@implementation FriendsController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;
    
    //创建他的晒榜和我的推荐button
    [self _creatSubView];
    
    //加载网络数据
    
    
    
}

//加载网络数据
- (void)getData{




}



//他的晒榜和我的推荐
- (void)_creatSubView{

    
    [_btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_btn4 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn5 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn6 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn7 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn8 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn9 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _showScrollerView.contentSize = CGSizeMake(500, 82);
    _showScrollerView.showsHorizontalScrollIndicator = NO;
    _showScrollerView.showsVerticalScrollIndicator = NO;
    
    _myGiveScrollerView.contentSize = CGSizeMake(500, 82);
    _myGiveScrollerView.showsHorizontalScrollIndicator = NO;
    _myGiveScrollerView.showsVerticalScrollIndicator = NO;
    


}




#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//他的晒榜
- (void)buttonAction:(UIButton *)button{


    
    ShowFriendController *friend = [[ShowFriendController alloc]init];
    
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:friend];
    
    [self presentViewController:selectedController animated:YES completion:nil];
  
}

//我的推荐
- (void)butAct:(UIButton *)button{


    MygiveController *friend = [[MygiveController alloc]init];
    
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:friend];
    
    [self presentViewController:selectedController animated:YES completion:nil];
    
    
}



- (IBAction)chat:(UIButton *)sender {
    
    ChatViewController * chat = [[ChatViewController alloc]initWithChatter:@"18552123120" isGroup:NO];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:chat];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}
@end
