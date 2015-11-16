//
//  TopCoilAllViewController.m
//  MicroList
//
//  Created by sks on 15/11/2.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopCoilAllViewController.h"
#import "TopCoilTableViewCell.h"

@interface TopCoilAllViewController ()<UITableViewDelegate, UITableViewDataSource>

@end


static NSString *cellIdentifier = @"TopCoilAllViewController";

@implementation TopCoilAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView * topCoil = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    topCoil.delegate = self;
    topCoil.dataSource = self;
    
    [self.view addSubview:topCoil];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect rect = [[UIScreen mainScreen] bounds];
    return rect.size.width * 1 / 4 + 20;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopCoilTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TopCoilTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    
    }
    cell.selectionStyle = NO;
    return cell;
}

@end
