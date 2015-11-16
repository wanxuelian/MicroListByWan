//
//  CommentModel.m
//  MicroList
//
//  Created by sks on 15/11/5.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel


-(void)setCommentArray:(NSMutableArray *)commentArray {
    if (_commentArray != commentArray) {
        _commentArray = commentArray;
    }
//    [self addObserver:self forKeyPath:@"commentArray" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}






@end

