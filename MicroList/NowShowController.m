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
#import "NowShowDataModel.h"
#import "GTMBase64.h"
#import "APImgModel.h"
#import "APTextTagModel.h"
#import "APAudioTagModel.h"
#import "APLocationModel.h"
@interface NowShowController ()<UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *arr;
}



@property (nonatomic, strong)UITableView *tableSun;

@property (nonatomic, strong)SunViewShow *sunHEader;

@property (nonatomic, strong)NSArray *textModelArray;//文本

@property (nonatomic, strong)NSArray *audioModelArray;//语音

@property (nonatomic, strong)NSArray *locationModelArray;//地理

@property (nonatomic, strong)NSMutableArray *arrayData;//存储NowShowDataModel

@end


static NSString *cellIdentife = @"sunDymnaicCell";

@implementation NowShowController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"晒榜";
    [self serverData];


    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    
    self.navigationItem.leftBarButtonItem = barItem;
    
    
   
    
    [self headerTopMy];
    self.tableSun.dataSource = self;
    self.tableSun.delegate = self;
    [self.view addSubview:self.tableSun];
    

}

-(void)viewDidAppear:(BOOL)animated {//来触发视图完全显示在屏幕上之后的行为
 
    if (self.arrayData.count == 0) {
        self.tableSun.tableFooterView = [[UIView alloc] init];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您还没有添加好友" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
    }
    
}

- (void)serverData{
    
    NSLog(@"获得数据");
    
    
    BaseJsonData *data = [[BaseJsonData alloc]init];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *key = [user objectForKey:@"key"];
    NSLog(@"%@",key);
    NSString *url = [NSString stringWithFormat:@"http://%@/friendShow/ShowList",kLoginServer];
    
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"key"] = key;
    self.arrayData = [[NSMutableArray alloc] initWithCapacity:0];
    //请求晒榜列表

    [data POSTData:url and:parmas and:^(id dict) {
        

        
        NSString *code = dict[@"code"];
        NSArray *dataArray = dict[@"data"];
        //1.创建存储数据的model
       
        if ([code isEqualToString:@"1"]) {
            
           
            
            
            for (NSDictionary *dicArr in dataArray) {
                NSLog(@"dicArr%@", dicArr);
               static int a = 0;

                NSLog(@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa%d",a);
                NowShowDataModel *showModel = [[NowShowDataModel alloc] init];

                NSError *err;
                
                NSString *str = dicArr[@"showNote"];
                NSLog(@"str******%@",str);
                
                //获得晒单id
                NSString *strSids = dicArr[@"sid"];
                showModel.sidOdd = strSids;
                
                //1.获得图片数据model
                NSString *str1 = [NSString stringWithFormat:@"http://%@%@",kLoginServer, dicArr[@"ImgPath"]];
                NSLog(@"str1*********w%@",str1);
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionary];
                imageDic[@"imgPath"] = str1;
//                imageDic[@"id"] =(long)f;
                imageDic[@"imgID"] = @"20150529194153DAGDGUGKUNODWYUDILUJFGWIFW";
                APImgModel *imgModelAp = [APImgModel objectWithKeyValues:imageDic];

                showModel.imgModel = imgModelAp;//存储图片数据model
                
                NSString *strJson = [self GMTDecodeTest:str];
                NSLog(@"strJson%@",[self GMTDecodeTest:str]);
                NSData *datastr = [strJson dataUsingEncoding:NSUTF8StringEncoding];
                
                NSArray *dicdataModel = [NSJSONSerialization JSONObjectWithData:datastr options:NSJSONReadingMutableLeaves error:&err];
                NSMutableArray *arreee = [NSMutableArray arrayWithObject:dicdataModel];
                NSLog(@"dicdataModel%ld",dicdataModel.count);
                NSLog(@"dicdataModelssssss%@",dicdataModel);
//                NSMutableArray *dicMutable = [NSMutableArray arrayWithObjects:0, nil];
                
                static int b = 0;
                for (NSDictionary *dic in arreee) {
                    NSLog(@"dicsssssssssssss%@",dic);
                    NSLog(@"sssssssssssssssssssssssssss%d",b);
                    //2.获得文本标签数据模型
//                    NSLog(@"dic**%@",dic[@"textTag"]);
                    NSArray *arrTextTag = [NSArray arrayWithObject:dic[@"textTag"]];//转化为数组类型的数据
                    NSLog(@"arrTextTag***%@",arrTextTag);
                    showModel.textNowModelArray = arrTextTag;//存储文本数据model
                    NSLog(@"showModel.有数据textNowModelArray%@",showModel.textNowModelArray);
                    //3.获得语音标签数据模型
                    NSMutableArray *arrAudioTag = [NSMutableArray arrayWithObjects:0, nil];
                    [arrAudioTag addObject:dic[@"audioTag"]];//转化为数组类型的数据
                    showModel.audioNowModelArray = arrAudioTag;//存储语音数据model

                    
                    //4.获得地理标签数据模型
                    NSMutableArray *arrLocationTag = [NSMutableArray arrayWithObjects:0, nil];
                    [arrLocationTag addObject:dic[@"locationTag"]];//转化为数组类型的数据
                    self.locationModelArray = [APLocationModel objectArrayWithKeyValuesArray:arrLocationTag];
                    showModel.locationModelArray = arrAudioTag;//存储地理数据model
                    
                    NSLog(@"***********showModel*********%@",showModel);
                    b++;
                    [self.arrayData addObject:showModel];//添加到数组

                }
                a++;
            }
            
            NSLog(@"**************arrayData*************%@",self.arrayData);
//            [BaseAlertView AlertView:@"请求成功"];
            [self.tableSun reloadData];
        }else if ([code isEqualToString:@"2"]){
        
            [BaseAlertView AlertView:@"没有数据"];
        
        }else if ([code isEqualToString:@"3"]){
        
            [BaseAlertView AlertView:@"服务器请求错误"];
        }
        [self.tableSun reloadData];

        
       
        
    }];
    
    
}
-(NSString *)GMTDecodeTest:(NSString *)gmtstr

{
    
    
    NSString* decodeResult = nil;
    
    NSData* encodeData = [gmtstr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData* decodeData = [GTMBase64 decodeData:encodeData];
    
    decodeResult = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    
    NSLog(@"decodeResult%@",decodeResult);
    return decodeResult;
}

- (void)headerTopMy {
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.tableSun = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height) style:UITableViewStyleGrouped];
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
    
    return self.arrayData.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"放置数据");
    DymnaicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentife];
    if (cell == nil) {
        cell = [[DymnaicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentife] ;
        
    }
    [cell.photoAvat setBackgroundImage:[UIImage imageNamed:@"picture7"] forState:UIControlStateNormal];
    cell.photoName.text = @"风铃";
    [cell.topTabel setBackgroundImage:[UIImage imageNamed:@"girlAvater"] forState:UIControlStateNormal];
    cell.selectionStyle = NO;

    
    NowShowDataModel *model = self.arrayData[indexPath.row];
    cell.zamB.tag = 400 + [model.sidOdd intValue];
    cell.badB.tag = 401 + [model.sidOdd intValue];
    
    [cell.zamB addTarget:self action:@selector(actionZamb:) forControlEvents:UIControlEventTouchUpInside];
    [cell.badB addTarget:self action:@selector(actionBadB:
                                               ) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%ld",self.arrayData.count);
    NSLog(@"%@",self.arrayData);
   
//    NSLog(@"textNowModelArray0%@", model.textNowModelArray);
//    NSLog(@"image%@",model.imgModel);
//    NSLog(@"model.audioNowModelArray0%@",model.audioNowModelArray);
    cell.modelNowShow = self.arrayData[indexPath.row];
    
    
    
    
    
    return cell;

    
}

#pragma mark - zemB badB
- (void)actionZamb:(UIButton *)button {
    NSInteger zidB = button.tag - 400;//晒单ID
    NSLog(@"赞%ld",button.tag - 400);
    //点击之后发送点击者的用户名(key);和头像,返回点击者的头像赞的数字和踩的
    BaseJsonData *data = [[BaseJsonData alloc]init];//创建请求类
    NSString *strUrl = [NSString stringWithFormat:@"http://%@/friendShow/ShowOpinion", kLoginServer];
    
    //获得key
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *key = [user objectForKey:@"key"];
    
    NSMutableDictionary *dicparms = [NSMutableDictionary dictionary];
    dicparms[@"key"] = key;
    dicparms[@"sid"] = [NSString stringWithFormat:@"%ld", zidB];
    NSString *strtype = @"1";
    dicparms[@"type"] = strtype;
    

    
    
    [data POSTData:strUrl and:dicparms and:^(id dic) {
        NSLog(@"%@", dic);
    }];
    
}

- (void)actionBadB:(UIButton *)button {
    
    BaseJsonData *data = [[BaseJsonData alloc]init];//创建请求类

    
    NSInteger bidB = button.tag - 401;
    NSLog(@"踩%ld",button.tag - 401);
    //点击之后发送点击者的用户名(key);和头像,返回点击者的头像赞的数字和踩的
    NSString *strUrl = [NSString stringWithFormat:@"http://%@/friendShow/ShowOpinion", kLoginServer];
    
    //获得key
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *key = [user objectForKey:@"key"];
    
    //创建请求体
    NSMutableDictionary *dicparms = [NSMutableDictionary dictionary];
    dicparms[@"key"] = key;
    dicparms[@"sid"] = [NSString stringWithFormat:@"%ld", bidB];
    NSString *strtype = @"1";
    dicparms[@"type"] = strtype;
    
    
    
    
    [data POSTData:strUrl and:dicparms and:^(id dic) {
        NSLog(@"%@", dic);
    }];
    
    
    
    
    //    data POSTData:strUrl and:<#(NSDictionary *)#> and:<#^(id)block#>
    
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 510;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NowShowDataModel *modelPhoto = self.arrayData[indexPath.row];
    NSLog(@"modelPhoto是%@",modelPhoto);
    
    
    
    
        CommentTableViewController *foodTrans = [[CommentTableViewController alloc] init];
        foodTrans.commentNowData = modelPhoto;
    
        [self.navigationController pushViewController:foodTrans animated:YES];
    
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 150;
//}




@end
