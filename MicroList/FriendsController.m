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
#import "AppDef.h"

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

    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    param[@"cid"] = _cid;
    
    [data POSTData:FriendDetails_URL and:param and:^(id dic) {
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求好友列表成功");
            
            NSMutableArray *dict = dic[@"data"];
            
//            FriendListModel *model = [[FriendListModel alloc]init];
            
            for (NSDictionary *di in dict) {
                
                self.nickName = di[@"nickName"];
                self.headPath = di[@"headPath"];
                self.area = di[@"area"];
//                self.sex = di[@"sex"];
                self.signature = di[@"signature"];
            }
            
            
            NSLog(@"dict:%@",dict);
            
            
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，好友列表请求失败"];
            
        }
        
        
    }];
    


}



//他的晒榜和我的推荐
- (void)_creatSubView{

    /*
    [_btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_btn4 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn5 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn6 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn7 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn8 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    [_btn9 addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
    */
    
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
//    判断是否已登录，如果登录直接跳转
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *uid = [userDefaults objectForKey:HXKey];
    
    if (![[EaseMob sharedInstance].chatManager isLoggedIn]) {
        
        [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:uid password:UserPassword];
        
    };
    
    ChatViewController * chat = [[ChatViewController alloc]initWithChatter:UserId isGroup:NO];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:chat];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
    
}
@end
