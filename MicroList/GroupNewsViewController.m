//
//  GroupNewsViewController.m
//  MicroList
//
//  Created by sks on 15/11/8.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "GroupNewsViewController.h"
#import "GroupNumberTableViewCell.h"
#import "GroupMemberTableViewCell.h"
#import "GroupContrTableViewCell.h"
#import "GroupChatTableCell.h"
#import "GroupViewController.h"
@interface GroupNewsViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation GroupNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    messageTable.delegate = self;
    messageTable.dataSource = self;
    [self.view addSubview:messageTable];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 200;
    }else if (indexPath.row == 1) {
        return 50;
    }else if (indexPath.row == 2) {
        return 85;
    }else if (indexPath.row == 3){
        return 85;
    }else {
        return 40;
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupImageTableViewCell"];
        GroupNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupImageTableViewCell" forIndexPath:indexPath];
        
        return cell;
        //        [tableView registerNib:[UINib nibWithNibName:@"GroupImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupImageTableViewCell"];
        //        GroupImageTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"GroupImageTableViewCell" owner:self options:nil]lastObject];
        //        return cell;
    }else if (indexPath.row == 1) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupNumberTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupNumberTableViewCell"];
        GroupNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupNumberTableViewCell" forIndexPath:indexPath];;
        
        return cell;
    }else if(indexPath.row == 2) {
        [tableView registerNib:[UINib nibWithNibName:@"GroupMemberTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupMemberTableViewCell"];
        GroupMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupMemberTableViewCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 3){
        [tableView registerNib:[UINib nibWithNibName:@"GroupContrTableViewCell" bundle:nil] forCellReuseIdentifier:@"GroupContrTableViewCell"];
        GroupContrTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupContrTableViewCell" forIndexPath:indexPath];
        return cell;
        
    }else {
            GroupChatTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupChatTableCell"];
            if (cell == nil) {
                cell = [[GroupChatTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"GroupChatTableCell"];
                
            }
        return cell;
    }

    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 4) {
        
        GroupViewController *group = [[GroupViewController alloc]init];
        [self.navigationController pushViewController:group animated:YES];
        
        
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
