//
//  ShopHouseController.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ShopHouseController.h"
#import "ShopHouNameCell.h"
#import "ShopPhotoDeCell.h"
#import "DepictViewCell.h"
#import "CommitShopCell.h"

@interface ShopHouseController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate>

@end

static NSString *cellShopHouNameCell = @"ShopHouNameCell";

static NSString *cellShopPhotoDeCell = @"ShopPhotoDeCell";

static NSString *cellDepictViewCell = @"DepictViewCell";

static NSString *cellLocation = @"cellLocation";

static NSString *cellCommitShopCell = @"CommitShopCell";

@implementation ShopHouseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.922 green:0.922 blue:0.949 alpha:1.000];
    //1.商户名字2.商户照片3.商户描述4.打榜语5.商户地点
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *shopDepictTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height ) style:UITableViewStyleGrouped];
    shopDepictTableView.tableFooterView = [[UIView alloc] init];
    shopDepictTableView.bounces = NO;
    shopDepictTableView.dataSource = self;
    shopDepictTableView.delegate = self;
    shopDepictTableView.clearsContextBeforeDrawing = YES;
    [self.view addSubview:shopDepictTableView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate 
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text
        isEqualToString:@"\n"])
        
    {
        
        [textView
         resignFirstResponder];
        return NO;
        
    }
    
    return YES;
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"就是他");
    [self resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"return");
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else {
        return 1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}// Default is 1 if not implemented


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld, %ld", indexPath.section, indexPath.row);
    if (indexPath.section == 0 && indexPath.row == 0) {
        ShopHouNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellShopHouNameCell];
        if (cell == nil) {
            cell = [[ShopHouNameCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellShopHouNameCell];
        }

        cell.shopText.delegate = self;
        return cell;
    }else if (indexPath.row == 1) {
        ShopPhotoDeCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellShopPhotoDeCell];
        if (cell == nil) {
            cell = [[ShopPhotoDeCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellShopPhotoDeCell];
            
        }
        return cell;
    }else if(indexPath.row == 2) {
        DepictViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellDepictViewCell];
        if (cell == nil) {
            cell = [[DepictViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellDepictViewCell];
            
        }
        cell.shopDesc.delegate = self;
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        CommitShopCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellCommitShopCell];
        if (cell == nil) {
            cell = [[CommitShopCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellCommitShopCell];
        }
        
        return cell;
        
    }
    else {
        
        UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellLocation];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellLocation];
            
        }
        cell.textLabel.text = @"地理位置";
        return cell;

    }
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 40;
    }else if (indexPath.row == 1) {
        return 100;
        
    }else if (indexPath.row == 2){
        return 140;
    }else {
        return 40;
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
