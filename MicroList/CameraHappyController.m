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
#import "TopGTypeModel.h"
#import "PhotoSelect.h"
#import "photoModel.h"

#define tabBarHeight 49
#define buttonHight (rect.size.height - 64 - 49) * 1 / 4
#define buttonWidth rect.size.width * 1 / 3

@interface CameraHappyController ()<APCropImageControllerDelegate,APCameraDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,APMakerViewControllerDelegate,APImageEditorViewControllerDelegate>


@property (nonatomic, strong)APImageEditorViewController * editor;

@property (strong,nonatomic)UIButton * tmpBtn;

@property (nonatomic, strong)UIButton *buttonLift;

@property (nonatomic, strong)UIButton *buttonRight;

@property (nonatomic, assign)BOOL exchange;

@property (nonatomic, assign)BOOL judge;//总体判断

@property (nonatomic, assign)NSInteger tagButt;

@end

@implementation CameraHappyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatPhotoButton];
    
   /* UIButton *cameraB = [UIButton buttonWithType:UIButtonTypeSystem];
    cameraB.frame = CGRectMake(0, 100, 50, 100);
    [cameraB setTitle:@"相机" forState:UIControlStateNormal];
    [self.view addSubview:cameraB];
    
    UIButton *albunB = [UIButton buttonWithType:UIButtonTypeSystem];
    albunB.frame = CGRectMake(200, 200, 100, 100);
    [albunB setTitle:@"相册" forState:UIControlStateNormal];
    [albunB addTarget:self action:@selector(albunContr) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:albunB];*/
    
    
   
    
    
    
    
    // Do any additional setup after loading the view.

}

    
    
- (void)buttonSelected:(UIButton *)sender{
        if (_tmpBtn == nil){
            sender.selected = YES;
            _tmpBtn = sender;
        }
        else if (_tmpBtn !=nil && _tmpBtn == sender){
            sender.selected = YES;
            
        }
        else if (_tmpBtn!= sender && _tmpBtn!=nil){
            _tmpBtn.selected = NO;
            sender.selected = YES;
            _tmpBtn = sender;
        }
        
        
    }
    
    
- (void)creatPhotoButton {
    //12个按钮
    CGRect rect = [[UIScreen mainScreen] bounds];
    static int s = 0;
    
    int b = 0;
//    UIButton *butt = [UIButton buttonWithType:UIButtonTypeSystem];
    


    for (int i = 0; i < 3; i++) {
        
        for (int a = 0; a < 3; a++) {
            //10个按钮
            PhotoSelect *buttonSelect = [[PhotoSelect alloc] init];
            
            [self addObserver:self forKeyPath:@"buttonSelect" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
            
            buttonSelect.frame = CGRectMake( ( a * (rect.size.width * 1 / 3)) , i * (rect.size.height - 64 - 49)  * 1 / 4 + 64, rect.size.width * 1 / 3, (rect.size.height - 64 - 49) * 1 / 4 );
            buttonSelect.tag = 300 +s;
            buttonSelect.imageTop.image = [UIImage imageNamed:[NSString stringWithFormat:@"camaers%d", s]];
            buttonSelect.photoBool = YES;
            

            [buttonSelect.buttonSelect addTarget:self action:@selector(exchangePhoto:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:buttonSelect];
            
            s++;
            b++;
            
        }
        
        
    }
    
    self.buttonLift = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonLift.frame = CGRectMake(0,  buttonHight * 3 + 64, buttonWidth, buttonHight);
     self.buttonLift.backgroundColor = [UIColor colorWithRed:0.000 green:0.874 blue:0.000 alpha:1.000];
    [self.buttonLift addTarget:self action:@selector(buttonLiftPush) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonLift setBackgroundImage:[UIImage imageNamed:@"相机photo"] forState:UIControlStateNormal];
    [self.buttonLift setTitle:@"相机" forState:UIControlStateNormal];
    [self.view addSubview:self.buttonLift];
    
    PhotoSelect *buttonCenter = [[PhotoSelect alloc] init];
    buttonCenter.frame = CGRectMake(buttonWidth, buttonHight * 3 +64, buttonWidth, buttonHight);
    buttonCenter.backgroundColor = [UIColor colorWithRed:0.000 green:0.874 blue:0.000 alpha:1.000];
    buttonCenter.imageTop.image = [UIImage imageNamed:@"camaers9"];
    [buttonCenter.buttonSelect addTarget:self action:@selector(exchangePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonCenter];
    
    self.buttonRight = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonRight.frame = CGRectMake(buttonWidth * 2, buttonHight * 3 +64, buttonWidth, buttonHight);
    [self.buttonRight setTitle:@"相册" forState:UIControlStateNormal];
    self.buttonRight.backgroundColor = [UIColor colorWithRed:0.000 green:0.874 blue:0.000 alpha:1.000];
    [self.buttonRight setBackgroundImage:[UIImage imageNamed:@"相册photo"] forState:UIControlStateNormal];
    [self.buttonRight addTarget:self action:@selector(camaerPushRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonRight];
    
    
    
  
}
- (void)exchangePhoto:(UIButton *)button {
    photoModel *phoModelTag = [photoModel sharedPhotoModel];

    if (self.judge == NO || phoModelTag.tagPhoto == (long)button.tag) {
        self.tagButt = (long)button.tag;
        
        phoModelTag.tagPhoto = self.tagButt;
        
        if (self.exchange == NO ) {
            [button setBackgroundImage:[UIImage imageNamed:@"icon_image_yes@3x"] forState:UIControlStateNormal];
            self.exchange = YES;
        }else {
            [button setBackgroundImage:[UIImage imageNamed:@"icon_image_no@2x"] forState:UIControlStateNormal];
            self.exchange = NO;
            
        }
        self.judge = YES;
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"123%@",change);
    NSIndexSet *indexSet = change[@"indexes"];
    __block  NSIndexPath *indexPath = nil;
    
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
    } ];
  
    
}

- (void)backGroundImageButton:(id)sender {
    
}


- (void)camaerPushRight {
    
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
    
    
}


- (void)darkPhoto:(UIButton *)btn {
    NSLog(@"%ld",btn.tag);
    
    
    TopGTypeModel *top = [TopGTypeModel sharedTopGTypeModel];
    top.buttonTag = btn.tag;
    
    
}

- (void)buttonLiftPush {
    
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
