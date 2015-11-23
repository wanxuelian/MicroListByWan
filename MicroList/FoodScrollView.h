//
//  FoodScrollView.h
//  MicroList
//
//  Created by sks on 15/11/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TermCellDelegate <NSObject>

- (void)choseTerm:(UIButton *)button;

@end




@interface FoodScrollView : UIView

@property (nonatomic, strong)UILabel *classLabel;

@property (nonatomic, strong)UIScrollView *scrollNameButton;

@property (nonatomic, strong)UIButton *allButton;

@property (nonatomic, strong)NSArray *array; //label的名字数组

@property (nonatomic, strong)NSArray *foodArray;//图片数组

@property (nonatomic, strong) id<TermCellDelegate>delegate;







@end
