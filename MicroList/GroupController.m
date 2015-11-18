//
//  GroupController.m
//  MicroList
//
//  Created by Mac on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "GroupController.h"
#import "TopCoilTableViewCell.h"
#import "GroupNewsViewController.h"
#import "GroupListModel.h"
#import "GroupListViewController.h"
#import "CreateGroupViewController.h"
@interface GroupController ()<UITableViewDelegate, UITableViewDataSource>
{

    NSMutableArray *_data;
}
@end


static NSString *cellIdentifier = @"groupCellIdentifier";

@implementation GroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"群组");
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;

//    UISearchBar *GroupBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, 375, 35)];
//    [self.view addSubview:GroupBar];

    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *tableGroup = [[UITableView alloc] initWithFrame:CGRectMake(0,0, rect.size.width, rect.size.height) style:UITableViewStyleGrouped];
    tableGroup.delegate = self;
    tableGroup.dataSource = self;
    [self.view addSubview:tableGroup];
    
    
    UIButton *rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBut setTitle:@"加入群组" forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"添加群组" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonAction:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
    UIView *view = [[UIView alloc]init];
    
    UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeSystem];
    chatButton.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    chatButton.backgroundColor = [UIColor colorWithRed:0.874 green:0.857 blue:0.876 alpha:1.000];
    [chatButton setTitle:@"新建群聊" forState:UIControlStateNormal];
    [chatButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:chatButton];
   
//    tableGroup.tableFooterView = view;
    
    
    
//    [self getData2];
    
    
    
}

- (void)rightButtonAction:(UIButton *)button{
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"加入群组" message:@"输入群组账号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
}



//群组列表请求
- (void)getData2{
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/userRelation/grouplist",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        
        NSLog(@"群组列表：%@",dic);
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求好友列表成功");
            
            NSMutableDictionary *dict = dic[@"data"];
            
            GroupListModel *model = [[GroupListModel alloc]init];
            
            for (NSDictionary *di in dict) {
                
                model.nickName = di[@"nickName"];
                model.headPath = di[@"headPath"];
                model.gid = di[@"gid"];
                model.groupName = di[@"groupName"];
                
                [_data addObject:model];
            }
            
            
            NSLog(@"dict:%@",dict);
            
            
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，好友列表请求失败"];
            
        }
        
        
    }];
    
    
}



#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
//    if (section ==0) {
//        return 2;
//    }else if (section == 2){
//    
//        return 1;
//    }
//    
//    return 3;
    
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopCoilTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TopCoilTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
   
 
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupNewsViewController *groupNewContr = [[GroupNewsViewController alloc] init];
    [self.navigationController pushViewController:groupNewContr animated:YES];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
//    if (section == 0) {
//        return @"为你推荐";
//    }
    return @"为你推荐";
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//
//    return 50.0f;
//}


//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//        return view;
//}

- (void)buttonAction:(UIButton *)button{
    
//    CreateGroupViewController *creatGroup =[[CreateGroupViewController alloc]init];
//    [self.navigationController pushViewController:creatGroup animated:YES];
    
    GroupNewsViewController *news = [[GroupNewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];

}


@end
