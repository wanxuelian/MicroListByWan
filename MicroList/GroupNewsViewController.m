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
#import "AppDef.h"
@interface GroupNewsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataSource;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic ) GroupDetailType groupDetailType;

@end

@implementation GroupNewsViewController

-(GroupNewsViewController *)initWithGroupModel:(GroupListModel *)group
{
    self = [super init];
    if (self != nil) {
        _group = group;
        _groupDetailType = GroupDetailByMyList;
    }
    return self;
}

-(GroupNewsViewController *)initWithGroupId:(NSString *)groupId
{
    self = [super init];
    if (self != nil) {

        [self getGroupDetailById:groupId];
        _groupDetailType = GroupDetailBySearch;
    }
    return self;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
//    UITableView *messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    
    _dataSource = [NSMutableArray array];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    
 }



//群资料查看
- (void)getGroupDetailById:(NSString *) groupId{
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[KEY] = key;
    param[@"gid"] = groupId;
    
    
    [data POSTData:GroupDetails_URL and:param and:^(id dic) {
        
        NSLog(@"群组列表：%@",dic);
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求群组成功");
            
            NSMutableArray *dict = dic[@"data"];
            

            _group = [[GroupListModel alloc]init];
            
            for (NSDictionary *di in dict) {
                _group.nickName = di[@"uName"];
                _group.headPath = di[@"headPath"];
                _group.gid = groupId;
                _group.groupName = di[@"groupName"];
                _group.gType = di[@"gType"];
                _group.groupNote = di[@"groupNote"];
                

            }
            
         
            [_tableView reloadData];
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
        
        
        NSString *urlStr = [NSString stringWithFormat:@"http://%@/%@",kLoginServer,_group.headPath];
        NSURL *url = [NSURL URLWithString:urlStr];
        [cell.headPath sd_setImageWithURL:url];
        
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
        
        cell.nickName.text = _group.nickName;
        
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
    //如果是通过搜索显示的群资料，则底部按钮为申请入群
    if (_groupDetailType == GroupDetailBySearch) {
        [chatButton setTitle:@"确定加入" forState:UIControlStateNormal];
        [chatButton addTarget:self action:@selector(applyForAdmission) forControlEvents:UIControlEventTouchUpInside];
    }
    //如果是通过我的列表进入群资料，则底部为发送群消息
    if (_groupDetailType == GroupDetailByMyList) {
        [chatButton setTitle:@"发送消息" forState:UIControlStateNormal];
        [chatButton addTarget:self action:@selector(goToGroupChat:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    [View addSubview:chatButton];
    
    return View;

}

-(void) applyForAdmission
{
    BaseJsonData * data = [[BaseJsonData alloc]init];
    
    NSString *key = [userDefault objectForKey:@"key"];
    
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    param[@"gid"] = _group.gid;

    
    [data POSTData:JoinGroup_URL and:param and:^(id dic) {
        
        NSLog(@"加群的返回：%@",dic);
        
        NSString *code = dic[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            
            NSLog(@"请求入群成功");
            [BaseAlertView AlertView:@"发送入群请求成功！"];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else if ([code isEqualToString:@"2"]){
            
            [BaseAlertView AlertView:@"网络错误，请求入群失败"];
            
        }
        
        
    }];
}


/**
 *  点击发送消息聊天方法
 *
 *  @param button
 */
- (void)goToGroupChat:(UIButton *)button{
    
    if ([[EaseMob sharedInstance].chatManager isLoggedIn]) {
        
        ChatViewController *chatController = [[ChatViewController alloc] initWithChatter:[NSString stringWithFormat:@"%@",_group.hid] isGroup:YES];
        chatController.title = _group.nickName;
        [self.navigationController pushViewController:chatController animated:YES];
        
    }
 
    

    
    
    
}




@end
