//
//  NextViewController.m
//  MicroList
//
//  Created by Mac on 15/11/5.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "NextViewController.h"
#import "ShopController.h"

@interface NextViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
static NSString * Mycell1 = @"mycell1";

@implementation NextViewController
{
    UICollectionView * collection;
    NSArray * array;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、设置布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置属性
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置一个单元格的大小
    flowLayout.itemSize =CGSizeMake(115, 50);
    //设置单元格间距
    flowLayout.minimumInteritemSpacing = 10;
    //设置行间距
    flowLayout.minimumLineSpacing = 10;
    
    
    //设置整个瀑布流的大小
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 120, 370, 180) collectionViewLayout:flowLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor blueColor];
    [self.view addSubview:collection];
    //3.注册单元格
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:Mycell1];
    array = @[@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Mycell1 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    lable.textColor = [UIColor whiteColor];
    lable.text = array[indexPath.item];
    [cell addSubview:lable];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ShopController * shop = [[ShopController alloc]init];
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:shop];
    
    [self presentViewController:selectedController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
