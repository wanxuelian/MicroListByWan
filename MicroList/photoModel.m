//
//  photoModel.m
//  MicroList
//
//  Created by sks on 15/11/18.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "photoModel.h"

@implementation photoModel

static photoModel *photoTag = nil;
+ (photoModel *)sharedPhotoModel {
    if (photoTag == nil) {
        photoTag = [[photoModel alloc] init];
        photoTag.tagPhoto = 0;
    }
    return photoTag;
   
}


@end
