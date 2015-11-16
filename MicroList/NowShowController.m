//
//  NowShowController.m
//  MicroList
//
//  Created by Mac on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "NowShowController.h"
#import "DymnaicCell.h"
#import "CommentTableViewController.h"
#import "SunViewShow.h"
#import "MyViewController.h"
#import "MJExtension.h"
#import "NowShowModel.h"
@interface NowShowController ()<UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *arr;
}



@property (nonatomic, strong)UITableView *tableSun;

@property (nonatomic, strong)SunViewShow *sunHEader;


@end


static NSString *cellIdentife = @"sunDymnaicCell";

@implementation NowShowController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"晒榜";

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    
    self.navigationItem.leftBarButtonItem = barItem;

    
    [self headerTopMy];
    self.tableSun.dataSource = self;
    self.tableSun.delegate = self;
    [self.view addSubview:self.tableSun];
    
    [self serverData];

}

- (void)serverData{
    
    BaseJsonData *data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *key = [user objectForKey:@"key"];
    
    NSString *url = [NSString stringWithFormat:@"http://%@/friendShow/ShowList",kLoginServer];
    
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"key"] = key;
    
    //请求晒榜列表
    [data POSTData:url and:parmas and:^(id dict) {
        
        NSString *code = dict[@"code"];
        if ([code isEqualToString:@"1"]) {
            
            [BaseAlertView AlertView:@"请求成功"];
            
        }else if ([code isEqualToString:@"2"]){
        
            [BaseAlertView AlertView:@"没有数据"];
        
        }else if ([code isEqualToString:@"3"]){
        
            [BaseAlertView AlertView:@"服务器请求错误"];
        }
        
        
        NSMutableArray *array = dict[@"data"];
        
        NowShowModel *model = [[NowShowModel alloc]init];
        
        arr = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            model.likeNumber = dict[@"lickNumber"];
            model.dislickNumber = dict[@"dislikeNumber"];
            model.ImgPath = dict[@"ImgPath"];
            model.sid = dict[@"sid"];
            [arr addObject:model];
            
        }
        
    }];
    
    
}



- (void)headerTopMy {
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.tableSun = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    self.sunHEader = [[SunViewShow alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 150)];
    self.sunHEader.imageSun.image = [UIImage imageNamed:@"picture12"];
    [self.sunHEader.buttonAvatat setBackgroundImage:[UIImage imageNamed:@"picture7"] forState:UIControlStateNormal];
    [self.sunHEader.buttonAvatat addTarget:self action:@selector(pushAvatrerBHeader) forControlEvents:UIControlEventTouchUpInside];
    self.tableSun.tableHeaderView = self.sunHEader;
    
    UITapGestureRecognizer *tapImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSunHeaderController)];
    self.sunHEader.imageSun.userInteractionEnabled = YES;//触摸手势
    [self.sunHEader.imageSun addGestureRecognizer:tapImageView];
    
    
    
    
}

- (void)pushAvatrerBHeader {
    MyViewController *myView = [[MyViewController alloc] init];
    UINavigationController *myNa = [[UINavigationController alloc] initWithRootViewController:myView]
    ;
    [self presentViewController:myNa animated:YES completion:^{
        
    }];
    
}
- (void)tapSunHeaderController {
    //触摸方法
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [picker setIsSingle:YES];
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];//打开相册
        //        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];//打开相机
    }else{
        [picker setIsSingle:YES];
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}

- (void)cameraPhoto:(UIImage *)image  //选择完图片
{   NSLog(@"选择玩图片");
    
    ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
    [fitler setDelegate:self];
    fitler.currentImage = image;
    [self presentViewController:fitler animated:YES completion:^{
        
    }];
    //    [self presentModalViewController:fitler animated:YES];
}

- (void)imageFitlerProcessDone:(UIImage *)image //图片处理完
{
    self.sunHEader.imageSun.image = image;
}


#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DymnaicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentife];
    if (cell == nil) {
        cell = [[DymnaicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentife] ;
        
    }
    [cell.photoAvat setBackgroundImage:[UIImage imageNamed:@"picture7"] forState:UIControlStateNormal];
    cell.photoName.text = @"风铃";
    [cell.topTabel setBackgroundImage:[UIImage imageNamed:@"girlAvater"] forState:UIControlStateNormal];
    cell.imageScenery.image = [UIImage imageNamed:@"picture12"];
    cell.selectionStyle = NO;
    
    
    
    
    return cell;

    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
        NowShowModel *model = [[NowShowModel alloc]init];
    
        CommentTableViewController *foodTrans = [[CommentTableViewController alloc] init];
    
    foodTrans.sid = model.sid;
    
        [self.navigationController pushViewController:foodTrans animated:YES];
        
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 150;
//}




@end
