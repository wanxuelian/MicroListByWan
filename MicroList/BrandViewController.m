//
//  BrandViewController.m
//  MicroList
//
//  Created by Mac on 15/11/4.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BrandViewController.h"
#import "NextViewController.h"


@interface BrandViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
static NSString *Mycell = @"mycell";

@implementation BrandViewController
{
    UICollectionView * collection;
    NSArray * array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.title = @"品牌榜";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBrandViewController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
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
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 140, 370, 170) collectionViewLayout:flowLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor whiteColor];
    
    //3.注册单元格
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:Mycell];
    
    [self.view addSubview:collection];
    array = @[@"服装",@"数码",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别"];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Mycell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    lable.textColor = [UIColor whiteColor];
    lable.text = array[indexPath.item];
    [cell addSubview:lable];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

        
        NextViewController * nextVC = [[NextViewController alloc]init];
        [self.navigationController pushViewController:nextVC animated:YES];
    

}


- (void)backBrandViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
