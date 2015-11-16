//
//  HiPhotoImageSDK.h
//  HiPhotoImageFramework
//
//  Created by JerryChui on 6/25/15.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APImageEditor.h"

#import "APImageEditorViewController.h"

@interface HiPhotoImageSDK : NSObject


/**
 *  @brief  图片编辑注册
 *  @param appKey 官方appKey
 *  @since 1.2
 */
+ (void)registImageSDKWithAPPKey:(NSString *)appKey;
/**
 *  @brief  图片编辑
 *  @param image 待编辑的图片
 *  @param delegate APImageEditorDelegate 代理
 *  @return APImageEditor
 *  @since 1.2
 */
+ (APImageEditor *)hiPhotoImageEditorManager:(UIImage *)image delegate:(id<APImageEditorDelegate>)delegate;


+ (APImageEditorViewController *)hiPhotoFilterManager:(UIImage *)image singal:(id<APImageEditorViewControllerDelegate>) singal;

+ (APImageEditorViewController *)hiPhotoAdjustManager:(UIImage *)image singal:(id<APImageEditorViewControllerDelegate>) singal;



@end













