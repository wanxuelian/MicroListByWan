//
//  photoModel.h
//  MicroList
//
//  Created by sks on 15/11/18.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface photoModel : NSObject

@property (nonatomic, assign)NSInteger tagPhoto;

+ (photoModel *)sharedPhotoModel;

@end
