//
//  LastDymnaicController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/17.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "LastDymnaicController.h"
#import "DymnaicCell.h"
#import "CommentTableViewCell.h"

@interface LastDymnaicController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UITextField *commentField;

@property (nonatomic, retain)UIButton *sendButton;

@property (nonatomic, retain)UITableView *commentTableView;

@property (nonatomic, assign)CGRect rect;

@property (nonatomic, assign)CGFloat heightKey;

@property (nonatomic, retain)NSMutableArray *sendArray;

@end



static NSString *cellIdentifier = @"DymnaicCell";


@implementation LastDymnaicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rect = [[UIScreen mainScreen] bounds];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.navigationItem.title = @"详细页面";
    
    
    self.commentField = [[UITextField alloc] initWithFrame:CGRectMake(5, self.rect.size.height *17 / 18 , self.rect.size.width* 3 / 4, self.rect.size.height - self.rect.size.height *17 / 18)];
    
    self.commentField.backgroundColor = [UIColor whiteColor];
    self.commentField.delegate = self;
    self.commentField.layer.cornerRadius = 5.0;
    
    [self.view addSubview:self.commentField];
    
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
     
     
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillhideAction:) name:UIKeyboardWillHideNotification object:nil];
    
    // 可以将输入框和发送按钮设置到一个自定义view上
    
    self.sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
                       
    self.sendButton.frame = CGRectMake(self.rect.size.width* 3 / 4 + 10, self.rect.size.height *17 / 18 , self.rect.size.width* 1 / 4  - 15, self.rect.size.height - self.rect.size.height *17 / 18 );
    self.sendButton.layer.cornerRadius = 5.0;
    [self.sendButton setTitle:@" 发送" forState:UIControlStateNormal];
    [self.sendButton addTarget:self action:@selector(sendNews) forControlEvents:UIControlEventTouchUpInside];
    self.sendButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.sendButton];
    
    [self creatTableViewComment];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)creatTableViewComment {
    self.commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.rect.size.width, self.rect.size.height  * 17 / 18 - 70) style:UITableViewStylePlain];
    [self.view addSubview:self.commentTableView];
    self.commentTableView .backgroundColor = [UIColor yellowColor];
    self.commentTableView.delegate = self;
    self.commentTableView.dataSource = self;
    
}

- (void)notificationAction:(NSNotification *)notification {
    NSLog(@"123");
    self.commentField.text = notification.object;
}

- (void)keyboardWillChange:(NSNotification *)notification{
    //发生改变时通知的方法
    
    NSDictionary *keyboadDic = [notification userInfo];
    //拿到键盘的frame
    CGRect keyboarRect = [[keyboadDic valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    float keyboardHeigh = CGRectGetHeight(keyboarRect);
    float minkeyboardheight = CGRectGetHeight(self.view.frame) - keyboardHeigh;
    
    if (self.heightKey - minkeyboardheight > 0) {
        self.view.frame = CGRectMake(0, minkeyboardheight - self.heightKey, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }
    
}
- (void)keyboardWillhideAction:(NSNotification *)notification{
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
}
- (void)keyboardWillShow:(NSNotification *)notification{
    
    float height = 45;
    CGRect frame = self.view.frame;//获得视图的大小
    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);//获得屏幕的长和宽
    [UIView beginAnimations:@"Curl" context:nil];//动画开始
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self ];
    [self.view setFrame:frame];
    [UIView commitAnimations];
    
    
    
    
    
    
    
//    NSDictionary *keyboadDic = [notification userInfo];
//    //拿到键盘的frame
//    CGRect keyboarRect = [[keyboadDic valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    float keyboardHeigh = CGRectGetHeight(keyboarRect);
//    float minkeyboardheight = CGRectGetHeight(self.view.frame) - keyboardHeigh;
//    
//    if (self.heightKey - minkeyboardheight > 0) {
//        self.view.frame = CGRectMake(0, minkeyboardheight - self.heightKey, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
//    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 即时添加聊天信息
- (void)insertObject:(id )object inSendArrayAtIndex:(NSUInteger)index {
    [self.sendArray insertObject:object atIndex:index];
    
}
- (void)sendNews {
    NSString *delivery = self.commentField.text;
    [self insertObject:delivery inSendArrayAtIndex:self.sendArray.count];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSIndexSet *indextSet = change[@"indexes"];
    __block  NSIndexPath *indexPath = nil;

    [indextSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
    }];
    if ([change[@"kind"] integerValue] == 2) {
        [self.commentTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0] ] withRowAnimation:UITableViewRowAnimationLeft];//可以做到刷新视图
        
        
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //if (indexPath.row == 0) {
        DymnaicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
        if (cell == nil) {
            cell = [[DymnaicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
            
        }
       cell.selectionStyle = NO;
        return cell;
        
    //}//else {        //需要设置一个值，判断是别人的信息，还是自己的信息
//        [self.commentTableView registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"CommentTableViewCell"];
//        CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
//        
//        return cell;
        
  //  }
    
    
    // Configure the cell...
    
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    float textFieldHeight = CGRectGetMaxY(textField.frame);
    self.heightKey = textFieldHeight;
}
#pragma mark - UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
