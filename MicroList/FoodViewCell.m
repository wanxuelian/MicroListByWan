//
//  FoodViewCell.m
//  MicroList
//
//  Created by sks on 15/11/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "FoodViewCell.h"
#import "FoodScrollView.h"

#import "ClassFoodModel.h"

#import "FigureClassModel.h"

@implementation FoodViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect =[[UIScreen mainScreen] bounds];
        self.scView = [[FoodScrollView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 140)];
        
        [self addSubview:self.scView];
    }
    return self;
    
}




-(void)setClassModelFood:(ClassFoodModel *)classModelFood {
    if (_classModelFood == classModelFood) {
        _classModelFood = classModelFood;
        
    }

    
//    self.scView.classLabel.text = aar[0];
    self.scView.array = @[@"sss", @"aa", @"", @"", @"", @"", @"", @""];
    self.scView.foodArray = @[@"fire0"];
    
    
    
    
    
}

- (void)setFigureModel:(FigureClassModel *)figureModel {
    if (_figureModel == figureModel) {
        _figureModel = figureModel;
        
    }
    self.scView.array = @[@"sss", @"aa", @"", @"", @"", @"", @"", @""];
//    self.scview.foodArray = @[]
}


@end
