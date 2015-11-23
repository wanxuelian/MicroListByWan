//
//  FoodViewCell.h
//  MicroList
//
//  Created by sks on 15/11/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoodScrollView;

@class ClassFoodModel;

@class FigureClassModel;

@interface FoodViewCell : UITableViewCell

@property (nonatomic, strong)FoodScrollView *scView;


@property (nonatomic, strong)ClassFoodModel *classModelFood;

@property (nonatomic, strong)UILabel *Lsssssss;

@property (nonatomic, strong)FigureClassModel *figureModel;//存储人物数据模型



@end
