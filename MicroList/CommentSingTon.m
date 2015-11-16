//
//  CommentSingTon.m
//  MicroList
//
//  Created by sks on 15/11/5.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CommentSingTon.h"

@implementation CommentSingTon

static CommentSingTon *comSingTon;


+ (CommentSingTon *)sharedDataBaseCommentSingTon {
    
    if (comSingTon == nil) {
        comSingTon = [[CommentSingTon alloc] init];
        comSingTon.comArrayTon = [NSMutableArray arrayWithCapacity:0];
        
    }
    
    return comSingTon;
}



@end
