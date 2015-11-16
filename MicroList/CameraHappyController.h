//
//  CameraHappyController.h
//  MicroList
//
//  Created by sks on 15/11/10.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomImagePickerController.h"
#import "ImageFilterProcessViewController.h"


@interface CameraHappyController : UIViewController<CustomImagePickerControllerDelegate,ImageFitlerProcessDelegate>
{
    UIImageView *imageCameraPhoto;
}



@end
