//
//  MainsViewController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/14.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MainsViewController.h"
#import "PhotoTableViewCell.h"
#import "FoodViewControll.h"
#import "ShopTableViewController.h"
#import "FunPlayTableController.h"
#import "HotTopCell.h"
#import "DymnaicCell.h"
#import "TopTableCell.h"
#import "SementImageCell.h"
#import "ArderMainViewController.h"
#import "TopRingViewController.h"
#import "travelViewController.h"
#import "MyViewController.h"
#import "IndustryViewController.h"
#import "FigureMainViewController.h"
#import "MovieViewController.h"
#import "CommentTableViewController.h"
#import "CarTableViewController.h"
#import "TopCoilAllViewController.h"
#import "TopFriendViewController.h"
#import "ServiceViewController.h"
#import "BrandViewController.h"
@interface MainsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGRect rect;

@end

@implementation MainsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.rect = [[UIScreen mainScreen] bounds];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:nil tag:306];
    self.listMain = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.rect.size.width, self.rect.size.height - 64) style:UITableViewStylePlain];
    
    self.listMain.backgroundColor = [UIColor whiteColor];
    self.listMain.delegate = self;
    self.listMain.dataSource = self;
    
    [self.view addSubview:self.listMain];
    
}



#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (indexPath.row == 0) {
        return 153;
    }else if (indexPath.row == 1) {
        return 76;
    }else if (indexPath.row == 2) {
        return 180;
    }else if (indexPath.row == 3) {
        return 150;
    }else {
        return 400;
    }
    
    
}


#pragma mark - UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (indexPath.row == 0) {
        [self.listMain registerNib:[UINib nibWithNibName:@"TopTableCell" bundle:nil] forCellReuseIdentifier:@"TopTableCell"];
        TopTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopTableCell" forIndexPath:indexPath];
        [cell.foodTop addTarget:self action:@selector(foodHist) forControlEvents:UIControlEventTouchUpInside];
        [cell.shopTop addTarget:self action:@selector(shopGoods) forControlEvents:UIControlEventTouchUpInside];
        [cell.funTop addTarget:self action:@selector(funPlay) forControlEvents:UIControlEventTouchUpInside];
        [cell.arderTop addTarget:self action:@selector(arderPlay) forControlEvents:UIControlEventTouchUpInside];
        [cell.figureTop addTarget:self action:@selector(figurePlay) forControlEvents:UIControlEventTouchUpInside];
        [cell.tradeTop addTarget:self action:@selector(industryHist) forControlEvents:UIControlEventTouchUpInside];
        [cell.travelTop addTarget:self action:@selector(travelpaly) forControlEvents:UIControlEventTouchUpInside];
        [cell.movieTop addTarget:self action:@selector(moviePlay) forControlEvents:UIControlEventTouchUpInside];
        [cell.nineTop addTarget:self action:@selector(ninePlay) forControlEvents:UIControlEventTouchUpInside];
        [cell.tenTop addTarget:self action:@selector(tenPlay) forControlEvents:UIControlEventTouchUpInside];

        
        cell.selectionStyle = NO;
        return cell;
        
    }else if (indexPath.row == 1) {
        [self.listMain registerNib:[UINib nibWithNibName:@"SementImageCell" bundle:nil] forCellReuseIdentifier:@"SementImageCell"];
        SementImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SementImageCell" forIndexPath:indexPath];
        cell.selectionStyle = NO;
        return cell;
    }
    else if (indexPath.row == 2) {
        [self.listMain registerNib:[UINib nibWithNibName:@"PhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhotoTableViewCell"];
        PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoTableViewCell" forIndexPath:indexPath];
       cell.selectionStyle = NO;
        [cell.allTop addTarget:self action:@selector(pushTopCoil) forControlEvents:UIControlEventTouchUpInside];
        cell.carImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCarController)];
        
        [cell.carImage addGestureRecognizer:tapImageView];
        
        return cell;
    }
    else if (indexPath.row == 3) {
        [self.listMain registerNib:[UINib nibWithNibName:@"HotTopCell" bundle:nil] forCellReuseIdentifier:@"HotTopCell"];
        HotTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotTopCell" forIndexPath:indexPath];
        [cell.fourTopFive addTarget:self action:@selector(pushAvater) forControlEvents:UIControlEventTouchUpInside];
        [cell.fourCellOneB addTarget:self action:@selector(pushAvater) forControlEvents:UIControlEventTouchUpInside];
        [cell.fourTopFourB addTarget:self action:@selector(pushAvater) forControlEvents:UIControlEventTouchUpInside];
        [cell.fourTopThreeFriendB addTarget:self action:@selector(pushAvater) forControlEvents:UIControlEventTouchUpInside];
        [cell.fourTopFriendB addTarget:self action:@selector(pushAvater) forControlEvents:UIControlEventTouchUpInside];
        [cell.allFriendB addTarget:self action:@selector(pushAllFriendToday) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = NO;
        return cell;

        }
    else  {
        static NSString *cellIdentife = @"DymnaicCell";
        
        DymnaicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentife];
        if (cell == nil) {
            cell = [[DymnaicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentife] ;
            
        }
        [cell.photoAvat setBackgroundImage:[UIImage imageNamed:@"picture7"] forState:UIControlStateNormal];
        cell.photoName.text = @"风铃";
        [cell.topTabel setBackgroundImage:[UIImage imageNamed:@"girlAvater"] forState:UIControlStateNormal];
        cell.imageScenery.image = [UIImage imageNamed:@"picture12"];
        cell.selectionStyle = NO;
        return cell;
    }


    
    
    
}

- (void)pushAllFriendToday {
    TopFriendViewController *topFriend = [[TopFriendViewController alloc] init];
    [self.navigationController pushViewController:topFriend animated:YES];
}


- (void)tapCarController {
    CarTableViewController *car = [[CarTableViewController alloc] init];
    [self.navigationController pushViewController:car animated:YES];
}

- (void)pushTopCoil {
    TopCoilAllViewController *topCon = [[TopCoilAllViewController alloc] init];
    [self.navigationController pushViewController:topCon animated:YES];
}

- (void)pushAvater {
    MyViewController *myView = [[MyViewController alloc] init];
    UINavigationController *myNa = [[UINavigationController alloc] initWithRootViewController:myView]
    ;
    [self presentViewController:myNa animated:YES completion:^{
        
    }];
    
}

- (void)foodHist {
    FoodViewControll *foodConr = [[FoodViewControll alloc] init];
    UINavigationController *foodNa = [[UINavigationController alloc] initWithRootViewController:foodConr];
    [self presentViewController:foodNa animated:YES completion:^{
        
    }];
}

- (void)industryHist{
    IndustryViewController *industContr = [[IndustryViewController alloc] init];
    UINavigationController *industNa = [[UINavigationController alloc] initWithRootViewController:industContr];
    [self presentViewController:industNa animated:YES completion:^{
        
    }];
    
}
- (void)shopGoods {
    ShopTableViewController *shopContr = [[ShopTableViewController alloc] init];
    UINavigationController *shopNa = [[UINavigationController alloc] initWithRootViewController:shopContr];
    [self presentViewController:shopNa animated:YES completion:^{
        
    }];
}

- (void)funPlay {
    FunPlayTableController *funContr = [[FunPlayTableController alloc] init];
    UINavigationController *funNa = [[UINavigationController alloc] initWithRootViewController:funContr];
    [self presentViewController:funNa animated:YES completion:^{
        
        
    }];

}

- (void)arderPlay{
    ArderMainViewController *arderContr = [[ArderMainViewController alloc] init];
    UINavigationController *arderNa =[[UINavigationController alloc] initWithRootViewController:arderContr];
    [self presentViewController:arderNa animated:YES completion:^{
        
    }];
    
}

- (void)figurePlay {
    FigureMainViewController *figureContr = [[FigureMainViewController alloc] init];
    UINavigationController *figureNa = [[UINavigationController alloc] initWithRootViewController:figureContr];
    [self presentViewController:figureNa animated:YES completion:^{
        
    }];
    
}

- (void)travelpaly {
    travelViewController *travel = [[travelViewController alloc] init];
    UINavigationController *travelcon = [[UINavigationController alloc] initWithRootViewController:travel];
    [self presentViewController:travelcon animated:YES completion:nil];
    
}

- (void)moviePlay {
    MovieViewController *movie = [[MovieViewController alloc] init];
    UINavigationController *movieNa = [[UINavigationController alloc] initWithRootViewController:movie];
    [self presentViewController:movieNa animated:YES completion:nil];
}

- (void)ninePlay{

    ServiceViewController *movie = [[ServiceViewController alloc] init];
    UINavigationController *movieNa = [[UINavigationController alloc] initWithRootViewController:movie];
    [self presentViewController:movieNa animated:YES completion:nil];


}

- (void)tenPlay{

    BrandViewController *movie = [[BrandViewController alloc] init];
    UINavigationController *movieNa = [[UINavigationController alloc] initWithRootViewController:movie];
    [self presentViewController:movieNa animated:YES completion:nil];

}





#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= 4) {
        CommentTableViewController *foodTrans = [[CommentTableViewController alloc] init];
        [self.navigationController pushViewController:foodTrans animated:YES];

    }
    
}







@end
