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
#import "CreatGroupViewController.h"
#import "ShangPuTableViewCell.h"
#import "ShangPuFrame.h"

@interface GroupController ()<UITableViewDelegate, UITableViewDataSource>
{

    NSMutableArray *_data;
}
@property(nonatomic,copy)UITextField *file;

@end


static NSString *cellIdentifier = @"groupCellIdentifier";

@implementation GroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"群组");
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;

    CGRect rect = [[UIScreen mainScreen] bounds];
    _tableGroup = [[UITableView alloc] initWithFrame:CGRectMake(0,0, rect.size.width, rect.size.height) style:UITableViewStyleGrouped];
    _tableGroup.delegate = self;
    _tableGroup.dataSource = self;
    [self.view addSubview:_tableGroup];
    
    
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
    
    
    
    [self getData2];
    
    
    
}

- (void)rightButtonAction:(UIButton *)button{
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"群组选择" message:nil delegate:self cancelButtonTitle:@"加入群组" otherButtonTitles:@"新建群组" ,nil];
    
    alert.tag = 101;
    [alert show];
    
}

//加入群组
- (void)joinGroup{

    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"加入群组" message:@"输入群组账号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 102;
    [alert show];



}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        _file = [alertView textFieldAtIndex:0];
        NSLog(@"%@",_file.text);
        
        switch (alertView.tag) {
                
            case 101:
            {
                //加入群组
                [self joinGroup];

                break;
            }
            case 102:
                
            {
                //申请入群的网络请求
                [self getData3];
                
                
                break;
            }
                
            default:
                break;
        }

        
        
        
              
    }else if (buttonIndex == 1){
        
        switch (alertView.tag) {
                
            case 101:
            {
                //创建群组
                [self creatGroup];
                
                break;
            }
            case 102:
                
            {
               
                NSLog(@"取消加入群群组");
                break;
            }
                
            default:
                break;
        }

        
    }
    //......
}




//群组列表请求
- (void)getData2{
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/group/list",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        

        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            _data = [NSMutableArray array];
            NSLog(@"请求群组列表成功");
            
            NSMutableArray *dict = dic[@"data"];
            
            if (dict != nil) {
                
                
                for (NSDictionary *di in dict) {
                    GroupListModel *model = [[GroupListModel alloc]init];
                    model.nickName = di[@"nickName"];
                    model.headPath = di[@"headPath"];
                    model.gid = di[@"gid"];
                    model.groupName = di[@"groupName"];
                    model.hid = di[@"hid"];
                    
                    [_data addObject:model];
                }
                
            }
            
            [_tableGroup reloadData];
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，好友列表请求失败"];
            
        }
        
        
    }];
    
    
}

//申请入群的网络请求
- (void)getData3{

    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    param[@"gid"] = _file.text;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/group/addVerify",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        
        NSLog(@"加群的返回：%@",dic);
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求入群成功");
            
            
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，请求入群失败"];
            
        }
        
        
    }];


}


//创建群组
- (void)creatGroup{
    

    CreatGroupViewController *creatGroup = [[CreatGroupViewController alloc]init];
    [self.navigationController pushViewController:creatGroup animated:YES];
    


 
}



#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return  _data.count;
//    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ShangPuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ShangPuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    GroupListModel *model = [_data objectAtIndex:indexPath.row];
    
    ShangPuFrame *frame = [[ShangPuFrame alloc]init];
    frame.shangPu = model;
    cell.shangPuFrame = frame;
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GroupListModel *model = [_data objectAtIndex:indexPath.row];
    ShangPuFrame *shangPuFrame = [[ShangPuFrame alloc]init];
    
    shangPuFrame.shangPu = model;
    return shangPuFrame.cellHight;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GroupNewsViewController *groupNewContr = [[GroupNewsViewController alloc] initWithGroupModel:[_data objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:groupNewContr animated:YES];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    

    return @"我的群组";
    
}


- (void)buttonAction:(UIButton *)button{
    
//    CreateGroupViewController *creatGroup =[[CreateGroupViewController alloc]init];
//    [self.navigationController pushViewController:creatGroup animated:YES];
    
    GroupNewsViewController *news = [[GroupNewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];

}


@end
