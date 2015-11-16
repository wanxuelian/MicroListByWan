//
//  MygiveController.m
//  MicroList
//
//  Created by Mac on 15/11/2.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MygiveController.h"
#import "MygiveCell.h"
@interface MygiveController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MygiveController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem = barItem;
  
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    
    
    
}



#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



#pragma mark -- UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 10;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 2;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"mycell";
    
    MygiveCell *cell = [tableView dequeueReusableCellWithIdentifier:str ];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MygiveCell" owner:self options:nil]lastObject];
        cell.backgroundColor = [UIColor redColor];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
    
}


#pragma mark -- UITableView Dalegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)section{
    
    return 130;
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return @"好友...";
        
        
    }else if (section == 1){
    
        return @"哈哈";
    
    }
    
    
    
    return @"嘿嘿";
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}



@end
