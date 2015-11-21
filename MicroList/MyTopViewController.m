//
//  MyTopViewController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MyTopViewController.h"
#import "MyproCell.h"
#import "FirstCell.h"
#import "ChooseViewController.h"
#import "LoginViewController.h"
#import "SelectModel.h"
#import "UIImageView+WebCache.h"
#import "BaseJsonData.h"
#import "SelectViewViewController.h"
#import "AFNetworking.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface MyTopViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSDictionary * setDic;
@property(nonatomic, strong) NSDictionary * diction;

@property(nonatomic,copy) NSString *nickName;
@property(nonatomic,copy)NSMutableArray * array;
@end

@implementation MyTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    //获取UserDefault
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    if (key != nil) {
        
//        LoginViewController *login = [[LoginViewController alloc]init];
//        
//        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:login];
//        [self presentViewController:selectedController animated:YES completion:nil];
        
        //请求网络数据
        [self getData];

        
    }else {
    
        LoginViewController *login = [[LoginViewController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:login];
        [self presentViewController:selectedController animated:YES completion:nil];
        
        
        
    
    
    }

    
    
    
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:nil tag:406];
 
    
    
    //加载数据
    _setDic = @{@"one"    : @[@""],
                @"two"    : @[@"设置"],
                @"three"  : @[@"收藏"],
                @"four"   : @[@"榜友特权",@"黄金会员"],
                @"five"   : @[@"联系微博"],
                @"six"    : @[@"关于微博"]
                };
    
    [self _creatTableView];
    
    
   /*
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(notificationAction:) name:@"notification" object:nil];
    */
    
    
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *headPath = [userDefault objectForKey:@"headPath"];
    NSString *image = [NSString stringWithFormat:@"http://%@/%@",kLoginServer,headPath];
    NSLog(@"头像：%@",image);
    
    NSURL *url = [NSURL URLWithString:image];
//    [self.headPath sd_setImageWithURL:url];
    
    FirstCell *cell = [[FirstCell alloc]init];
    [cell.userPhoto sd_setImageWithURL:url];
    
    
 
    
    
}
/*
//- (void)notificationAction:(NSNotification *)notification{
//
//    NSLog(@"notification: %@",notification);
//    
//    NSDictionary *dic = [notification userInfo];
//    NSString *str = [dic valueForKey:@"uid"];
//    NSString *userphone = [dic valueForKey:@"username"];
//
//    self.uid = str;
//    self.userphone = userphone;
//}

*/

//请求网络数据
- (void)getData{
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
 
    //获取UserDefault
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSString *name = [userDefault objectForKey:@"username"];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
//    NSString *key = @"qcl901028";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = key;
    params[@"type"] = @"2";
    
    
    NSString *url = [NSString stringWithFormat:@"http://%@/user/dataEdit/",kLoginServer];
    
    
    //请求用户名
    [data POSTData:url and:params and:^(id dict) {
        
        NSString *code = dict[@"code"];
        
        if ([code isEqualToString:@"1"]) {
            
            NSArray *array = dict[@"data"];
            
            for (NSDictionary *data in array) {
                
                //            SelectModel *model = [[SelectModel alloc]init];
                //            model.username = dic[@"data"][@"nickName"];
                //            [_array addObject:model];
                
                _nickName = data[@"nickName"];
                
                
            }
            
        }
        
    }];
    /*
    //上传头像
    [data POSTData:@"http://api.360.ren/user/headUp" and:params and:^(id dict) {
        
        for (NSDictionary *dic in dict) {
            
            SelectModel *model = [[SelectModel alloc]init];
            model.myPhoto = dic[@"data"][@"headPath"];
            [_array addObject:model];
            
            NSString *code = dic[@"data"][@"code"];
            if ([code isEqualToString:@"1" ]) {
                
                [self AlertView:@"上传成功"];
               
                
            }else if ([code isEqualToString:@"2" ]){
                
                [self AlertView:@"密钥错误"];
                
                
            }else if ([code isEqualToString:@"3" ]){
                
                
                [self AlertView:@"文件格式错误"];
                
            }
            
           
        }
        
    }];
    
*/
 }
/*
- (void)getPhotoData{

    NSString *urlstaring = @"http://dev-hello-baby.com/api/upload";
    
    UIImage *asset = [UIImage imageNamed:@"loginBackImage"];
    NSData *data1 = UIImageJPEGRepresentation(asset, 0.2);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//这个有时必须设置
    AFHTTPRequestOperation *operation = [manager POST:urlstaring parameters:nil
  constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                
      for (int i = 0; i<6; i++) {
          
           [formData appendPartWithFileData:data1 name:[NSString stringWithFormat:@"sfile[%d]",i] fileName:@"sfile" mimeType:@"multipart/form-data"];
       }
      
   } success:^(AFHTTPRequestOperation *operation,id responseObject) {
       
//       NSLog(@"aaaaaaaa%@",responseObject);
       
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                
//      NSLog(@"%@",error);
   }];
    
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten,long long totalBytesWritten,long long totalBytesExpectedToWrite) {
        NSLog(@"bytesWritten=%ld, totalBytesWritten=%lld, totalBytesExpectedToWrite=%lld", bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
        
    }];
    
}

*/



//加载表视图
- (void)_creatTableView{
    CGRect rect = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, rect.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
   

}


#pragma mark -- UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 5;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
        
    }else if (section == 1){
    
        return 2;
        
    }else if (section == 2){
    
        return 1;
    }else if (section == 3){
    
        return 2;
    }
    
    
    return 1;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *str = @"mycell";
    
    MyproCell *cell = [tableView dequeueReusableCellWithIdentifier:str ];
    
//    SelectModel *selectModel = [[SelectModel alloc]init];
    
    
    if (cell == nil) {
        cell = [[MyproCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.backgroundColor = [UIColor yellowColor];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
       
        FirstCell *cell = [tableView dequeueReusableCellWithIdentifier:str ];
        if (cell == nil) {
        
            cell = [[[NSBundle mainBundle]loadNibNamed:@"FirstCell" owner:self options:nil]lastObject];
            
        
        }
        
//        NSString * str = selectModel.myPhoto;
//        NSURL *url = [NSURL URLWithString:str];
//    
//        [cell.imageView sd_setImageWithURL:url];
//        
//        
//        cell.user.text = selectModel.username;
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *headPath = [userDefault objectForKey:@"headPath"];
        NSString *nickName = [userDefault objectForKey: @"nickName"];
        
        NSLog(@"nickName:%@",nickName);
        
        if (cell.userPhoto != nil) {
            
            NSString *image = [NSString stringWithFormat:@"http://%@%@",kLoginServer,headPath];
            NSLog(@"image:%@",image);
            NSURL *url = [NSURL URLWithString:image];
            [cell.userPhoto sd_setImageWithURL:url];
            
        }
        cell.user.text = nickName;
        

        
//        cell.model = _array[indexPath.row];
//        cell.user.text = _nickName;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor yellowColor];
        cell.selectionStyle = NO;
        return cell;
    }
    
        
        
    if (indexPath.section == 1) {
        
        cell.imgView.backgroundColor = [UIColor redColor];
        
        if (indexPath.row == 0) {
            
            cell.titleLable.text = @"设置";
        }else{
        
            cell.titleLable.text = @"收藏";
        }
        
    }if (indexPath.section == 2) {
        
        cell.imgView.backgroundColor = [UIColor redColor];
        cell.titleLable.text = @"榜友特权";
        cell.detailLable.text = @"暂无";
        
    }if (indexPath.section == 3) {
        
        cell.imgView.backgroundColor = [UIColor redColor];
        
        if (indexPath.row == 0) {
            
            cell.titleLable.text = @"联系微榜";
            
        }else{
            cell.titleLable.text = @"关于微榜";
        }
        
    }if (indexPath.section == 4) {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        cell.titleLable.text = @"退出登录";

    }
    
    return cell;

}




#pragma mark -- UITableView Dalegate



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

  return 6;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (indexPath.row == 0 & indexPath.section == 0) {
        return 90;
    }
    
    return 40;
    


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section == 0) {
        
        SelectViewViewController *select = [[SelectViewViewController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:select];
        
        [self presentViewController:selectedController animated:YES completion:nil];
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
    
        
        ChooseViewController *select = [[ChooseViewController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:select];
        
        [self presentViewController:selectedController animated:YES completion:^{
            
        }];
    
    
    }else if (indexPath.section == 4){
        /*
        [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES];
    
        [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES completion:^(NSDictionary *info, EMError *error) {
            
            
//            NSLog(@"退出失败 error：",&error);
            
            if (!error && info) {
                NSLog(@"退出成功");
                
                LoginViewController *select = [[LoginViewController alloc]init];
                
                UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:select];
                [self presentViewController:selectedController animated:YES completion:nil];
                
                
            }
        } onQueue:nil];
    
    
    }
*/
        [self outLogin];
        
    }

}

//退出登录
- (void)outLogin{
    
     //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     //移除UserDefaults中存储的用户信息
    [userDefaults removeObjectForKey:@"username"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults removeObjectForKey:@"uid"];
    [userDefaults synchronize];
    
    LoginViewController *login = [[LoginViewController alloc]init];
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:login];
    [self presentViewController:selectedController animated:YES completion:nil];
    
    

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
