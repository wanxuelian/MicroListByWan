//
//  FoodViewControll.m
//  MicroList
//
//  Created by sks on 15/10/26.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FoodViewControll.h"
#import "MentFoodCollectionCell.h"
#import "FoodClassCell.h"
#import "PhotoDetailViewController.h"
#import "ShopTableViewController.h"
#import "FoodTranslateCon.h"

#import "FoodViewCell.h"

#import "FoodScrollView.h"//设置代理需要引入这个类,也可不引用

#import "ClassFoodModel.h"

static NSString *cellIdentfier = @"ment";


@interface FoodViewControll ()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, TermCellDelegate>

@property (nonatomic, strong)NSArray *foodClassArray;


@property (nonatomic, strong)ClassFoodModel *food; //美食榜数据模型

@property (nonatomic, strong)NSArray *arrFoodModel; //存储模型数据的数组



@end

@implementation FoodViewControll

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"美食榜";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFoodMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.foodClassArray = @[@"火锅",@"自助餐",@"面包甜点", @"烧烤",@"快餐简餐",@"江浙菜",@"咖啡厅", @"西餐",@"日本料理",@"韩国料理",@"酒吧", @"小吃面食",@"海鲜",@"川菜",@"粤菜", @"小吃面食",@"海鲜",@"川菜",@"粤菜",  @"东南亚菜",@"湘菜",@"东北菜",@"茶馆", @"清真菜",@"新疆菜"];
   
   
    self.arrFoodModel  = @[@"火锅",@"自助餐",@"面包甜点", @"烧烤",@"快餐简餐"];
    
    //    [self collViewFlowLayout];
    [self creatModel];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)creatModel {
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(70, 30);
    layout.minimumLineSpacing = 30;
    layout.minimumInteritemSpacing = 30;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64, rect.size.width,0)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    self.foodment = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view1.frame),rect.size.width, 100) collectionViewLayout:layout];
    self.foodment.layer.borderWidth = 1.0;
    [self.foodment.layer setBorderColor:[[UIColor colorWithRed:0.767 green:0.833 blue:0.851 alpha:1.000]CGColor]];
    
    
    self.foodment.backgroundColor = [UIColor whiteColor];
    self.foodment.dataSource = self;
    self.foodment.delegate = self;
    [self.foodment registerClass:[MentFoodCollectionCell class] forCellWithReuseIdentifier:cellIdentfier];
    [self.view addSubview:self.foodment];
    
    self.foodDetail = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.foodment.frame) + 5, rect.size.width, rect.size.height - 100 - 64 - 5)];
    self.foodDetail.layer.borderWidth = 1.0;
    self.foodDetail.layer.cornerRadius = 10.0;
    [self.foodDetail.layer setBorderColor:[[UIColor colorWithRed:0.767 green:0.833 blue:0.851 alpha:1.000]CGColor]];
    self.foodDetail.dataSource = self;
    self.foodDetail.delegate = self;
    [self.view addSubview:self.foodDetail];
    
    
}

- (void)backFoodMainController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)collViewFlowLayout {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(60, 25);
    layout.minimumLineSpacing = 40;
    layout.minimumInteritemSpacing = 40;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    self.foodment.collectionViewLayout = layout;
    
    
    
    
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
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.foodClassArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    MentFoodCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentfier forIndexPath:indexPath];
    [cell.foodB addTarget:self action:@selector(foodPushphoto) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.foodB setTitle:[NSString stringWithFormat:@"%@",  self.foodClassArray[indexPath.row]] forState:UIControlStateNormal];
    return cell;
    
}


- (void)foodPushphoto {
    PhotoDetailViewController *photoContr = [[PhotoDetailViewController alloc] init];
    UINavigationController *foodphotoNa = [[UINavigationController alloc] initWithRootViewController:photoContr];
    [self presentViewController:foodphotoNa animated:YES completion:^{
        
    }];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    [self.foodDetail registerNib:[UINib nibWithNibName:@"FoodClassCell" bundle:nil] forCellReuseIdentifier:@"FoodClassCell"];
//    FoodClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodClassCell" forIndexPath:indexPath];
//    
//    [cell.foodClassB addTarget:self action:@selector(pushTransDetail) forControlEvents:UIControlEventTouchUpInside];
//    [cell.foodClassSecond addTarget:self action:@selector(pushTransDetail) forControlEvents:UIControlEventTouchUpInside];
//    [cell.foodClassC addTarget:self action:@selector(pushTransDetail) forControlEvents:UIControlEventTouchUpInside];
//    [cell.foodClassD addTarget:self action:@selector(pushTransDetail) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    static NSString *cellIdentifier = @"foodViewCell";
    
    FoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[FoodViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    NSArray *aar = @[@"火锅",@"自助餐",@"面包甜点", @"烧烤",@"快餐简餐"];

    cell.scView.classLabel.text = aar[indexPath.row];
    cell.scView.delegate = self;
//    cell.scView.array = aarray;
    cell.classModelFood = self.food;
    return cell;
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}




- (void)pushTransDetail {
    FoodTranslateCon *transDetail = [[FoodTranslateCon alloc] init];
//    UINavigationController * transDetailNa = [[UINavigationController alloc] initWithRootViewController:transDetail];
//    [self presentViewController:transDetailNa animated:YES completion:^{
//        
//    }];
    [self.navigationController pushViewController:transDetail animated:YES];
        
}
#pragma mark - TermCellDelegate
- (void)choseTerm:(UIButton *)button
{
    NSLog(@"%ld",button.tag);
    
    FoodTranslateCon *transDetail = [[FoodTranslateCon alloc] init];
    [self.navigationController pushViewController:transDetail animated:YES];
 
    
    
    
}





@end
