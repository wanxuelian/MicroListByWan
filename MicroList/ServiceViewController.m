//
//  ServiceViewController.m
//  MicroList
//
//  Created by Mac on 15/11/5.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "ServiceViewController.h"
#import "ShopController.h"

@interface ServiceViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
static NSString * Mycell2 = @"mycell";

@implementation ServiceViewController
{
    UICollectionView * collection;
    NSArray * array;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"品牌榜";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backServiceViewController)];
    self.navigationItem.leftBarButtonItem = backItem;

    
    //1、设置布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置属性
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //头视图大小
    flowLayout.headerReferenceSize = CGSizeMake(0, 20);
    //设置一个单元格的大小
    flowLayout.itemSize =CGSizeMake(115, 50);
    //设置单元格间距
    flowLayout.minimumInteritemSpacing = 10;
    //设置行间距
    flowLayout.minimumLineSpacing = 10;
    
    
    //设置整个瀑布流的大小
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 125, 370, 400) collectionViewLayout:flowLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor whiteColor];
    
    //3.注册单元格
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:Mycell2];
    
    //collectionView组的头视图的 默认类型 是 UICollectionReusableView
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Mycell2];
    
    [self.view addSubview:collection];
    array = @[@"服装",@"数码",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别",@"分类类别"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Mycell2 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    lable.textColor = [UIColor whiteColor];
    
    lable.text = array[indexPath.item];
    [cell addSubview:lable];
    
    return cell;
}

//设置组头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:Mycell2 forIndexPath:indexPath];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 25)];
    lable.text = @"城市";
    lable.textColor = [UIColor grayColor];
    if(view.subviews != nil){
        for (UIView *v in view.subviews) {
            //移除所有子视图
            [v removeFromSuperview];
        }
    }
    [view addSubview:lable];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderWidth = 1.f;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    
    return view;
    
    
}

//设置头部视图的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(200, 35);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ShopController * shop = [[ShopController alloc]init];
    
    UINavigationController *selectedController = [[UINavigationController alloc] initWithRootViewController:shop];
    
    [self presentViewController:selectedController animated:YES completion:nil];
}

- (void)backServiceViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
