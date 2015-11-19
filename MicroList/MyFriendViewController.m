//
//  MyFriendViewController.m
//  MicroList
//
//  Created by Mac on 15/10/29.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MyFriendViewController.h"
#import "MyFriendCell.h"
#import "FriendsController.h"
#import "BaseJsonData.h"
#import "FriendListModel.h"
@interface MyFriendViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic,strong)UITextField *file;
@property(nonatomic,copy)NSMutableArray *array;
@property(nonatomic,copy)NSMutableArray *data;


@end

@implementation MyFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"好友";
    
    //是否有好友请求
    [self getData3];
    
    
    //获取好友列表
//    [self getData2];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;
    
    
    UIButton *rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBut setTitle:@"添加好友" forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"添加好友" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonAction:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;

    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    

    
}


#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)rightButtonAction:(UIButton *)button{
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加好友" message:@"输入好友账号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
   
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        _file = [alertView textFieldAtIndex:0];
        NSLog(@"%@",_file.text);

        
        //添加好友的网络请求
        [self getdData];
        
        
    }else if (buttonIndex == 1){
        
        NSLog(@"弹出失败");
    }
    //......
}




//添加好友的网络请求
- (void)getdData{
    
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
       
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    //请求添加好友
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = key;
    params[@"mobile"] = _file.text;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/userRelation/requestFriends",kLoginServer];
    
    //请求用户名
    [data POSTData:url and:params and:^(id dict) {
            
            NSString *code = dict[@"code"];
            if ([code isEqualToString:@"1" ]) {
                
                [self AlertView:@"请求已发出"];
                
                
            }else if ([code isEqualToString:@"2" ]){
                
                [self AlertView:@"此好友不存在"];
                
                
            }else if ([code isEqualToString:@"3" ]){
                
                
                [self AlertView:@"网络错误"];
                
            }
            
    }];
    

  

}

//好友列表请求
- (void)getData2{
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    
     NSString *url = [NSString stringWithFormat:@"http://%@/userRelation/friendList",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求好友列表成功");
            
            NSMutableDictionary *dict = dic[@"data"];
            
            FriendListModel *model = [[FriendListModel alloc]init];
            
            for (NSDictionary *di in dict) {
                
                model.nickName = di[@"nickName"];
                model.headPath = di[@"headPath"];
                model.count = di[@"count"];
//                model.fdata = di[@"fdata"];
                model.cid = di[@"cid"];
                [_data addObject:model];
            }
            
            
            NSLog(@"dict:%@",dict);
            
            
        }else if ([code isEqualToString:@"2"]){
            
            [self AlertView:@"网络错误，好友列表请求失败"];
            
        }
        
        
    }];
    

}

//接受好友的实时网络请求
- (void)getData3{

    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = key;
//    params[@"cid"] = _file.text;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/message/messageList",kLoginServer];
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//这个有时必须设置
   
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"******************************请求成功************************** ：%@",responseObject);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"*******************************请求失败*************************  error : %@", error);
        
    }];
    
    
//    [data POSTData:url and:params and:^(id dict) {
//        
//        NSLog(@"************************是否有好友请求：%@",dict);
//        
//        
//        
//        
//        NSString *code = dict[@"code"];
//        if ([code isEqualToString:@"1" ]) {
//            
//            [self AlertView:@"请求成功"];
//            
//            
//        }else if ([code isEqualToString:@"2" ]){
//            
//            [self AlertView:@"服务器错误"];
//            
//            
//        }
//        
//    }];
    

}

#pragma mark -- UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return  _data.count;
    
    return 20;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"mycell";
    
    MyFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:str ];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyFriendCell" owner:self options:nil]lastObject];
//        cell.backgroundColor = [UIColor yellowColor];
        cell.selectionStyle = NO;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }

    cell.model = _data[indexPath.row];
    
    return cell;


}


#pragma mark -- UITableView Dalegate



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 60;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;

    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{


    return @"好友列表";

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    FriendsController *friend = [[FriendsController alloc]init];
    
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:friend];
    
    [self presentViewController:selectedController animated:YES completion:nil];

    
    //拿到好友fdata 传到用户资料页面
    NSMutableArray *array = [NSMutableArray array];;
    for (FriendListModel *model in _data) {
        
//        NSString *fdata = model.fdata;
        
//        [array addObject:fdata];
        
    }
    
    
    
}


//弹出框
- (void)AlertView:(NSString *)text{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:text
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    alert = nil;
    
}



@end
