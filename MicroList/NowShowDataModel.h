//
//  NowShowDataModel.h
//  MicroList
//
//  Created by sks on 15/11/20.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APImgModel;

@interface NowShowDataModel : NSObject

@property (nonatomic, strong)APImgModel *imgModel;//图像

@property (nonatomic, strong)NSArray *textNowModelArray;

@property (nonatomic, strong)NSMutableArray *audioNowModelArray;

@property (nonatomic, strong)NSMutableArray *locationModelArray;

@property (nonatomic, strong)NSString *sidOdd;



@end
