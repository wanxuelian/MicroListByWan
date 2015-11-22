//
//  GroupNewsViewController.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "GroupNewsViewController.h"
#import "GroupNumberTableViewCell.h"
#import "GroupMemberTableViewCell.h"
#import "GroupContrTableViewCell.h"
#import "GroupImageTableViewCell.h"
#import "GroupChatTableCell.h"
#import "GroupViewController.h"
#import "ChatViewController.h"
@interface GroupNewsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation GroupNewsViewController

-(GroupNewsViewController *)initWithGroupModel:(GroupListModel *)group
{
    self = [super init];
    if (self != nil) {
        _group = group;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
//    UITableView *messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    
    _dataSource = [NSMutableArray array];
    
    UITableView *messageTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    
    messageTable.delegate = self;
    messageTable.dataSource = self;
    [self.view addSubview:messageTable];
    
//    [self getData];
    
 }


//群资料查看
- (void)getData{
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    
    NSString *url = [NSString stringWithFormat:@"http://%@/group/list",kLoginServer];
    
    [data POSTData:url and:param and:^(id dic) {
        
        NSLog(@"群组列表：%@",dic);
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求群组成功");
            
            NSMutableArray *dict = dic[@"data"];
            

            _group = [[GroupListModel alloc]init];
            
            for (NSDictionary *di in dict) {
                _group.nickName = di[@"nickName"];
                _group.headPath = di[@"headPath"];
                _group.gid = di[@"gid"];
                _group.groupName = di[@"groupName"];
                _group.gType = di[@"gType"];
                _group.groupNote = di[@"groupNote"];

            }
            
         
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
    
    if (indexPath.row == 0) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupImageTableViewCell"];
        GroupImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupImageTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        
        
//        NSURL *url = [NSURL URLWithString:_group.headPath];
//        
//        [cell.headPath sd_setImageWithURL:url];
        
        return cell;
        
    }else if (indexPath.row == 1) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupNumberTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupNumberTableViewCell"];
        GroupNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupNumberTableViewCell" forIndexPath:indexPath];;
        cell.selectionStyle = NO;
        
        cell.groupid.text = [NSString stringWithFormat:@"%@",_group.gid];
        
        return cell;
        
    }else if(indexPath.row == 2) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupMemberTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupMemberTableViewCell"];
        GroupMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupMemberTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        
        cell.nickName.text = _group.groupName;
        
        return cell;
    }
    else
    {
        [tableView registerNib:[UINib nibWithNibName:@"GroupContrTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupContrTableViewCell"];
        GroupContrTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupContrTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        
        cell.groupNote.text = _group.groupName;
        
        return cell;
    }
    
    
    
}


#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 200;
    }else if (indexPath.row == 1) {
        return 50;
    }else if (indexPath.row == 2) {
        return 85;
    }else {
        return 85;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{


    return 85;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{


    UIView *View = [[UIView alloc]init];
    
    UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeSystem];
    chatButton.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    chatButton.backgroundColor = [UIColor colorWithRed:0.874 green:0.857 blue:0.876 alpha:1.000];
    [chatButton setTitle:@"发送消息" forState:UIControlStateNormal];
    [chatButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [View addSubview:chatButton];
    
    return View;

}


- (void)buttonAction:(UIButton *)button{
    
    if ([[EaseMob sharedInstance].chatManager isLoggedIn]) {
        
        ChatViewController *chatController = [[ChatViewController alloc] initWithChatter:[NSString stringWithFormat:@"%@",_group.hid] isGroup:YES];
        chatController.title = _group.nickName;
        [self.navigationController pushViewController:chatController animated:YES];
        
    }
 
    

    
    
    
}




@end
