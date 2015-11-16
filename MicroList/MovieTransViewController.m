//
//  MovieTransViewController.m
//  MicroList
//
//  Created by sks on 15/10/31.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MovieTransViewController.h"
#import "IndexView.h"
#import "MovieTableViewCell.h"
#import "ListAlertCell.h"
#import "DymnaicCell.h"

@interface MovieTransViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

static NSString *cellIdentifier = @"moviewTableViewCell";

static NSString *cellIdentifierList = @"listAlertMovie";

static NSString *cellIdentifierDymna = @"DymnaicCell";

@implementation MovieTransViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"电影详细页";
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    IndexView *indexView = [[IndexView alloc] initWithFrame:CGRectMake(0, 64, rect.size.width, 45)];
    [self.view addSubview:indexView];
    
    UITableView *movieTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indexView.frame), rect.size.width, rect.size.height - 50 - 64)];
    movieTable.dataSource = self;
    movieTable.delegate = self;
    [self.view addSubview:movieTable];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backMovieMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MovieTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[MovieTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            
        }
        cell.selectionStyle = NO;
        return cell;
    }else if (indexPath.row == 1) {
        ListAlertCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifierList];
        if (cell == nil) {
            cell = [[ListAlertCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierList];
            
        }
        cell.selectionStyle = NO;
        [cell.modifyB addTarget:self action:@selector(popAlartView) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else {
        
        DymnaicCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifierDymna];
        if (cell == nil) {
            cell = [[DymnaicCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierDymna];
            
        }
        cell.selectionStyle = NO;
        return cell;
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 230;
    }else if (indexPath.row == 1) {
        return 130;
    }else {
        return 400;
        
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)backMovieMainController {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


- (void)popAlartView {
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"打榜语" message:nil preferredStyle:UIAlertControllerStyleAlert];
    

    [alertCon addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入";
    }];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    
    [alertCon addAction:cancel];
    [alertCon addAction:confirm];
    
    
    [self presentViewController:alertCon animated:YES completion:^{
        
    }];

    
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"打榜语" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    
////    [self presentViewController:alert animated:YES completion:nil];
//    [alert show];
}

@end
