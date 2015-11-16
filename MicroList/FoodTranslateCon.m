//
//  FoodTranslateCon.m
//  MicroList
//
//  Created by sks on 15/10/27.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FoodTranslateCon.h"
#import "BotumView.h"
#import "IndexTableViewCell.h"
#import "ListAlertCell.h"
#import "DymnaicCell.h"


@interface FoodTranslateCon ()<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, assign)CGRect rect;

@end




@implementation FoodTranslateCon

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"食物";
    
    
    self.rect = [[UIScreen mainScreen] bounds];
    
    UITableView *topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.rect.size.width, self.rect.size.height - 60) style:UITableViewStylePlain];
    topTableView.dataSource = self;
    topTableView.delegate = self;
    
    [self.view addSubview:topTableView];
    
    BotumView *botm = [[BotumView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topTableView.frame), self.rect.size.width, 60)];
    [self.view addSubview:botm];
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFoodTransController)];
//    self.navigationItem.leftBarButtonItem = backItem;
//    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 220;
        
    }else if (indexPath.row == 1) {
        return 0;
    }else if (indexPath.row == 2){
        return 200;
    }else {
        return 400;
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *cellIdentifer = @"indexTableViewCell";
        IndexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (cell == nil) {
            cell = [[IndexTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];
        }
        cell.selectionStyle = NO;
        return cell;
    }else if(indexPath.row == 1){
        static NSString *cellIdentifier = @"tableViewCellTrans";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCellTrans"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = NO;
        return cell;
    }else if(indexPath.row == 2){
        ListAlertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listAlertCellTrans"];
        if (cell == nil) {
            cell = [[ListAlertCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"listAlertCellTrans"];
        }
        [cell.modifyB addTarget:self action:@selector(popAlartView) forControlEvents:UIControlEventTouchUpInside];
        
        cell.selectionStyle = NO;
        return cell;
    }else {
        DymnaicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodDymnaicCell"];
        if (cell == nil) {
            cell = [[DymnaicCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"foodDymnaicCell"];
            
        }
        cell.photoName.text = @"风铃";
        cell.selectionStyle = NO;
        [cell.topTabel setBackgroundImage:[UIImage imageNamed:@"girlAvater"] forState:UIControlStateNormal];
        return cell;
        
        
    }
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (void)backFoodTransController {
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
//}




@end