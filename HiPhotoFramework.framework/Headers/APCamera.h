//
//  APCamera.h
//  HiPhotoFramework
//
//  Created by JerryChui on 4/27/15. Email:strawcrop@qq.com
//  Copyright (c) 2015 Appsoon. All rights reserved.

@import Foundation;
@import AVFoundation;
@import UIKit;


#define kAPCameraOptionSaveImageToAlbum @"APCameraOptionSaveImageToAlbum"

@protocol APCameraDelegate;



@interface APCamera : NSObject

+ (instancetype)new __attribute__
((unavailable("[+new] is not allowed, use [+cameraWithRootView:andCaptureView:]")));

- (instancetype) init __attribute__
((unavailable("[-init] is not allowed, use [+cameraWithRootView:andCaptureView:]")));

+ (instancetype)cameraWithFlashButton:(UIButton *)flashButton;
+ (instancetype)cameraWithFlashButton:(UIButton *)flashButton devicePosition:(AVCaptureDevicePosition)devicePosition;

+ (void)setOption:(NSString*)option value:(id)value;
+ (id)getOption:(NSString*)option;

- (void)startRunning;
- (void)stopRunning;

- (AVCaptureVideoPreviewLayer *)previewLayer;
- (AVCaptureStillImageOutput *)stillImageOutput;

- (void)insertSublayerWithCaptureView:(UIView *)captureView atRootView:(UIView *)rootView;

- (void)disPlayGridView;

- (void)changeFlashModeWithButton:(UIButton *)button;

- (void)focusView:(UIView *)focusView inTouchPoint:(CGPoint)touchPoint;

- (void)takePhotoWithCaptureView:(UIView *)captureView
                videoOrientation:(AVCaptureVideoOrientation)videoOrientation
                        cropSize:(CGSize)cropSize
                      completion:(void (^)(UIImage *))completion;

- (void)toogleWithFlashButton:(UIButton *)flashButton;

@end



@protocol APCameraDelegate <NSObject>

- (void)cameraDidCancel;
- (void)cameraDidSelectAlbumPhoto:(UIImage *)image;
- (void)cameraDidTakePhoto:(UIImage *)image;

@optional

- (void)cameraDidSavePhotoWithError:(NSError *)error;
- (void)cameraDidSavePhotoAtPath:(NSURL *)assetURL;
- (void)cameraWillTakePhoto;


@end