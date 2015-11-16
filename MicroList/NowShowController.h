//
//  NowShowController.h
//  MicroList
//
//  Created by Mac on 15/10/28.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomImagePickerController.h"
#import "ImageFilterProcessViewController.h"


@interface NowShowController : UIViewController<ImageFitlerProcessDelegate>
{
    UIImageView *imageCameraPhoto;
}

@end
