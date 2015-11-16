//
//  TopRingViewController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/14.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopRingViewController.h"
#import "NowShowController.h"
#import "GroupController.h"
#import "MyFriendViewController.h"
#import "ChattingViewController.h"
#import "BaseJsonData.h"
#import "BaseAlertView.h"
@interface TopRingViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)NSArray *topArray;

@end

@implementation TopRingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    
    self.topArray = @[@"正在晒",@"群组",@"我的好友",@"聊天"];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"榜圈" image:nil tag:307];
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *viewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 64, rect.size.width, 1)];
    [self.view addSubview:viewTop];
    
    UITableView *topRing = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(viewTop.frame), rect.size.width, rect.size.height) style:UITableViewStyleGrouped];
    topRing.delegate = self;
    topRing.dataSource = self;
    [self.view addSubview:topRing];
    
    
}


- (void)getData{

    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/userRelation/messageCount",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        
        NSString *numberCount = [                                                                                                                                               dic objectForKey:@"numberCount"];
        
        UITabBarItem * item=[self.tabBarController.tabBar.items objectAtIndex:1];
        item.badgeValue = numberCount;
        

        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求好友未读消息数量");
            
            
            
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，好友列表请求失败"];
            
        }
        
        
    }];


}







#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentfire = @"topRingcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfire];
    if (cell == nil) {
     cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentfire] ;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.backgroundColor = [UIColor redColor];
    cell.textLabel.text = self.topArray[indexPath.row];
    cell.selectionStyle = NO;
    return cell;
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        
        NowShowController *nowShow = [[NowShowController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:nowShow];
        
        [self presentViewController:selectedController animated:YES completion:nil];
       
    }else if (indexPath.row == 1){
    
        GroupController *select = [[GroupController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:select];
        
        [self presentViewController:selectedController animated:YES completion:nil];
    
    }else if (indexPath.row == 2){
        
        MyFriendViewController *select = [[MyFriendViewController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:select];
        
        [self presentViewController:selectedController animated:YES completion:nil];
        
    }else if (indexPath.row == 3){
        
        ChattingViewController *select = [[ChattingViewController alloc]init];
        
        UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:select];
        
        [self presentViewController:selectedController animated:YES completion:nil];
        
        
        
        
    }

    
}




//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    //设置区头
//    return  d;
//}


@end
