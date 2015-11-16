//
//  RootViewController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "RootViewController.h"
#import "MainsViewController.h"
#import "TopRingViewController.h"
#import "PhotoViewController.h"
#import "RanKingTopController.h"
#import "MyTopViewController.h"
#import "LoginViewController.h"
#import "CameraHappyController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainsViewController *mainContr = [[MainsViewController alloc] init];
    mainContr.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:102] ;
    
    TopRingViewController *TopContr = [[TopRingViewController alloc] init];
    TopContr.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:103] ;
    
    PhotoViewController *photoContr = [[PhotoViewController alloc] init];
    photoContr.tabBarItem.image = [UIImage imageNamed:@"10-medical"];
    photoContr.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    RanKingTopController *RanContr = [[RanKingTopController alloc] init];
    RanContr.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:105] ;
    
    CameraHappyController *cameraHaContr = [[CameraHappyController alloc] init];
    cameraHaContr.tabBarItem.image = [UIImage imageNamed:@"10-medical"];
    cameraHaContr.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    MyTopViewController *MyTopContr = [[MyTopViewController alloc] init];
    MyTopContr.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:106] ;
     self.viewControllers = @[mainContr , TopContr, cameraHaContr , RanContr , MyTopContr];
    
   
    
    
    MyTopContr.navigationItem.title = @"个人中心";
    
 
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
