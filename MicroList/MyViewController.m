//
//  MyViewController.m
//  MicroList
//
//  Created by sks on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MyViewController.h"
#import "AvatarTableViewCell.h"
#import "PresentTableViewCell.h"
#import "LikeStyleTableViewCell.h"
#import "MyBaskTableViewCell.h"
#import "CooseTableViewCell.h"

@interface MyViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

static NSString *cellAvatarIdentifier = @"cellAvatarTableCell";

static NSString *cellPresentIdentifier = @"presentTableCell";

static NSString *cellLikeStyleIdentifier = @"LikeStyleTableViewCell";

static NSString *cellMyBaskIdentifier = @"MyBaskTableViewCell";

static NSString *cellCooseIdentifier = @"CooseTableViewCell";

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //个人页面
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backMyViewMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backMyViewMainController {
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5 ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        AvatarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellAvatarIdentifier];
        if (cell == nil) {
            cell = [[AvatarTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellAvatarIdentifier];
            
        }
//        cell.selectionStyle = NO;
        return cell;
    }else if (indexPath.row == 1) {
        PresentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellPresentIdentifier];
        if (cell == nil) {
            cell = [[PresentTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellPresentIdentifier];
        }
//        cell.selectionStyle = NO;
        return cell;
    }else if (indexPath.row == 2) {
        LikeStyleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellLikeStyleIdentifier ];
        if (cell == nil) {
            cell = [[LikeStyleTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellLikeStyleIdentifier];
        }
//        cell.selectionStyle = NO;
        return cell;
    }else if (indexPath.row == 3) {
        MyBaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMyBaskIdentifier];
        if (cell == nil) {
            cell = [[MyBaskTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:cellMyBaskIdentifier];
        }
//        cell.selectionStyle = NO;
        return cell;
        
    }else {
        CooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellCooseIdentifier];
        if (cell == nil) {
            cell = [[CooseTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:cellCooseIdentifier];
            
        }
//        cell.selectionStyle = NO;
        return cell;
        
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return  110;
    }else if (indexPath.row == 1) {
        return 100;
    }else if (indexPath.row == 2) {
        return 45;
    }else if (indexPath.row == 3) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        return rect.size.width * 1 / 5 + 5;
    }else {
        return 160;
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

@end
