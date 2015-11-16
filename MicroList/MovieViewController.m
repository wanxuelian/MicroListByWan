//
//  MovieViewController.m
//  MicroList
//
//  Created by sks on 15/10/31.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MovieViewController.h"
#import "MentFoodCollectionCell.h"
#import "FoodClassCell.h"
#import "PhotoDetailViewController.h"
#import "ShopTableViewController.h"
#import "MovieTransViewController.h"


static NSString *cellIdentfier = @"movie";


@interface MovieViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"影视榜";
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
    
    self.moviement = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view1.frame),rect.size.width, 100) collectionViewLayout:layout];
    self.moviement.layer.borderWidth = 1.0;
    [self.moviement.layer setBorderColor:[[UIColor colorWithRed:0.767 green:0.833 blue:0.851 alpha:1.000]CGColor]];
    
    
    self.moviement.backgroundColor = [UIColor whiteColor];
    self.moviement.dataSource = self;
    self.moviement.delegate = self;
    [self.moviement registerClass:[MentFoodCollectionCell class] forCellWithReuseIdentifier:cellIdentfier];
    [self.view addSubview:self.moviement];
    
    self.movieDetail = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.moviement.frame) + 5, rect.size.width, rect.size.height - 100 - 64 - 5)];
    self.movieDetail.layer.borderWidth = 1.0;
    self.movieDetail.layer.cornerRadius = 10.0;
    [self.movieDetail.layer setBorderColor:[[UIColor colorWithRed:0.767 green:0.833 blue:0.851 alpha:1.000]CGColor]];
    self.movieDetail.dataSource = self;
    self.movieDetail.delegate = self;
    [self.view addSubview:self.movieDetail];
    
    
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
    
    self.moviement.collectionViewLayout = layout;
    
    
    
    
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
    
    [self.movieDetail registerNib:[UINib nibWithNibName:@"FoodClassCell" bundle:nil] forCellReuseIdentifier:@"FoodClassCell"];
    FoodClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodClassCell" forIndexPath:indexPath];
    cell.selectionStyle = NO;
    [cell.foodClassB setBackgroundImage:[UIImage imageNamed:@"avarer"] forState:UIControlStateNormal];
    cell.avaterNameLabel.text = @"电影";
    [cell.foodClassB addTarget:self action:@selector(pushMoviePhotoDetail) forControlEvents:UIControlEventTouchUpInside];
    [cell.foodClassSecond addTarget:self action:@selector(pushMoviePhotoDetail) forControlEvents:UIControlEventTouchUpInside];
    [cell.foodClassC addTarget:self action:@selector(pushMoviePhotoDetail) forControlEvents:UIControlEventTouchUpInside];
    [cell.foodClassD addTarget:self action:@selector(pushMoviePhotoDetail) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}



- (void)pushMoviePhotoDetail {
//    PhotoDetailViewController *photoDetail = [[PhotoDetailViewController alloc] init];
//    UINavigationController * photoDetailNa = [[UINavigationController alloc] initWithRootViewController:photoDetail];
//    [self presentViewController:photoDetailNa animated:YES completion:^{
//        
//    }];
//    
//    [photoDetail release];
//
    MovieTransViewController *movieCont = [[MovieTransViewController alloc] init];
    [self.navigationController pushViewController:movieCont animated:YES];
    
}

@end
