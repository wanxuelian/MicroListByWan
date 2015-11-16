//
//  PhotoViewController.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/22.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()<UIActionSheetDelegate>

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cameraButton.frame = CGRectMake(80, 500, 80, 40);
    [cameraButton setTitle:@"相机" forState:UIControlStateNormal];
    cameraButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [cameraButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    cameraButton.backgroundColor = [UIColor greenColor];
    cameraButton.layer.cornerRadius = 10.0;
    cameraButton.layer.masksToBounds = YES;
    [cameraButton addTarget:self action:@selector(cameraButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cameraButton];
    
    UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeSystem];
    photoButton.frame = CGRectMake(215, 500, 80, 40);
    [photoButton setTitle:@"相册" forState:UIControlStateNormal];
    photoButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [photoButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    photoButton.backgroundColor = [UIColor greenColor];
    photoButton.layer.cornerRadius = 10.0;
    photoButton.layer.masksToBounds = YES;
    [photoButton addTarget:self action:@selector(photoButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoButton];
}

- (void)photoButtonAction
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //选择资源类型，有3种类型
    //1.SavedPhotosAlbum
    //2.camrea
    //3.PhotoLibrary
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //设置代理，要遵守两个协议 UIImagePickerControllerDelegate , UINavigationControllerDelegate
    imagePicker.delegate = self;
    //跳转模式4种
    imagePicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //是否允许对图片进行编辑 , 改为NO，则选择图片时不能进行放缩, 显然默认为NO
    imagePicker.allowsEditing = YES;
    //进入到相册页面
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)cameraButtonAction
{
    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照", @"从相册选择", nil];
    }
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 200;
    
    [sheet showInView:self.view];
}

#pragma mark - UIImagePickerControllerDelegate

//选择图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //    UIImagePickerControllerOriginalImage   //原图片
    //    UIImagePickerControllerEditedImage    //编辑后的图片
    
    //把图片添加到imageView上进行显示
    self.imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

//取消选择
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 200) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    return;
                case 1: //相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 2: //相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}



@end
