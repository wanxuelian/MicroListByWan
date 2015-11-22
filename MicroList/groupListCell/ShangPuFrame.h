//
//  ShangPuFrame.h
//  MyDemos
//
//  Created by Michael on 15-11-10.
//  Copyright (c) 2015年 liguilong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GroupListModel.h"
@interface ShangPuFrame : NSObject


@property(nonatomic,assign)CGRect iconF;
 /**
  *  vip图标的frame
  */
 @property(nonatomic,assign)CGRect vipF;
 /**
  *  微博昵称的frame
  */
 @property(nonatomic,assign)CGRect nameF;
 /**
  *  配图的frame
  */
@property(nonatomic,assign)CGRect pictureF;
/**
  *  正文的frame
  */
@property(nonatomic,assign)CGRect textF;
/**
  *  行高
  */
@property(nonatomic,assign)CGFloat cellHight;

@property(nonatomic,assign)CGFloat cellWidth;

/**
  *  设置一个shangPu型的属性，用来接收模型
  */

@property(nonatomic,strong) GroupListModel  *shangPu;

@end
