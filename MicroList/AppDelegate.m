//
//  AppDelegate.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/14.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "EaseMob.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setNav];
    
    
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"microlist#microlist" apnsCertName:@"Test"];
    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    
//    LoginViewController *loginVC = [[LoginViewController alloc]init];
//    self.window.rootViewController = loginVC;
    
    
    RootViewController *rootVC = [[RootViewController alloc] init];
    UINavigationController *rootNa = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = rootNa;
    

    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    
}

// App进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

// App将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

// 申请处理时间
- (void)applicationWillTerminate:(UIApplication *)application {
    
    [[EaseMob sharedInstance] applicationWillTerminate:application];    
}


- (void)setNav

{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //设置显示的颜色
    
    bar.barTintColor = [UIColor colorWithRed:1.000 green:0.498 blue:0.043 alpha:1.000];
    
    //设置字体颜色
    
    bar.tintColor = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //或者用这个都行
    
    
    //    [bar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
    
    
}

@end
