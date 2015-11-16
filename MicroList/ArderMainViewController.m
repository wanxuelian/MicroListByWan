//
//  ArderMainViewController.m
//  MicroList
//
//  Created by sks on 15/10/27.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ArderMainViewController.h"
#import "ArderPortViewController.h"

@interface ArderMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign)CGRect rect;

@property (nonatomic, retain)NSArray *arderArray;

@property (nonatomic, retain)NSArray *rowClassArray;

@end

@implementation ArderMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rect = [[UIScreen mainScreen] bounds];
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backArderMainController)];
    self.navigationItem.leftBarButtonItem = backItem;

    
    
    UITableView *arderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.rect.size.width, self.rect.size.height)];
    arderTableView.delegate = self;
    arderTableView.dataSource = self;
//    arderTableView.backgroundColor = [UIColor colorWithRed:1.000 green:0.702 blue:0.070 alpha:1.000];
    arderTableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:arderTableView];
    
    
    self.arderArray = @[@"养生", @"休闲", @"娱乐", @"文化/展览",@"户外"];
    
    
    self.rowClassArray = @[@[@"足疗按摩", @"洗浴"] ,@[@"电影院",@"酒吧",@"咖啡厅", @"茶馆",@"密室"] ,@[@"KTV",@"桌面游戏", @"桌球馆", @"游乐游艺",@"DIY手工坊"] ,@[@"博物馆", @"艺术展览", @"图书馆", @"创意园区", @"文化艺术"], @[@"公园"]];

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)backArderMainController {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ArderPortViewController *arderConA = [[ArderPortViewController alloc] init];
    UINavigationController *arderNa = [[UINavigationController alloc] initWithRootViewController:arderConA];
    arderNa.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:arderNa animated:YES completion:^{
        
    }];
    
}




#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 5;
    }else if (section == 2) {
        return 5;
    }else if (section == 3) {
        return 5;
    }else {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%ld", self.arderArray.count);
    return self.arderArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"arderCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"arderCell"];
    }
    cell.selectionStyle = NO;
    NSLog(@"%ld  %ld", indexPath.section,indexPath.row );
    cell.textLabel.text = self.rowClassArray[indexPath.section][indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.arderArray[section];
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
