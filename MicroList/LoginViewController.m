//
//  LoginViewController.m
//  MicroList
//
//  Created by Mac on 15/11/3.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "LoginViewController.h"
#import "RootViewController.h"
#import "EMError.h"
#import "EaseMob.h"
#import "AFNetworking.h"
#import "FirstCell.h"
#import "MyTopViewController.h"
#import "NSString+Hash.h"
#import "AESData.h"
#import "AESCrypt.h"
@interface LoginViewController ()
{

    BOOL isAutoLogin;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //环信
    /*
    
//    [[EaseMob sharedInstance].chatManager removeDelegate:self];
//    //注册为SDK的ChatManager的delegate
//    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
//    
    
    
    

//    isAutoLogin = NO;
//    isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
//    if (!isAutoLogin) {
//        [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:_userName.text password:_passWord.text completion:^(NSDictionary *loginInfo, EMError *error) {
//            
//            [self dismissViewControllerAnimated:YES completion:nil];
//
//            NSLog(@"用户名：%@,密码：%@",_userName.text,_passWord.text);
//                                                          
//        } onQueue:nil];
//    }
    */
    
    
    
}
/*
- (void)willAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{

    NSLog(@"自动登录中");
}


- (void)didAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{

    NSLog(@"自动登录成功");

}

*/


//注册
- (IBAction)registerIn:(UIButton *)sender {
    

    
    
    //环信注册
    /*
     //异步注册账号
     [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:_userName.text
     password:_passWord.text
     withCompletion:
     ^(NSString *username, NSString *password, EMError *error) {
     
     if (!error) {//注册成功,显示马上登录
     UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
     message:@"注册成功，请登陆"
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
     [alert show];
     alert = nil;
     
     
     }else{
     //输出错误信息.
     
     NSLog(@"注册失败");
     
     }
     } onQueue:nil];
     
     */
    
 
    
    /*
    //请求对象
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    
//    [request setHTTPMethod:@"POST"];
//    
//    NSString * safeString = [self saltMD5:passwordStr];
//    
//    NSString * st = [NSString stringWithFormat:@"%@=%@", usernameStr, safeString];
//    
//    [request setHTTPBody:[st dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        
//        
//        if (connectionError != nil || data == nil) {
//            
//            //写一个弹框
//            NSLog(@"error : %@", connectionError);
//            
//            return;
//        }
//        
//        
//        id jsondata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        
//        NSLog(@"json data 请求成功 : %@", jsondata);
    
//        NSInteger * code = jsondata[code];
//        
//        if (code == 1) {
//            
//            NSLog(@"注册成功");
//            
//            NSString * data = jsondata[data][uid];
//
//        }else if (code == 2){
//        
//            NSLog(@"手机号码格式错误，请重新输入");
//        
//        }else if (code == 3){
//        
//            NSLog(@"手机号码已被注册");
//        
//        }
        
       */
    /*
         如果前面的queue给的是子线程
         //刷新UI
         dispatch_async(dispatch_get_main_queue(), ^{
         
         
         //刷新
         });
         */
        
        
//    }];

    //AES加密
    /*
    NSString *encryptedData = [AESCrypt encrypt:_passWord.text password:@"111"];//加密
    
    NSLog(@"哈哈哈哈哈哈哈哈哈哈哈：%@",encryptedData);
    
    
    NSString *message = [AESCrypt decrypt:encryptedData password:@"111"];//解密
    
    NSLog(@"呵呵呵呵呵呵呵呵呵呵：%@",message);
    */
    
    /*
    NSData* xmlData = [_passWord.text dataUsingEncoding:NSUTF8StringEncoding];
    AESData *AES = [[AESData alloc]init];
    NSData *data =  [AES AES256EncryptWithKey:xmlData];
    NSLog(@"在哈哈哈哈哈哈哈哈哈, %@",data);
    
   NSData *da = [AES AES256DecryptWithKey:data];
    NSString *result = [[NSString alloc]initWithData:da encoding:NSUTF8StringEncoding];
   
    NSLog(@"呵呵呵呵呵呵呵呵,%@",result);
    */
    
    
    
    
    //注册的网络请求
    NSString * usernameStr = _userName.text;
    NSString * passwordStr = _passWord.text;
    
//    NSString * safeString = [self saltMD5:passwordStr];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    NSString * string = [NSString stringWithFormat:@"http://%@/user/register",kLoginServer];
    
//    NSLog(@"%@",string);
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"mobile"] = usernameStr;
    params[@"password"] = passwordStr;
    
    
    
    [manager POST:string parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"%@",responseObject);
        
        NSString * code = responseObject[@"code"];
        
        
        if ([code isEqualToString:@"1" ]) {
            
            [self AlertView:@"注册成功"];
            /*
//            NSString *uid = responseObject[@"data"][@"uid"];
//            NSString *username = _userName.text;
//            
//            NSDictionary *dic = @{
//                                  
//                                  @"username":username,
//                                  @"uid":uid
//                                  };
//            
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"notification" object:nil userInfo:dic];
            
         */
        }else if ([code isEqualToString:@"2" ]){
            
            [self AlertView:@"手机号码格式错误，请重新输入"];
            
            
        }else if ([code isEqualToString:@"3" ]){
            
            
            [self AlertView:@"手机号码已被注册"];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"请求失败  error : %@", error);
        
    }];
    
    
    //环信注册
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:usernameStr password:passwordStr withCompletion:^(NSString *username, NSString *password, EMError *error) {
        if (!error) {
            NSLog(@"注册成功");
        }
    } onQueue:nil];
    
    

    
    
    
    
}



//MD5撒盐
- (NSString *)saltMD5:(NSString *)pass{
    
    
    NSString * newPass = [[pass md5String] stringByAppendingString:@"123"];
    
    
    return [newPass md5String];
    
    
}




//登录
- (IBAction)loginIn:(UIButton *)sender {
    
    //环信登录
    /*
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:_userName.text password:_passWord.text completion:^(NSDictionary *loginInfo, EMError *error) {
  
        if (!error) {
     
     
            NSLog(@"登录成功");
     
//            MyTopViewController *top = [[MyTopViewController alloc]init];
            NSLog(@"%@",self.userName.text);
            
//            self.block(self.userName.text);
            
            
            
            // 设置自动登录
//            [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } onQueue:nil];
     
    
    */
    
    NSString * usernameStr = _userName.text;
    NSString * passwordStr = _passWord.text;
    
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:usernameStr password:passwordStr];
    
    
    NSString * safeString = [self saltMD5:passwordStr];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    NSString * string = [NSString stringWithFormat:@"http://%@/user/login",kLoginServer];
//    NSLog(@"返回的登录数据： %@",string);
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"mobile"] = usernameStr;
    params[@"password"] = passwordStr;
    
    
    
    [manager POST:string parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//       NSLog(@"返回的登录数据： %@",responseObject);
        
        NSString * code = responseObject[@"code"];
        
        
        
        if ([code isEqualToString:@"1" ]) {
            
            [self AlertView:@"登录成功"];
            
            NSString * key = responseObject[@"data"][@"key"];
            
            //获取userDefault单例
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            //登陆成功后把用户名和密码存储到UserDefault
            [userDefaults setObject:usernameStr forKey:@"username"];
            [userDefaults setObject:passwordStr forKey:@"password"];
            [userDefaults setObject:key forKey:@"key"];
            //及时刷新
            [userDefaults synchronize];
            
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            
        }else if ([code isEqualToString:@"2" ]){
            
            [self AlertView:@"用户名不存在，请重新输入"];
            
            
        }else if ([code isEqualToString:@"3" ]){
            
            
            [self AlertView:@"用户名密码错误"];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"请求失败  error : %@", error);
        
    }];
    
    
   
    
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
