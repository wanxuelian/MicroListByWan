//
//  FunDetailViewController.m
//  MicroList
//
//  Created by sks on 15/10/31.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FunDetailViewController.h"
#import "ShopGoodsCell.h"
#import "TableHeaderView.h"
#import "DropDownListView.h"
#import "PhotoAvatCollectionViewCell.h"
#import "IndustryViewController.h"
#import "FunTransViewController.h"


static NSString *collCellIdentifer = @"funPhotoAvatCell";

@interface FunDetailViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource> {
}


@property (nonatomic, retain)NSMutableArray *chooseArray ;

@property (nonatomic, retain)UIScrollView *shopScroll;

@property (nonatomic, assign)CGRect rect;

@property (nonatomic, retain)UITableView *marketTableView;

@property (nonatomic, retain)UISegmentedControl *topFunSegment;

@end

@implementation FunDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.rect = [[UIScreen mainScreen] bounds];
    
    NSArray *topArray = @[@"榜单列表",@"榜友列表"];
  UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFunMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    self.topFunSegment = [[UISegmentedControl alloc] initWithItems:topArray];
    self.topFunSegment.selectedSegmentIndex = 0;
    [self.topFunSegment addTarget:self action:@selector(switchOver:) forControlEvents:UIControlEventValueChanged];
    [self.navigationController.navigationBar.topItem setTitleView:self.topFunSegment];
    
    
    
    
    [self creatLeftModel];
    [self creatRightModel];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)creatLeftModel {
    self.shopScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.rect.size.width, self.rect.size.height)];
    self.shopScroll.contentSize = CGSizeMake(self.rect.size.width * 2, self.rect.size.height - 64);
    self.shopScroll.pagingEnabled = YES;
    self.shopScroll.delegate = self;
    [self.view addSubview:self.shopScroll];
    
    TableHeaderView *header= [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.rect.size.width * 2 / 3, 35)];
    [self.shopScroll addSubview:header];
    
    
    
    
    self.chooseArray = [NSMutableArray arrayWithArray:@[
                                                        @[@"智能排序",@"人气最高",@"评价最好",@"口味最佳",@"评价最好",@"口味最佳",@"评价最好",@"口味最佳",@"评价最好",@"口味最佳"]
                                                        
                                                        ]];
    
    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(header.frame),0, self.rect.size.width * 1 / 3 , 40) dataSource:self delegate:self];
    dropDownView.mSuperView = self.view;
    
    
    [self.shopScroll addSubview:dropDownView];
    
    self.marketTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(header.frame) + 2, self.rect.size.width,  self.rect.size.height - 64 - header.frame.size.height) style:UITableViewStylePlain];
    self.marketTableView.dataSource = self;
    self.marketTableView.delegate = self;
    [self.shopScroll addSubview:self.marketTableView];
    
    
}
- (void)creatRightModel {
    
    
    
    self.chooseArray = [NSMutableArray arrayWithArray:@[
  @[@"智序",@"高",@"好",@"口味最佳",@"评价最好",@"口味最佳",@"评最好",@"口味最佳",@"评价最好",@"口味最佳"]]];
    
    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(self.shopScroll.contentSize.width * 1/ 2,0, self.rect.size.width * 1 / 3 , 40) dataSource:self delegate:self];
    dropDownView.mSuperView = self.view;
    [self.shopScroll addSubview:dropDownView];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(self.rect.size.width / 2 - 20, self.rect.size.height/4);
    layout.minimumInteritemSpacing = 5;//cell之间的最小间距；
    layout.minimumLineSpacing = 5;//整个视图上分区的边距；
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    
    
    UICollectionView *photoShow = [[UICollectionView alloc] initWithFrame:CGRectMake( self.rect.size.width, 40, self.rect.size.width, self.rect.size.height - 64) collectionViewLayout:layout];
    photoShow.backgroundColor = [UIColor whiteColor];
    photoShow.dataSource = self;
    
    
    [photoShow registerClass:[PhotoAvatCollectionViewCell class] forCellWithReuseIdentifier:collCellIdentifer];
    
    [self.shopScroll addSubview:photoShow];
    
    
    
    
    
    
    
}
- (void)switchOver:(UISegmentedControl *)aSegmentedControl{
    switch (aSegmentedControl.selectedSegmentIndex) {
        case 0:
            [self.shopScroll setContentOffset:CGPointMake( 0 *self.rect.size.width, -64) animated:YES];
            break;
            
        default:
            [self.shopScroll setContentOffset:CGPointMake( 1 *self.rect.size.width, -64) animated:YES];
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backFunMainController {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc {
    self.shopScroll = nil;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.topFunSegment.selectedSegmentIndex =  scrollView.contentOffset.x / rect.size.width;

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNib:[UINib nibWithNibName:@"ShopGoodsCell" bundle:nil] forCellReuseIdentifier:@"ShopGoodsCell"];
    ShopGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopGoodsCell" forIndexPath:indexPath];
    [cell.brand addTarget:self action:@selector(controllerView) forControlEvents:UIControlEventTouchUpInside];
    
    
    cell.selectionStyle = NO;
    
    return cell;
}

-(void)controllerView {
    FunTransViewController *indust = [[FunTransViewController alloc] init];
    [self.navigationController pushViewController:indust animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 122;
    
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark -- dropDownListDelegate
-(void) chooseAtSection:(NSInteger)section index:(NSInteger)index
{
    NSLog(@"童大爷选了section:%ld ,index:%ld",(long)section,(long)index);
}

#pragma mark -- dropdownList DataSource
-(NSInteger)numberOfSections
{
    return [self.chooseArray count];
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *arry =self.chooseArray[section];
    return [arry count];
}
-(NSString *)titleInSection:(NSInteger)section index:(NSInteger) index
{
    return self.chooseArray[section][index];
}
-(NSInteger)defaultShowSection:(NSInteger)section
{
    return 0;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoAvatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collCellIdentifer forIndexPath:indexPath];
    UITapGestureRecognizer *tapImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(funTapController)];
    
    [cell.photoImage addGestureRecognizer:tapImageView];
    
    return cell;
}

- (void)funTapController {
    FunTransViewController *indust = [[FunTransViewController alloc] init];
    [self.navigationController pushViewController:indust animated:YES];
}

@end
