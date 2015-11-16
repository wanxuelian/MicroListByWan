//
//  CarTableViewController.m
//  MicroList
//
//  Created by sks on 15/11/1.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CarTableViewController.h"
#import "GroupImageTableViewCell.h"
#import "GroupNumberTableViewCell.h"
#import "GroupMemberTableViewCell.h"
#import "GroupContrTableViewCell.h"

@interface CarTableViewController ()

@end

@implementation CarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupImageTableViewCell"];
        GroupNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupImageTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        return cell;
//        [tableView registerNib:[UINib nibWithNibName:@"GroupImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupImageTableViewCell"];
//        GroupImageTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"GroupImageTableViewCell" owner:self options:nil]lastObject];
//        return cell;
    }else if (indexPath.row == 1) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupNumberTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupNumberTableViewCell"];
        GroupNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupNumberTableViewCell" forIndexPath:indexPath];;
        cell.selectionStyle = NO;
        return cell;
    }else if(indexPath.row == 2) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupMemberTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupMemberTableViewCell"];
        GroupMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupMemberTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        return cell;
    }else {
         [tableView registerNib:[UINib nibWithNibName:@"GroupContrTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupContrTableViewCell"];
        GroupContrTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupContrTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        return cell;

    }
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 200;
    }else if (indexPath.row == 1) {
        return 50;
    }else if (indexPath.row == 2) {
        return 100;
    }else {
        return 100;
    }
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
