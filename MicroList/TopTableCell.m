//
//  TopTableCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/15.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopTableCell.h"

#import "travelViewController.h"

@implementation TopTableCell

- (void)awakeFromNib {
    // Initialization code
    
    
    [self.foodTop setBackgroundImage:[UIImage imageNamed:@"foodIcon"] forState:UIControlStateNormal];
    [self.shopTop setBackgroundImage:[UIImage imageNamed:@"shopIcon"] forState:UIControlStateNormal];
    [self.funTop setBackgroundImage:[UIImage imageNamed:@"funIcon7"] forState:UIControlStateNormal];
    [self.arderTop setBackgroundImage:[UIImage imageNamed:@"arderIcon9"] forState:UIControlStateNormal];
    [self.travelTop setBackgroundImage:[UIImage imageNamed:@"traveiIcon4"] forState:UIControlStateNormal];
    [self.tradeTop setBackgroundImage:[UIImage imageNamed:@"arderIcon8"] forState:UIControlStateNormal];
    
    [self.figureTop setBackgroundImage:[UIImage imageNamed:@"figreIcon5"] forState:UIControlStateNormal];
    [self.movieTop setBackgroundImage:[UIImage imageNamed:@"movieIcon1"] forState:UIControlStateNormal];
    [self.nineTop setBackgroundImage:[UIImage imageNamed:@"movieIcon1"] forState:UIControlStateNormal];
    [self.tenTop setBackgroundImage:[UIImage imageNamed:@"movieIcon1"] forState:UIControlStateNormal];
    
    
}








- (IBAction)nineTop:(UIButton *)sender {
}
@end
