//
//  ChattingViewController.m
//  MicroList
//
//  Created by Mac on 15/11/11.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ChattingViewController.h"
#import "ChatViewController.h"
#import "ChatingFriendCell.h"
#import "ChatingModel.h"
@interface ChattingViewController ()
{

    NSMutableArray *_listArr;
}
@end

@implementation ChattingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;
    
    [self getData];
    
    
}

- (void)getData{

//    [[EaseMob sharedInstance].chatManager asyncFetchBuddyListWithCompletion:^(NSArray *buddyList, EMError *error) {
//        if (!error) {
//            
//            
//            
//            for (ChatingModel * model in buddyList) {
//                
//                [_listArr addObject:model];
//                
//                NSLog(@"获取成功 -- %@",model.friendName);
//                
//            }
//            
//                     
//            
//        }
//    } onQueue:nil];
//    
    
    
    
}




#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentfire = @"topRingcell";
    ChatingFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfire];
    if (cell == nil) {
//        cell =  [[MyFriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentfire] ;
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ChatingFriendCell" owner:self options:nil]lastObject];
        
    }
    
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.backgroundColor = [UIColor redColor];
    cell.selectionStyle = NO;
    
//    ChatingModel *model = _listArr[indexPath.row];
    
//    cell.textLabel.text = model.friendName;
    
    
    
    return cell;
}




#pragma mark -- UITableView Dalegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return @"好友列表";
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //获得点中的会话对象.
//    EMConversation *conversation = [_listArr objectAtIndex:indexPath.row];
//    [conversation markAllMessagesAsRead:YES];
    
    ChatViewController *friend = [[ChatViewController alloc]init];
    
//    ChatingModel *model = _listArr[indexPath.row];
    
//    friend.userName = model.friendName;
    
//    NSString *title = conversation.chatter;//获得当前联系人的名字
//    if (conversation.conversationType != eConversationTypeChat) {
//        if ([[conversation.ext objectForKey:@"groupSubject"] length])
//        {
//            title = [conversation.ext objectForKey:@"groupSubject"];
//        }
//        else
//        {
//            NSArray *groupArray = [[EaseMob sharedInstance].chatManager groupList];
//            for (EMGroup *group in groupArray) {
//                if ([group.groupId isEqualToString:conversation.chatter]) {
//                    title = group.groupSubject;
//                    break;
//                }
//            }
//        }
//    }
    
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:friend];
    
 
    [self presentViewController:selectedController animated:YES completion:nil];
    
}


// 得到未读消息条数
- (NSInteger)unreadMessageCountByConversation:(EMConversation *)conversation
{
    NSInteger ret = 0;
    ret = conversation.unreadMessagesCount;
    
    return  ret;
}






@end
