//
//  CommentSingTon.h
//  MicroList
//
//  Created by sks on 15/11/5.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentSingTon : NSObject


@property (nonatomic, strong)NSMutableArray *comArrayTon;

+ (CommentSingTon *)sharedDataBaseCommentSingTon;
    


@end
