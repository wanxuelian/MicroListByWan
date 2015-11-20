//
//  TopGTypeModel.m
//  MicroList
//
//  Created by sks on 15/11/16.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "TopGTypeModel.h"

@implementation TopGTypeModel

static TopGTypeModel *topGty = nil;

+ (TopGTypeModel *)sharedTopGTypeModel {
    if (topGty == nil) {
        topGty = [[TopGTypeModel alloc] init];
        topGty.buttonTag = 0;
    }
    return topGty;
}


@end
