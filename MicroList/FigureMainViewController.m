//
//  FigureMainViewController.m
//  MicroList
//
//  Created by sks on 15/10/31.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FigureMainViewController.h"
#import "MentFoodCollectionCell.h"
#import "FoodClassCell.h"
#import "PhotoDetailViewController.h"
#import "ShopTableViewController.h"
#import "FigureViewController.h"


static NSString *cellIdentfier = @"ment";


@interface FigureMainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>

@end

@implementation FigureMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"人物榜";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFoodMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    
    
    
    
    //    [self collViewFlowLayout];
    [self creatModel];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)creatModel {
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(60, 25);
    layout.minimumLineSpacing = 40;
    layout.minimumInteritemSpacing = 40;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64, rect.size.width,0)];
    view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    
    self.figurement = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view1.frame),rect.size.width, 100) collectionViewLayout:layout];
    self.figurement.layer.borderWidth = 1.0;
    [self.figurement.layer setBorderColor:[[UIColor colorWithRed:0.767 green:0.833 blue:0.851 alpha:1.000]CGColor]];
    
    
    self.figurement.backgroundColor = [UIColor whiteColor];
    self.figurement.dataSource = self;
    self.figurement.delegate = self;
    [self.figurement registerClass:[MentFoodCollectionCell class] forCellWithReuseIdentifier:cellIdentfier];
    [self.view addSubview:self.figurement];
    
    self.figureDetail = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.figurement.frame) + 5, rect.size.width, rect.size.height - 100 - 64 - 5)];
    self.figureDetail.layer.borderWidth = 1.0;
    self.figureDetail.layer.cornerRadius = 10.0;
    [self.figureDetail.layer setBorderColor:[[UIColor colorWithRed:0.767 green:0.833 blue:0.851 alpha:1.000]CGColor]];
    self.figureDetail.dataSource = self;
    self.figureDetail.delegate = self;
    [self.view addSubview:self.figureDetail];
    
    
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
    
    self.figurement.collectionViewLayout = layout;
    
    
    
    
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
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    MentFoodCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentfier forIndexPath:indexPath];
    
    
    
    return cell;
    
}


- (void)foodClassTouch {
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ShopTableViewController *shopContr = [[ShopTableViewController alloc] init];
    [self presentViewController:shopContr animated:YES completion:^{
        
    }];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.figureDetail registerNib:[UINib nibWithNibName:@"FoodClassCell" bundle:nil] forCellReuseIdentifier:@"FoodClassCell"];
    FoodClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodClassCell" forIndexPath:indexPath];
    cell.selectionStyle = NO;
    [cell.foodClassB addTarget:self action:@selector(pushFigureDetail) forControlEvents:UIControlEventTouchUpInside];
    [cell.foodClassSecond addTarget:self action:@selector(pushFigureDetail) forControlEvents:UIControlEventTouchUpInside];
    [cell.foodClassC addTarget:self action:@selector(pushFigureDetail) forControlEvents:UIControlEventTouchUpInside];
    [cell.foodClassD addTarget:self action:@selector(pushFigureDetail) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}



- (void)pushFigureDetail {
    FigureViewController *figureDetail = [[FigureViewController alloc] init];
    UINavigationController * figureDetailNa = [[UINavigationController alloc] initWithRootViewController:figureDetail];
    
    [self presentViewController:figureDetailNa animated:YES completion:^{
        
    }];
    
    
}

@end
