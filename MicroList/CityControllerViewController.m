//
//  travelViewController.m
//  MicroList
//
//  Created by Mac on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CityControllerViewController.h"
#import "ArderPortViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface CityControllerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSDictionary *city;
@property(nonatomic,strong)NSArray *pro;

@end

@implementation CityControllerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backFunMainController)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self _loadTableView];
    
}

- (void)_loadTableView{
    
    
    //1.创建表示图
    UITableView *tabeleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];

    //2.设置数据代理
    tabeleView.delegate = self;
    tabeleView.dataSource = self;
    
    //3.添加到主视图
    [self.view addSubview:tabeleView];
    
    //加载plist文件
    //读取城市的字典
    self.city = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
    //读取省份
    self.pro = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil]];
    
    
    
    
    
}


#pragma mark - 代理方法的实现

//1.组的数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.pro.count;
}


//2.单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //得到每一个省份
    NSString *p = self.pro[section];
    //通过身份获取字典中城市数组
    NSArray *arr = self.city[p];
    
    return arr.count;
}

//3.创建单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //得到每个省份
    NSString *p = self.pro[indexPath.section];
    //    NSLog(@"%@",indexPath);
    //得到每个城市
    NSArray *arr = self.city[p];
    
    cell.selectionStyle = NO;
    
    //解析数据源
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}

//设置头视图的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.pro[section];
}
//设置右侧的索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.pro;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ArderPortViewController *arderConA = [[ArderPortViewController alloc] init];
    UINavigationController *arderNa = [[UINavigationController alloc] initWithRootViewController:arderConA];
    arderNa.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:arderNa animated:YES completion:^{
        
    }];
}



#pragma mark -- Button Action
- (void)backFunMainController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
