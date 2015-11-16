//
//  BaseJsonData.m
//  MicroList
//
//  Created by Mac on 15/11/9.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BaseJsonData.h"
#import "AFNetworking.h"
@implementation BaseJsonData

- (void)GETData:(NSString *)urlStr and:(NSDictionary *)params and:(ReturnBlock)block{

//    NSString * usernameStr = _userName.text;
//    NSString * passwordStr = _passWord.text;
//    NSString * safeString = [self saltMD5:passwordStr];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    NSString * string = urlStr;
    
//    NSMutableDictionary * params = [NSMutableDictionary dictionary];
//    params[@"mobile"] = usernameStr;
//    params[@"password"] = safeString;
    
    
    
    [manager GET:string parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"请求成功： %@",responseObject);
        
        block(responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"请求失败  error : %@", error);
        
    }];


}


- (void)POSTData:(NSString *)urlStr and:(NSDictionary *)params and:(ReturnBlock)block{
/*
//    NSString * usernameStr = _userName.text;
//    NSString * passwordStr = _passWord.text;
//    NSString * safeString = [self saltMD5:passwordStr];
 */
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
     manager.responseSerializer = [AFJSONResponseSerializer serializer];//这个有时必须设置
    NSString * string = urlStr;
 /*
//    NSMutableDictionary * params = [NSMutableDictionary dictionary];
//    params[@"mobile"] = usernameStr;
//    params[@"password"] = safeString;
 */
    
    
    [manager POST:string parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"******************************请求成功************************** ：%@",responseObject);
        
        
        block(responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        NSLog(@"*******************************请求失败*************************  error : %@", error);
        
    }];

}

@end
