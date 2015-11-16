//
//  FigureViewController.m
//  MicroList
//
//  Created by sks on 15/10/25.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FigureViewController.h"
#import "IndexTableViewCell.h"
#import "IndexView.h"
#import "FigerAvaterTableViewCell.h"
#import "BaskTableViewCell.h"

@interface FigureViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UITableView *figureTable;

@end

@implementation FigureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [[UIScreen mainScreen] bounds];

    self.navigationItem.title = @"人物";
    IndexView *indexView = [[IndexView alloc ]initWithFrame:CGRectMake(0, 64, rect.size.width, 50)];
    [self.view addSubview:indexView];
    
    self.figureTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(indexView.frame), rect.size.width, rect.size.height - 50 - 64) style:UITableViewStylePlain];
    self.figureTable.delegate = self;
    self.figureTable.dataSource = self;
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFigureMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self.view addSubview:self.figureTable];
    
    
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

- (void)backFigureMainController {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self.figureTable registerNib:[UINib nibWithNibName:@"FigerAvaterTableViewCell" bundle:nil] forCellReuseIdentifier:@"FigerAvaterTableViewCell"];
        FigerAvaterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FigerAvaterTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        return cell;
    }else if(indexPath.row == 1) {
        static NSString *cellIdentifier = @"baskTableView";
        BaskTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[BaskTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            
        }
        cell.selectionStyle = NO;
        return cell;
    }else  {
        static NSString *cellIdentifier = @"baskTableViewFigue";
        BaskTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[BaskTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            
        }
        cell.selectionStyle = NO;
        cell.heBask.text = @"热门人物";
        return cell;
    }
    
    
    
    
    
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 218;
    }else{
        return 155;
    }
}

/*
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{//只刷新单行数据
    NSIndexPath *indexPath_1=[NSIndexPath indexPathForRow:1 inSection:0];
    NSArray *indexArray=[NSArray arrayWithObject:indexPath_1];
    [regTableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/
@end
