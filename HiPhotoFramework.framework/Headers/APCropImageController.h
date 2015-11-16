//
//  APCropImageController.h
//  HiPhotoFramework
//
//  Created by JerryChui on 4/27/15. Email:strawcrop@qq.com
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APCropImageControllerDelegate <NSObject>

- (void)cropImage:(UIImage*)cropImage forOriginalImage:(UIImage*)originalImage;

@end

@interface APCropImageController : UIViewController


@property(nonatomic,strong) UIImage *image;//本地图片

@property(nonatomic,strong) NSURL *imageURL;//网路图片

@property(nonatomic,weak) id<APCropImageControllerDelegate> delegate;

//截取比例，宽高比
@property(nonatomic,assign) CGFloat ratioOfWidthAndHeight;

- (void)showWithAnimation:(BOOL)animation;

@end
