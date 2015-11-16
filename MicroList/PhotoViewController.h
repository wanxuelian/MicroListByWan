//
//  PhotoViewController.h
//  MicroList
//
//  Created by 黄相杰 on 15/10/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController<UIImagePickerControllerDelegate , UINavigationControllerDelegate , UIScrollViewDelegate>

@property (nonatomic , retain) UIImageView *imageView;


@end
