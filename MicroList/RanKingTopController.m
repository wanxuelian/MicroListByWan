//
//  RanKingTopController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//
#import "RanKingTopController.h"

#import "ShopTableViewController.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width


@interface RanKingTopController ()<UITableViewDataSource,UITableViewDelegate>

{
    UILabel * label;
    //热门榜单
    NSArray * arr;
    NSArray * array1;
    NSArray * array2;
    NSArray * array3;
    //美食榜
    NSArray * array4;
    NSArray * array5;
    NSArray * array6;
    NSArray * array7;
    NSArray * array8;
    NSArray * array9;
    //休闲娱乐
    NSArray * array10;
    NSArray * array11;
    NSArray * array12;
    NSArray * array13;
    NSArray * array14;
    NSArray * array15;
    
    //酒店
    NSArray * array16;
    NSArray * array17;
    NSArray * array18;
    
    //景点
    NSArray * array19;
    NSArray * array20;
    NSArray * array21;
    
    //生活服务
    NSArray * array22;
    NSArray * array23;
    NSArray * array24;
    NSArray * array25;
    NSArray * array26;
    
    // 家装
    NSArray * array27;
    NSArray * array28;
    
}

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation RanKingTopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 64, kScreenWidth, 2);
    [self.view addSubview:view];
    

    //加载表视图
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    
}

#pragma mark - TableView DataSource

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 7;
}


//每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 4;
    }else if (section == 1){
        
        return 6;
    }else if (section == 2){
        
        return 6;
    }else if (section == 3){
        
        return 3;
    }else if (section == 4){
        
        return 3;
    }else if (section == 5){
        
        return 5;
    }else{
        
        return 2;
    }
}

//创建单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1.创建复用的 id
    static NSString * identifier = @"cell_01";
    
    //2.先到闲置池中，根据id去取这个单元格对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    //3.如果闲置池中没有这样的单元格，创建单元格
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    
    //热门榜单
    arr    = @[@"小区/商务楼",@"足疗按摩",@"KTV",@"快餐简餐"];
    array1 = @[@"面包甜点",@"江浙菜",@"咖啡厅",@"自助餐"];
    array2 = @[@"西餐",@"日本料理",@"美发",@"火锅"];
    array3 = @[@"韩国料理",@"",@"",@""];
    //美食榜
    array4 = @[@"全部",@"火锅",@"自助餐",@"面包甜点"];
    array5 = @[@"烧烤",@"快餐简餐",@"江浙菜",@"咖啡厅"];
    array6 = @[@"西餐",@"日本料理",@"韩国料理",@"酒吧"];
    array7 = @[@"小吃面食",@"海鲜",@"川菜",@"粤菜"];
    array8 = @[@"东南亚菜",@"湘菜",@"东北菜",@"茶馆"];
    array9 = @[@"清真菜",@"新疆菜",@"",@""];
    //休闲娱乐
    array10 = @[@"全部",@"KTV",@"电影院",@"私人影院"];
    array11 = @[@"足疗按摩",@"咖啡厅",@"酒吧",@"洗浴"];
    array12 = @[@"密室",@"网吧网咖",@"DIY手工坊",@"真人CS"];
    array13 = @[@"游乐游艺",@"轰趴馆",@"棋牌室",@"桌球馆"];
    array14 = @[@"温泉",@"茶馆",@"采摘/农家乐",@"文化艺术"];
    array15 = @[@"桌面游戏",@"",@"",@""];
    //酒店
    array16 = @[@"全部",@"经济型酒店",@"五星级酒店",@"四星级酒店"];
    array17 = @[@"三星级酒店",@"精品酒店",@"度假村",@"客栈旅舍"];
    array18 = @[@"公寓式酒店",@"青年旅舍",@"",@""];
    //景点
    array19 = @[@"全部",@"景点/郊游",@"游乐场",@"动植物园"];
    array20 = @[@"公园",@"古镇",@"漂流",@"滑雪场"];
    array21 = @[@"温泉",@"采摘/农家乐",@"影视基地",@""];
    //生活服务
    array22 = @[@"全部",@"医院",@"宠物",@"快照/冲印"];
    array23 = @[@"家政",@"小区/商务楼",@"银行",@"洗衣店"];
    array24 = @[@"电信营业厅",@"旅行社",@"体检中心",@"售票点"];
    array25 = @[@"居家维修",@"交通",@"房屋地产",@"物流快递"];
    array26 = @[@"公司企业",@"网站",@"",@""];
    //家装
    array27 = @[@"全部",@"建材",@"家具家居",@"装修设计"];
    array28 = @[@"家用电器",@"家装卖场",@"",@""];
    
    
    for (int j = 0; j < 4; j++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(j * 91 +3 ,5, 90, 40);
        
        //热门榜单
        if (indexPath.section == 0) {
            
            if (indexPath.row == 0) {
                [button setTitle:arr[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 1){
                [button setTitle:array1[j] forState:UIControlStateNormal];
                
            }else if (indexPath.row == 2){
                [button setTitle:array2[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array3[j] forState:UIControlStateNormal];
            }
            
            //美食榜
        }else if (indexPath.section == 1){
            
            if (indexPath.row == 0) {
                [button setTitle:array4[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 1){
                [button setTitle:array5[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 2){
                [button setTitle:array6[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 3){
                [button setTitle:array7[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 4){
                [button setTitle:array8[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array9[j] forState:UIControlStateNormal];
            }
            //
        }else if (indexPath.section == 2){
            
            if (indexPath.row == 0) {
                [button setTitle:array10[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 1){
                [button setTitle:array11[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 2){
                [button setTitle:array12[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 3){
                [button setTitle:array13[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 4){
                [button setTitle:array14[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array15[j] forState:UIControlStateNormal];
            }
            
            //
        }else if (indexPath.section == 3){
            
            if (indexPath.row == 0) {
                [button setTitle:array16[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 1){
                [button setTitle:array17[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array18[j] forState:UIControlStateNormal];
            }
            //
        }else if (indexPath.section == 4){
            
            if (indexPath.row == 0) {
                [button setTitle:array19[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 1){
                [button setTitle:array20[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array21[j] forState:UIControlStateNormal];
            }
         
        }else if (indexPath.section == 5){
            
            if (indexPath.row == 0) {
                [button setTitle:array22[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 1){
                [button setTitle:array23[j] forState:UIControlStateNormal];
                
            }else if (indexPath.row == 2){
                [button setTitle:array24[j] forState:UIControlStateNormal];
            }else if (indexPath.row == 3){
                [button setTitle:array25[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array26[j] forState:UIControlStateNormal];
            }
            //家装
        }else if (indexPath.section == 6){
            
            if (indexPath.row == 0) {
                [button setTitle:array27[j] forState:UIControlStateNormal];
            }else{
                [button setTitle:array28[j] forState:UIControlStateNormal];
                
            }
        
        }
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        button.backgroundColor = [UIColor lightGrayColor];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = NO;
        [cell addSubview:button];
        
    }
    
    
    return cell;
}

#pragma mark - Action
- (void)clickAction:(UIButton *)sender{

//    ShopController * shop = [[ShopController alloc]init];
    ShopTableViewController *shop = [[ShopTableViewController alloc]init];
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:shop];
    
    [self presentViewController:selectedController animated:YES completion:nil];
    


}

#pragma mark - TableView Delegate

//设置组的头视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   UIView * iview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    iview.backgroundColor = [UIColor clearColor];
    
    NSString * arr1 = @"热门榜单";
    NSString * arr2 = @"美食榜";
    NSString * arr3 = @"休闲娱乐";
    NSString * arr4 = @"酒店";
    NSString * arr5 = @"景点";
    NSString * arr6 = @"生活服务";
    NSString * arr7 = @"家装";
    
    
    NSArray * ar = [NSArray arrayWithObjects:arr1,arr2,arr3,arr4,arr5,arr6,arr7,nil];
    
    for (int i = 0; i <= 6; i++) {
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
        
        UIImage * image = [UIImage imageNamed:@""];
        
        imageView.image = image;
        
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [iview addSubview:imageView];
        
        label = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, 100, 50)];
        
        label.textColor = [UIColor grayColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont boldSystemFontOfSize:18];
        
        [iview addSubview:label];
        
        
    }
    
    label.text = ar[section];
    
    
    
    return iview;
}




@end
