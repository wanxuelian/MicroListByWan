//
//  HiPhotoSDK.h
//  HiPhotoFramework
//
//  Created by JerryChui on 6/3/15.Email:strawcrop@qq.com
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APCropImageController.h"

#import "APCamera.h"

#import "APCameraNavigationController.h"

#import "APMakerViewController.h"




@interface HiPhotoSDK : NSObject

/*
 初始化SDK
 获取appKey 请上官网
 */
+ (void)registSDKWithAPPKey:(NSString *)appKey;


/*
 获取图片剪切方法
 @pragrams delegate 切图代理
 */

+(APCropImageController *)cropImageManager:(id<APCropImageControllerDelegate>)delegate;

/*
 *相册组件
 *获取相册里的图片
 *@params delegate 选择图片代理
 */
+(UIImagePickerController *)imgePickerManager:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate;

/*
 *相机组件
 *
 *@params delegate 相机照片代理
 */
+(APCameraNavigationController *)cameraManager:(id<APCameraDelegate>)delegate;


/**
 *  @brief  图片标记页面
 *  @param delegate 图片标记页面代理
 *  @param tagPhoto 需要打标签的图片
 *  @return 返回APMakerViewController
 *  @since 1.0
 */
+(APMakerViewController *)makerTagManager:(id<APMakerViewControllerDelegate>)delegate tagPhoto:(UIImage *)tagPhoto;


@end








