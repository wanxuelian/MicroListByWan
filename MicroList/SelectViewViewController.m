//
//  SelectViewViewController.m
//  MicroList
//
//  Created by Mac on 15/11/12.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "SelectViewViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@interface SelectViewViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    NSArray *cityArr;
    UIPickerView *pickView;
    NSMutableArray *mutArr;
    NSMutableArray *towArr;
}
@end

@implementation SelectViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    
    self.navigationItem.leftBarButtonItem = barItem;
    
    [self getData];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *headPath = [userDefault objectForKey:@"headPath"];
    
    
    NSString *image = headPath;
    NSURL *url = [NSURL URLWithString:image];
    [self.headPath sd_setImageWithURL:url];
    

}




#pragma mark -- Button Action
- (void)leftButtonAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)submitButton:(UIButton *)sender {
    
    [self submitData];
    [self getPhotoData];
}



//请求个人资料网络数据
- (void)getData{
    
    
    NSLog(@"*********************************请求用户资料***************************************");
    /*
     NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
     NSTimeInterval a=[dat timeIntervalSince1970];  //精确到秒
     NSString *timeString = [NSString stringWithFormat:@"%f", a]; //转为字符型
     */
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
   
    
    NSString *url = [NSString stringWithFormat:@"http://%@/user/dataEdit/",kLoginServer];
    
//    NSLog(@"请求的地址了： %@",url);
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = key;
    params[@"type"] = @"2";
    
    [data POSTData:url and:params and:^(id dict) {
        
        //        NSLog(@"好友资料： %@",dict);
        
        NSArray *dat = dict[@"data"];
        
        for (NSDictionary *data in dat) {
            
            self.nickName.text = data[@"nickName"];
//            self.sex.text = data[@"sex"];
            self.area.text = data[@"area"];
            self.signature.text = data[@"signature"];
            
            
            NSString *number = [NSString stringWithFormat:@"%@", data[@"sex"]];
            
//           NSInteger *sex = [number integerValue];
            
            if ([number isEqualToString:@"1"]) {
                
                self.sex.text = @"男";
            }else if ([number isEqualToString:@"2"]){
            
                self.sex.text = @"女";
            }
            

            
        }
        
        
//        for (NSDictionary *dic in data) {
//
//                self.nickName.text = dic[@"data"][@"nickName"];
//                self.sex.text = dic[@"data"][@"sex"];
//                self.area.text = dic[@"data"][@"area"];
//                self.signature.text = dic[@"data"][@"signature"];
//
//        }
        
    }];
    
    
    
}



//提交个人资料网络数据
- (void)submitData{
    
    
    NSLog(@"*********************************请求用户资料***************************************");
    
    
    BaseJsonData * data = [[BaseJsonData alloc]init];
    /*
     NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
     NSTimeInterval a=[dat timeIntervalSince1970];  //精确到秒
     NSString *timeString = [NSString stringWithFormat:@"%f", a]; //转为字符型
     */
    
    NSString *url = [NSString stringWithFormat:@"http://%@/user/dataEdit/",kLoginServer];
    
    NSLog(@"请求的地址了： %@",url);
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefault objectForKey:@"key"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = key;
    params[@"type"] = @"1";
    params[@"nickName"] = _nickName.text;
    
    if ([_sex.text isEqualToString:@"男"]) {
        params[@"sex"] = @"1";
    }else if ([_sex.text isEqualToString:@"女"]){
    
        params[@"sex"] = @"2";
    }
    
//    params[@"sex"] = @"1";
    params[@"area"] = _area.text;
    params[@"signature"] = _signature.text;
    
    [data POSTData:url and:params and:^(id dict) {
        
        NSLog(@"提交返回： %@",dict);
        
        NSString *code = dict[@"code"];
        
        if ([code isEqualToString:@"1"]) {
            
            [BaseAlertView AlertView:@"提交成功"];
            
            
        }
        
    }];
    
}



//上传图片
- (void)getPhotoData{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [userDefaults objectForKey:@"key"];
    
    
    NSString *urlstaring = [NSString stringWithFormat:@"http://%@/user/headUp?key=g23das1sd21dsf121key=g23das1sd21dsf121",kLoginServer];
    
    UIImage *asset = self.headPath.image;
    NSData *data1 = UIImageJPEGRepresentation(asset, 0.2);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//这个有时必须设置
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    parame[@"key"] = key;
    
    
    AFHTTPRequestOperation *operation = [manager POST:urlstaring parameters:parame constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
//        NSLog(@"***********正在请求  请求地址：%@*******************",urlstaring);
        [formData appendPartWithFileData:data1 name:@"file" fileName:@"ddd.png" mimeType:@"image/jpeg"];
        
        
        
    } success:^(AFHTTPRequestOperation *operation,id responseObject) {
        
        NSLog(@"aaaaaaaa******************%@",responseObject);
        
        NSArray *data = responseObject[@"data"];
        
        for (NSDictionary *dic in data) {
            
            NSString *str = dic[@"headPath"];
            
           [userDefaults setObject:str forKey:@"headPath"];
            
            //及时刷新
            [userDefaults synchronize];
        
        }
        
        NSString *code = responseObject[@"code"];
        if ([code isEqualToString:@"1" ]) {
            
            [self AlertView:@"图片上传成功"];
           
            
        }else if ([code isEqualToString:@"2" ]){
            
            [self AlertView:@"上传失败，请检查网络"];
            
            
        }else if ([code isEqualToString:@"3" ]){
            
            
            [self AlertView:@"文件格式错误"];
            
        }
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                
            NSLog(@"***********请求失败**********%@",error);
    }];
    
    
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten,long long totalBytesWritten,long long totalBytesExpectedToWrite) {
        NSLog(@"bytesWritten=%ld, totalBytesWritten=%lld, totalBytesExpectedToWrite=%lld", bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
        
    }];
    
}





- (IBAction)Photo:(id)sender {
    
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
    self.headPath.image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSLog(@"拿到的图片名字。。。。。。。。。 %@",[info objectForKey:UIImagePickerControllerEditedImage]);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)nickNameButton:(UIButton *)sender {
    
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入昵称" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 100;
    [alert show];
    
}

- (IBAction)sexButton:(UIButton *)sender {
    
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请选择性别" message:nil delegate:self cancelButtonTitle:@"男" otherButtonTitles:@"女" ,nil];
    
//    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 101;
    [alert show];
   
}

- (IBAction)areaButton:(UIButton *)sender {
    
    //创建弹出框
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入昵称" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
//    
//    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
//    alert.tag = 102;
//    [alert show];
    
    //开启一个挡板
//    [MBProgressHUD showMessage:@"正在加载..."];
    
   MBProgressHUD *hub = [[MBProgressHUD alloc]init];
    [hub show:YES];
    
    
    [self _loadPickView];
    
   
}

- (IBAction)signatureButton:(UIButton *)sender {
    
    //创建弹出框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入昵称" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消" ,nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 103;
    [alert show];

}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
      UITextField *  _file = [alertView textFieldAtIndex:0];
        NSLog(@"%@",_file.text);
        
    
        switch (alertView.tag) {
            case 100:
                
            {
                self.nickName.text = _file.text;
                break;
            }
                
            case 101:
            {
                self.sex.text = @"男";
                break;
            }
            case 102:
                
            {
                self.area.text = _file.text;
                
                break;
            }
            case 103:
                
            {
                self.signature.text = _file.text;
                break;
            }
            default:
                break;
        }

        
        
        
        
        
        
        
    }else if (buttonIndex == 1){
        
        if (alertView.tag == 101) {
            self.sex.text = @"女";
        }
    }
    //......
}


- (void)_loadPickView{

    pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 200, 375, 360)];
    pickView.backgroundColor = [UIColor yellowColor];
    
    pickView.delegate = self;
    pickView.dataSource = self;
    
    [self.view addSubview:pickView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 430, 175, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cityAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //解析数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cityes.plist" ofType:nil];
    cityArr = [NSArray arrayWithContentsOfFile:path];
    

}

//城市选择确定按钮
- (void)cityAction:(UIButton *)button{

    [MBProgressHUD hideHUD];
    

}



#pragma mark ---UIPickView  datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        
        return cityArr.count;
    }
    NSInteger index = [pickerView selectedRowInComponent:0];
    NSDictionary *dic = cityArr[index];
    NSArray *arr = dic[@"cities"];
    
    return arr.count;
}


#pragma mark - delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    
    if (component == 0) {
        NSDictionary *dic = cityArr[row];
        
        NSString *Name = dic[@"state"];
        
        //        NSString *string = [NSString stringWithFormat:@"%@",arr[row]];
        
        return Name;
        
    }
    NSInteger index = [pickerView selectedRowInComponent:0];
    NSDictionary *pro = cityArr[index];
    NSArray *arr = pro[@"cities"];
    
    NSString *string = arr[row];
    
    
    return string;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        
        [pickerView reloadAllComponents];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}




- (void)AlertView:(NSString *)text{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:text
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    alert = nil;
    
}



@end
