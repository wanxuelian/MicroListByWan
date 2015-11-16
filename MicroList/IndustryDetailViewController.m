//
//  IndustryDetailViewController.m
//  MicroList
//
//  Created by sks on 15/11/1.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "IndustryDetailViewController.h"
#import "PhotoAvatCollectionViewCell.h"
#import "LastDymnaicController.h"
#import "CityFoodViewController.h"

@interface IndustryDetailViewController ()<UIScrollViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain)UIScrollView *topScrollView;


@property (nonatomic, assign)CGRect rect;

@property (nonatomic, retain)NSArray *topFriend;//榜友列表的数据
@property (nonatomic, retain)UISegmentedControl *topSegment;

@end

static NSString *collCellIdentifer = @"photoAvatCell";

@implementation IndustryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *topArray = @[@"榜单列表",@"榜友列表"];
    self.topSegment = [[UISegmentedControl alloc] initWithItems:topArray];
    [self.navigationController.navigationBar.topItem setTitleView: self.topSegment];
    self.topSegment.selectedSegmentIndex = 0;
    [self.topSegment addTarget:self action:@selector(switchOver:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *seekItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(seekPlayCityController)];
    self.navigationItem.rightBarButtonItem = seekItem;
    
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backsMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    [self modelView];
    
    [self segmentSecond];//榜友列表；
    // Do any additional setup after loading the view.
}
- (void)backsMainController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)seekPlayCityController {
    CityFoodViewController *cityFood = [[CityFoodViewController alloc] init];
    [self.navigationController pushViewController:cityFood animated:YES];
}


- (void)modelView {
    self.rect = [[UIScreen mainScreen] bounds];
    self.topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.rect.size.width, self.rect.size.height)];
    self.topScrollView.contentSize = CGSizeMake(self.rect.size.width * 2, self.rect.size.height  - 64);
    self.topScrollView.delegate = self;
    self.topScrollView.pagingEnabled = YES;
    
    [self creatCollectionTop:self.topSegment];
    
    
}
- (void)creatCollectionTop:(UISegmentedControl *)aSegmentedControl {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(self.rect.size.width / 2 - 20, self.rect.size.height/4);
    layout.minimumInteritemSpacing = 5;//cell之间的最小间距；
    layout.minimumLineSpacing = 5;//整个视图上分区的边距；
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    
    
    UICollectionView *photoShow = [[UICollectionView alloc] initWithFrame:CGRectMake(aSegmentedControl.selectedSegmentIndex * self.rect.size.width, 0, self.rect.size.width, self.rect.size.height - 64) collectionViewLayout:layout];
    photoShow.backgroundColor = [UIColor whiteColor];
    photoShow.dataSource = self;
    
    [self.topScrollView addSubview:photoShow];
    
    
    
    
    [self.view addSubview:self.topScrollView];
    
    [photoShow registerClass:[PhotoAvatCollectionViewCell class] forCellWithReuseIdentifier:collCellIdentifer];
}

- (void)switchOver:(UISegmentedControl *)aSegmentedControl{
    switch (aSegmentedControl.selectedSegmentIndex) {
        case 0:
            [self.topScrollView setContentOffset:CGPointMake( 0 *self.rect.size.width, -64) animated:YES];
            break;
            
        default:
            [self.topScrollView setContentOffset:CGPointMake( 1 *self.rect.size.width, -64) animated:YES];
            break;
    }
}

- (void)segmentSecond {
    //    self.topFriend = @[@"aa"];//测试
    if (self.topFriend.count == 0) {
        UILabel *noWord = [[UILabel alloc] initWithFrame:CGRectMake(self.rect.size.width, 0, self.rect.size.width, self.rect.size.height - 64)];
        noWord.text = @"暂无";
        noWord.font = [UIFont boldSystemFontOfSize:150];
        
        noWord.textAlignment = NSTextAlignmentCenter;
        [self.topScrollView addSubview:noWord];
        
    }else {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(self.rect.size.width / 2 - 20, self.rect.size.height/4);
        layout.minimumInteritemSpacing = 5;//cell之间的最小间距；
        layout.minimumLineSpacing = 5;//整个视图上分区的边距；
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        
        
        UICollectionView *photoShow = [[UICollectionView alloc] initWithFrame:CGRectMake(1* self.rect.size.width, 0, self.rect.size.width, self.rect.size.height - 64) collectionViewLayout:layout];
        photoShow.backgroundColor = [UIColor whiteColor];
        photoShow.dataSource = self;
        
        [self.topScrollView addSubview:photoShow];
        
        
        
        
        [self.view addSubview:self.topScrollView];
        
        [photoShow registerClass:[PhotoAvatCollectionViewCell class] forCellWithReuseIdentifier:collCellIdentifer];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoAvatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collCellIdentifer forIndexPath:indexPath];
    UITapGestureRecognizer *tapImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapController)];
    
    [cell.photoImage addGestureRecognizer:tapImageView];

    return cell;
}

- (void)tapController {
    LastDymnaicController *last = [[LastDymnaicController alloc] init];
    [self.navigationController pushViewController:last animated:YES];
}

- (void)dealloc
{
    self.topFriend = nil;
    self.topScrollView = nil;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.topSegment.selectedSegmentIndex =  scrollView.contentOffset.x / rect.size.width;
    
    
    
    
}



@end
