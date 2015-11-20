//
//  CreatGroupViewController.m
//  MicroList
//
//  Created by Mac on 15/11/20.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CreatGroupViewController.h"

@interface CreatGroupViewController ()

@end

@implementation CreatGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建群组
    [self creatGroup];
    
}


//创建群组
- (void)creatGroup{

    EMGroupStyleSetting *groupStyleSetting = [[EMGroupStyleSetting alloc] init];
    groupStyleSetting.groupMaxUsersCount = 500; // 创建500人的群，如果不设置，默认是200人。
    groupStyleSetting.groupStyle = eGroupStyle_PublicOpenJoin; // 创建不同类型的群组，这里需要才传入不同的类型
    [[EaseMob sharedInstance].chatManager asyncCreateGroupWithSubject:@"群组名称"
description:@"群组描述"invitees:nil initialWelcomeMessage:@"邀请您加入群组"styleSetting:groupStyleSetting completion:^(EMGroup *group, EMError *error) {
    
    
        if(!error){
             NSLog(@"创建成功 -- %@",group);
        }
    
    } onQueue:nil];


}

- (void)asyncFetchGroupInfo:(NSString *)groupId{

    NSLog(@"群id为：%@",groupId);

}



@end
