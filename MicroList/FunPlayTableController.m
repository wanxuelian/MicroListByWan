//
//  FunPlayTableController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/21.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FunPlayTableController.h"
#import "BuildTableViewCell.h"
#import "FunDetailViewController.h"

@interface FunPlayTableController ()

@property (nonatomic, retain) NSArray *classFunArray;


@end

static NSString *cellIdentifier = @"BuildTableViewCell";


@implementation FunPlayTableController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"趣玩";
    
    
    self.classFunArray = @[@"家具",@"运动",@"个护",@"数码",@"玩物",@"文具",@"出行",@"视听",@"摄影"];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFunMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.classFunArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BuildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[BuildTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];

    }
    cell.selectionStyle = NO;
    cell.labelClass.text = self.classFunArray[indexPath.row];
//    cell.cellCount = self.classFunArray.count;
    return cell;

    
    // Configure the cell...
    

}
-(void)backFunMainController {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FunDetailViewController *funDetailCon = [[FunDetailViewController alloc] init];
    UINavigationController *funNa = [[UINavigationController alloc] initWithRootViewController:funDetailCon];
    funDetailCon.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:funNa animated:YES completion:^{
        
    }];

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
