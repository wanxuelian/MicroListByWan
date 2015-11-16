//
//  TopFriendViewController.m
//  MicroList
//
//  Created by sks on 15/11/3.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopFriendViewController.h"
#import "TopFriendTodayCell.h"

static NSString *cellIdentifier = @"topFriendCell";



@interface TopFriendViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TopFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *tableTopFriend = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    [self.view addSubview:tableTopFriend];
    
    tableTopFriend.delegate = self;
    tableTopFriend.dataSource = self;
    
 
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopFriendTodayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TopFriendTodayCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:cellIdentifier];
        
    }
    
    cell.selectionStyle = NO;
    return cell;
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
