//
//  CreatGroupViewController.m
//  MicroList
//
//  Created by Mac on 15/11/20.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CreatGroupViewController.h"
#import "AFHTTPRequestOperation.h"

@interface CreatGroupViewController ()<UIImagePickerControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{

    UITextField *groupName;
    UITextView *groupNote;
    UIImageView *headPath;
}
@end

@implementation CreatGroupViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建视图
    [self _createSubView];
   
}

//创建视图
- (void)_createSubView{


    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 74, 100, 30)];
    
    label1.text = @"群组名:";
    [self.view addSubview:label1];
    
    groupName = [[UITextField alloc]initWithFrame:CGRectMake(110, 74, 200, 30)];
    groupName.backgroundColor = [UIColor lightGrayColor];
    [groupName becomeFirstResponder];
    [self.view addSubview:groupName];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 124, 100, 30)];
    label2.text = @"群描述:";
    [self.view addSubview:label2];
    
    groupNote = [[UITextView alloc]initWithFrame:CGRectMake(110, 124, 200, 50)];
    [groupNote becomeFirstResponder];
    groupNote.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:groupNote];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 224, 100, 30)];
    label3.text = @"群头像:";
    [self.view addSubview:label3];
    
    headPath = [[UIImageView alloc]init];
    headPath.frame = CGRectMake(110, 224, 80, 80);
    headPath.backgroundColor = [UIColor lightGrayColor];
    headPath.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headPathAction:)];
    [headPath addGestureRecognizer:tapGesturRecognizer];
    
    
    [self.view addSubview:headPath];
    
    
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 500,300 , 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"确认创建" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}


//创建群组
- (void)creatEaseGroup{

    EMGroupStyleSetting *groupStyleSetting = [[EMGroupStyleSetting alloc] init];
    groupStyleSetting.groupMaxUsersCount = 500; // 创建500人的群，如果不设置，默认是200人。
    groupStyleSetting.groupStyle = eGroupStyle_PublicOpenJoin; // 创建不同类型的群组，这里需要才传入不同的类型
    [[EaseMob sharedInstance].chatManager asyncCreateGroupWithSubject:groupName.text
description:groupNote.text invitees:nil initialWelcomeMessage:@"邀请您加入群组"styleSetting:groupStyleSetting completion:^(EMGroup *group, EMError *error) {
    
    
        if(!error){
             NSLog(@"创建成功 -- %@",group);
            
            [self createSelfGroupWithHXid:group.groupId];
            
//
            
            
        }
    
    } onQueue:nil];


}
/**
 * 1: key		     时间轴|手机号码|uid
 * 2: groupName      群名
 * 3: groupNote		 群说明
 * 4: gType			 群分类
 * 5: file			 上传属性
 * 6: hid            环信ID
 *
 *  @param string hid
 */
- (void)createSelfGroupWithHXid:(NSString *) hid{

     NSString *url = [NSString stringWithFormat:@"http://%@/group/create",kLoginServer];

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    //请求好友列表
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"key"] = key;
    param[@"groupName"] = groupName.text;
    param[@"groupNote"] = groupNote.text;
    param[@"gType"] = @"1";
    param[@"hid"] = hid;
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//这个有时必须设置
    AFHTTPRequestOperation *operation = [manager POST:url parameters:param
                            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                
                                NSData *data=UIImagePNGRepresentation(_image);
                                [formData appendPartWithFileData:data name:@"file" fileName:@"qunzuIcon" mimeType:@"image/png"];
                                
                            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                NSLog(@"创建成功！");
                                NSLog(@"--------%@",responseObject );
                            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                NSLog(@"创建失败！");
                            }];
                                
    
    

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"upload++++++success");
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"upload++++++failed");
    }];
    

   
    
    
    
//    [data POSTData:url and:param and:^(id dic) {
//        
//        
//        NSString *code = dic[@"code"];
//        if ([code isEqualToString:@"1"]) {
//            
//            
//           [BaseAlertView AlertView:@"创建群组成功！"];
//           [self.navigationController popViewControllerAnimated:YES];
//            
//        }else if ([code isEqualToString:@"2"]){
//            
//            [BaseAlertView AlertView:@"群名或群分类格式错误!"];
//            
//        }
//        else
//        {
//            [BaseAlertView AlertView:@"网络错误，群组创建失败!"];
//        }
//        
//        
//    }];
    




}



#pragma mark -- buttonAction
- (void)buttonAction:(UIButton *)button{
    
    //创建环信群组
    [self creatEaseGroup];
    
    //创建自己群组
//    [self createSelfGroup];
}


- (void)headPathAction:(UIButton *)button{

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

//选择图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //    UIImagePickerControllerOriginalImage   //原图片
    //    UIImagePickerControllerEditedImage    //编辑后的图片
    
    //把图片添加到imageView上进行显示
    headPath.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSLog(@"拿到的图片名字。。。。。。。。。 %@",[info objectForKey:UIImagePickerControllerEditedImage]);
    _image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}




- (void)asyncFetchGroupInfo:(NSString *)groupId{

    NSLog(@"群id为：%@",groupId);

}



@end
