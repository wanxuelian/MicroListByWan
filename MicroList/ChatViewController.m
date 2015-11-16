//
//  ChatViewController.m
//  MicroList
//
//  Created by Mac on 15/11/6.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageModel.h"
#import "MassageViewCell.h"
@interface ChatViewController ()<UITextFieldDelegate>
{
    
    NSMutableArray *_data;
    NSMutableArray *_arrModel;
//    EMConversation *conversation ;
}
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _userName;
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;
    


    //1.加载数据
    [self _loadData];
    //2.布局子视图
    [self _coustomSubViews];
    
    //3.监听键盘弹起
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyBoard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _textFile.delegate = self;
    
    
    

//    [[EaseMob sharedInstance].chatManager removeDelegate:self];
//    //注册为SDK的ChatManager的delegate
//    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
//    [[EaseMob sharedInstance].callManager addDelegate:self delegateQueue:nil];
//    //最后一个为即时通讯的代理,(即时视频,即时语音)
//    
//    //开始新建会话/获取会话列表
//    conversation = [[EaseMob sharedInstance].chatManager conversationForChatter:_userName conversationType:eConversationTypeChat];
//    
    
    
    
    

}


#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}




- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //将tableview滚动到最后一个单元格
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_arrModel.count - 1 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    //注销键盘显示通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [super viewWillDisappear:animated];
}




#pragma mark - keyboard Notification

- (void)showKeyBoard:(NSNotification *)notification {
    
    
    NSValue *rectValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
    
    CGRect keyBoardFrame = [rectValue CGRectValue];//键盘的frame
    
    CGFloat height = keyBoardFrame.size.height;
    
    //
    [UIView animateWithDuration:0.2 animations:^{
        self.tableView.transform = CGAffineTransformMakeTranslation(0, -height);
        self.inputView.transform = CGAffineTransformMakeTranslation(0, -height);
    }];
    
    
}


#pragma mark - private Method

- (void)_loadData {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
    
    _data = [NSMutableArray arrayWithContentsOfFile:path];
    
    _arrModel = [NSMutableArray arrayWithCapacity:_data.count];
    
    for (NSDictionary *dic in _data) {
        MessageModel *model = [[MessageModel alloc] init];
        
        model.content = dic[@"content"];
        model.icon = dic[@"icon"];
        model.time = dic[@"time"];
        model.isSelf = [dic[@"self"] boolValue];
        
        [_arrModel addObject:model];
    }
}

- (void)_coustomSubViews {
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - dataSourse

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _arrModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"myCell";
    
    
    MassageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        cell = [[MassageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *bgView = [[UIView alloc] initWithFrame:cell.bounds];
        bgView.backgroundColor = [UIColor clearColor];
        cell.selectedBackgroundView = bgView;
    }
    
    cell.model = _arrModel[indexPath.row];
    
    return cell;
}

#pragma mark - tableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageModel *model = _arrModel[indexPath.row];
    
    UIFont *font = [UIFont systemFontOfSize:16];
    
    //设置分割方式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attrDic = @{
                              NSFontAttributeName : font,
                              
                              NSParagraphStyleAttributeName : paragraph
                              
                              };
    
    CGRect rect = [model.content boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
    
    
    return rect.size.height + 40;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1.键盘收起
    
    [self.view endEditing:YES];
    
    
    //2.还原frame
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tableView.transform = CGAffineTransformIdentity;
        self.inputView.transform = CGAffineTransformIdentity;
    }];
    
}

//启用编辑模式（删除或插入）
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //1.从数据中移除
        
        [_arrModel removeObjectAtIndex:indexPath.row];
        //2.刷新单元格
        [self.tableView reloadData];
    }else if (editingStyle == UITableViewCellEditingStyleInsert){
        
        //添加
        NSLog(@"插入一个单元格");
    }
    
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    //数据交换
    [_arrModel exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}



#pragma mark - TextFile delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    //1.取得文本中的内容
    
    NSString *content =  textField.text;
    
    
    if (content == nil || content.length <= 0) {
        NSLog(@"发送为空");
    }
    
    /*
    //2.创建model
    
    MessageModel *model = [[MessageModel alloc] init];
    model.content = content;
    model.time = @"";
    model.icon = @"icon01.jpg";
    model.isSelf = YES;
    
    //3.将模型加入到数组中
    
    [_arrModel addObject:model];
    */
    
    
    EMChatText *textChat = [[EMChatText alloc]initWithText:content];
    EMTextMessageBody *body = [[EMTextMessageBody alloc]initWithChatObject:textChat];
    
    //生成message
    EMMessage *message = [[EMMessage alloc]initWithReceiver:@"ddfddd" bodies:@[body]];
    message.messageType = eMessageTypeChat;
    
    EMError *error = nil;
    
    id <IChatManager> chatManager = [[EaseMob sharedInstance]chatManager];
    [chatManager sendMessage:message progress:nil error:&error];
    
    if (error) {
        
        UIAlertView * a = [[UIAlertView alloc] initWithTitle:@"error" message:@"发送失败" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [a show];
        
    }else {
        
        //2.创建model
        
        MessageModel *model = [[MessageModel alloc] init];
        model.content = content;
        model.time = @"";
        model.icon = @"icon01.jpg";
        model.isSelf = YES;
        
        //3.将模型加入到数组中
        
        [_arrModel addObject:model];
        
    }

    
    //4.刷新tableview
    
    [self.tableView reloadData];
    
    //5.文本中的内容清空
    
    textField.text = @"";
    
    
    //6.将tableview滚动到最后一个单元格
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_arrModel.count - 1 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    return YES;
    
}




- (void)didReceiveMessage:(EMMessage *)message{

    id<IEMMessageBody> msgBody = message.messageBodies.firstObject;
    switch (msgBody.messageBodyType) {
        case eMessageBodyType_Text:
        {
            // 收到的文字消息
            NSString *txt = ((EMTextMessageBody *)msgBody).text;
            NSLog(@"收到的文字是 txt -- %@",txt);
        }
            break;
        case eMessageBodyType_Image:
        {
            // 得到一个图片消息body
            EMImageMessageBody *body = ((EMImageMessageBody *)msgBody);
            NSLog(@"大图remote路径 -- %@"   ,body.remotePath);
            NSLog(@"大图local路径 -- %@"    ,body.localPath); // // 需要使用sdk提供的下载方法后才会存在
            NSLog(@"大图的secret -- %@"    ,body.secretKey);
            NSLog(@"大图的W -- %f ,大图的H -- %f",body.size.width,body.size.height);
            NSLog(@"大图的下载状态 -- %lu",body.attachmentDownloadStatus);
            
            
            // 缩略图sdk会自动下载
            NSLog(@"小图remote路径 -- %@"   ,body.thumbnailRemotePath);
            NSLog(@"小图local路径 -- %@"    ,body.thumbnailLocalPath);
            NSLog(@"小图的secret -- %@"    ,body.thumbnailSecretKey);
            NSLog(@"小图的W -- %f ,大图的H -- %f",body.thumbnailSize.width,body.thumbnailSize.height);
            NSLog(@"小图的下载状态 -- %lu",body.thumbnailDownloadStatus);
        }
            break;
        case eMessageBodyType_Location:
        {
            EMLocationMessageBody *body = (EMLocationMessageBody *)msgBody;
            NSLog(@"纬度-- %f",body.latitude);
            NSLog(@"经度-- %f",body.longitude);
            NSLog(@"地址-- %@",body.address);
        }
            break;
            
            
        default:
            break;
    }

}

@end
