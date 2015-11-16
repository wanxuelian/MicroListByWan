//
//  CameraHappyController.m
//  MicroList
//
//  Created by sks on 15/11/10.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CameraHappyController.h"
#import "APTagviewController.h"

#import <HiPhotoFramework/HiPhotoFramework.h>
#import <UIKit/UIKit.h>
#import "CamerasViewController.h"

@interface CameraHappyController ()<APCropImageControllerDelegate,APCameraDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,APMakerViewControllerDelegate,APImageEditorViewControllerDelegate>


@property (nonatomic, strong)APImageEditorViewController * editor;

@end

@implementation CameraHappyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *cameraB = [UIButton buttonWithType:UIButtonTypeSystem];
    cameraB.frame = CGRectMake(0, 100, 50, 100);
    [cameraB setTitle:@"相机" forState:UIControlStateNormal];
    [self.view addSubview:cameraB];
    
    UIButton *albunB = [UIButton buttonWithType:UIButtonTypeSystem];
    albunB.frame = CGRectMake(200, 200, 100, 100);
    [albunB setTitle:@"相册" forState:UIControlStateNormal];
    [albunB addTarget:self action:@selector(albunContr) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:albunB];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)albunContr {
    NSLog(@"相册");
    
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
//        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        [picker setIsSingle:YES];
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:^{
        
    }];

    
    
    
    
//    UIImagePickerController *pickerController = [APAlbum imagePickerControllerWithDelegate:self];
    
//    [self.navigationController presentViewController:pickerController animated:YES completion:^{
//        
//    }];
//        [self presentViewController:pickerController animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *photo = [APAlbum imageWithMediaInfo:info];

   
    APTagviewController *tagViewController = [[APTagviewController alloc] init];
    tagViewController.hiPhotoImage = photo;
    

    
    APImageEditorViewController * editor= [HiPhotoImageSDK hiPhotoFilterManager:photo singal:self];
    [self.navigationController pushViewController:tagViewController animated:YES];

    //    [self presentViewController:editor animated:YES completion:^{
//        
//    }];
        [self dismissViewControllerAnimated:YES completion:nil];

    
}
#pragma mark - cameraPhoto
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{   NSLog(@"选择玩图片");
    
    ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
    [fitler setDelegate:self];
    fitler.currentImage = image;
    [self presentViewController:fitler animated:YES completion:^{
        
    }];
    //    [self presentModalViewController:fitler animated:YES];
}
- (void)imageFitlerProcessDone:(UIImage *)image //图片处理完
{
    imageCameraPhoto.image = image;
    APTagviewController *tagViewController = [[APTagviewController alloc] init];
    tagViewController.hiPhotoImage = image;
    [self.navigationController pushViewController:tagViewController animated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

/*

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"什么时候");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- 标记页面的代理APMakerViewControllerDelegate


- (void)didPostSuceed:(APMakerViewController *)makerViewController{
    NSLog(@"sad");
    
    
    [makerViewController dismiss];
}
- (void)didPostFaild:(APMakerViewController *)makerViewController{
    
    
}

#pragma mark - APImageEditorViewControllerDelegate
- (void)didTapedWapDoneBtnWithImage:(UIImage *) image {
    NSLog(@"%s",__FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
    
    APTagviewController *tagViewController = [[APTagviewController alloc] init];
    tagViewController.hiPhotoImage  = image;
    tagViewController.delegate = self;
//    [self presentViewController:tagViewController animated:YES completion:^{
    
//    }];
    [self.navigationController pushViewController:tagViewController animated:YES];
    
//    [self dismissViewControllerAnimated:YES completion:nil];

    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
