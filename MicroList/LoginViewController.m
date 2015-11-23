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

#import "AppDef.h"
@interface LoginViewController ()
{

    BOOL isAutoLogin;
    NSString *uid;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userName.delegate = self;
    _passWord.delegate = self;
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
#warning 这里可以在本地判断是否为手机号
    //判断格式等最好先在本地判断，然后再发送网络请求
    if (usernameStr == nil || [usernameStr isEqualToString:@""]) {
        [self AlertView:@"请输入账号！"];
        return;
    }
    if (passwordStr == nil || [passwordStr isEqualToString:@""]) {
        [self AlertView:@"请输入密码！"];
        return;
    }
    
    
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"mobile"] = usernameStr;
    params[@"password"] = passwordStr;
    
    
    
    [manager POST:UserRegister_URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"%@",responseObject);
        
        NSString * code = responseObject[@"code"];
        
        
        if ([code isEqualToString:@"1" ]) {
            
            NSDictionary *da = responseObject[@"data"];
            
            uid = [[da objectForKey:@"uid"]description];

            //判断uid，如果uid存在则去注册环信
#warning  这里有个问题需要处理，假如服务器注册成功，而环信注册不成功
            if (uid != nil && ![uid isEqualToString:@""]) {
                //环信注册
                [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:uid password:UserPassword withCompletion:^(NSString *username, NSString *password, EMError *error) {
                    if (!error) {
                        [self AlertView:@"注册成功"];
                    }
                    
                    
                    
                    NSLog(@"error %@",error);
                    
                } onQueue:nil];
                
            }
           


            
        }else if ([code isEqualToString:@"2" ]){
            
            [self AlertView:@"手机号码格式错误，请重新输入"];
            
            
        }else if ([code isEqualToString:@"3" ]){
            
            
            [self AlertView:@"手机号码已被注册"];
            
        }
        
        else
            [self AlertView:@"未知错误!"];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"请求失败  error : %@", error);
        [self AlertView:@"网络异常！请检查网络设置！"];
        
    }];
    
    
    
 

    
    
    
}



//MD5撒盐
- (NSString *)saltMD5:(NSString *)pass{
    
    
    NSString * newPass = [[pass md5String] stringByAppendingString:@"123"];
    
    
    return [newPass md5String];
    
    
}




//登录
/**
 *  登录方法，
 *
 *
 *  @param sender 按钮事件
 */
- (IBAction)loginIn:(UIButton *)sender {
    
    
    NSString * usernameStr = _userName.text;
    NSString * passwordStr = _passWord.text;

#warning 这里可以在本地判断是否为手机号
    //判断格式等最好先在本地判断，然后再发送网络请求
    if (usernameStr == nil || [usernameStr isEqualToString:@""]) {
        [self AlertView:@"请输入账号！"];
        return;
    }
    if (passwordStr == nil || [passwordStr isEqualToString:@""]) {
        [self AlertView:@"请输入密码！"];
        return;
    }
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    

    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    params[@"mobile"]   = usernameStr;
    params[@"password"] = passwordStr;
    
    [manager POST:UserLogin_URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"返回的登录数据： %@",responseObject);
        
        NSString * code = responseObject[@"code"];
        
        
        
        if ([code isEqualToString:@"1" ]) {
            
            [self AlertView:@"登录成功"];
            
            NSString * key = responseObject[@"data"][@"key"];
            //获取返回的id用来作为登录环信的账号
            uid            = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"uid"]];
            
            //获取userDefault单例
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            //登陆成功后把用户名和密码存储到UserDefault
            [userDefaults setObject:usernameStr forKey:UserNameKey];
            [userDefaults setObject:passwordStr forKey:PassWordKey];
            [userDefaults setObject:uid forKey:HXKey];
            [userDefaults setObject:key forKey:KEY];
            
            //及时刷新
            [userDefaults synchronize];
            
            
            //登录成功，则登录环信，也可以不登陆，等需要聊天时候再登录
            [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:uid password:UserPassword completion:^(NSDictionary *loginInfo, EMError *error) {
                if (!error) {
                    // 设置自动登录
                    [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
                }
            } onQueue:nil];
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            
        }else if ([code isEqualToString:@"2" ]){
            
            [self AlertView:@"用户名不存在，请重新输入"];
            
            
        }else if ([code isEqualToString:@"3" ]){
            
            
            [self AlertView:@"用户名密码错误"];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"请求失败  error : %@", error);
        [self AlertView:@"网络异常！请检查网络设置！"];
        
    }];
    
    
   
    
}

-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    if (textField.tag == 1001) {
        _passWord.text = @"";
    }
    return YES;
}



- (void)AlertView:(NSString *)text{

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:text
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    alert = nil;
    
   }

@end
