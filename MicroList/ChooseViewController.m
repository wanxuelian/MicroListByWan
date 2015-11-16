//
//  ChooseViewController.m
//  MicroList
//
//  Created by Mac on 15/10/27.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ChooseViewController.h"
#import "MyproCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface ChooseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    NSArray * array1;
    NSArray * array2;
    NSArray * array3;
    
    
}

@end

@implementation ChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.title = @"设置";
    
    //加载数据
    [self _loadData];
    
    //加载表视图
    [self _creatTableView];

    
    
    
}

//加载数据
- (void)_loadData{

    array1 = @[@"图片设置",@"消息提醒设置",@"清除缓存"];
    array2 = @[@"意见反馈",@"关于我们",@"诊断网络" ];
    array3 = @[@"邀请送红包"];
    



}


//加载表视图
- (void)_creatTableView{
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    
    self.navigationItem.leftBarButtonItem = barItem;
   
    
    
}


#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}




#pragma mark -- UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 3;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 3;
        
    }else if (section == 1){
        
        return 3;
        
    }
    
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"mycell";
    MyproCell *cell = [tableView dequeueReusableCellWithIdentifier:str ];
    if (cell == nil) {
        cell = [[MyproCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.backgroundColor = [UIColor yellowColor];
        cell.selectionStyle = NO;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }
    cell.selectionStyle = NO;
    cell.titleLable.backgroundColor = [UIColor clearColor];
    cell.detailLable.backgroundColor = [UIColor yellowColor];
    
    if (indexPath.section == 0  ) {
        cell.selectionStyle = NO;
        cell.titleLable.text = array1[indexPath.row];
        
    }else if (indexPath.section == 1){
        cell.selectionStyle = NO;
        cell.titleLable.text = array2[indexPath.row];
    
    }else if (indexPath.section == 2){
        cell.selectionStyle = NO;
        cell.titleLable.text = array3[indexPath.row];
        
    }
    
        cell.selectionStyle = NO;
    
    return cell;
    
}


#pragma mark -- UITableView Dalegate



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 6;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0 & indexPath.section == 0) {
        return 60;
    }
    
    return 40;
    
    
    
}




@end
