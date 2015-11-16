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
    UITableView *tableGroup = [[UITableView alloc] initWithFrame:CGRectMake(0,0, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    tableGroup.delegate = self;
    tableGroup.dataSource = self;
    [self.view addSubview:tableGroup];
    
    
    UIButton *rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBut setTitle:@"添加好友" forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"添加好友" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonAction:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    

    
    
    
    [self getData2];
    
    
    
}

- (void)rightButtonAction:(UIButton *)button{
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"创建群组" message:@"输入群组账号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
}



//好友列表请求
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
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupNewsViewController *groupNewContr = [[GroupNewsViewController alloc] init];
    [self.navigationController pushViewController:groupNewContr animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopCoilTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TopCoilTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return @"为你推荐";
    
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
