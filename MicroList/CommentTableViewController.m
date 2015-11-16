//
//  CommentTableViewController.m
//  MicroList
//
//  Created by sks on 15/11/4.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CommentTableViewController.h"
#import "CommentTransCell.h"
#import "CommentModel.h"
#import "CommentSingTon.h"
#import "CommentHeaderView.h"
#import "NowShowModel.h"

static NSString *cellIdentifier = @"DymnaicCellCom";

static NSString *cellIdentcom = @"commentCell";

@interface CommentTableViewController ()<UITextFieldDelegate>
{

    NSMutableArray *arr;
}
@property (nonatomic, strong)NSMutableArray *assrrays;

@property (nonatomic, strong)CommentModel *comModel;

@property (nonatomic, retain)NSString *comString;

@property (nonatomic, retain)UITextField *comMainField;

@property (nonatomic, retain)UIButton *comSendButton;

@end

@implementation CommentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CommentSingTon *comAssTon = [CommentSingTon sharedDataBaseCommentSingTon];

    [comAssTon addObserver:self forKeyPath:@"comArrayTon" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    CommentHeaderView *view = [[CommentHeaderView alloc] initWithFrame:CGRectMake(0, 0, 375, 400)];
    [view.commentB addTarget:self action:@selector(commentTextFieldMoview) forControlEvents:UIControlEventTouchUpInside];
   
    self.tableView.tableHeaderView = view;
    
    
}


//- (void)getData{
//
//    BaseJsonData *data = [[BaseJsonData alloc]init];
//    
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *key = [user objectForKey:@"key"];
//    
//    NSString *url = [NSString stringWithFormat:@"http://%@/friendShow/ShowList",kLoginServer];
//    
//    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
//    parmas[@"key"] = key;
//    
//    //请求晒榜列表
//    [data POSTData:url and:parmas and:^(id dict) {
//        
//        NSString *code = dict[@"code"];
//        if ([code isEqualToString:@"1"]) {
//            
//            [BaseAlertView AlertView:@"请求成功"];
//            
//        }else if ([code isEqualToString:@"2"]){
//            
//            [BaseAlertView AlertView:@"没有数据"];
//            
//        }else if ([code isEqualToString:@"3"]){
//            
//            [BaseAlertView AlertView:@"服务器请求错误"];
//        }
//        
//        
//        NSMutableArray *array = dict[@"data"];
//        
//        NowShowModel *model = [[NowShowModel alloc]init];
//        
//        arr = [NSMutableArray array];
//        
//        for (NSDictionary *dict in array) {
//            
//            model.likeNumber = dict[@"lickNumber"];
//            model.dislickNumber = dict[@"dislikeNumber"];
//            model.ImgPath = dict[@"ImgPath"];
//            model.sid = dict[@"sid"];
//            [arr addObject:model];
//            
//        }
//        
//    }];
//    
//    
//    
//
//}




-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    NSLog(@"%@", change);
    NSIndexSet *indexSet = change[@"indexes"];
    __block NSIndexPath *indexPath = nil;
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
    }];
    if ([change[@"kind"] integerValue] == 2) {
        CommentSingTon *comAssTon = [CommentSingTon sharedDataBaseCommentSingTon];
//        NSLog(@"数组是%ld",comAssTon.comArrayTon.count);
        
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:  comAssTon.comArrayTon.count - 1 inSection:0] ] withRowAnimation:UITableViewRowAnimationLeft];//可以做到刷新视图
        //        [self.tableView reloadInputViews];
        

    }
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CommentSingTon *comAssTon = [CommentSingTon sharedDataBaseCommentSingTon];
    NSLog(@"数组是%ld",comAssTon.comArrayTon.count);
    return   comAssTon.comArrayTon.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
/*
//    if (indexPath.row == 0) {
//        
//        CommentTransCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (cell == nil) {
//            cell = [[CommentTransCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//            
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell.commentB addTarget:self action:@selector(commentTextFieldMoview) forControlEvents:UIControlEventTouchUpInside];
//        CommentModel *commentArrayModel = [[CommentModel alloc] init];
//        
//        
//        
//        commentArrayModel.commentArray = [NSMutableArray arrayWithArray:self.assrrays];
//        
//        return cell;
//    }else {
    */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentcom];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentcom];
            
        }
    CommentSingTon *comAssTon = [CommentSingTon sharedDataBaseCommentSingTon];
    NSLog(@"ssssssssssssssssssssss%@",comAssTon.comArrayTon[indexPath.row ]);
    //如果从前边插入是在indexpath.row为0的哪一行,由观察的方法影响
    NSLog(@"%@",comAssTon.comArrayTon[indexPath.row ]);
        cell.textLabel.text = comAssTon.comArrayTon[indexPath.row ];
        cell.selectionStyle = NO;
    
        
    
        return cell;
    
    
    
}




#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
    

  
}



- (void)commentTextFieldMoview {
//    NSLog(@"%s", __FUNCTION__);
    //评论

        CGRect rect = [[UIScreen mainScreen] bounds];
        self.comMainField = [[UITextField alloc] initWithFrame:CGRectMake(0,  rect.size.height *17 / 18  - 64, rect.size.width * 3 / 4 , 35)];

        self.comMainField.backgroundColor = [UIColor whiteColor];
        self.comMainField.delegate = self;
        self.comMainField.layer.cornerRadius = 5.0;
//        self.comMainField.backgroundColor = [UIColor colorWithRed:0.674 green:1.000 blue:0.642 alpha:1.000];
        [self.view addSubview:self.comMainField];
    [self.comMainField becomeFirstResponder];
        [self.view reloadInputViews];

    

    
    self.comSendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.comSendButton.frame = CGRectMake(CGRectGetMaxX(self.comMainField.frame) + 10 , rect.size.height *17 / 18  - 64  , rect.size.width* 1 / 4  - 15, rect.size.height - rect.size.height *17 / 18 );
        self.comSendButton.layer.cornerRadius = 5.0;
        [self.comSendButton setTitle:@" 发送" forState:UIControlStateNormal];
        [self.comSendButton addTarget:self action:@selector(sendNewsOne) forControlEvents:UIControlEventTouchUpInside];
//        self.comSendButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.540 blue:0.113 alpha:1.000];
        [self.view addSubview:self.comSendButton];
        [self.view reloadInputViews];
}
- (void)sendNewsOne {
    //发送
//        self.comString = self.comMainField.text;

    [self.comMainField removeFromSuperview];
    [self.comSendButton removeFromSuperview];
}

//系统利用runtime动态给NSObject里边添加方法
- (void)insertObject:(id )object inStudentArrayAtIndex:(NSInteger)index {
    static  int i = 0;
//    NSLog(@"执行了%d",i);
    i++;
    CommentSingTon *comAssTon = [CommentSingTon sharedDataBaseCommentSingTon];
    [[comAssTon mutableArrayValueForKey:@"comArrayTon"] addObject:self.comString];
//    NSLog(@"单例1是%@",comAssTon.comArrayTon);
   
//    [comAssTon.comArrayTon insertObject:object atIndex:index];
//    NSLog(@"%@",self.comString);
//    NSLog(@"单例是%@",comAssTon.comArrayTon);
    //添加学生
}

#pragma mark - UITextFieldDelegate
-(void) textFieldDidEndEditing:(UITextField *)textField
{
 
    //获取输入的内容
    self.comString = [textField text];
    NSLog(@"输入的内容%@",self.comString);
    [self insertObject:self.comString inStudentArrayAtIndex:0];
}



//    dispatch_queue_t customQueue = dispatch_queue_create("com.keyboard.24", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(customQueue, ^{
//    });
//    dispatch_queue_t keyboardQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//        [self.comMainField becomeFirstResponder];//点击按钮直接弹出键盘



@end
