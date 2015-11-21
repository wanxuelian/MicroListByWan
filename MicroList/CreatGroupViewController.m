//
//  CreatGroupViewController.m
//  MicroList
//
//  Created by Mac on 15/11/20.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CreatGroupViewController.h"

@interface CreatGroupViewController ()
{

    UITextField *groupName;
    UITextView *groupNote;
}
@end

@implementation CreatGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建视图
    [self _createSubView];
   
}

//创建视图
- (void)_createSubView{


    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 74, 100, 30)];
    
    label1.text = @"群组名:";
    [self.view addSubview:label1];
    
    groupName = [[UITextField alloc]initWithFrame:CGRectMake(124, 74, 200, 30)];
    groupName.backgroundColor = [UIColor lightGrayColor];
    [groupName becomeFirstResponder];
    [self.view addSubview:groupName];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 124, 100, 30)];
    label2.text = @"群描述:";
    [self.view addSubview:label2];
    
    groupNote = [[UITextView alloc]initWithFrame:CGRectMake(110, 124, 200, 50)];
    [groupNote becomeFirstResponder];
    groupNote.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:groupNote];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 500,300 , 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"确认创建" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}


//创建群组
- (void)creatEaseGroup{

    EMGroupStyleSetting *groupStyleSetting = [[EMGroupStyleSetting alloc] init];
    groupStyleSetting.groupMaxUsersCount = 500; // 创建500人的群，如果不设置，默认是200人。
    groupStyleSetting.groupStyle = eGroupStyle_PublicOpenJoin; // 创建不同类型的群组，这里需要才传入不同的类型
    [[EaseMob sharedInstance].chatManager asyncCreateGroupWithSubject:groupName.text
description:groupNote.text invitees:nil initialWelcomeMessage:@"邀请您加入群组"styleSetting:groupStyleSetting completion:^(EMGroup *group, EMError *error) {
    
    
        if(!error){
             NSLog(@"创建成功 -- %@",group);
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
        }
    
    } onQueue:nil];


}

- (void)createSelfGroup{

    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    param[@"groupName"] = groupName.text;
    param[@"groupNote"] = groupNote.text;
    param[@"gType"] = @"1";
    
    NSString *url = [NSString stringWithFormat:@"http://%@/group/list",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        
        NSLog(@"群组创建：%@",dic);
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"群组创建成功");
           
            
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，群组创建失败"];
            
        }
        
        
    }];
    




}



#pragma mark -- buttonAction
- (void)buttonAction:(UIButton *)button{
    
    //创建环信群组
    [self creatEaseGroup];
    
    //创建自己群组
    [self createSelfGroup];
}




- (void)asyncFetchGroupInfo:(NSString *)groupId{

    NSLog(@"群id为：%@",groupId);

}



@end
