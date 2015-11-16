//
//  CameraPhotoController.m
//  MicroList
//
//  Created by sks on 15/11/7.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CameraPhotoController.h"

@interface CameraPhotoController ()<UITextViewDelegate>


@property (nonatomic, strong)UITextView *sheerTextView;

@property (nonatomic, strong)UITextView *writeField;

@end



@implementation CameraPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    imageCameraPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(50, 68, rect.size.width * 3 / 4 , (rect.size.height  - 64 )* 4 / 5)];
    imageCameraPhoto.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:imageCameraPhoto];
    
   /*
    self.writeField = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageCameraPhoto.frame), rect.size.width, 100)];
    self.sheerTextView.text = @"sdsnafjnajofnosanfosanfioa";
    self.writeField.backgroundColor = [UIColor whiteColor];
//    writeField.delegate = self;

    [self.view addSubview:self.writeField];
    
    self.sheerTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageCameraPhoto.frame), rect.size.width, 100)];
    //    writeField.placeholder = @"写点什么";  表层
    self.sheerTextView.alpha = 0;
    self.sheerTextView.delegate = self;

    [self.sheerTextView setHidden:YES];
    self.sheerTextView.backgroundColor = [UIColor colorWithRed:0.878 green:0.886 blue:0.902 alpha:1.000];
    
    [self.view addSubview:self.sheerTextView];
    */
    
    
    
    
    
    UIButton * buttonCamera = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonCamera setBackgroundImage:[UIImage imageNamed:@"icon6"] forState:UIControlStateNormal];
//    [buttonCamera setTitle:@"相机" forState:UIControlStateNormal];
    buttonCamera.frame  = CGRectMake(20 , CGRectGetMaxY(imageCameraPhoto.frame), 70, 50);;
//    [buttonCamera setBackgroundImage:[UIImage imageNamed:@"1"]  forState:UIControlStateNormal];
    [buttonCamera addTarget:self action:@selector(buttonCameraPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonCamera];
    
    
    UIButton *buttonDone = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonDone.frame = CGRectMake(CGRectGetMaxX(buttonCamera.frame) + 1, CGRectGetMaxY(imageCameraPhoto.frame), 80, 50);
    buttonDone.backgroundColor = [UIColor colorWithRed:0.844 green:1.000 blue:0.965 alpha:1.000];
    [buttonDone setTitle:@"完成" forState:UIControlStateNormal];
    [buttonDone addTarget:self action:@selector(doneComment) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDone];
    
    /*
    UIBarButtonItem *doneB = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneComment)];
    self.navigationItem.rightBarButtonItem = doneB;
    
    
    */
    
    // Do any additional setup after loading the view.
}
- (void)doneComment {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonCameraPhoto {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        [picker setIsSingle:YES];
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

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

}

#pragma mark - UITextViewDelegate

//通过判断表层TextView的内容来实现底层TextView的显示于隐藏


    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Ge
 t the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
